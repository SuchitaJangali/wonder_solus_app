// Article Card Widget
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wonder_souls/src/utils/common_widgets/size.dart';

class ArticleCard extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String date;

  const ArticleCard({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.date,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Colors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Image.network(
              imageUrl,
              width: 200.w,
              height: 140.w,
              fit: BoxFit.cover,
              loadingBuilder: (context, child, loadingProgress) {
                if (loadingProgress == null) return child;
                return Container(
                  width: 200.w,
                  height: 140.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: Colors.grey[200],
                  ),
                  child: Center(
                    child: CircularProgressIndicator(
                      color: const Color(0xFF2DD4A3),
                    ),
                  ),
                );
              },
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  width: 20.w,
                  height: 140.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [Colors.orange.shade300, Colors.pink.shade200],
                    ),
                  ),
                  child: const Icon(
                    Icons.article,
                    size: 50,
                    color: Colors.white,
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Text(
                  title,
                  style: Theme.of(
                    context,
                  ).textTheme.bodyMedium, //AppTextStyles.bodyMediumRegular,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              8.w.width,
              const Icon(Icons.more_vert, size: 20, color: Colors.black),
            ],
          ),
          8.h.height,
          Text(date, style: Theme.of(context).textTheme.labelSmall),
        ],
      ),
    );
  }
}
