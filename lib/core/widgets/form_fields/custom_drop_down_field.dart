import 'package:albanoon/core/assets/svg/svg_assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../../theme/theme.dart';
import '../../utils/validators.dart';

class CustomDropdownField<T> extends StatelessWidget {
  final bool enabled;
  final String name;
  final String labelText;
  final String? hintText;
  final bool isRequired;
  final List<String? Function(T?, String?)> validators;
  final TextStyle? hintStyle;
  final T? initialValue;
  final Color? fillColor;
  final List<T> items;
  final Widget Function(BuildContext, T) itemBuilder;
  final ValueChanged<T?>? onChanged;

  CustomDropdownField({
    Key? key,
    this.enabled = true,
    required this.name,
    required this.labelText,
    this.hintText,
    this.isRequired = false,
    this.initialValue,
    required this.items,
    required this.itemBuilder,
    this.onChanged,
    this.validators = const [],
    this.hintStyle,
    this.fillColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          isRequired ? "$labelText*" : labelText,
          style: TextStyle(
            fontWeight: FontWeight.w400,
            color: AppTheme.primaryTextColor,
            fontSize: 14,
          ),
        ),
        SizedBox(height: 10.h),
        FormBuilderDropdown<T>(
          name: name,
          enabled: enabled,
          isExpanded: true,
          isDense: false,
          elevation: 0,
          icon: Padding(
            padding:  EdgeInsets.symmetric(horizontal: 4.0.w),
            child: SvgPicture.asset(SVGAssets.calendar),
          ),
          decoration: InputDecoration(
            fillColor: AppTheme.whiteColor,
            filled: true,
            errorStyle: TextStyle(
              fontWeight: FontWeight.w400,
              color: AppTheme.errorColor,
              fontSize: 13,
            ),
            isDense: true,
            isCollapsed: true,
            errorBorder: UnderlineInputBorder(
              borderRadius: BorderRadius.circular(4.r),
              borderSide: BorderSide(color: AppTheme.errorColor, width: 1),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(4.r),
              borderSide: const BorderSide(color: AppTheme.formBordersColor, width: 1),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(4.r),
              borderSide: const BorderSide(color: AppTheme.formBordersColor, width: 1),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(4.r),
              borderSide: const BorderSide(color: AppTheme.formBordersColor, width: 1),
            ),
            hintText: hintText,
            hintStyle: TextStyle(
              fontWeight: FontWeight.w400,
              color: AppTheme.hintColor,
              fontSize: 14,
            ),
          ),
          items: <DropdownMenuItem<T>>[
            for (var item in items)
              DropdownMenuItem(
                value: item,
                child: itemBuilder(context, item),
              ),
          ],
          initialValue: initialValue,
          dropdownColor: AppTheme.whiteColor,
          onChanged: enabled ? onChanged : null,
          autovalidateMode: AutovalidateMode.disabled,
          validator: (T? value) {
            var validatorsList = <String? Function(T?)>[
              if (isRequired) (value) => Validators.required(value, labelText,context),
              for (final validator in validators) (value) => validator(value, labelText),
            ];
            for (var validator in validatorsList) {
              var validationResult = validator(value);
              if (validationResult != null) {
                return validationResult;
              }
            }
            return null;
          },
        ),
      ],
    );
  }
}
