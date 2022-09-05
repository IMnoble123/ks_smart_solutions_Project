import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:usermodel/Controller/admin_projectcontroller.dart';
import 'package:usermodel/services/auth/firebase_auth.dart';

class Adminlogin with ChangeNotifier {
  TextEditingController usernameController = TextEditingController();
  TextEditingController paswordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  String? usernameValidater(String value) {
    if (value.isEmpty) {
      return "Username needed";
    }
    return null;
  }

  String? passwordValidater(String value) {
    if (value.isEmpty) {
      return "Password required";
    } else if (value.length < 6) {
      return "Character must me 6 or more";
    }
    return null;
  }

  feildValidation(BuildContext context) {
    if (formKey.currentState!.validate()) {
      FirebaseAuthMethods(FirebaseAuth.instance).loginwithEmail(
          email: usernameController.text,
          password: paswordController.text,
          context: context);
      context.read<AdminProject>().fetchDatas();
    } else {
      return;
    }
  }
}
