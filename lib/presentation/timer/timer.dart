import 'package:flutter/material.dart';
import 'package:meditation/core/common/widgets/app_state_wrapper.dart';
import 'package:meditation/core/constants/font_names.dart';
import 'package:meditation/core/utils/responsiveness.dart';

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
                      SizedBox(height: appH(10)),
                      Container(
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
