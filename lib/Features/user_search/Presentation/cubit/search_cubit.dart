import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sarmad_task/Features/user_search/Data/Models/employee_data_model.dart';
import 'package:sarmad_task/Features/user_search/Data/Models/search_criteria_model.dart';
import 'package:sarmad_task/Features/user_search/Data/Repository/repo.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  final SearchRepository searchRepository;
  SearchCubit({required this.searchRepository}) : super(SearchInitial());
  static SearchCubit get(context, {listen = false}) =>
      BlocProvider.of(context, listen: listen);
  String? selectedNationality;
  final formKey = GlobalKey<FormState>();
  SearchCriteriaModel? searchCriteriaModel = SearchCriteriaModel();
  setNationality(String nationality) {
    selectedNationality = nationality;
    searchCriteriaModel?.nat = selectedNationality;
    emit(NationalityUpadteState());
  }

  searchEmployeeByCriteria() async {
    emit(SearchLoadingState());
    final response =
        await searchRepository.seachEmployees(searchCriteriaModel!);
    response.fold((l) => emit(SearchErrorState(errorMsg: l.message)),
        (r) => emit(SearchLoadedState(employees: r)));
  }
}
