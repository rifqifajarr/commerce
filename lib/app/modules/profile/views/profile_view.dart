import 'package:commerce/app/core/components/adaptive_progress_indicator.dart';
import 'package:commerce/app/core/resources/themes.dart';
import 'package:commerce/app/core/utils/extensions.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      appBar: AppBar(
        title: const Text('Profile'),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.black,
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 40),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 32),
              padding: EdgeInsets.all(32),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(24),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withAlpha(20),
                    blurRadius: 20,
                    offset: Offset(0, 8),
                  ),
                  BoxShadow(
                    color: Colors.black.withAlpha(20),
                    blurRadius: 10,
                    offset: Offset(0, 4),
                  ),
                ],
              ),
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: Theme.of(context).primaryColor.withAlpha(50),
                        width: 2,
                      ),
                    ),
                    child: Icon(
                      Icons.account_circle_rounded,
                      size: 100,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                  SizedBox(height: 24),
                  Obx(() {
                    if (controller.isLoading.value) {
                      return Container(
                        padding: EdgeInsets.symmetric(vertical: 20),
                        child: AdaptiveProgressIndicator(),
                      );
                    }
                    return AnimatedContainer(
                      duration: Duration(milliseconds: 300),
                      padding: EdgeInsets.symmetric(
                        horizontal: controller.isEditing.value ? 16 : 8,
                        vertical: controller.isEditing.value ? 12 : 8,
                      ),
                      decoration: BoxDecoration(
                        color: controller.isEditing.value
                            ? Colors.grey.shade50
                            : Colors.transparent,
                        borderRadius: BorderRadius.circular(12),
                        border: controller.isEditing.value
                            ? Border.all(
                                color: Theme.of(
                                  context,
                                ).primaryColor.withAlpha(50),
                                width: 2,
                              )
                            : null,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Flexible(
                            child: controller.isEditing.value
                                ? TextField(
                                    controller: controller.usernameController,
                                    textAlign: TextAlign.center,
                                    style: textTheme(context).headlineSmall
                                        ?.copyWith(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black87,
                                        ),
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText: 'Enter username',
                                      hintStyle: TextStyle(
                                        color: Colors.grey.shade400,
                                        fontSize: 20,
                                      ),
                                    ),
                                  )
                                : Text(
                                    controller.usernameController.text,
                                    style: textTheme(context).headlineSmall
                                        ?.copyWith(
                                          fontWeight: FontWeight.bold,
                                          color:
                                              controller
                                                  .usernameController
                                                  .text
                                                  .isEmpty
                                              ? Colors.grey.shade400
                                              : Colors.black87,
                                        ),
                                    textAlign: TextAlign.center,
                                  ),
                          ),
                          SizedBox(width: 12),
                          Container(
                            decoration: BoxDecoration(
                              color: controller.isEditing.value
                                  ? Colors.green.withAlpha(25)
                                  : Theme.of(
                                      context,
                                    ).primaryColor.withAlpha(25),
                              shape: BoxShape.circle,
                              boxShadow: [
                                BoxShadow(
                                  color:
                                      (controller.isEditing.value
                                              ? Colors.green
                                              : Theme.of(context).primaryColor)
                                          .withAlpha(45),
                                  blurRadius: 8,
                                  offset: Offset(0, 2),
                                ),
                              ],
                            ),
                            child: IconButton(
                              onPressed: () {
                                if (controller.isEditing.value) {
                                  controller.onSubmit();
                                }
                                controller.toggleIsEditing();
                              },
                              icon: AnimatedSwitcher(
                                duration: Duration(milliseconds: 200),
                                child: Icon(
                                  controller.isEditing.value
                                      ? Icons.check
                                      : Icons.edit,
                                  key: ValueKey(controller.isEditing.value),
                                  color: controller.isEditing.value
                                      ? Colors.green
                                      : Theme.of(context).primaryColor,
                                  size: 22,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  }),
                ],
              ),
            ),
            Spacer(),
            Container(
              margin: EdgeInsets.only(bottom: 32),
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withAlpha(40),
                    blurRadius: 10,
                    offset: Offset(0, 4),
                  ),
                ],
              ),
              child: Text(
                'Made by Rifqi Fajar',
                style: textTheme(context).bodyMedium?.copyWith(
                  color: Colors.grey.shade800,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
      ),
    ).dismissKeyboardOnTap(context);
  }
}
