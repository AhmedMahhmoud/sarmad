import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sarmad_task/Core/Theme/colors.dart';

class CustomTextField extends StatelessWidget {
  final String hintText;
  final Function(String?)? onSaved;
  final String? Function(String?)? validator;

  const CustomTextField({
    Key? key,
    required this.hintText,
    this.onSaved,
    this.validator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 50.w),
      child: TextFormField(
        onSaved: onSaved,
        validator: validator,
        textInputAction: TextInputAction.next,
        style: const TextStyle(color: AppColors.whiteK),
        onTapOutside: (e) => FocusScope.of(context).unfocus(),
        decoration: InputDecoration(hintText: hintText),
      ),
    );
  }
}
