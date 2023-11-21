part of 'search_cubit.dart';

sealed class SearchState {}

final class SearchInitial extends SearchState {}

final class NationalityUpadteState extends SearchState {}

final class SearchLoadingState extends SearchState {}

final class SearchLoadedState extends SearchState {
  List<EmployeeDataModel> employees;
  SearchLoadedState({required this.employees});
}

final class SearchErrorState extends SearchState {
  final String errorMsg;
  SearchErrorState({required this.errorMsg});
}
