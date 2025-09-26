import 'package:commerce/app/core/components/custom_search_bar.dart';
import 'package:commerce/app/core/components/custom_shimmer.dart';
import 'package:commerce/app/core/components/product_item.dart';
import 'package:commerce/app/core/utils/extensions.dart';
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
        final data = controller.filteredData;
        return Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
              child: CustomSearchBar(
                controller: controller.searchController,
                focusNode: controller.searchFocusNode,
                onChanged: (_) {
                  controller.searchProducts();
                },
                onCleared: () {
                  controller.clearSearch();
                },
              ),
            ),
            Expanded(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 200,
                  crossAxisSpacing: 16,
                  childAspectRatio: 0.56,
                ),
                itemCount: controller.isLoading.value ? 6 : data.length,
                shrinkWrap: true,
                padding: EdgeInsets.symmetric(horizontal: 20),
                itemBuilder: (context, index) {
                  return controller.isLoading.value
                      ? ShimmeringObject(
                          margin: EdgeInsets.symmetric(vertical: 8),
                        )
                      : GestureDetector(
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
    ).dismissKeyboardOnTap(context);
  }
}
