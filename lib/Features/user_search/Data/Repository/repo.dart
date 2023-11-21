import 'package:dartz/dartz.dart';
import 'package:sarmad_task/Core/ErrorHandling/exceptions.dart';
import 'package:sarmad_task/Core/Network/connection_checker.dart';
import 'package:sarmad_task/Core/typeDefs/type_def.dart';
import 'package:sarmad_task/Features/user_search/Data/Datasource/data_source.dart';
import 'package:sarmad_task/Features/user_search/Data/Models/employee_data_model.dart';
import 'package:sarmad_task/Features/user_search/Data/Models/search_criteria_model.dart';
import 'package:sarmad_task/core/ErrorHandling/failure.dart';

class SearchRepository {
  final ConnectionChecker connectionChecker;
  final SearchDatasource searchDatasource;
  SearchRepository(
      {required this.connectionChecker, required this.searchDatasource});

  FutureEither<List<EmployeeDataModel>> seachEmployees(
      SearchCriteriaModel searchCriteriaModel) async {
    try {
      if (!await connectionChecker.isConnected()) {
        return Left(NetworkFailure());
      }
      return Right(await searchDatasource.searchEmployees(searchCriteriaModel));
    } on ServerException {
      return Left(ServerFailure());
    } catch (e) {
      return Left(UnExpectedFailure(message: e.toString()));
    }
  }
}
