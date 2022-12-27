import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wallbunch/views/gridview.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          AppBar(
            backgroundColor: Colors.black,
            title: Text(
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
    );
  }
}
