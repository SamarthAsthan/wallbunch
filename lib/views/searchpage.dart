// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:wallbunch/constants.dart';
import 'package:wallbunch/services/apicalls.dart';

class DiscoverPage extends StatefulWidget {
  DiscoverPage({super.key});

  @override
  State<DiscoverPage> createState() => _DiscoverPageState();
}

class _DiscoverPageState extends State<DiscoverPage>
    with AutomaticKeepAliveClientMixin<DiscoverPage> {
  String searchQuery = "";
  @override
  void initState() {
    // TODO: implement initState
    WidgetsBinding.instance.addPostFrameCallback((_) {});
  }

  @override
  void dispose() {
    Constant.textFieldfocusNode.dispose();
    Constant.textFieldcontroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //do not miss this line
    super.build(context);
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(15.w, 5.h, 15.w, 5.h),
              child: Container(
                height: 35.h,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(.09),
                    border: Border.all(color: Colors.grey, width: 0.w),
                    borderRadius: BorderRadius.all(Radius.circular(10.sp))),
                child: Padding(
                  padding: EdgeInsets.all(8.0.sp),
                  child: Row(
                    children: [
                      Flexible(
                        child: TextField(
                          style: GoogleFonts.poppins(
                            textStyle: const TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          onChanged: (text) {
                            setState(() {
                              searchQuery = text;
                            });
                          },
                          focusNode: Constant.textFieldfocusNode,
                          controller: Constant.textFieldcontroller,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            errorBorder: InputBorder.none,
                            disabledBorder: InputBorder.none,
                            // ignore: prefer_const_constructors
                            contentPadding: EdgeInsets.only(
                                left: 5, bottom: 5, top: 15, right: 10),
                            hintText: "Search 'Wallpaper'",
                            hintStyle: GoogleFonts.poppins(
                              // ignore: prefer_const_constructors
                              textStyle: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                      if (searchQuery == "")
                        const Icon(
                          Icons.search,
                          color: Colors.red,
                        )
                      else if (searchQuery == "null")
                        const Icon(
                          Icons.search,
                          color: Colors.red,
                        )
                      else
                        InkWell(
                          child: const Icon(
                            Icons.cancel,
                            color: Colors.red,
                          ),
                          onTap: () {
                            setState(() {
                              Constant.textFieldcontroller.clear();
                              searchQuery = "null";
                            });
                          },
                        ),
                    ],
                  ),
                ),
              ),
            ),
            if (searchQuery == "")
              Flexible(
                  child: Center(
                      child: Text(
                "Search Somthing",
                style: GoogleFonts.poppins(
                  textStyle: const TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              )))
            else if (searchQuery == "null")
              Flexible(
                  child: Center(
                      child: Text(
                "Search Somthing",
                style: GoogleFonts.poppins(
                  textStyle: const TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              )))
            else
              Flexible(
                child: FutureBuilder(
                  future: CallApi().GetSearchData(searchQuery),
                  builder: (context, snapshot) {
                    if (snapshot.hasError) {
                      return Center(
                        child: Text("${snapshot.error}"),
                      );
                    } else if (snapshot.hasData) {
                      return SingleChildScrollView(child: Text("Hello"));
                    } else {
                      return SizedBox(
                        height: 150.h,
                        width: double.infinity,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          // ignore: prefer_const_literals_to_create_immutables
                          children: [
                            const CupertinoActivityIndicator(
                              color: Colors.red,
                            ),
                            Padding(
                              padding: EdgeInsets.all(8.0.sp),
                              child: Text(
                                "Please wait.",
                                style: GoogleFonts.poppins(
                                  textStyle: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      );
                    }
                  },
                ),
              )
          ],
        ),
      ),
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
