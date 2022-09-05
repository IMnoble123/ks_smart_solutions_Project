import 'package:flutter/material.dart';
import 'package:usermodel/view/screens/components/admin/create_project.dart';
import 'package:usermodel/view/screens/components/admin/create_user.dart';

class AdminInputs with ChangeNotifier {
  int radiovalue = 0;

  void onvalueChange(value) {
    radiovalue = value;
    notifyListeners();
  }

  void onSubmit(BuildContext context) {
    switch (radiovalue) {
      case 0:
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (ctx) => const CreatePage()));

        break;
      case 1:
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (ctx) => const CreateProject()));
    }
  }
}
