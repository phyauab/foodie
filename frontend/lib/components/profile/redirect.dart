import 'package:flutter/material.dart';
import 'package:frontend/components/long_button.dart';
import 'package:get/get.dart';

import '../../constants.dart';

class Redirect extends StatelessWidget {
  const Redirect({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Login to see more!",
            style: Theme.of(context).textTheme.headline5,
          ),
          const SizedBox(
            height: 50,
          ),
          LongButton(
            text: 'Login',
            icon: Icons.login,
            func: () {
              Get.toNamed("/login");
            },
          ),
          const SizedBox(
            height: 15,
          ),
          LongButton(
            text: 'Register',
            icon: Icons.app_registration,
            func: () {
              Get.toNamed("/register");
            },
            isInverted: true,
          ),
        ],
      ),
    );
  }
}
