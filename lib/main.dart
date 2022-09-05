import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:usermodel/Controller/admin_controller.dart';
import 'package:usermodel/Controller/admin_page.dart';
import 'package:usermodel/Controller/admin_projectcontroller.dart';
import 'package:usermodel/Controller/login_admincontroller.dart';
import 'package:usermodel/view/screens/components/admin/admin_user.dart';
import 'firebase_options.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_)=> AdminProvider() ),
        ChangeNotifierProvider(create: (_)=> Adminlogin()),
        ChangeNotifierProvider(create: (_)=> AdminInputs()),
        ChangeNotifierProvider(create: (_)=> AdminProject())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.grey,
        ),
       home:  const UserAdminPage(),
      ),
    );
  }
}

