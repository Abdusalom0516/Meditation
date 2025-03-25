import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:meditation/core/common/widgets/app_state_wrapper.dart';
import 'package:meditation/core/constants/font_names.dart';
import 'package:meditation/core/utils/responsiveness.dart';
import 'package:meditation/providers/timer_minute_provider.dart.dart';
import 'package:meditation/providers/timer_second_provider.dart';

class TimerScreen extends StatelessWidget {
  const TimerScreen({
    super.key,
    required this.title,
    required this.time,
    required this.image,
    required this.color,
  });
  final String title, time, image;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return AppStateWrapper(
      builder: (colors, ref) => Scaffold(
        appBar: AppBar(
          backgroundColor: color,
          elevation: 0,
          leading: IconButton(
            icon: Icon(
              Icons.keyboard_arrow_down_rounded,
              color: colors.bg,
              size: appW(35),
            ),
            onPressed: () => Navigator.pop(context),
          ),
          toolbarHeight: appH(75),
          title: IntrinsicWidth(
            child: Container(
              alignment: Alignment.center,
              padding: EdgeInsets.symmetric(
                horizontal: appW(11),
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
          ),
          centerTitle: true,
        ),
        backgroundColor: color,
        body: Stack(
          children: [
            Align(
              alignment: Alignment.bottomLeft,
              child: Image.asset(
                image,
                fit: BoxFit.cover,
                height: appH(195),
                width: appW(155),
              ),
            ),
            CustomScrollView(
              slivers: [
                SliverFillRemaining(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        title,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: appW(27),
                          fontWeight: FontWeight.bold,
                          fontFamily: FontNames.poppins,
                        ),
                      ),
                      SizedBox(height: appH(35)),
                      TextButton(
                        style: TextButton.styleFrom(
                          padding: EdgeInsets.zero,
                          minimumSize: Size.zero,
                          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        ),
                        onPressed: () {
                          if (ref.watch(timerSecondProvider) == 0 &&
                              ref.watch(timerMinuteProvider) >= 5) {
                            ref.read(timerSecondProvider.notifier).start(
                                  ref,
                                  ref.watch(timerMinuteProvider),
                                );
                          }
                        },
                        child: Container(
                          height: appH(70),
                          width: appW(70),
                          decoration: BoxDecoration(
                            color: colors.orange,
                            shape: BoxShape.circle,
                          ),
                          child: Center(
                            child: Icon(
                              Icons.play_arrow_rounded,
                              color: Colors.white,
                              size: appW(40),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: appH(15)),
                      Text(
                        "${ref.watch(timerMinuteProvider).toString().padLeft(2, "0")}:${ref.watch(timerSecondProvider).toString().padLeft(2, "0")}",
                        style: GoogleFonts.robotoMono(
                          fontSize: appW(21),
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: appH(79)),
                    ],
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
