import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

class CustomNetworkImage extends StatelessWidget {
  const CustomNetworkImage({super.key, required this.imageUrl});

  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(4),
      child: CachedNetworkImage(
        imageUrl: imageUrl,
        placeholder:
            (context, url) => Skeletonizer(
              enabled: true,
              child: Container(color: Colors.grey, width: 100, height: 100),
            ),

        errorWidget: (context, url, error) => Icon(Icons.error),
        fit: BoxFit.contain,
      ),
    );
    // return Image.network(imageUrl);
  }
}
