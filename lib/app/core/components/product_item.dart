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
      margin: EdgeInsets.symmetric(vertical: 8),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                CustomImage(url: data.image, height: 140, fit: BoxFit.contain),
                Positioned(
                  top: 4,
                  right: 4,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 6, vertical: 4),
                    decoration: BoxDecoration(
                      color: Colors.amber,
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.amber.withAlpha(3),
                          blurRadius: 6,
                          offset: Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.star_rounded, size: 14, color: Colors.white),
                        SizedBox(width: 2),
                        Text(
                          data.rating.rate.toString(),
                          style: textTheme(context).bodySmall?.copyWith(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 11,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Container(
              padding: EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    data.title,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: textTheme(context).titleSmall?.copyWith(
                      fontWeight: FontWeight.w700,
                      height: 1.3,
                      letterSpacing: -0.2,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(data.category, style: textTheme(context).labelSmall),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Theme.of(context).primaryColor.withAlpha(1),
                          Theme.of(context).primaryColor.withAlpha(5),
                        ],
                      ),
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                        color: Theme.of(context).primaryColor.withAlpha(2),
                        width: 1,
                      ),
                    ),
                    child: Text(
                      formatDollar(data.price),
                      style: textTheme(context).titleMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                  ),
                  SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 6,
                          vertical: 2,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.grey.shade100,
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              Icons.reviews_outlined,
                              size: 12,
                              color: Colors.grey.shade600,
                            ),
                            SizedBox(width: 2),
                            Text(
                              '${data.rating.count} reviews',
                              style: textTheme(context).bodySmall?.copyWith(
                                color: Colors.grey.shade600,
                                fontSize: 10,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
