import 'package:albanoon/core/assets/images/image_assets.dart';
import 'package:albanoon/core/localization/app_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import '../../theme/theme.dart';
import '../../utils/validators.dart';

class ConfirmPasswordTextField extends StatefulWidget {
  final String? initialValue;
  final String name;
  final String labelText;
  final String? hintText;
  final bool isRequired;
  final TextEditingController passwordController;
  final List<String? Function(String?, String?)> validators;

  const ConfirmPasswordTextField({
    Key? key,
    this.initialValue,
    required this.name,
    required this.labelText,
    this.hintText,
    this.isRequired = false,
    required this.passwordController,
    this.validators = const [],
  }) : super(key: key);

  @override
  _ConfirmPasswordTextFieldState createState() => _ConfirmPasswordTextFieldState();
}

class _ConfirmPasswordTextFieldState extends State<ConfirmPasswordTextField> {
  bool obscureText = true;

  @override
  Widget build(BuildContext context) {
    return  Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        FormBuilderTextField(
            initialValue: widget.initialValue,
            name: widget.name,
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
                onTap: (){
                  setState(() {
                    obscureText= !obscureText;
                  });
                },
                child: obscureText?Image.asset(PNGAssets.eyeClosed):Image.asset(PNGAssets.eye)),          ),
          cursorColor: AppTheme.blackColor,
            obscureText: obscureText,
            obscuringCharacter: "*",
            validator: FormBuilderValidators.compose(
              <String? Function(String?)>[
                if (widget.isRequired) (value) => Validators.isNotNullNorEmpty(value, widget.labelText,context),
                    (value) {
                  if (value != widget.passwordController.text) {
                    return "Passwords are not matching, please re-enter the password";
                  }
                  return null;
                },
              ],
            ),
        ),
      ],
    );
  }
}
