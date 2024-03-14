import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wiwikost/config/themes/colours.dart';

class PrimaryButton extends StatelessWidget {
  final String text;
  final void Function()? onPressed;
  final VisualDensity? visualDensity;
  final bool bordered;
  final Color borderColor;
  final Color? backgroundColor;
  final Color textColor;
  final double verticalPadding;
  final int fontSize;
  const PrimaryButton({
    Key? key,
    required this.text,
    this.onPressed,
    this.visualDensity,
    this.borderColor = Colors.transparent,
    this.backgroundColor = Colours.greenPrimary1,
    this.textColor = Colours.white,
    this.verticalPadding = 10,
    this.fontSize = 18,
  })  : bordered = false,
        super(key: key);
  const PrimaryButton.noVerticalPadding({
    Key? key,
    required this.text,
    this.onPressed,
    this.visualDensity,
    this.borderColor = Colors.transparent,
    this.backgroundColor = Colours.greenPrimary,
    this.textColor = Colours.white,
    this.verticalPadding = 0,
    this.fontSize = 12,
  })  : bordered = false,
        super(key: key);
  const PrimaryButton.bordered({
    Key? key,
    required this.text,
    this.onPressed,
    this.borderColor = Colours.greenPrimary,
    this.backgroundColor = Colours.white,
    this.textColor = Colours.greenPrimary,
    this.verticalPadding = 8,
    this.fontSize = 18,
  })  : visualDensity = VisualDensity.compact,
        bordered = true,
        super(key: key);
  const PrimaryButton.borderedNoverticalPadding({
    Key? key,
    required this.text,
    this.onPressed,
    this.borderColor = Colours.greenPrimary,
    this.backgroundColor = Colours.white,
    this.textColor = Colours.greenPrimary,
    this.verticalPadding = 0,
    this.fontSize = 12,
  })  : visualDensity = VisualDensity.compact,
        bordered = true,
        super(key: key);
  const PrimaryButton.borderedDense({
    Key? key,
    required this.text,
    this.onPressed,
    this.borderColor = Colours.greenPrimary,
    this.backgroundColor = Colours.white,
    this.textColor = Colours.greenPrimary,
    this.verticalPadding = 0,
    this.fontSize = 10,
  })  : visualDensity = VisualDensity.compact,
        bordered = true,
        super(key: key);
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor,
        elevation: 3,
        padding:
            EdgeInsets.symmetric(vertical: verticalPadding.r, horizontal: 10.r),
        shape: RoundedRectangleBorder(
          side: BorderSide(color: borderColor, width: 1),
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      child: Text(
        text,
        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
            fontSize: fontSize.sp,
            color: textColor,
            overflow: TextOverflow.ellipsis),
      ),
    );
  }
}
