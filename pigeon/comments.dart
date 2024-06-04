import 'package:pigeon/pigeon.dart';

@ConfigurePigeon(PigeonOptions(
  dartOut: 'lib/native_api/comments_api.dart',
  swiftOut: 'ios/Runner/CommentsApi.swift',
  dartPackageName: 'pinapp_challenge',
))
@HostApi()
abstract class CommentsApi {
  @async
  List<CommentModel> fetchComments(int postId);
}

class CommentModel {
  final int postId;
  final int id;
  final String name;
  final String email;
  final String body;
  CommentModel(this.postId, this.id, this.name, this.email, this.body);
}
