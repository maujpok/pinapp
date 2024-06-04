import 'package:pinapp_challenge/data/models/_models.dart';

abstract class Api {
  Future<List<PostModel>> getPosts();
  // Future<List<CommentModel>?> getComments(int postId);
}
