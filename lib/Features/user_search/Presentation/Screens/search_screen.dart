import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sarmad_task/Features/user_search/Presentation/Widgets/floating_search_button.dart';
import 'package:sarmad_task/Features/user_search/Presentation/Widgets/searching_fields_components.dart';
import 'package:sarmad_task/Core/dependency_inj/di.dart' as di;
import 'package:sarmad_task/Features/user_search/Presentation/cubit/listdisplay_cubit.dart';
import 'package:sarmad_task/Features/user_search/Presentation/cubit/search_cubit.dart';
import '../Widgets/display_search_result.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => di.getIt<SearchCubit>(),
          ),
          BlocProvider(create: (context) => ListdisplayCubit())
        ],
        child: const Scaffold(
          floatingActionButton: FloatingSearchButton(),
          body: Form(
            child: Column(
              children: [SearchingFieldsComponents(), DisplaySearchResult()],
            ),
          ),
        ),
      ),
    );
  }
}
