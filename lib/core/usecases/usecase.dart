import 'package:either_dart/either.dart';
import 'package:equatable/equatable.dart';
import 'package:pinapp_challenge/core/error/failures.dart';

abstract class UseCase<Type, Params> {
  Future<Either<Failure, Type>> call(Params params);
}

abstract class Params extends Equatable {
  @override
  List<Object> get props => [];
}

class CommentsParams extends Params {
  final int postId;
  CommentsParams({required this.postId});
}

class NoParams extends Params {}
