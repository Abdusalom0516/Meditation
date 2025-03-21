import 'package:flutter/material.dart';
import 'package:meditation/core/common/widgets/app_state_wrapper.dart';
import 'package:meditation/core/constants/font_names.dart';
import 'package:meditation/core/utils/responsiveness.dart';

class CustomTypeCard extends StatelessWidget {
  const CustomTypeCard({
    super.key,
    required this.image,
    required this.title,
    required this.time,
    required this.color,
    required this.func,
  });
  final String image, title, time;
  final Color color;
  final VoidCallback func;

  @override
  Widget build(BuildContext context) {
    return AppStateWrapper(
      builder: (colors, ref) => Expanded(
        child: InkWell(
          onTap: func,
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
      ),
    );
  }
}
