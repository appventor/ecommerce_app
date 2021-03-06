import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';

import '../../pages.dart';

class ProductImageSlider extends StatefulWidget {
  final String id;
  final List<String> images;

  const ProductImageSlider({Key key, @required this.images, this.id})
      : super(key: key);

  @override
  _ProductImageSliderState createState() => _ProductImageSliderState();
}

class _ProductImageSliderState extends State<ProductImageSlider> {
  int _current = 0;
  List<Widget> items;

  @override
  void initState() {
    items = List.generate(
        widget.images.length,
        (index) => GestureDetector(
              onTap: () => showImageViewer(
                  images: widget.images,
                  index: index,
                  pageController: PageController(initialPage: index)),
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 8),
                height: 300,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(widget.images[index])),
                    color: Color((Random().nextDouble() * 0xFFFFFF).toInt())
                        .withOpacity(1.0),
                    borderRadius: BorderRadius.circular(10)),
              ),
            ));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Hero(
            tag: "${widget.id}",
            child: Stack(children: [
              CarouselSlider(
                items: items,
                options: CarouselOptions(
                    height: MediaQuery.of(context).size.height / 3,
                    autoPlay: true,
                    viewportFraction: 1.0,
                    onPageChanged: (index, reason) {
                      setState(() {
                        _current = index;
                      });
                    }),
              ),
              Positioned(
                  bottom: 2,
                  width: MediaQuery.of(context).size.width,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: items.map((item) {
                      int index = items.indexOf(item);
                      return Container(
                          width: 8.0,
                          height: 8.0,
                          margin: EdgeInsets.symmetric(
                              vertical: 10.0, horizontal: 2.0),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: _current == index
                                ? Color.fromRGBO(0, 0, 0, 0.9)
                                : Color.fromRGBO(0, 0, 0, 0.4),
                          ));
                    }).toList(),
                  ))
            ])));
  }
}

showImageViewer(
    {List<String> images, int index, PageController pageController}) {
  showDialog(
    context: navigatorKey.currentContext,
    barrierDismissible: true,
    builder: (context) => Material(
      color: Colors.black87,
      child: Stack(
        children: [
          PhotoViewGallery.builder(
            pageController: pageController,
            scrollPhysics: const BouncingScrollPhysics(),
            builder: (BuildContext context, int index) {
              return PhotoViewGalleryPageOptions(
                imageProvider: NetworkImage(images[index]),
                initialScale: PhotoViewComputedScale.contained * 1,
                heroAttributes: PhotoViewHeroAttributes(
                    tag: images[index].toString(),
                    transitionOnUserGestures: true),
              );
            },
            itemCount: images.length,
            loadingBuilder: (context, event) => Center(
              child: SizedBox(
                width: 40.0,
                height: 40.0,
                child: CircularProgressIndicator(),
              ),
            ),
            backgroundDecoration: BoxDecoration(color: Colors.transparent),
          ),
          Positioned(
            right: 10,
            child: IconButton(
              icon: Icon(
                Icons.close,
                size: 50,
                color: Colors.white,
              ),
              onPressed: () => Navigator.of(context).pop(),
            ),
          )
        ],
      ),
    ),
  );
}
