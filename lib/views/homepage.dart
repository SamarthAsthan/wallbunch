import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wallbunch/views/gridview.dart';
import 'dart:math' as math;

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            AppBar(
              centerTitle: true,
              backgroundColor: Colors.black,
              title: Stack(alignment: Alignment.bottomRight, children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 17),
                  child: Text(
                    "WallBUNCH",
                    style: GoogleFonts.poppins(
                      textStyle: const TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                Transform.rotate(
                  angle: -math.pi / 25,
                  child: (SizedBox(
                    height: 20,
                    width: 20,
                    child: CachedNetworkImage(
                        imageUrl:
                            "https://is3-ssl.mzstatic.com/image/thumb/Purple112/v4/88/ba/ce/88bace10-cc69-26f6-3562-fa8f8d95b7c1/AppIcon-0-0-1x_U007emarketing-0-0-0-7-0-0-sRGB-0-0-0-GLES2_U002c0-512MB-85-220-0-0.png/512x512bb.jpg"),
                  )),
                )
              ]),
            ),
            CustomGridView(
              keyword: 'paint abstract',
              title: 'Abstract',
            ),
            CustomGridView(
              keyword: 'landscape',
              title: 'Nature',
            ),
            CustomGridView(
              keyword: 'black and white',
              title: 'B&W',
            ),
            CustomGridView(
              keyword: 'gradient',
              title: 'Gradient',
            ),
            CustomGridView(
              keyword: "macro",
              title: 'Macro',
            ),
            CustomGridView(
              keyword: 'street',
              title: 'Street',
            )
          ],
        ),
      ),
    );
  }
}
