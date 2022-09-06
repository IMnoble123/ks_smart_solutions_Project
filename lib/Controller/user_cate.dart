import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'login_admincontroller.dart';

class UserInputs with ChangeNotifier {
  int radiovalue = 0;

  void onvalueChange(value) {
    radiovalue = value;
    notifyListeners();
  }

  void onSubmit(BuildContext context) {
    switch (radiovalue) {
      case 0:
        context.read<Adminlogin>().getdata('WzqtxzdZ0aal2fyzVVDB', context);
        // Navigator.of(context)
        //     .push(MaterialPageRoute(builder: (ctx) => const UserBio()));

        break;
      case 1:
        context.read<Adminlogin>().getprojects('WzqtxzdZ0aal2fyzVVDB', context);
    }
  }
}
