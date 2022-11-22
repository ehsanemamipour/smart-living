import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:smart_living/core/errors/errors.dart';

abstract class UseCase<Type, Params> {
  Future<Either<Failure, Type>> call(Params params);
}

class NoParams extends Equatable {
  @override
  List<Object> get props => [];
}
