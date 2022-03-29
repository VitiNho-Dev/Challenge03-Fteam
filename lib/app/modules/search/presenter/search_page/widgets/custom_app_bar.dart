import 'package:flutter/material.dart';

import '../../../../../theme/app_colors.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String text;

  const CustomAppBar({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.backgroundColor,
      padding: const EdgeInsets.only(top: 18),
      child: Center(
        child: Text(
          text,
          style: Theme.of(context).textTheme.headline6,
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size(double.infinity, 56);
}
