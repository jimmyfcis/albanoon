import 'package:albanoon/core/localization/app_extensions.dart';
import 'package:albanoon/core/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class CustomMainButton extends StatefulWidget {
  final String? title;
  final double? fontSize;
  final double? width;
  final double? height;
  final double? borderRadius;
  final Color? backGroundColor;
  final Color? borderColor;
  final EdgeInsets? padding;
  final void Function()? onPressed;

  const CustomMainButton(
      {super.key,
        this.title,
        this.onPressed,
        this.fontSize,
        this.borderRadius,
        this.padding,
        this.width,
        this.backGroundColor,
        this.borderColor,
        this.height});

  @override
  State<CustomMainButton> createState() => _CustomMainButtonState();
}

class _CustomMainButtonState extends State<CustomMainButton> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width ?? double.infinity,
      height: widget.height,
      child: ElevatedButton(
          style: ButtonStyle(
            elevation: MaterialStateProperty.all<double>(0),
            padding:
            MaterialStateProperty.all<EdgeInsetsGeometry>(EdgeInsets.zero),
            backgroundColor: MaterialStateProperty.all<Color>(
                widget.backGroundColor ??
                    AppTheme.primaryColor),
            shadowColor: MaterialStateProperty.all<Color>(AppTheme.primaryColor),
            overlayColor:
            MaterialStateProperty.all<Color>(AppTheme.primaryColor),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(widget.borderRadius ?? 4.0.r),
                side: BorderSide(
                    color: widget.borderColor ??
                        AppTheme.blackColor),
              ),
            ),
          ),
          onPressed: widget.onPressed,
          child: Padding(
            padding:
            widget.padding ?? const EdgeInsets.symmetric(vertical: 16.0),
            child: Text(
              widget.title ?? context.tr.translate("submit"),
              style: TextStyle(
                color: AppTheme.whiteColor,
                fontSize: widget.fontSize ?? 16.sp,
                fontWeight: FontWeight.w700,
              ),
            ),
          )),
    );
  }
}
