part of 'posts_bloc.dart';

class PostsState extends Equatable {
  const PostsState({
    required this.loading,
    this.posts,
    this.comments,
    this.errorMessage,
    this.lastPostId,
  });

  final bool loading;
  final List<PostModel>? posts;
  final List<CommentModel>? comments;
  final String? errorMessage;
  final int? lastPostId;

  PostsState copyWith({
    bool? loading,
    List<PostModel>? posts,
    List<CommentModel>? comments,
    String? errorMessage,
    int? lastPostId,
  }) {
    return PostsState(
      loading: loading ?? this.loading,
      posts: posts ?? this.posts,
      comments: comments ?? this.comments,
      errorMessage: errorMessage ?? this.errorMessage,
      lastPostId: lastPostId ?? this.lastPostId,
    );
  }

  @override
  List<Object?> get props => [loading, posts, comments, errorMessage, lastPostId];

  factory PostsState.initial() {
    return const PostsState(loading: false);
  }
}
