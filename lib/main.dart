import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:commerce/app/core/resources/themes.dart';

import 'package:get/get.dart';

import 'app/routes/app_pages.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");
  return runApp(const Application());
}

class Application extends StatelessWidget {
  const Application({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: theme(context).copyWith(
        textTheme: textTheme(context).apply(fontFamily: 'PlusJakartaSans'),
      ),
      title: "E-Commerce App",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    );
  }
}
