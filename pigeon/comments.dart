import 'package:pigeon/pigeon.dart';

@ConfigurePigeon(PigeonOptions(
  dartOut: 'lib/native_api/comments_api.dart',
  dartTestOut: 'test/native_api/comments_api_test.dart',
  dartOptions: DartOptions(),
  objcOptions: ObjcOptions(),
  objcHeaderOut: 'ios/Runner/CommentsApi.h',
  objcSourceOut: 'ios/Runner/CommentsApi.m',
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
  CommentModel({
    required this.postId,
    required this.id,
    required this.name,
    required this.email,
    required this.body,
  });
}
