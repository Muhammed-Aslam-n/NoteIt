import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:noteit/controller/controller.dart';
import 'package:noteit/widgets/widgets.dart';
import 'package:wc_form_validators/wc_form_validators.dart';
import 'package:get/get.dart';

class EditStudent extends StatelessWidget {
  const EditStudent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();

    final noteItController = Get.find<NoteItController>();

    return Scaffold(
      appBar: const CommonAppBar(),
      body: GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: Container(
          margin: const EdgeInsets.only(top: 10),
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 30),
          child: Form(
            key: _formKey,
            child: ListView(
              children: [
                const SizedBox(
                  height: 80,
                ),
                SizedBox(
                  child: TextFormField(
                    controller: noteItController.studentName,
                    keyboardType: TextInputType.text,
                    validator: Validators.compose([
                      Validators.required("This Field is Required"),
                      Validators.minLength(
                          5, "Name must be atleast 5 Characters"),
                    ]),
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(RegExp('[a-z.A-Z ]'))
                    ],
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    decoration: InputDecoration(
                      icon: const Icon(Icons.person),
                      labelText: 'Name',
                      fillColor: Colors.white,
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25.0),
                        borderSide: const BorderSide(
                          color: Colors.blue,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25.0),
                        borderSide: const BorderSide(
                          color: Color.fromARGB(255, 9, 87, 102),
                          width: 1.0,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                SizedBox(
                  child: TextFormField(
                    controller: noteItController.studentAge,
                    keyboardType: TextInputType.number,
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(RegExp('[0-9 ]'))
                    ],
                    validator: Validators.compose([
                      Validators.required("Age is Required"),
                      Validators.maxLength(2, "Invalid Age"),
                    ]),
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    decoration: InputDecoration(
                      icon: const Icon(Icons.accessibility),
                      labelText: 'Age',
                      fillColor: Colors.white,
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25.0),
                        borderSide: const BorderSide(
                          color: Colors.blue,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25.0),
                        borderSide: const BorderSide(
                          color: Color.fromARGB(255, 9, 87, 102),
                          width: 1.0,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                SizedBox(
                  child: TextFormField(
                    controller: noteItController.studentRoll,
                    keyboardType: TextInputType.number,
                    validator: Validators.compose([
                      Validators.required("This is Field is Required"),
                      Validators.maxLength(10, "Invalid Register Number"),
                      Validators.minLength(5, "Invalid Register Number"),
                    ]),
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(RegExp('[0-9 ]'))
                    ],
                    decoration: InputDecoration(
                      icon: const Icon(Icons.paste),
                      labelText: 'Roll Number',
                      fillColor: Colors.white,
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25.0),
                        borderSide: const BorderSide(
                          color: Colors.blue,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25.0),
                        borderSide: const BorderSide(
                          color: Color.fromARGB(255, 9, 87, 102),
                          width: 1.0,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                SizedBox(
                  child: TextFormField(
                    controller: noteItController.studentMobile,
                    keyboardType: TextInputType.phone,
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(RegExp('[0-9 ]')),
                    ],
                    validator: Validators.compose([
                      Validators.required("This is Field is Required"),
                      Validators.maxLength(10, "Maximum 10 Digits"),
                      Validators.minLength(10, "Minimum 10 Digits")
                    ]),
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    decoration: InputDecoration(
                      icon: const Icon(Icons.phone),
                      labelText: 'Contact Number',
                      fillColor: Colors.white,
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25.0),
                        borderSide: const BorderSide(
                          color: Colors.blue,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25.0),
                        borderSide: const BorderSide(
                          color: Color.fromARGB(255, 9, 87, 102),
                          width: 1.0,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.only(left: 30),
                  child: SizedBox(
                    child: OutlinedButton(
                      onPressed: () async {
                        final isValidated = _formKey.currentState!.validate();
                        if (isValidated) {
                          noteItController.addStudent();
                          Get.offNamed('/shortDetails');
                          if (noteItController.isShortEnabled) {
                            Get.back();
                          } else {
                            Get.offNamed('/shortDetails');
                          }
                        }
                      },
                      style: OutlinedButton.styleFrom(
                          side: const BorderSide(
                              color: Color.fromARGB(255, 9, 87, 102),
                              width: 1.0),
                          minimumSize: const Size(230, 50)),
                      child: const Text(
                        "Save",
                        style:
                            TextStyle(color: Color.fromARGB(255, 9, 87, 102)),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
