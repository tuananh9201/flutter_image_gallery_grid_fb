library image_gallery_grid_fb;

import 'package:flutter/material.dart';
import './gallery_item_thumbnail.dart';

class GalleryImageGridFb extends StatefulWidget {
  final List<String> imageUrls;
  final GestureTapCallback onTap;
  const GalleryImageGridFb({@required this.imageUrls, this.onTap});
  @override
  _GalleryImageGridFbState createState() => _GalleryImageGridFbState();
}

class _GalleryImageGridFbState extends State<GalleryImageGridFb> {
  List<GalleryItemModel> galleryItems = <GalleryItemModel>[];
  GalleryItemModel firstItem;
  @override
  void initState() {
    buildItemsList(widget.imageUrls);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(4),
      child: galleryItems.isEmpty
          ? getEmptyWidget()
          : FittedBox(
              fit: BoxFit.scaleDown,
              child: SizedBox(
                height: 400,
                width: MediaQuery.of(context).size.width,
                child: Column(
                  children: [
                    Container(
                      height: 150,
                      width: double.infinity,
                      margin: EdgeInsets.only(bottom: 8),
                      child: GalleryItemThumbnail(
                        galleryItem: firstItem,
                        onTap: widget.onTap,
                      ),
                    ),
                    GridView.builder(
                      primary: false,
                      itemCount:
                          galleryItems.length > 2 ? 2 : galleryItems.length,
                      padding: EdgeInsets.all(0),
                      semanticChildCount: 1,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: 0,
                          crossAxisSpacing: 5),
                      shrinkWrap: true,
                      itemBuilder: (BuildContext context, int index) {
                        return galleryItems.length > 2 && index == 1
                            ? buildImageNumbers(index)
                            : GalleryItemThumbnail(
                                galleryItem: galleryItems[index],
                                onTap: () {
                                  widget.onTap();
                                },
                              );
                      },
                    )
                  ],
                ),
              ),
            ),
    );
  }

  // clear and build list
  buildItemsList(List<String> items) {
    galleryItems.clear();
    int count = 0;
    items.forEach((item) {
      if (count == 0) {
        firstItem = GalleryItemModel(id: item, imageUrl: item);
      } else {
        galleryItems.add(
          GalleryItemModel(id: item, imageUrl: item),
        );
      }
      count++;
    });
  }

  Widget buildImageNumbers(int index) {
    return GestureDetector(
      onTap: () {
        widget.onTap();
      },
      child: Stack(
        alignment: AlignmentDirectional.center,
        fit: StackFit.expand,
        children: <Widget>[
          GalleryItemThumbnail(
            galleryItem: galleryItems[index],
          ),
          Container(
            height: 150,
            color: Colors.black.withOpacity(.7),
            child: Center(
              child: Text(
                "+${galleryItems.length - index}",
                style: TextStyle(color: Colors.white, fontSize: 40),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget getEmptyWidget() {
    return SizedBox.shrink();
  }
}
