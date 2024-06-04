import 'dart:async';

import 'package:pinapp_challenge/native_api/comments_api.dart';

final CommentsApi _api = CommentsApi();

Future<List<CommentModel?>> fetchComments(int postId) async {
  try {
    return await _api.fetchComments(postId);
  } catch (e) {
    rethrow;
  }
}
