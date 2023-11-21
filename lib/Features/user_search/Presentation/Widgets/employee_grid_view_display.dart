import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sarmad_task/Features/user_search/Data/Models/employee_data_model.dart';
import 'package:sarmad_task/Features/user_search/Presentation/Widgets/employee_card_for_grid.dart';

class EmployeesGridDisplay extends StatelessWidget {
  const EmployeesGridDisplay({
    required this.employees,
    super.key,
  });
  final List<EmployeeDataModel> employees;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GridView.builder(
        itemCount: employees.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 22,
          childAspectRatio: 0.49,
        ),
        itemBuilder: (context, index) {
          return EmployeeCardForGrid(employee: employees[index]);
        },
      ),
    );
  }
}
