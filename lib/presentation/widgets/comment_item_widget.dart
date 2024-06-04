import 'package:flutter/material.dart';
import 'package:pinapp_challenge/app/utils.dart';
import 'package:pinapp_challenge/native_api/comments_api.dart';

class CommentItemWidget extends StatelessWidget {
  const CommentItemWidget({
    super.key,
    required this.comment,
  });

  final CommentModel comment;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Commenter Name: ${comment.name.capitalize()}'),
            Text('Email: ${comment.email.capitalize()}'),
            Divider(),
            Text(comment.body.capitalize()),
          ],
        ),
      ),
    );
  }
}
