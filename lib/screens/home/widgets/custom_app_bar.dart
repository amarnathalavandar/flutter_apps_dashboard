import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../resume_screen/resume_screen.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {

  final Widget title;
  final double height;
  final List<Widget>? actionList;

  CustomAppBar({required this.title, this.height = kToolbarHeight, this.actionList});

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: BottomRightRoundedClipper(),
      child: AppBar(
          backgroundColor: const Color.fromRGBO(138, 170, 229, 1),
        title: Center(child: title),
        titleTextStyle: TextStyle(
            color: Theme.of(context).colorScheme.surfaceContainerLowest,
            fontSize: 24,
            fontWeight: FontWeight.w500),
        elevation: 1,
        actions: actionList
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(height);
}

class BottomRightRoundedClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(0, 0);
    path.lineTo(0, size.height);
    path.lineTo(size.width - 40, size.height);
    path.quadraticBezierTo(
        size.width, size.height, size.width, size.height - 40);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
