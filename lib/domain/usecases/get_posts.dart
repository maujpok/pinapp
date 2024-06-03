import 'package:either_dart/either.dart';
import 'package:pinapp_challenge/core/error/failures.dart';
import 'package:pinapp_challenge/core/usecases/usecase.dart';
import 'package:pinapp_challenge/data/models/_models.dart';
import 'package:pinapp_challenge/domain/repositories/post_repository.dart';

class GetPosts implements UseCase<List<PostModel>, NoParams> {
  final PostRepository repository;

  GetPosts(this.repository);

  @override
  Future<Either<Failure, List<PostModel>>> call(NoParams params) async {
    return await repository.getPosts();
  }
}
