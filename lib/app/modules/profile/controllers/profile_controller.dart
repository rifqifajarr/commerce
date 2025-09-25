import 'package:commerce/app/core/utils/utils.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController {
  final RxBool isEditing = false.obs;
  final RxBool isLoading = true.obs;
  late Preferences prefs;
  TextEditingController usernameController = TextEditingController();

  void toggleIsEditing() {
    isEditing.value = !isEditing.value;
  }

  void onSubmit() {
    prefs.username = usernameController.text;
    Get.snackbar(
      "Username changed!",
      "Username changed to: ${usernameController.text}",
    );
  }

  @override
  void onInit() {
    super.onInit();
    _initializeData();
  }

  void _initializeData() async {
    try {
      isLoading.value = true;
      prefs = await Preferences.instance();
      usernameController.text = prefs.username ?? "Guest";
    } catch (e) {
      usernameController.text = "Guest";
    } finally {
      isLoading.value = false;
    }
  }

  @override
  void onClose() {
    usernameController.dispose();
    super.onClose();
  }
}
