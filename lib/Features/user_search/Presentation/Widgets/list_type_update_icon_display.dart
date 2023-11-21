import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sarmad_task/Core/Theme/colors.dart';

import 'package:sarmad_task/Features/user_search/Presentation/cubit/listdisplay_cubit.dart';

class ListTypeUpdateIconDisplay extends StatelessWidget {
  const ListTypeUpdateIconDisplay({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final listTypeCubit =
        BlocProvider.of<ListdisplayCubit>(context, listen: true);
    return InkWell(
      onTap: () {
        listTypeCubit.toggleListType();
      },
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 15.h),
        child: Container(
          width: 35.w,
          height: 35.h,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(
                7,
              ),
              border: Border.all(width: 1, color: AppColors.blackK)),
          child: Center(
            child: Icon(listTypeCubit.state.type == ListDisplayType.listview
                ? Icons.list
                : Icons.grid_on),
          ),
        ),
      ),
    );
  }
}
