import 'package:flutter/material.dart';
import 'package:usermodel/model/user_model.dart';

class UserBio extends StatelessWidget {
  const UserBio({Key? key, this.user}) : super(key: key);
  final UserModel? user;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.only(bottom: 30),
        child: ListView(children: [
          const SizedBox(height: 100),
          const Padding(
            padding: EdgeInsets.only(left: 120, right: 90, top: 30),
            child: Text(
              'My Bio',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(left: 20, right: 20, top: 30),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Text(user!.username.toString()),
                Text(user!.dateofbirth.toString()),
                Text(user!.password.toString())
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
