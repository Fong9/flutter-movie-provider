import 'package:flutter/material.dart';

class PinnedHomeHeaderDelegate extends SliverPersistentHeaderDelegate {
  const PinnedHomeHeaderDelegate({required this.child});

  static const double _height = 320;

  final Widget child;

  @override
  double get minExtent => _height;

  @override
  double get maxExtent => _height;

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return ColoredBox(color: Colors.black, child: child);
  }

  @override
  bool shouldRebuild(covariant PinnedHomeHeaderDelegate oldDelegate) {
    return oldDelegate.child != child;
  }
}