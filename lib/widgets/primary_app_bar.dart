import 'package:flutter/material.dart';
import 'package:note_app/constants.dart';

class PrimaryAppBar extends StatelessWidget implements PreferredSizeWidget {
  const PrimaryAppBar({super.key, required this.title, this.prefixIcon});
  final String title;
  final Widget? prefixIcon;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title,
        style: kHeadingTextStyle,
      ),
      centerTitle: true,
      elevation: 2,
      backgroundColor: Colors.white,
      surfaceTintColor: Colors.white,
      shadowColor: Colors.black.withOpacity(0.5),
      leading: prefixIcon,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(25))),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(56);
  //height of the app bar from top
}
