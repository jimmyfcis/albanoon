import 'package:albanoon/core/localization/app_extensions.dart';
import 'package:albanoon/core/models/lookup.dart';
import 'package:albanoon/core/theme/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SchoolsFilterBottomSheet extends StatefulWidget {
  final List<Lookup> provinces;
  final Function(Lookup) onSelected;

  const SchoolsFilterBottomSheet({
    super.key,
    required this.provinces,
    required this.onSelected,
  });

  @override
  State<SchoolsFilterBottomSheet> createState() => _SchoolsFilterBottomSheet();
}

class _SchoolsFilterBottomSheet extends State<SchoolsFilterBottomSheet> {
  Lookup? selectedProvince;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.r),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(context.tr.translate("filter_by"), style: TextStyle(color: AppTheme.primaryTextColor,fontSize: 16.sp, fontWeight: FontWeight.w500)),
          Divider(color: AppTheme.grey2Color,thickness: 2,),
          SizedBox(height: 16.h),
          DropdownButtonFormField<Lookup>(
            dropdownColor: AppTheme.primaryColor,
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
            ),
            isExpanded: true,
            value: selectedProvince,
            hint: Text(context.tr.translate("choose_province")),
            items: widget.provinces.map((Lookup province) {
              return DropdownMenuItem<Lookup>(
                value: province,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    width: double.infinity,
                    child: Card(
                        color: AppTheme.whiteColor,
                        elevation: 2,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(province.name ?? ""),
                        )),
                  ),
                ),
              );
            }).toList(),
            onChanged: (Lookup? value) {
              if (value != null) {
                widget.onSelected(value);
                Navigator.pop(context);
              }
            },
          ),
          SizedBox(height: 16.h),
        ],
      ),
    );
  }
}
