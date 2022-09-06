import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:usermodel/Controller/admin_projectcontroller.dart';
import 'package:usermodel/model/update.dart';
import 'package:usermodel/model/user_model.dart';
import 'package:usermodel/services/auth/firebase_auth.dart';
import 'package:usermodel/view/screens/components/user/user_bio.dart';
import 'package:usermodel/view/screens/components/user/user_project.dart';

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
      context.read<AdminProject>().fetchUsers();
    } else {
      return;
    }
  }

  getdata(String id, BuildContext context) async {
    final fireStore = FirebaseFirestore.instance;
    DocumentSnapshot<Map<String, dynamic>> querySnapshot =
        await fireStore.collection('users').doc(id).get();
    final allData = UserModel.fromJson(querySnapshot.data()!);

    log(allData.toString());
    log(querySnapshot.toString());
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (ctx) => UserBio(user: allData)));
  }

  getprojects(String id, BuildContext context) async {
    final fireStore = FirebaseFirestore.instance;
    DocumentSnapshot<Map<String, dynamic>> querySnapshot =
        await fireStore.collection('users').doc(id).get();
    final projects = Updateproject.fromJson(querySnapshot.data()!);
    log(projects.company.toString());
    Navigator.of(context).push(
        MaterialPageRoute(builder: (ctx) => UserProject(project: projects)));
  }
}
