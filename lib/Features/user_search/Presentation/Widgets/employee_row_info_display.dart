import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sarmad_task/Core/shared/Widgets/display_text.dart';

class DisplayEmployeeRowInfo extends StatelessWidget {
  const DisplayEmployeeRowInfo({
    required this.title,
    required this.description,
    super.key,
  });

  final String title;
  final String description;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Row(
        children: [
          DisplayText(
            text: title,
            fontWeight: FontWeight.bold,
          ),
          SizedBox(
            width: 5.w,
          ),
          SizedBox(
            width: 210.w,
            child: DisplayText(
              text: description,
              textOverflow: TextOverflow.ellipsis,
            ),
          )
        ],
      ),
    );
  }
}