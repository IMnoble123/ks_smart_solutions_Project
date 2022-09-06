import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:usermodel/model/api.dart';
import 'package:usermodel/model/api_mode.dart';
import 'package:usermodel/model/update.dart';
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
  List<Company> companies = [];
  List<UserModel> users = [];
  String dropdownvalue = '';
  String docid = " ";

  Company? selCompany;
  UserModel? selUser;
  //String cityDropVal = 'Select city';

  updateDocid(String id) {
    docid = id;
  }

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
      companies.add(user.company);
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
  fetchUsers() async {
    final fireStore = FirebaseFirestore.instance;
    QuerySnapshot querySnapshot = await fireStore.collection('users').get();
    final allData = querySnapshot.docs.map((doc) => doc.data()).toList();
    users = usersFromMap(allData);
    log(users.length.toString());
    // usernames = users.map((item) => item.username).toList();
    // usernames.forEach((element) {
    //   log(element);
    // });
  }

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

  addProject() async {
    log('i am worked');
    //log(docid.toString());
    final userdata =
        FirebaseFirestore.instance.collection("users").doc(selUser!.id);
    final entries = Updateproject(
        projectname: projectController.text,
        projectdate: dateController.text,
        company: selCompany!.name,
        catchphase: selCompany!.catchPhrase,
        websites: websiteController.text,
        location: locationController.text);

    await userdata.collection('projects').add(entries.toJson());
    // await userdata.update({"projects": entries.toJson()});
  }
}
