import 'package:flutter/material.dart';
import 'package:frontend/constants.dart';
import 'package:frontend/providers/user_provider.dart';
import 'package:get/get.dart';

class WelcomeMessage extends StatelessWidget {
  const WelcomeMessage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final userProvider = Get.put(UserProvider());

    return Container(
      decoration: BoxDecoration(
        color: Colors.orange[300],
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(defaultBorderRadius),
          bottomRight: Radius.circular(defaultBorderRadius),
        ),
      ),
      width: MediaQuery.of(context).size.width,
      child: Padding(
        padding: EdgeInsets.symmetric(
            vertical: 40, horizontal: defaultScreenPadding),
        child: Obx(
          (() => userProvider.isLoggedIn.value
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Welcome back,",
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.w500,
                            color: Colors.white70,
                          ),
                        ),
                        Text(
                          "${userProvider.user!.username}!",
                          style: const TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                    const CircleAvatar(
                      radius: 40,
                      child: Icon(Icons.person),
                    )
                  ],
                )
              : Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          "You haven't logged in",
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.w500,
                            color: Colors.white70,
                          ),
                        ),
                        Text(
                          "Login to see more!",
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                    const CircleAvatar(
                      radius: 40,
                      child: Icon(Icons.person),
                    )
                  ],
                )),
        ),
      ),
    );
  }
}
