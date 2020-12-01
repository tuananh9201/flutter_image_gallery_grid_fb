import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class GalleryItemModel {
  GalleryItemModel({this.id, this.imageUrl});
// id image (image url) to use in hero animation
  final String id;
  // image url
  final String imageUrl;
}

class GalleryItemThumbnail extends StatelessWidget {
  final GalleryItemModel galleryItem;

  final GestureTapCallback onTap;

  const GalleryItemThumbnail({Key key, this.galleryItem, this.onTap})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: GestureDetector(
        onTap: onTap,
        child: CachedNetworkImage(
          fit: BoxFit.cover,
          imageUrl: galleryItem.imageUrl,
          height: 100.0,
          placeholder: (context, url) =>
              Center(child: CircularProgressIndicator()),
          errorWidget: (context, url, error) => Icon(Icons.error),
        ),
      ),
    );
  }
}
