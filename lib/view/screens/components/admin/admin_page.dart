import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:usermodel/Controller/admin_page.dart';

class AdminPage extends StatelessWidget {
  const AdminPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(
            height: 100,
          ),
          ListTile(
            title: const Text("Create User"),
            leading: Radio(
                value: 0,
                groupValue: context.watch<AdminInputs>().radiovalue,
                onChanged: (value) {
                  context.read<AdminInputs>().onvalueChange(value);
                }),
          ),
          const SizedBox(height: 10),
          ListTile(
            title: const Text("Create project"),
            leading: Radio(
                value: 1,
                groupValue: context.watch<AdminInputs>().radiovalue,
                onChanged: (value) {
                  context.read<AdminInputs>().onvalueChange(value);
                }),
          ),
          const SizedBox(height: 40),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: SizedBox(
                height: 50,
                width: MediaQuery.of(context).size.width * 1,
                child: ElevatedButton(
                    onPressed: () =>context.read<AdminInputs>().onSubmit(context),
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
          const Padding(
            padding: EdgeInsets.only(left: 43),
          )
        ],
      ),
    );
  }
}
