import 'dart:developer';
import 'dart:html';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:usermodel/model/api.dart';
import 'package:usermodel/model/api_mode.dart';
import 'package:usermodel/model/user_model.dart';

class AdminProject with ChangeNotifier {
  // AdminProject() {
  //   log('called');
  //   fetchDatas();
  // }

  TextEditingController projectController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController detailsController = TextEditingController();
  TextEditingController websiteController = TextEditingController();
  TextEditingController locationController = TextEditingController();
  TextEditingController asignController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  List<String> city = [];
  List<String> websites = [];
  List<String> companies = [];
  String dropdownvalue = '';

  //String cityDropVal = 'Select city';

  String? projectValidater(String value) {
    if (value.isEmpty) {
      return "projectname needed";
    }
    return null;
  }

  String? dateValidater(String value) {
    if (value.isEmpty) {
      return "date needed";
    }
    return null;
  }

  String? companyValidater(String value) {
    if (value.isEmpty) {
      return "company needed";
    }
    return null;
  }

  String? webValidater(String value) {
    if (value.isEmpty) {
      return "website needed";
    }
    return null;
  }

  String? locationValidater(String value) {
    if (value.isEmpty) {
      return "location needed";
    }
    return null;
  }

  String? assignValidater(String value) {
    if (value.isEmpty) {
      return "User required";
    }
    return null;
  }

  submitValidation() {
    if (formKey.currentState!.validate()) {
    } else {
      return;
    }
  }

//*** Api to list ***//

  fetchDatas() async {
    final response = await Project().getProductApi();
    if (response.data == null) {
      return;
    }
    city = [];
    websites = [];
    companies = [];
    List<User> users = userFromJson(response.data);
    log('${users.length}');
    for (User user in users) {
      city.add(user.address.city);
      websites.add(user.website);
      companies.add(user.company.name);
    }
    log('city ${city.length}');
    log('web ${websites.length}');
    log('comp ${companies.length}');
    log(city.last);
  }

  setCityVal(String val) {
    locationController.text = val;
  }
// update and add name on textfield //

  addDropdawn(value) {
    dropdownvalue = value;
    notifyListeners();
  }

// get data from firebase //

  // Future<List<UserModel>> getUser(){
  //   return FirebaseFirestore.instance.collection("users").snapshots().map(
  //       (snapshot) => snapshot.docs
  //           .map((doc) => UserModel.fromJson(doc.data()))
  //           .toList());
  // }

  listcovert() async{
    final list =await FirebaseFirestore.instance.collection("users").get();
    
  
     
  }
}
