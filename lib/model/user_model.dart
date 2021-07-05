class Data {
  int? id;
  String? email;
  String? firstName;
  String? lastName;
  String? avatar;

  Data({this.id, this.email, this.firstName, this.lastName, this.avatar});

  factory Data.fromJSON(Map<String, dynamic> jsonMap) {
    return Data(
      id: jsonMap['id'],
      email: jsonMap['email'],
      firstName: jsonMap['first_name'],
      lastName: jsonMap['last_name'],
      avatar: jsonMap['avatar'],
    );
  }
}
