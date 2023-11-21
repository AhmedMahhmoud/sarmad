import 'package:dartz/dartz.dart';
import '../../core/ErrorHandling/failure.dart';

typedef FutureEither<T> = Future<Either<Failure, T>>;
