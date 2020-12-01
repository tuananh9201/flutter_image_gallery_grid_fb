import 'package:flutter/material.dart';
import 'package:image_gallery_grid_fb/image_gallery_grid_fb.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        child: GalleryImageGridFb(
          imageUrls: [
            "https://mikihome-listing.s3-ap-southeast-1.amazonaws.com/s3url_3045b488-1bae-11eb-b97f-62c21a3cbd5e_361b8b80-1bae-11eb-a7b7-a20f5861fd9f_2808920255876571.jpg",
            "https://mikihome-listing.s3-ap-southeast-1.amazonaws.com/s3url_3045b488-1bae-11eb-b97f-62c21a3cbd5e_366e2110-1bae-11eb-a7b7-a20f5861fd9f_2808920409209889.jpg",
            "https://mikihome-listing.s3-ap-southeast-1.amazonaws.com/s3url_3045b488-1bae-11eb-b97f-62c21a3cbd5e_32959f00-1bae-11eb-a7b7-a20f5861fd9f_2808919195876677.jpg",
            "https://mikihome-listing.s3-ap-southeast-1.amazonaws.com/s3url_3045b488-1bae-11eb-b97f-62c21a3cbd5e_371d8952-1bae-11eb-a7b7-a20f5861fd9f_2808920599209870.jpg",
            "https://mikihome-listing.s3-ap-southeast-1.amazonaws.com/s3url_3045b488-1bae-11eb-b97f-62c21a3cbd5e_33dd4ab6-1bae-11eb-a7b7-a20f5861fd9f_2808919469209983.jpg",
            "https://mikihome-listing.s3-ap-southeast-1.amazonaws.com/s3url_3045b488-1bae-11eb-b97f-62c21a3cbd5e_356290a8-1bae-11eb-a7b7-a20f5861fd9f_2808920092543254.jpg"
          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
