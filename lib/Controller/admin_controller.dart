import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:usermodel/model/user_model.dart';

class AdminProvider with ChangeNotifier {

  final formkey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController dateController = TextEditingController();

  String? nameValidater(String value) {
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

  void datePicker(BuildContext context) async {
    DateTime? pickedDate = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(1950),
        lastDate: DateTime(2025));
    if (pickedDate != null) {
      String formatDate = DateFormat('dd-MMM-yyyy').format(pickedDate);
      dateController.text = formatDate;
    }
  }

  String? dateValidation(String value) {
    if (value.isEmpty) {
      return "date required";
    }
    return null;
  }

  void createValidater() {
    if (formkey.currentState!.validate()) {
      addUser();
    } else {
      return;
    }
  }

// **** function to submit ****//

  addUser() async {
    final users = FirebaseFirestore.instance.collection("users").doc();
    final userdata = UserModel(
        username: nameController.text,
        dateofbirth: dateController.text,
        password: passwordController.text);
    await users.set(userdata.toJson());
  }
}
