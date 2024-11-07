import 'package:flutter/material.dart';
import 'package:job_scraper/utils/constants/colors.dart';
import 'package:job_scraper/utils/helpers/helper_functions.dart';

class TSectionHeading extends StatelessWidget {
  const TSectionHeading({
    super.key,
    this.textColor,
    this.onPressed,
    required this.title,
    this.buttonTitle = "More",
    this.showActionButton = true,
    this.option,
  });

  final Color? textColor;
  final bool showActionButton;
  final String title, buttonTitle;
  final void Function()? onPressed;
  final Widget? option;

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.headlineSmall!.apply(color: textColor),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        if (showActionButton)
          option ??
              TextButton(
                onPressed: onPressed,
                style: TextButton.styleFrom(
                  padding: EdgeInsets.zero,
                  minimumSize: Size.zero,
                ),
                child: Text(
                  buttonTitle,
                  style: dark
                      ? Theme.of(context).textTheme.titleSmall!.apply(color: TColors.secondary)
                      : Theme.of(context).textTheme.titleSmall!.apply(color: TColors.primary),
                ),
              ),
      ],
    );
  }
}
