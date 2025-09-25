import 'package:commerce/app/core/components/custom_image.dart';
import 'package:commerce/app/core/resources/themes.dart';
import 'package:commerce/app/core/utils/utils.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/detail_controller.dart';

class DetailView extends GetView<DetailController> {
  const DetailView({super.key});

  @override
  Widget build(BuildContext context) {
    final data = controller.data;
    return Scaffold(
      appBar: AppBar(title: const Text('DetailView'), centerTitle: true),
      body: Column(
        children: [
          CustomImage(url: data.image, height: 120, fit: BoxFit.contain),
          Text(
            data.title,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: textTheme(
              context,
            ).titleSmall?.copyWith(fontWeight: FontWeight.bold),
          ),
          Text(data.category, style: textTheme(context).bodySmall),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                formatDollar(data.price),
                style: textTheme(
                  context,
                ).titleSmall?.copyWith(fontWeight: FontWeight.bold),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.star_rounded, size: 18),
                  SizedBox(width: 6),
                  Text(
                    data.rating.rate.toString(),
                    style: textTheme(
                      context,
                    ).titleSmall?.copyWith(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(width: 6),
                  Text(
                    "(${data.rating.count})",
                    style: textTheme(context).titleSmall,
                  ),
                ],
              ),
            ],
          ),
          Text(data.description),
        ],
      ),
    );
  }
}
