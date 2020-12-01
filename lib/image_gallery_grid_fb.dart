library image_gallery_grid_fb;

import 'package:flutter/material.dart';
import './gallery_item_thumbnail.dart';
import 'package:cached_network_image/cached_network_image.dart';

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
        padding: EdgeInsets.all(10),
        child: galleryItems.isEmpty
            ? getEmptyWidget()
            : Container(
                child: Column(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Container(
                        padding: EdgeInsets.all(10.0),
                        child: CachedNetworkImage(
                          fit: BoxFit.cover,
                          imageUrl: firstItem.imageUrl,
                          height: 100.0,
                          width: double.infinity,
                          placeholder: (context, url) =>
                              Center(child: CircularProgressIndicator()),
                          errorWidget: (context, url, error) => Text("ERROR"),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: GridView.builder(
                          primary: false,
                          itemCount:
                              galleryItems.length > 3 ? 3 : galleryItems.length,
                          padding: EdgeInsets.all(0),
                          semanticChildCount: 1,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 3,
                                  mainAxisSpacing: 0,
                                  crossAxisSpacing: 5),
                          shrinkWrap: true,
                          itemBuilder: (BuildContext context, int index) {
                            return ClipRRect(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(8)),
                                // if have less than 4 image w build GalleryItemThumbnail
                                // if have mor than 4 build image number 3 with number for other images
                                child: galleryItems.length > 3 && index == 2
                                    ? buildImageNumbers(index)
                                    : GalleryItemThumbnail(
                                        galleryItem: galleryItems[index],
                                        onTap: () {
                                          widget.onTap();
                                        },
                                      ));
                          }),
                    )
                  ],
                ),
              ));
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

  // build image with number for other images
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
    /// reference
    /// https://stackoverflow.com/a/55796929/2172590
    return Text("SHIT");
  }
}
