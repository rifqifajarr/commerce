import 'package:commerce/app/core/components/custom_card.dart';
import 'package:commerce/app/core/components/custom_image.dart';
import 'package:commerce/app/core/resources/themes.dart';
import 'package:commerce/app/core/utils/utils.dart';
import 'package:commerce/app/data/response/products.dart';
import 'package:flutter/material.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({super.key, required this.data});

  final Products data;

  @override
  Widget build(BuildContext context) {
    return CustomCard(
      padding: EdgeInsets.all(8),
      margin: EdgeInsets.symmetric(vertical: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
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
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(Icons.star_rounded, size: 18),
                  Text(
                    data.rating.rate.toString(),
                    style: textTheme(
                      context,
                    ).titleSmall?.copyWith(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
