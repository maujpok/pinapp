import 'package:either_dart/either.dart';
import 'package:pinapp_challenge/core/error/failures.dart';
import 'package:pinapp_challenge/data/models/_models.dart';
import 'package:pinapp_challenge/native_api/comments_api.dart';

abstract class PostRepository {
  Future<Either<Failure, List<PostModel>>> getPosts();
  Future<Either<Failure, List<CommentModel>>> getComments(int postId);
}
