import 'package:sarmad_task/Features/user_search/Data/Models/descriptions.dart';

class EmployeeDataModel {
  final String? name;
  final int? score;
  final String? nat;
  final List<String>? placesOfBirth;
  final List<Descriptions>? descriptions;

  EmployeeDataModel(
      {this.name, this.placesOfBirth, this.score, this.nat, this.descriptions});

  factory EmployeeDataModel.fromJson(json) {
    return EmployeeDataModel(
        placesOfBirth: json['places_of_birth'].cast<String>() ?? [],
        descriptions:
            Descriptions.parseDescriptions(json['descriptions'] ?? []),
        nat: json['nat'] ?? '',
        score: json['score'],
        name: json['name'] ?? '');
  }
  static List<EmployeeDataModel> parseEmployees(json) {
    final list = json as List;
    return list.map((e) => EmployeeDataModel.fromJson(e)).toList();
  }
}
