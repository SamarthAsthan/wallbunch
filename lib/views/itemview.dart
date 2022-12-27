import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ItemView extends StatelessWidget {
  ItemView(
      {super.key,
      required this.imageurl,
      required this.index,
      required this.title});

  String imageurl, title;
  int index;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: Hero(
          tag: 'image$index$title',
          child: CachedNetworkImage(
            fit: BoxFit.cover,
            imageUrl: imageurl,
          ),
        ),
      ),
    );
  }
}
