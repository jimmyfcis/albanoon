import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import '../../theme/theme.dart';
import '../../utils/validators.dart';

class OTPTextField extends StatelessWidget {
  final int length;

  final bool enabled;
  final String name;
  final String? labelText;
  final String? hintText;
  final bool isRequired;

  final EdgeInsets padding;
  final TextEditingController? controller;
  final String? initialValue;
  final List<String? Function(String?, String?)> validators;
  final ValueChanged<String?>? onChanged;

  const OTPTextField({
    Key? key,
    this.length = 4,
    this.enabled = true,
    required this.name,
    this.labelText,
    this.hintText,
    this.padding = const EdgeInsets.symmetric(horizontal: 16.0),
    this.initialValue,
    this.validators = const [],
    this.isRequired = true,
    this.onChanged,
    this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FormBuilderField<String>(
      enabled: enabled,
      name: name,
      initialValue: initialValue,
      validator: FormBuilderValidators.compose(
        <String? Function(String?)>[
          if (isRequired) (value) => Validators.isNotNullNorEmpty(value, labelText,context),
          for (final validator in validators) (value) => validator(value, labelText),
        ],
      ),
      onChanged: onChanged,
      builder: (field) {
        return Padding(
          padding: padding,
          child: InputDecorator(
            decoration: InputDecoration(
              fillColor: Colors.transparent,
              filled: false,
              errorStyle: TextStyle(
                fontWeight: FontWeight.w400,
                color: AppTheme.errorColor,
                fontSize: 13,
              ),
              errorBorder: UnderlineInputBorder(
                borderSide: const BorderSide(color: Colors.transparent, width: 1),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.transparent, width: 1),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.transparent, width: 1),
              ),
              border: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.transparent, width: 1),
              ),
              hintText: "Enter your email",
              hintStyle: TextStyle(
                fontWeight: FontWeight.w400,
                color: AppTheme.hintColor,
                fontSize: 14,
              ),
            ),
            child: PinCodeTextField(
              appContext: context,
              length: length,
              showCursor: true,
              cursorColor: AppTheme.blackColor,
              controller: controller,
              keyboardType: TextInputType.number,
              enableActiveFill: true,
              enablePinAutofill: false,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              backgroundColor: Colors.transparent, // Ensure the background doesn't interfere
              textStyle: TextStyle(
                color: AppTheme.primaryTextColor,
              ),
              pinTheme: PinTheme(
                shape: PinCodeFieldShape.box, // Ensures full borders
                fieldWidth: 58.h,
                fieldHeight: 58.w,
                borderWidth: 1.0,
                borderRadius: BorderRadius.circular(8.r), // Rounded corners

                // PIN Box Colors
                inactiveFillColor: AppTheme.whiteColor, // Default background color
                activeFillColor: AppTheme.whiteColor, // When a field is active
                selectedFillColor: AppTheme.whiteColor, // When a field is selected

                // Full Border Colors
                inactiveColor: AppTheme.greyColor, // Default border color
                activeColor: AppTheme.greyColor, // Border when active
                selectedColor: AppTheme.greyColor, // Border when selected
              ),
              onChanged: (value) => field.didChange(value),
            ),
          ),
        );
      },
    );
  }
}
