import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sarmad_task/Core/Theme/colors.dart';
import 'package:sarmad_task/Core/shared/Widgets/display_text.dart';
import 'package:sarmad_task/Features/user_search/Data/Models/descriptions.dart';
import 'package:sarmad_task/Features/user_search/Data/Models/employee_data_model.dart';
import 'package:sarmad_task/Features/user_search/Presentation/Widgets/employee_row_info_display.dart';

class EmployeeCardForListView extends StatelessWidget {
  final EmployeeDataModel employee;

  const EmployeeCardForListView({Key? key, required this.employee})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      margin: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            DisplayText(
              text: employee.name ?? 'N/A',
              fontWeight: FontWeight.bold,
              style:
                  const TextStyle(fontSize: 18, color: AppColors.primaryColor),
            ),
            const Divider(),
            DisplayEmployeeRowInfo(
                title: 'Score :', description: employee.score.toString()),
            DisplayEmployeeRowInfo(
              title: 'Nationality :',
              description: employee.nat ?? 'N/A',
            ),
            employee.placesOfBirth!.isNotEmpty
                ? DisplayEmployeeRowInfo(
                    title: "Place of Birth :",
                    description: "${employee.placesOfBirth?.join(', ')}")
                : const DisplayEmployeeRowInfo(
                    title: 'Place of birth',
                    description: 'N/A',
                  ),
            const DisplayText(
              text: 'Descriptions :',
              fontWeight: FontWeight.bold,
            ),
            ..._buildDescriptions(employee.descriptions),
          ],
        ),
      ),
    );
  }

  List<Widget> _buildDescriptions(List<Descriptions>? descriptions) {
    if (descriptions == null || descriptions.isEmpty) {
      return [const Text('No Descriptions Available')];
    }
    return descriptions
        .map((desc) =>
            Text('${desc.description1 ?? ''} ${desc.description2 ?? ''}'))
        .toList();
  }
}
