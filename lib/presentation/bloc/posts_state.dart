part of 'posts_bloc.dart';

class PostsState extends Equatable {
  const PostsState({
    required this.loading,
    this.posts,
    this.comments,
    this.errorMessage,
  });

  final bool loading;
  final List<PostModel>? posts;
  final List<CommentModel>? comments;
  final String? errorMessage;

  PostsState copyWith({
    bool? loading,
    List<PostModel>? posts,
    List<CommentModel>? comments,
    String? errorMessage,
  }) {
    return PostsState(
      loading: loading ?? this.loading,
      posts: posts ?? this.posts,
      comments: comments ?? this.comments,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props => [loading, posts, comments];

  factory PostsState.initial() {
    return const PostsState(loading: false);
  }
}

// class PostsInitial extends PostsState {}

// class PostsLoading extends PostsState {}

// class PostsLoaded extends PostsState {
//   final List<Post> posts;

//   const PostsLoaded({required this.posts});

//   @override
//   List<Object> get props => [posts];
// }

// class PostsError extends PostsState {
//   final String message;

//   const PostsError({required this.message});

//   @override
//   List<Object> get props => [message];
// }

// class CommentsLoaded extends PostsState {
//   final List<Comment> comments;

//   const CommentsLoaded({
//     required this.comments,
//   });

//   @override
//   List<Object> get props => [comments];
// }
