import 'package:commerce/app/core/resources/themes.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/splash_controller.dart';

class SplashView extends GetView<SplashController> {
  const SplashView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'E-Commerce',
          style: textTheme(
            context,
          ).displayMedium?.copyWith(fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
