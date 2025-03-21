import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meditation/core/constants/colors.dart';

class AppStateWrapper extends ConsumerWidget {
  const AppStateWrapper({super.key, required this.builder});
  final Widget Function(AppColors colors, WidgetRef ref) builder;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    AppColors colors = AppColors();
    return builder(colors, ref);
  }
}