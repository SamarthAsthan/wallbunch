import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wallbunch/services/apicalls.dart';
import 'package:wallbunch/views/itemview.dart';

class CustomGridView extends StatelessWidget {
  CustomGridView({super.key, required this.keyword, required this.title});

  String keyword, title;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: CallApi().callapi(keyword),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 10, bottom: 2, top: 2),
                child: Text(
                  title,
                  style: GoogleFonts.poppins(
                    textStyle: const TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 160,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: snapshot.data!.data!.length,
                  itemBuilder: (context, index) {
                    if (index == snapshot.data!.data!.length - 1) {
                      return const SizedBox(
                        height: 160,
                        width: 120,
                        child: Center(
                          child: Text(
                            "Load More",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      );
                    } else {
                      return Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: SizedBox(
                          height: 160,
                          width: 120,
                          child: InkWell(
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(8.0),
                              child: Hero(
                                tag: 'image$index$title',
                                child: CachedNetworkImage(
                                  fit: BoxFit.cover,
                                  imageUrl: snapshot
                                      .data!.data![index].thumbs!.original
                                      .toString(),
                                ),
                              ),
                            ),
                            onTap: () {
                              Get.to(
                                  ItemView(
                                    imageurl: snapshot
                                        .data!.data![index].thumbs!.original
                                        .toString(),
                                    index: index,
                                    title: title,
                                  ),
                                  transition: Transition.noTransition);
                            },
                          ),
                        ),
                      );
                    }
                  },
                ),
              ),
            ],
          );
        } else {
          return const Center(
            child: Text("Loading"),
          );
        }
      },
    );
  }
}
