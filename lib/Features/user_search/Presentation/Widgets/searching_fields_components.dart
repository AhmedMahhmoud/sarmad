import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sarmad_task/Features/user_search/Presentation/Widgets/nationality_dropdown_component.dart';
import 'package:sarmad_task/Features/user_search/Presentation/Widgets/searching_textform_field_component.dart';
import 'package:sarmad_task/Features/user_search/Presentation/cubit/search_cubit.dart';

class SearchingFieldsComponents extends StatelessWidget {
  const SearchingFieldsComponents({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final searchCubit = SearchCubit.get(context);
    return SizedBox(
      height: 260.h,
      child: Form(
        key: SearchCubit.get(context).formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            CustomTextField(
              hintText: 'First name',
              onSaved: (v) => searchCubit.searchCriteriaModel?.fName = v,
              validator: (v) {
                if (v!.isEmpty) {
                  return 'required';
                }
                return null;
              },
            ),
            CustomTextField(
              hintText: 'Middle name',
              onSaved: (v) => searchCubit.searchCriteriaModel?.mName = v,
            ),
            const NationalityDropdownComponent()
          ],
        ),
      ),
    );
  }
}
