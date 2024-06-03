import 'package:either_dart/either.dart';
import 'package:pinapp_challenge/core/error/failures.dart';
import 'package:pinapp_challenge/data/models/_models.dart';

abstract class PostRepository {
  Future<Either<Failure, List<PostModel>>> getPosts();
  Future<Either<Failure, List<CommentModel>>> getComments(int postId);
}
