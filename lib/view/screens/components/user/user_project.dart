import 'package:flutter/material.dart';
import 'package:usermodel/model/update.dart';

class UserProject extends StatelessWidget {
  const UserProject({Key? key, this.project}) : super(key: key);
  final Updateproject? project;
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
              'My Project',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(left: 20, right: 20, top: 30),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [Text(project?.location ?? "hi")],
            ),
          ),
        ]),
      ),
    );
  }
}
