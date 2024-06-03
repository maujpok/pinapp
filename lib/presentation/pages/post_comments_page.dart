import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pinapp_challenge/presentation/bloc/posts_bloc.dart';
import 'package:pinapp_challenge/presentation/widgets/_widgets.dart';

class PostCommentsPage extends StatelessWidget {
  const PostCommentsPage({
    super.key,
    required this.postId,
  });

  final int postId;

  @override
  Widget build(BuildContext context) {
    context.read<PostsBloc>().add(GetCommentsEvent(postId: postId));

    return Scaffold(
      appBar: AppBar(
        title: Text('Post Comments'),
      ),
      body: BlocBuilder<PostsBloc, PostsState>(
        builder: (context, state) {
          if (state.loading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state.errorMessage != null) {
            return Center(
              child: Text(state.errorMessage!),
            );
          } else if (state.comments != null) {
            return SingleChildScrollView(
              padding: EdgeInsets.symmetric(vertical: 16),
              physics: AlwaysScrollableScrollPhysics(),
              child: ListView.separated(
                separatorBuilder: (context, index) => const SizedBox(height: 16),
                itemCount: state.comments!.length,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return CommentItemWidget(
                    comment: state.comments![index],
                  );
                },
              ),
            );
          }
          return Container();
        },
      ),
    );
  }
}
