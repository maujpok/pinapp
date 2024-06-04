import 'package:either_dart/either.dart';
import 'package:pinapp_challenge/core/error/exceptions.dart';
import 'package:pinapp_challenge/core/error/failures.dart';
import 'package:pinapp_challenge/core/network/network_info.dart';
import 'package:pinapp_challenge/data/models/_models.dart';
import 'package:pinapp_challenge/data/services/api.dart';
import 'package:pinapp_challenge/domain/repositories/post_repository.dart';
import 'package:pinapp_challenge/native_api/comments_api.dart';

class PostRepositoryImpl implements PostRepository {
  final Api api;
  final NetworkInfo networkInfo;

  PostRepositoryImpl({
    required this.api,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, List<PostModel>>> getPosts() async {
    if (await networkInfo.isConnected) {
      try {
        final postsResponse = await api.getPosts();
        return Right(postsResponse);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(NetworkFailure());
    }
  }

  @override
  Future<Either<Failure, List<CommentModel>>> getComments(int postId) async {
    if (await networkInfo.isConnected) {
      final CommentsApi _api = CommentsApi();
      try {
        final commentsResponse = await _api.fetchComments(postId);
        return Right(List<CommentModel>.from(commentsResponse));
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(NetworkFailure());
    }
  }
}
