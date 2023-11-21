import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sarmad_task/Core/Theme/colors.dart';
import 'package:sarmad_task/Core/shared/Snackbar/snackbar.dart';
import 'package:sarmad_task/Core/shared/Widgets/adaptive_indicator.dart';
import 'package:animate_do/animate_do.dart';
import 'package:sarmad_task/Features/user_search/Presentation/Widgets/employee_grid_view_display.dart';
import 'package:sarmad_task/Features/user_search/Presentation/Widgets/employee_listview_display.dart';
import 'package:sarmad_task/Features/user_search/Presentation/cubit/listdisplay_cubit.dart';
import 'package:sarmad_task/Features/user_search/Presentation/cubit/search_cubit.dart';

class ManageResultStatesDisplay extends StatelessWidget {
  const ManageResultStatesDisplay({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SearchCubit, SearchState>(
      listener: (context, state) {
        if (state is SearchErrorState) {
          ShowSnackBar.show(
              context: context, message: state.errorMsg, isSuccess: false);
        }
      },
      builder: (context, state) {
        return Container(
            decoration: const BoxDecoration(
                color: AppColors.whiteK,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30))),
            child: state is SearchLoadingState
                ? const AdaptiveCircularIndicator()
                : state is SearchLoadedState
                    ? BlocBuilder<ListdisplayCubit, ListDisplayTypeState>(
                        builder: (context, list) {
                          return list.type == ListDisplayType.listview
                              ? FadeInLeft(
                                  child: EmployeesListDisplay(
                                    employees: state.employees,
                                  ),
                                )
                              : FadeInRight(
                                  child: EmployeesGridDisplay(
                                      employees: state.employees),
                                );
                        },
                      )
                    : Container());
      },
    );
  }
}
