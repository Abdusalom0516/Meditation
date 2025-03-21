import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:meditation/core/common/widgets/app_state_wrapper.dart';
import 'package:meditation/core/constants/font_names.dart';
import 'package:meditation/core/constants/image_paths.dart';
import 'package:meditation/core/utils/responsiveness.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: AppStateWrapper(
        builder: (colors, ref) => Scaffold(
          backgroundColor: Colors.white,
          body: Stack(
            children: [
              Lottie.asset(
                "assets/images/animation.json",
                alignment: Alignment.center,
                fit: BoxFit.cover,
                height: double.infinity,
                width: double.infinity,
              ),
              CustomScrollView(
                slivers: [
                  SliverToBoxAdapter(
                    child: SizedBox(
                      height: appH(15),
                    ),
                  ),
                  SliverPadding(
                    padding: EdgeInsets.symmetric(
                      horizontal: appW(9),
                    ),
                    sliver: SliverList.list(
                      children: [
                        Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(appW(16)),
                          ),
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          elevation: appH(3),
                          child: Container(
                              padding: EdgeInsets.only(
                                right: appW(8),
                                top: appW(8),
                              ),
                              height: appH(200),
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: colors.blue,
                                borderRadius: BorderRadius.circular(appW(16)),
                              ),
                              child: Stack(
                                children: [
                                  Align(
                                    alignment: Alignment.bottomLeft,
                                    child: Image.asset(
                                      ImagePaths.blueFace,
                                      fit: BoxFit.cover,
                                      height: appH(225),
                                      width: appW(195),
                                    ),
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.only(
                                          bottom: appW(17),
                                        ),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                          children: [
                                            Container(
                                              margin: EdgeInsets.only(
                                                top: appH(3),
                                              ),
                                              alignment: Alignment.center,
                                              padding: EdgeInsets.symmetric(
                                                horizontal: appW(8),
                                                vertical: appH(5),
                                              ),
                                              decoration: BoxDecoration(
                                                color: colors.bg,
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        appW(18)),
                                              ),
                                              child: Text(
                                                "5 minutes",
                                                style: TextStyle(
                                                  color: colors.black,
                                                  fontSize: appW(10),
                                                  fontWeight: FontWeight.bold,
                                                  fontFamily: FontNames.poppins,
                                                ),
                                              ),
                                            ),
                                            Column(
                                              children: [
                                                Text(
                                                  "Falling asleep",
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: appW(27),
                                                    fontWeight: FontWeight.bold,
                                                    fontFamily:
                                                        FontNames.poppins,
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: appH(5),
                                                ),
                                                Text(
                                                  textAlign: TextAlign.end,
                                                  "Meditation to prepare the \nmind for sleep",
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: appW(13),
                                                    fontFamily:
                                                        FontNames.poppins,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Container(
                                              padding: EdgeInsets.symmetric(
                                                horizontal: appW(13),
                                                vertical: appH(7),
                                              ),
                                              decoration: BoxDecoration(
                                                color: colors.orange,
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        appW(21)),
                                              ),
                                              child: Text(
                                                "Getting started",
                                                style: TextStyle(
                                                  color: colors.bg,
                                                  fontSize: appW(15),
                                                  fontWeight: FontWeight.bold,
                                                  fontFamily: FontNames.poppins,
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              )),
                        ),
                        SizedBox(
                          height: appH(15),
                        ),
                        Text(
                          "Made for you",
                          style: TextStyle(
                            color: colors.black,
                            fontSize: appW(20),
                            fontWeight: FontWeight.bold,
                            fontFamily: FontNames.poppins,
                          ),
                        ),
                        SizedBox(
                          height: appH(7),
                        ),
                        SizedBox(
                          height: appH(160),
                          child: Row(
                            spacing: appW(9),
                            children: [
                              CustomTypeCard(
                                color: colors.green,
                                image: ImagePaths.greenFace,
                                time: "5 minutes",
                                title: "Anxiety",
                              ),
                              CustomTypeCard(
                                color: colors.darkBlue,
                                image: ImagePaths.darkBlueFace,
                                time: "12 minutes",
                                title: "Physical \nhealth",
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: appH(9),
                        ),
                        SizedBox(
                          height: appH(160),
                          child: Row(
                            spacing: appW(9),
                            children: [
                              CustomTypeCard(
                                color: colors.yellow,
                                image: ImagePaths.yellowFace,
                                time: "7 minutes",
                                title: "Productivity",
                              ),
                              CustomTypeCard(
                                color: colors.red,
                                image: ImagePaths.redFace,
                                time: "15 minutes",
                                title: "Work life",
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: SizedBox(
                      height: appH(15),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomTypeCard extends StatelessWidget {
  const CustomTypeCard({
    super.key,
    required this.image,
    required this.title,
    required this.time,
    required this.color,
  });
  final String image, title, time;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return AppStateWrapper(
      builder: (colors, ref) => Expanded(
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(appW(16)),
          ),
          clipBehavior: Clip.antiAliasWithSaveLayer,
          elevation: appH(3),
          child: Container(
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(appW(16)),
            ),
            child: Stack(
              children: [
                Align(
                  alignment: Alignment.bottomLeft,
                  child: Image.asset(
                    image,
                    fit: BoxFit.cover,
                    height: appH(125),
                    width: appW(95),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: EdgeInsets.all(appW(8)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Container(
                            margin: EdgeInsets.only(
                              top: appH(3),
                            ),
                            alignment: Alignment.center,
                            padding: EdgeInsets.symmetric(
                              horizontal: appW(8),
                              vertical: appH(5),
                            ),
                            decoration: BoxDecoration(
                              color: colors.bg,
                              borderRadius: BorderRadius.circular(appW(18)),
                            ),
                            child: Text(
                              time,
                              style: TextStyle(
                                color: colors.black,
                                fontSize: appW(10),
                                fontWeight: FontWeight.bold,
                                fontFamily: FontNames.poppins,
                              ),
                            ),
                          ),
                          Text(
                            textAlign: TextAlign.end,
                            title,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: appW(16),
                              fontWeight: FontWeight.bold,
                              fontFamily: FontNames.poppins,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
