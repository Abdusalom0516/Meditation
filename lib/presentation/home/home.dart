import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:meditation/core/common/widgets/app_state_wrapper.dart';
import 'package:meditation/core/constants/font_names.dart';
import 'package:meditation/core/constants/image_paths.dart';
import 'package:meditation/core/utils/responsiveness.dart';
import 'package:meditation/presentation/home/widgets/custom_type_card.dart';
import 'package:meditation/presentation/timer/timer.dart';
import 'package:meditation/providers/timer_minute_provider.dart.dart';
import 'package:meditation/providers/timer_second_provider.dart';

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
                        InkWell(
                          onTap: () {
                            ref.read(timerMinuteProvider.notifier).initialize(5);
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => TimerScreen(
                                  title: "Falling asleep",
                                  time: "5 minutes",
                                  image: ImagePaths.blueFace,
                                  color: colors.blue,
                                ),
                              ),
                            );
                          },
                          child: Card(
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
                                                  horizontal: appW(11),
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
                                                    fontFamily:
                                                        FontNames.poppins,
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
                                                      fontWeight:
                                                          FontWeight.bold,
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
                                                    fontFamily:
                                                        FontNames.poppins,
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
                                func: () {
                                  ref.read(timerMinuteProvider.notifier).initialize(5);
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => TimerScreen(
                                        title: "Anxiety",
                                        time: "5 minutes",
                                        image: ImagePaths.greenFace,
                                        color: colors.green,
                                      ),
                                    ),
                                  );
                                },
                              ),
                              CustomTypeCard(
                                color: colors.darkBlue,
                                image: ImagePaths.darkBlueFace,
                                time: "12 minutes",
                                title: "Physical \nhealth",
                                func: () {
                                  ref.read(timerMinuteProvider.notifier).initialize(12);
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => TimerScreen(
                                        title: "Physical health",
                                        time: "12 minutes",
                                        image: ImagePaths.darkBlueFace,
                                        color: colors.darkBlue,
                                      ),
                                    ),
                                  );
                                },
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
                                func: () {
                                  ref.read(timerMinuteProvider.notifier).initialize(7);
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => TimerScreen(
                                        title: "Productivity",
                                        time: "7 minutes",
                                        image: ImagePaths.yellowFace,
                                        color: colors.yellow,
                                      ),
                                    ),
                                  );
                                },
                              ),
                              CustomTypeCard(
                                color: colors.red,
                                image: ImagePaths.redFace,
                                time: "15 minutes",
                                title: "Work life",
                                func: () {
                                  ref.read(timerMinuteProvider.notifier).initialize(15);
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => TimerScreen(
                                        title: "Work life",
                                        time: "15 minutes",
                                        image: ImagePaths.redFace,
                                        color: colors.red,
                                      ),
                                    ),
                                  );
                                },
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
