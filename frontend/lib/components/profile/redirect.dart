import 'package:flutter/material.dart';
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
            "Foodie login to see more!",
            style: Theme.of(context).textTheme.headline5,
          ),
          const SizedBox(
            height: 50,
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * longButtonToScreenRatio,
            child: ElevatedButton.icon(
              onPressed: () {
                Get.toNamed("/login");
              },
              icon: const Icon(Icons.login),
              label: const Text("Login"),
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * longButtonToScreenRatio,
            child: ElevatedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.app_registration_rounded),
              label: const Text("Register"),
            ),
          )
        ],
      ),
    );
  }
}
