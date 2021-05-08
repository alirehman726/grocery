import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:main_grocery/models/product_model.dart';

class DatabaseHelper {
  static const _databaseName = 'ProductData.db';
  static const _dataVersion = 1;

  DatabaseHelper._();
  static final DatabaseHelper instance = DatabaseHelper._();

  Database _database;

  Future<Database> get database async {
    if (_database != null) return _database;
    _database = await _initDatabase();
    return _database;
  }

  _initDatabase() async {
    Directory dataDirectory = await getApplicationDocumentsDirectory();
    String dbPath = join(dataDirectory.path, _databaseName);
    return await openDatabase(dbPath,
        version: _dataVersion, onCreate: _onCreateDB);
  }

  _onCreateDB(Database db, int version) async {
    await db.execute('''
      CREATE TABLE ${ProductModel.tblProduct} (
        ${ProductModel.colId} INTEGER PRIMARY KEY AUTOINCREMENT,
        ${ProductModel.colName} TEXT,
        ${ProductModel.colSizes} TEXT, 
        ${ProductModel.colPrices} TEXT, 
        ${ProductModel.colDescription} TEXT,
        ${ProductModel.colImage} TEXT,
        ${ProductModel.colBgColor} TEXT, 
        ${ProductModel.colFavorite} BOOL NOT NULL
      )
    ''');
  }

  Future<int> insertProduct(ProductModel product) async {
    Database db = await database;

    print(product.toMap().toString());
    int insertedId = await db.insert(ProductModel.tblProduct, product.toMap());
    print("insert ID ${insertedId}");
    return insertedId;
  }

  Future<int> updateProduct(ProductModel product) async {
    Database db = await database;
    return await db.update(ProductModel.tblProduct, product.toMap(),
        where: '${ProductModel.colId}=?', whereArgs: [product.id]);
  }

  Future<int> deleteProduct(int id) async {
    Database db = await database;
    return await db.delete(ProductModel.tblProduct,
        where: '${ProductModel.colId}=?', whereArgs: [id]);
  }

  Future<List<ProductModel>> fetchProduct() async {
    Database db = await database;
    List<Map> product = await db.query(ProductModel.tblProduct);

    // print("Checking length of products ${product.length}");
    return product.length == 0
        ? []
        : product.map((e) => ProductModel.fromMap(e)).toList();
  }

//   //=======SAVE_DATA========//
//   Future<int> saveNote(ProductModel product) async {
//     print("SAVE DATA IN DATABASE");
//     var dbClient = await database;
//     var result = await dbClient.insert(_databaseName, product.toMap());
// //    var result = await dbClient.rawInsert(
// //        'INSERT INTO $tableNote ($columnTitle, $columnDescription) VALUES (\'${note.title}\', \'${note.description}\')');

//     return result;
//   }
}
