import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import '../../theme/theme.dart';
import '../../utils/validators.dart';

class CustomTextField extends StatelessWidget {
  final String? initialValue;
  final bool enabled;
  final bool? readOnly;
  final String name;
  final TextEditingController? controller;
  final String labelText;
  final String? hintText;
  final double? radius;
  final bool isRequired;
  final List<String? Function(String?, String?)> validators;
  final ValueChanged<String?>? onChanged;
  final int? maxLines;
  final TextInputType textInputType;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final bool? hasName;
  final VoidCallback? onTap;
  final Color? fillColor;
  final Color? hintTextColor;

  const CustomTextField({
    Key? key,
    this.initialValue,
    this.enabled = true,
    required this.name,
    required this.labelText,
    this.hintText,
    this.readOnly,
    this.validators = const [],
    this.isRequired = false,
    this.onChanged,
    this.textInputType = TextInputType.text,
    this.hasName,
    this.prefixIcon,
    this.suffixIcon,
    this.fillColor,
    this.onTap,
    this.maxLines,
    this.hintTextColor, this.controller, this.radius,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (hasName ?? true) ...[
          Text(
            isRequired ? "$labelText*" : labelText,
            style: TextStyle(
              fontWeight: FontWeight.w400,
              color: AppTheme.primaryTextColor,
              fontSize: 14,
            ),
          ),
          SizedBox(height: 10.h),
        ],
        FormBuilderTextField(
          initialValue: initialValue,
          onTap: onTap,
          controller: controller,
          enabled: enabled,
          readOnly: readOnly ?? false,
          name: name,
          maxLines: maxLines,
          style: TextStyle(
            color: enabled ? Colors.black : Colors.grey,
          ),
          keyboardType: textInputType,
          decoration: InputDecoration(
            fillColor: fillColor ?? AppTheme.whiteColor,
            suffixIcon: suffixIcon,
            prefixIcon: prefixIcon,
            filled: true,
            errorStyle: TextStyle(
              fontWeight: FontWeight.w400,
              color: AppTheme.errorColor,
              fontSize: 13,
            ),
            errorBorder: UnderlineInputBorder(
              borderRadius: BorderRadius.circular(radius??4.r),
              borderSide: BorderSide(color: AppTheme.errorColor, width: 1),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(radius??4.r),
              borderSide: const BorderSide(color: AppTheme.formBordersColor, width: 1),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(radius??4.r),
              borderSide: const BorderSide(color: AppTheme.formBordersColor, width: 1),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(radius??4.r),
              borderSide: const BorderSide(color: AppTheme.formBordersColor, width: 1),
            ),
            hintText: hintText,
            hintStyle: TextStyle(
              fontWeight: FontWeight.w400,
              color: hintTextColor ?? AppTheme.hintColor,
              fontSize: 14.sp,
            ),
          ),
          cursorColor: AppTheme.blackColor,
          // valueTransformer: (text) => num.tryParse(text),
          validator: FormBuilderValidators.compose(
            <String? Function(String?)>[
              if (isRequired)
                (value) => Validators.isNotNullNorEmpty(value, labelText,context),
              for (final validator in validators)
                (value) => validator(value, labelText),
            ],
          ),
          onChanged: onChanged,
        ),
      ],
    );
  }
}
