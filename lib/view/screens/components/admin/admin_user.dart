import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:usermodel/Controller/login_admincontroller.dart';

class UserAdminPage extends StatelessWidget {
  const UserAdminPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.only(bottom: 30),
        child: ListView(
          children: [
          const SizedBox(height: 100),
          Container(
            margin: const EdgeInsets.only(left: 20, right: 20, top: 30),
            child: Form(
              key: context.watch<Adminlogin>().formKey,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  textInput(
                    hint: 'User Name',
                    controller: context.watch<Adminlogin>().usernameController,
                    validator:(value) => context.read<Adminlogin>().usernameValidater(value!),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  textInput(
                    hint: 'Password',
                    controller: context.watch<Adminlogin>().paswordController,
                    validator: (value) => context.read<Adminlogin>().passwordValidater(value!),
                  ),
                  const SizedBox(height: 12),
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: SizedBox(
                        height: 50,
                        width: MediaQuery.of(context).size.width * 1,
                        child: ElevatedButton(
                            onPressed: () => context.read<Adminlogin>().feildValidation(context),
                            style: ElevatedButton.styleFrom(
                              primary: Colors.black,
                            ),
                            child: const Text(
                              'Login',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                              ),
                            )),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ]),
      ),
    );
  }
}

Widget textInput(
    {controller, hint, icon, FormFieldValidator<String>? validator}) {
  return Container(
    margin: const EdgeInsets.only(top: 10),
    decoration: const BoxDecoration(
      borderRadius: BorderRadius.all(Radius.circular(15)),
      color: Colors.white,
    ),
    child: Padding(
      padding: const EdgeInsets.only(left: 10),
      child: TextFormField(
        validator: validator,
        style: const TextStyle(fontSize: 15),
        controller: controller,
        decoration: InputDecoration(
          fillColor: const Color(0xfff3f3f4),
          filled: true,
          border: InputBorder.none,
          hintText: hint,
          prefixIcon: Icon(
            icon,
            size: 16,
          ),
        ),
      ),
    ),
  );
}
