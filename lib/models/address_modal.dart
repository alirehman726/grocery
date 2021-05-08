class Address {
  String id;
  String address;
  String name;
  bool isPrimary;

  Address(this.id, this.name, this.address, this.isPrimary);

  static List<Address> fetchAll() {
    return [
      Address(
          "001",
          "Home Address",
          "C232, Siddhi Vinayak Towers, Opp. S.G. Highway, Makarba, Ahmedabad, Gujarat, India - 380051",
          true),
      Address(
          "002",
          "Home Address",
          "A304, Mohammadi Baug, B/h Haidery Baug, Sharkhej-Makarba Road, Sharkhej, Ahmedabad, Gujarat, India - 380055",
          false),
      Address(
          "001",
          "Home Address",
          "C232, Siddhi Vinayak Towers, Opp. S.G. Highway, Makarba, Ahmedabad, Gujarat, India - 380051",
          true),
      Address(
          "002",
          "Home Address",
          "A304, Mohammadi Baug, B/h Haidery Baug, Sharkhej-Makarba Road, Sharkhej, Ahmedabad, Gujarat, India - 380055",
          false),
      Address(
          "001",
          "Home Address",
          "C232, Siddhi Vinayak Towers, Opp. S.G. Highway, Makarba, Ahmedabad, Gujarat, India - 380051",
          true),
      Address(
          "002",
          "Home Address",
          "A304, Mohammadi Baug, B/h Haidery Baug, Sharkhej-Makarba Road, Sharkhej, Ahmedabad, Gujarat, India - 380055",
          false),
    ];
  }
}
