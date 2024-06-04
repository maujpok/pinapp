import 'package:either_dart/either.dart';
import 'package:pinapp_challenge/core/error/failures.dart';
import 'package:pinapp_challenge/core/usecases/usecase.dart';
import 'package:pinapp_challenge/domain/repositories/post_repository.dart';
import 'package:pinapp_challenge/native_api/comments_api.dart';

class GetComments implements UseCase<List<CommentModel>, CommentsParams> {
  final PostRepository repository;

  GetComments(this.repository);

  @override
  Future<Either<Failure, List<CommentModel>>> call(CommentsParams params) async {
    return await repository.getComments(params.postId);
  }
}
