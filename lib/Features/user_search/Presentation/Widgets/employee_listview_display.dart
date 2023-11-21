import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sarmad_task/Features/user_search/Data/Models/employee_data_model.dart';
import 'package:sarmad_task/Features/user_search/Presentation/Widgets/employee_card_display.dart';

class EmployeesListDisplay extends StatelessWidget {
  const EmployeesListDisplay({
    required this.employees,
    super.key,
  });
  final List<EmployeeDataModel> employees;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 10.w,
      ),
      child: ListView.separated(
          itemCount: employees.length,
          separatorBuilder: (context, index) => const SizedBox(
                height: 10,
              ),
          itemBuilder: (context, index) {
            return EmployeeCardForListView(
              employee: employees[index],
            );
          }),
    );
  }
}
