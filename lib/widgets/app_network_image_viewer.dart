import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class AppNetworkImageViewer extends StatelessWidget {
  final String imageUrl;

  const AppNetworkImageViewer({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imageUrl,
      fit: BoxFit.cover,
      width: double.infinity,
      height: double.infinity,
      placeholder:
          (context, url) => Center(
            child: SizedBox(
              width: 24,
              height: 24,
              child: CircularProgressIndicator(strokeWidth: 2),
            ),
          ),
      errorWidget: (context, url, error) => Icon(Icons.broken_image, color: Colors.grey, size: 40),
      fadeInDuration: Duration(milliseconds: 300),
      fadeOutDuration: Duration(milliseconds: 300),
      memCacheWidth: 400, // Optional: for memory optimization
      memCacheHeight: 400, // Optional
    );
  }
}
