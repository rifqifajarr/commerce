import 'package:commerce/app/core/components/adaptive_progress_indicator.dart';
import 'package:commerce/app/core/utils/extensions.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Profile'), centerTitle: true),
      body: Center(
        child: Column(
          children: [
            Icon(Icons.account_circle_rounded, size: 128),
            Obx(() {
              if (controller.isLoading.value) {
                return Center(child: AdaptiveProgressIndicator());
              }
              return Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  controller.isEditing.value
                      ? Expanded(
                          child: TextField(
                            controller: controller.usernameController,
                          ),
                        )
                      : Text(
                          controller.usernameController.text,
                          style: TextStyle(fontSize: 20),
                        ),
                  SizedBox(width: 4),
                  IconButton(
                    onPressed: () {
                      if (controller.isEditing.value) {
                        controller.onSubmit();
                      }
                      controller.toggleIsEditing();
                    },
                    icon: Icon(
                      controller.isEditing.value ? Icons.check : Icons.edit,
                    ),
                  ),
                ],
              );
            }),
            Spacer(),
            Text("Made by Rifqi Fajar"),
          ],
        ),
      ),
    ).dismissKeyboardOnTap(context);
  }
}
