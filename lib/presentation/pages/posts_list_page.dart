import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pinapp_challenge/presentation/bloc/posts_bloc.dart';
import 'package:pinapp_challenge/presentation/widgets/_widgets.dart';

class PostListPage extends StatelessWidget {
  const PostListPage({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<PostsBloc>().add(GetPostsEvent());

    return RefreshIndicator(
      onRefresh: () async => context.read<PostsBloc>().add(GetPostsEvent()),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Posts List Page'),
          centerTitle: true,
        ),
        body: BlocBuilder<PostsBloc, PostsState>(
          builder: (context, state) {
            if (state.loading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state.errorMessage != null) {
              return Center(
                child: Text(state.errorMessage!),
              );
            } else if (state.posts != null) {
              return SingleChildScrollView(
                padding: EdgeInsets.all(16),
                physics: AlwaysScrollableScrollPhysics(),
                child: ListView.separated(
                  separatorBuilder: (context, index) => const SizedBox(height: 8),
                  itemCount: state.posts!.length,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return PostItemWidget(
                      post: state.posts![index],
                    );
                  },
                ),
              );
            }
            return Container();
          },
        ),
      ),
    );
  }
}
