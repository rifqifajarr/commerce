import 'package:commerce/app/core/components/product_item.dart';
import 'package:flutter/material.dart';
import 'package:commerce/app/core/resources/themes.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('E-Commerce', style: textTheme(context).headlineSmall),
        centerTitle: true,
      ),
      body: Obx(() {
        final data = controller.data;
        return Column(
          children: [
            Expanded(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 200,
                  crossAxisSpacing: 24,
                  childAspectRatio: 0.72,
                ),
                itemCount: data.length,
                shrinkWrap: true,
                padding: EdgeInsets.symmetric(horizontal: 20),
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      controller.toDetail(data[index]);
                    },
                    child: ProductItem(data: data[index]),
                  );
                },
              ),
            ),
          ],
        );
      }),
    );
  }
}
