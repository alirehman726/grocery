class Country {
  int id;
  String name;

  Country(this.id, this.name);

  static List<Country> getCompanies() {
    return <Country>[
      Country(1, '+91'),
      Country(2, '+92'),
      Country(3, '+93'),
      Country(4, '+94'),
    ];
  }
}
