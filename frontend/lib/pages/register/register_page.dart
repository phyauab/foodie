import 'package:flutter/material.dart';
import 'package:frontend/components/long_button.dart';
import 'package:frontend/constants.dart';
import 'package:frontend/pages/register/register_controller.dart';
import 'package:get/get.dart';

class RegisterPage extends GetView<RegisterController> {
  RegisterPage({Key? key}) : super(key: key);

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String username = "";
  String password = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: defaultScreenPadding),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Register',
                style: Theme.of(context).textTheme.headline3,
              ),
              const SizedBox(
                height: 50,
              ),
              TextFormField(
                onSaved: (value) {
                  controller.username.value = value!;
                },
                decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.person),
                    border: OutlineInputBorder(),
                    contentPadding: EdgeInsets.all(0),
                    hintText: 'username'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please Enter Username';
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                onSaved: (value) {
                  controller.email.value = value!;
                },
                decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.person),
                    border: OutlineInputBorder(),
                    contentPadding: EdgeInsets.all(0),
                    hintText: 'email'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please Enter Email';
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                onSaved: (value) {
                  controller.password.value = value!;
                },
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.lock),
                  border: OutlineInputBorder(),
                  contentPadding: EdgeInsets.all(0),
                  hintText: 'password',
                ),
                obscureText: true,
                enableSuggestions: false,
                autocorrect: false,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please Enter Password';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 10),
              // SizedBox(
              //   width: double.infinity,
              //   child: ElevatedButton.icon(
              //     onPressed: () async {
              //       if (_formKey.currentState!.validate()) {
              //         _formKey.currentState!.save();
              //         bool isRegisterSuccess = await controller.register();
              //         if (isRegisterSuccess) {
              //           Get.back();
              //         } else {
              //           _showMyDialog(context);
              //         }
              //       }
              //     },
              //     child: const Text(
              //       'Register',
              //       style: TextStyle(color: Colors.white),
              //     ),
              //     style: ButtonStyle(
              //       padding: MaterialStateProperty.all<EdgeInsets>(
              //         const EdgeInsets.all(14),
              //       ),
              //     ),
              //   ),
              // )
              LongButton(
                  text: "Register",
                  icon: Icons.app_registration_rounded,
                  func: () async {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                      bool isRegisterSuccess = await controller.register();
                      if (isRegisterSuccess) {
                        Get.back();
                      } else {
                        _showMyDialog(context);
                      }
                    }
                  })
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _showMyDialog(BuildContext context) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('AlertDialog Title'),
          content: SingleChildScrollView(
            child: ListBody(
              children: const <Widget>[
                Text('This is a demo alert dialog.'),
                Text('Would you like to approve of this message?'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Approve'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
