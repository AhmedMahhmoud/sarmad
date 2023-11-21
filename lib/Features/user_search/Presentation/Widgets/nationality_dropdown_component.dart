import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sarmad_task/Constants/constants.dart';
import 'package:sarmad_task/Core/Theme/colors.dart';
import 'package:sarmad_task/Features/user_search/Presentation/cubit/search_cubit.dart';

class NationalityDropdownComponent extends StatelessWidget {
  const NationalityDropdownComponent({super.key});

  @override
  Widget build(BuildContext context) {
    final searchCubit = SearchCubit.get(context, listen: true);
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 50.w),
      child: SizedBox(
        height: 50.h,
        child: DropdownButtonHideUnderline(
          child: InputDecorator(
            decoration: InputDecoration(
                border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            )),
            child: DropdownButton<String>(
              hint: Text('Select Nationality',
                  style: TextStyle(
                      color: AppColors.neutralColor.withOpacity(0.5),
                      fontStyle: FontStyle.italic)),
              value: searchCubit.selectedNationality,
              onChanged: (String? newValue) {
                searchCubit.setNationality(newValue!);
              },
              style: const TextStyle(color: AppColors.whiteK),
              dropdownColor: AppColors.primaryColor,
              items: Constants.nationalities
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(
                    value,
                  ),
                );
              }).toList(),
            ),
          ),
        ),
      ),
    );
  }
}
