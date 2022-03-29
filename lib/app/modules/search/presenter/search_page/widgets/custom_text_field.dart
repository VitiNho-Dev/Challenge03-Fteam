import 'package:flutter/material.dart';
import 'package:weather_forecast_bloc_app/app/theme/app_colors.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    Key? key,
    this.onChanged,
    this.onPressed,
    this.controller,
  }) : super(key: key);

  final Function(String)? onChanged;
  final void Function()? onPressed;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.textColor.withOpacity(0.15),
        borderRadius: BorderRadius.circular(14),
      ),
      child: TextField(
        controller: controller,
        onChanged: onChanged,
        style: Theme.of(context).textTheme.bodyText2,
        decoration: InputDecoration(
          prefixIcon: IconButton(
            onPressed: onPressed,
            color: AppColors.textColor.withOpacity(0.75),
            icon: const Icon(Icons.search),
          ),
          hintText: 'Search',
          hintStyle: Theme.of(context).textTheme.bodyText2,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(14),
            borderSide: BorderSide(
              color: AppColors.textColor.withOpacity(0.05),
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(14),
            borderSide: BorderSide(
              color: AppColors.textColor.withOpacity(0.05),
            ),
          ),
        ),
      ),
    );
  }
}
