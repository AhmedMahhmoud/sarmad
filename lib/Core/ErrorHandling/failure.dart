import 'package:sarmad_task/Constants/constants.dart';

abstract class Failure {
  String get message;
}

class ServerFailure extends Failure {
  @override
  final String message;

  ServerFailure({this.message = Constants.serverFailure});
}

class NetworkFailure extends Failure {
  @override
  final String message;

  NetworkFailure({this.message = Constants.noInternet});
}

class UnExpectedFailure extends Failure {
  @override
  final String message;

  UnExpectedFailure({required this.message});
}
