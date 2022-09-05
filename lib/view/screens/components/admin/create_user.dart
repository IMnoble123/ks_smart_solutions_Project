import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:usermodel/Controller/admin_controller.dart';

class CreatePage extends StatelessWidget {
  const CreatePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.only(bottom: 30),
        child: ListView(children: [
          const SizedBox(height: 100),
          const Padding(
            padding: EdgeInsets.only(left: 120, right: 90, top: 30),
            child: Text(
              'Create User',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(left: 20, right: 20, top: 30),
            child: Form(
              key: context.watch<AdminProvider>().formkey,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  textInput(
                    hint: 'User Name',
                    icon: Icons.person,
                    controller: context.watch<AdminProvider>().nameController,
                    validator: (value) => context.read<AdminProvider>().nameValidater(value!),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  textInput(
                    hint: 'Password',
                    icon: Icons.vpn_key,
                    controller: context.watch<AdminProvider>().passwordController,
                    validator: (value) => context.read<AdminProvider>().passwordValidater(value!),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  textInput(
                    hint: 'Date of Birth:',
                    icon: Icons.calendar_month,
                    controller: context.watch<AdminProvider>().dateController,
                    validator: (value) => context.read<AdminProvider>().dateValidation(value!),
                    readOnly: true,
                    ontap: () =>context.read<AdminProvider>().datePicker(context)
                  ),
                  const SizedBox(height: 12),
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: SizedBox(
                        height: 50,
                        width: MediaQuery.of(context).size.width * 1,
                        child: ElevatedButton(
                            onPressed: ()=> context.read<AdminProvider>().createValidater(),
                            style: ElevatedButton.styleFrom(
                              primary: Colors.black,
                            ),
                            child: const Text(
                              'Submit',
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
    {controller, hint, icon, FormFieldValidator<String>? validator,ontap,readOnly = false}) {
  return Container(
    margin: const EdgeInsets.only(top: 10),
    decoration: const BoxDecoration(
      borderRadius: BorderRadius.all(Radius.circular(15)),
      color: Colors.white,
    ),
    child: Padding(
      padding: const EdgeInsets.only(left: 10),
      child: TextFormField(
        readOnly: readOnly,
        validator: validator,
        onTap: ontap,
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