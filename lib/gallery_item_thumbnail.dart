import 'package:flutter/material.dart';
import './image_item.dart';

class GalleryItemModel {
  GalleryItemModel({this.id, this.imageUrl});
  final String id;
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
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10.0)),
      ),
      child: GestureDetector(
        onTap: onTap,
        child: ImageItem(imageUrl: galleryItem.imageUrl),
      ),
    );
  }
}
