import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:sarmad_task/Features/user_search/Presentation/Widgets/list_type_update_icon_display.dart';
import 'package:sarmad_task/Features/user_search/Presentation/Widgets/manage_result_states_display.dart';

class DisplaySearchResult extends StatelessWidget {
  const DisplaySearchResult({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Expanded(
      child: Stack(
        alignment: Alignment.topRight,
        children: [ManageResultStatesDisplay(), ListTypeUpdateIconDisplay()],
      ),
    );
  }
}
