import 'package:flutter/material.dart';

class Gap extends StatelessWidget {
  static Gap get gap4h => const Gap.horizontal(4.0);
  static Gap get gap8h => const Gap.horizontal(8.0);
  static Gap get gap16h => const Gap.horizontal(16.0);
  static Gap get gap20h => const Gap.horizontal(20.0);

  static Gap get gap4v => const Gap.vertical(4.0);
  static Gap get gap8v => const Gap.vertical(8.0);
  static Gap get gap16v => const Gap.vertical(16.0);
  static Gap get gap20v => const Gap.vertical(20.0);

  const Gap.horizontal(this.gap, {super.key}) : axis = Axis.horizontal;
  const Gap.vertical(this.gap, {super.key}) : axis = Axis.vertical;

  final double gap;
  final Axis axis;

  @override
  Widget build(BuildContext context) {
    if (axis == Axis.horizontal) return SizedBox(width: gap);
    if (axis == Axis.vertical) return SizedBox(height: gap);
    return SizedBox.square(dimension: gap);
  }
}
