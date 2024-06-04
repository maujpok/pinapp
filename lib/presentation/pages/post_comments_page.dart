import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pinapp_challenge/app/utils.dart';
import 'package:pinapp_challenge/presentation/bloc/posts_bloc.dart';
import 'package:pinapp_challenge/presentation/widgets/_widgets.dart';

class PostCommentsPage extends StatelessWidget {
  const PostCommentsPage({super.key});

  @override
  Widget build(BuildContext context) {
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
              padding: EdgeInsets.all(16),
              physics: AlwaysScrollableScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Selected Post Title:'),
                  Text('${state.selectedPostTitle.capitalize()}', style: TextStyle(fontSize: 18)),
                  SizedBox(height: 8),
                  Text('Total comments: ${state.comments!.length}'),
                  SizedBox(height: 8),
                  ListView.separated(
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
                ],
              ),
            );
          }
          return Container();
        },
      ),
    );
  }
}
