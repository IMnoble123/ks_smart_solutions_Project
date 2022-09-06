import 'dart:convert';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));
List<UserModel> usersFromMap(List list) =>
    List<UserModel>.from(list.map((item) => UserModel.fromJson(item)));
String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
  UserModel(
      {required this.dateofbirth,
      required this.password,
      required this.username,
      required this.id});

  String dateofbirth;
  String password;
  String username;
  String id;

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
      dateofbirth: json["dateofbirth"],
      password: json["password"],
      username: json["username"],
      id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "dateofbirth": dateofbirth,
        "password": password,
        "username": username,
        "id": id
      };
  @override
  String toString() {
    return toJson().toString();
  }
}






// final String username;
//   final String password;
//   final String dateofbirth;

//   UserModel( 
//       {required this.username,
//       required this.dateofbirth,
//       required this.password});

//   Map<String, String> toJson() {
//     return {
//       "username": username,
//       "dateofbirth": dateofbirth,
//       "password": password
//     };
//   }


//     factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
//        username: json["username"],
//        dateofbirth: json["dateofbirth"],
//        password:  json["password"]
//       );