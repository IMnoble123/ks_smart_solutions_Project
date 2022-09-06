import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:usermodel/Controller/login_admincontroller.dart';
import 'package:usermodel/view/screens/components/admin/admin_user.dart';
import 'package:usermodel/view/screens/components/user/user_bio.dart';
import 'package:usermodel/view/screens/components/user/user_cate.dart';

class HomeInputs with ChangeNotifier {
  int radiovalue = 0;

  void onvalueChange(value) {
    radiovalue = value;
    notifyListeners();
  }

  void onSubmit(BuildContext context) {
    switch (radiovalue) {
      case 0:
        
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (ctx) => const UserPage()));

        break;
      case 1:
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (ctx) => const UserAdminPage()));
    }
  }
}
