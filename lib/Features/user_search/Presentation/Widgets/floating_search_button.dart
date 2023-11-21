import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sarmad_task/Core/Theme/colors.dart';
import 'package:sarmad_task/Core/shared/Snackbar/snackbar.dart';
import 'package:sarmad_task/Features/user_search/Presentation/cubit/search_cubit.dart';

class FloatingSearchButton extends StatelessWidget {
  const FloatingSearchButton({
    super.key,
  });
  validateAndSearch(context) {
    final searchCubit = SearchCubit.get(
      context,
    );
    if (!searchCubit.formKey.currentState!.validate()) {
      return;
    } else {
      if (searchCubit.selectedNationality == null) {
        ShowSnackBar.show(
            context: context, message: 'Please select a nationality');
      } else {
        searchCubit.formKey.currentState!.save();
        searchCubit.searchEmployeeByCriteria();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50.h,
      child: FloatingActionButton.extended(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          icon: const Icon(
            Icons.search,
            color: Colors.white,
          ),
          label: const Row(
            children: [
              Text(
                'Apply Search',
                style: TextStyle(
                    color: AppColors.whiteK, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          onPressed: () {
            validateAndSearch(context);
          },
          backgroundColor: AppColors.secondaryColor),
    );
  }
}
