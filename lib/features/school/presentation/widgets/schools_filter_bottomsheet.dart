import 'package:albanoon/core/models/lookup.dart';
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
          Text("Select Province", style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold)),
          SizedBox(height: 16.h),
          DropdownButtonFormField<Lookup>(
            isExpanded: true,
            value: selectedProvince,
            hint: Text("Choose Province"),
            items: widget.provinces.map((Lookup province) {
              return DropdownMenuItem<Lookup>(
                value: province,
                child: Text(province.name ?? "Unnamed"),
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
