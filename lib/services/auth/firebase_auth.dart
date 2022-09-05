import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:usermodel/view/screens/components/admin/admin_page.dart';
import 'package:usermodel/view/utls/snakbar.dart';

class FirebaseAuthMethods {
  final FirebaseAuth _auth;
  FirebaseAuthMethods(this._auth);

  Future loginwithEmail(
      {required email, required password, required context}) async {
    try {
      await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (ctx) => const AdminPage()));
    } on FirebaseAuthException catch (e) {
      ShowsnakBar.showsnak(context, e.message!);
    }
  }
}
