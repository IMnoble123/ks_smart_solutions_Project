import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:usermodel/Controller/admin_projectcontroller.dart';

class CreateProject extends StatelessWidget {
  const CreateProject({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final watch = context.watch<AdminProject>();
    //watch.detailsController.text = watch.dropdownvalue;
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.only(bottom: 30),
        child: ListView(children: [
          const SizedBox(height: 100),
          const Padding(
            padding: EdgeInsets.only(left: 120, right: 90, top: 30),
            child: Text(
              'Create Project',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(left: 20, right: 20, top: 30),
            child: Form(
              key: context.watch<AdminProject>().formKey,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  textInput(
                    context: context,
                    hint: 'Project Name',
                    controller: context.watch<AdminProject>().projectController,
                    validator: (value) =>
                        context.read<AdminProject>().projectValidater(value!),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  textInput(
                    context: context,
                    hint: 'Project Date',
                    controller: context.watch<AdminProject>().dateController,
                    validator: (value) =>
                        context.read<AdminProject>().dateValidater(value!),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  textInput(
                      isDropdown: true,
                      context: context,
                      hint: 'Company Details(Name,Carch Phrase)',
                      controller:
                          context.watch<AdminProject>().detailsController,
                      validator: (value) =>
                          context.read<AdminProject>().companyValidater(value!),
                      dropdawnlist: watch.companies),
                  const SizedBox(
                    height: 8,
                  ),
                  textInput(
                    isDropdown: true,
                    hint: 'Website',
                    dropdawnlist: watch.websites,
                    controller: context.watch<AdminProject>().websiteController,
                    validator: (value) =>
                        context.read<AdminProject>().webValidater(value!),
                    context: context,
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  textInput(
                    context: context,
                    dropdawnlist: watch.city,
                    isDropdown: true,
                    hint: 'Location',
                    controller: context.read<AdminProject>().locationController,
                    validator: (value) =>
                        context.read<AdminProject>().locationValidater(value!),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  textInput(
                    isDropdown: true,
                    // dropdawnlist: ,
                    context: context,
                    hint: 'Assigns User',
                    controller: context.watch<AdminProject>().asignController,
                    validator: (value) =>
                        context.read<AdminProject>().assignValidater(value!),
                  ),
                  const SizedBox(height: 12),
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: SizedBox(
                        height: 50,
                        width: MediaQuery.of(context).size.width * 1,
                        child: ElevatedButton(
                            onPressed: () =>
                                context.read<AdminProject>().submitValidation(),
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
    {controller,
    hint,
    FormFieldValidator<String>? validator,
    required BuildContext context,
    bool? isDropdown,
    List<String>? dropdawnlist}) {
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
              suffixIcon: isDropdown != null
                  ? DropdownButton<String>(
                      items: dropdawnlist?.map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      onChanged: (value) {
                        if (value == null) return;
                        controller.text = value;
                      },
                    )
                  : null)),
    ),
  );
}
