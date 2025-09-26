import 'package:commerce/app/core/components/custom_image.dart';
import 'package:commerce/app/core/resources/themes.dart';
import 'package:commerce/app/core/utils/utils.dart';
import 'package:commerce/app/data/response/products.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/detail_controller.dart';

class DetailView extends GetView<DetailController> {
  const DetailView({super.key});

  @override
  Widget build(BuildContext context) {
    final data = controller.data;
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 300,
            pinned: true,
            elevation: 0,
            backgroundColor: Colors.white,
            leading: Container(
              margin: EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withAlpha(80),
                    blurRadius: 8,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              child: IconButton(
                icon: Icon(Icons.arrow_back, color: Colors.black87),
                onPressed: () => Get.back(),
              ),
            ),
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Colors.white, Colors.grey.shade100],
                  ),
                ),
                child: _buildHero(data.id.toString(), data.image),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black..withAlpha(80),
                    blurRadius: 10,
                    offset: Offset(0, -2),
                  ),
                ],
              ),
              child: _buildDetail(
                context,
                data.category,
                data.title,
                data.rating,
                data.price,
                data.description,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHero(String id, String image) {
    return Stack(
      children: [
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          height: 100,
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Colors.transparent, Colors.grey.shade50],
              ),
            ),
          ),
        ),
        Center(
          child: Hero(
            tag: 'product_$id',
            child: Container(
              padding: EdgeInsets.all(20),
              child: CustomImage(url: image, height: 250, fit: BoxFit.contain),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildDetail(
    BuildContext context,
    String category,
    String title,
    Rating rating,
    double price,
    String description,
  ) {
    return Padding(
      padding: EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor.withAlpha(20),
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: Theme.of(context).primaryColor),
            ),
            child: Text(
              category.toUpperCase(),
              style: textTheme(context).bodySmall?.copyWith(
                color: Theme.of(context).primaryColor,
                fontWeight: FontWeight.w600,
                letterSpacing: 0.5,
              ),
            ),
          ),
          SizedBox(height: 16),
          Text(
            title,
            style: textTheme(context).headlineSmall?.copyWith(
              fontWeight: FontWeight.bold,
              height: 1.3,
              letterSpacing: -0.5,
            ),
          ),
          SizedBox(height: 16),
          Container(
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.amber.withAlpha(30),
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: Colors.amber.withAlpha(80)),
            ),
            child: Row(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  decoration: BoxDecoration(
                    color: Colors.amber,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.amber.withAlpha(80),
                        blurRadius: 8,
                        offset: Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.star_rounded, size: 20, color: Colors.white),
                      SizedBox(width: 4),
                      Text(
                        rating.rate.toString(),
                        style: textTheme(context).titleMedium?.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        _getRatingText(rating.rate),
                        style: textTheme(context).titleMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: Colors.amber.shade700,
                        ),
                      ),
                      SizedBox(height: 2),
                      Text(
                        "Based on ${rating.count} reviews",
                        style: textTheme(
                          context,
                        ).bodySmall?.copyWith(color: Colors.grey.shade600),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 24),
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Theme.of(context).primaryColor,
                  Theme.of(context).primaryColor.withAlpha(80),
                ],
              ),
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: Theme.of(context).primaryColor.withAlpha(80),
                  blurRadius: 12,
                  offset: Offset(0, 4),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Price",
                  style: textTheme(context).bodyMedium?.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  formatDollar(price),
                  style: textTheme(context).headlineMedium?.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    letterSpacing: -1,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 24),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Description",
                style: textTheme(
                  context,
                ).titleLarge?.copyWith(fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 12),
              Container(
                width: double.infinity,
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.grey.shade50,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: Colors.grey.shade200),
                ),
                child: Text(
                  description,
                  style: textTheme(context).bodyMedium?.copyWith(
                    height: 1.6,
                    color: Colors.grey.shade700,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 32),
          Row(
            children: [
              Expanded(
                child: _buildStatCard(
                  context,
                  "Quality",
                  _getQualityText(rating.rate),
                  Icons.verified_outlined,
                  _getQualityColor(rating.rate),
                ),
              ),
              SizedBox(width: 12),
              Expanded(
                child: _buildStatCard(
                  context,
                  "Reviews",
                  "${rating.count}",
                  Icons.rate_review_outlined,
                  Colors.blue,
                ),
              ),
              SizedBox(width: 12),
              Expanded(
                child: _buildStatCard(
                  context,
                  "Rating",
                  "${rating.rate}/5",
                  Icons.star_outline_rounded,
                  Colors.amber,
                ),
              ),
            ],
          ),
          SizedBox(height: 32),
        ],
      ),
    );
  }

  Widget _buildStatCard(
    BuildContext context,
    String title,
    String value,
    IconData icon,
    Color color,
  ) {
    return Container(
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: color.withAlpha(30),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: color),
      ),
      child: Column(
        children: [
          Icon(icon, color: color, size: 20),
          SizedBox(height: 6),
          Text(
            value,
            style: textTheme(
              context,
            ).titleSmall?.copyWith(fontWeight: FontWeight.bold, color: color),
          ),
          SizedBox(height: 2),
          Text(
            title,
            style: textTheme(
              context,
            ).bodySmall?.copyWith(color: Colors.grey.shade600, fontSize: 10),
          ),
        ],
      ),
    );
  }

  String _getRatingText(double rating) {
    if (rating >= 4.5) return 'Excellent';
    if (rating >= 4.0) return 'Very Good';
    if (rating >= 3.5) return 'Good';
    if (rating >= 3.0) return 'Average';
    return 'Poor';
  }

  Color _getQualityColor(double rating) {
    if (rating >= 4.5) return Colors.green;
    if (rating >= 4.0) return Colors.lightGreen;
    if (rating >= 3.5) return Colors.orange;
    if (rating >= 3.0) return Colors.deepOrange;
    return Colors.red;
  }

  String _getQualityText(double rating) {
    if (rating >= 4.5) return 'Premium';
    if (rating >= 4.0) return 'High';
    if (rating >= 3.5) return 'Good';
    if (rating >= 3.0) return 'Fair';
    return 'Low';
  }
}
