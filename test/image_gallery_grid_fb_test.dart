import 'package:flutter_test/flutter_test.dart';

import 'package:image_gallery_grid_fb/image_gallery_grid_fb.dart';

void main() {
  testWidgets('MyWidget has a title and message', (WidgetTester tester) async {
    // Create the widget by telling the tester to build it.
    final List<String> imageUrls = [
      "https://mikihome-listing.s3-ap-southeast-1.amazonaws.com/s3url_3045b488-1bae-11eb-b97f-62c21a3cbd5e_361b8b80-1bae-11eb-a7b7-a20f5861fd9f_2808920255876571.jpg",
      "https://mikihome-listing.s3-ap-southeast-1.amazonaws.com/s3url_3045b488-1bae-11eb-b97f-62c21a3cbd5e_366e2110-1bae-11eb-a7b7-a20f5861fd9f_2808920409209889.jpg",
      "https://mikihome-listing.s3-ap-southeast-1.amazonaws.com/s3url_3045b488-1bae-11eb-b97f-62c21a3cbd5e_32959f00-1bae-11eb-a7b7-a20f5861fd9f_2808919195876677.jpg",
      "https://mikihome-listing.s3-ap-southeast-1.amazonaws.com/s3url_3045b488-1bae-11eb-b97f-62c21a3cbd5e_371d8952-1bae-11eb-a7b7-a20f5861fd9f_2808920599209870.jpg",
      "https://mikihome-listing.s3-ap-southeast-1.amazonaws.com/s3url_3045b488-1bae-11eb-b97f-62c21a3cbd5e_33dd4ab6-1bae-11eb-a7b7-a20f5861fd9f_2808919469209983.jpg",
      "https://mikihome-listing.s3-ap-southeast-1.amazonaws.com/s3url_3045b488-1bae-11eb-b97f-62c21a3cbd5e_356290a8-1bae-11eb-a7b7-a20f5861fd9f_2808920092543254.jpg"
    ];
    await tester.pumpWidget(GalleryImageGridFb(
      imageUrls: imageUrls,
      onTap: () {
        print("hello");
      },
    ));
    final numberPlusImageFinder = find.text('Flutter Demo Home Page');
    expect(numberPlusImageFinder, findsOneWidget);
  });
}
