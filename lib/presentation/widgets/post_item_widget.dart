import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pinapp_challenge/app/utils.dart';
import 'package:pinapp_challenge/data/models/_models.dart';
import 'package:pinapp_challenge/presentation/bloc/posts_bloc.dart';
import 'package:pinapp_challenge/presentation/pages/_pages.dart';

class PostItemWidget extends StatelessWidget {
  const PostItemWidget({
    super.key,
    required this.post,
  });

  final PostModel post;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      color: Colors.white,
      child: ListTile(
        leading: Text(
          post.id.toString(),
          style: TextStyle(
            color: Theme.of(context).colorScheme.secondary,
          ),
        ),
        trailing: Icon(
          Icons.chevron_right_rounded,
          color: Theme.of(context).colorScheme.secondary,
        ),
        title: Text(
          '${post.title.capitalize()}',
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
        subtitle: Text(
          'User ID: ${post.userId} - Post ID: ${post.id}',
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        onTap: () {
          context.read<PostsBloc>().add(GetCommentsEvent(postId: post.id));
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => PostCommentsPage(),
            ),
          );
        },
      ),
    );
  }
}
