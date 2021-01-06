class UserModel {
  String name, email;

  UserModel({
    this.name,
    this.email,
  });

  factory UserModel.fromJson(Map<String, dynamic> map) {
    return UserModel(
      name: map['name'],
      email: map['email'],
    );
  }
}
