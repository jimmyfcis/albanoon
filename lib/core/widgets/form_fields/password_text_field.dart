import 'package:albanoon/core/assets/images/image_assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import '../../theme/theme.dart';
import '../../utils/validators.dart';
import '../../localization/app_extensions.dart';

class PasswordTextField extends StatefulWidget {
  final String? initialValue;
  final String name;
  final String labelText;
  final String? hintText;
  final bool isRequired;
  final TextEditingController? controller;
  final List<String? Function(String?, String?)> validators;

  const PasswordTextField({
    Key? key,
    this.initialValue,
    required this.name,
    required this.labelText,
    this.hintText,
    this.isRequired = false,
    this.controller,
    this.validators = const [],
  }) : super(key: key);

  @override
  _PasswordTextFieldState createState() => _PasswordTextFieldState();
}

class _PasswordTextFieldState extends State<PasswordTextField> {
  bool obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        FormBuilderTextField(
          initialValue: widget.initialValue,
          name: widget.name,
          controller: widget.controller,
          decoration: InputDecoration(
            fillColor: AppTheme.whiteColor,
            filled: true,
            errorStyle: TextStyle(
              fontWeight: FontWeight.w400,
              color: AppTheme.errorColor,
              fontSize: 13.sp,
            ),
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
            hintText: context.tr.translate('password_hint'),
            hintStyle: TextStyle(
              fontWeight: FontWeight.w400,
              color: AppTheme.hintColor,
              fontSize: 14.sp,
            ),
            suffixIcon: InkWell(
                onTap: () {
                  setState(() {
                    obscureText = !obscureText;
                  });
                },
                child: obscureText
                    ? Image.asset(
                        PNGAssets.eyeClosed,
                        color: AppTheme.hintColor,
                      )
                    : Image.asset(
                        PNGAssets.eye,
                        color: AppTheme.hintColor,
                      )),
          ),
          cursorColor: AppTheme.blackColor,
          obscureText: obscureText,
          obscuringCharacter: "*",
          validator: FormBuilderValidators.compose(
            <String? Function(String?)>[
              if (widget.isRequired) (value) => Validators.isNotNullNorEmpty(value, widget.labelText, context),
              for (final validator in widget.validators) (value) => validator(value, widget.labelText),
            ],
          ),
        ),
      ],
    );
  }
}
