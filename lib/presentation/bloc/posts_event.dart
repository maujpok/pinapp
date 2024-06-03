part of 'posts_bloc.dart';

abstract class PostsEvent extends Equatable {
  const PostsEvent();

  @override
  List<Object> get props => [];
}

class GetPostsEvent extends PostsEvent {}

class GetCommentsEvent extends PostsEvent {
  final int postId;

  const GetCommentsEvent({required this.postId});

  @override
  List<Object> get props => [postId];
}
