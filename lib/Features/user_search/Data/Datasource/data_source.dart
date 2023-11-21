import 'dart:convert';
import 'dart:developer';

import 'package:sarmad_task/Constants/constants.dart';
import 'package:sarmad_task/Core/ErrorHandling/exceptions.dart';
import 'package:sarmad_task/Features/user_search/Data/Models/employee_data_model.dart';
import 'package:sarmad_task/Features/user_search/Data/Models/search_criteria_model.dart';
import 'package:http/http.dart' as http;

class SearchDatasource {
  Future<List<EmployeeDataModel>> searchEmployees(
      SearchCriteriaModel searchCriteriaModel) async {
    final url = Uri.parse(
      "${Constants.baseUrl}/integration/focal/screen/individual",
    );
    final response = await http.post(url,
        body: json.encode(searchCriteriaModel.toJson()),
        headers: {
          "Content-Type": "application/json",
          "Accept": "application/json"
        });
    if (response.statusCode == 500) {
      throw ServerException();
    } else if (response.statusCode == 200) {
      final decodedResponse = json.decode(response.body);
      inspect(decodedResponse);
      return EmployeeDataModel.parseEmployees(decodedResponse['screen_result']);
    }
    throw UnExpectedException();
  }
}
