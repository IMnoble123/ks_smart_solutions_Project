
class UserModel {
  final String username;
  final String password;
  final String dateofbirth;

  UserModel( 
      {required this.username,
      required this.dateofbirth,
      required this.password});

  Map<String, String> toJson() {
    return {
      "username": username,
      "dateofbirth": dateofbirth,
      "password": password
    };
  }


    factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
       username: json["username"],
       dateofbirth: json["dateofbirth"],
       password:  json["password"]
      );
}
