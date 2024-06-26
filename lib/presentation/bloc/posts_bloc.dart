import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:pinapp_challenge/core/error/failures.dart';
import 'package:pinapp_challenge/core/usecases/usecase.dart';
import 'package:pinapp_challenge/data/models/_models.dart';
import 'package:pinapp_challenge/domain/usecases/_usecases.dart';
import 'package:pinapp_challenge/native_api/comments_api.dart';

part 'posts_event.dart';
part 'posts_state.dart';

class PostsBloc extends Bloc<PostsEvent, PostsState> {
  final GetPosts getPosts;
  final GetComments getComments;

  PostsBloc({
    required this.getPosts,
    required this.getComments,
  }) : super(PostsState.initial()) {
    on<GetPostsEvent>(_onGetPostsEvent);
    on<GetCommentsEvent>(_onGetCommentsEvent);
  }
  FutureOr<void> _onGetPostsEvent(
    GetPostsEvent event,
    Emitter<PostsState> emit,
  ) async {
    emit(state.copyWith(loading: true));

    final response = await getPosts(NoParams());

    emit(
      response.fold(
        (l) => state.copyWith(
          errorMessage: _mapFailureToMessage(l),
          loading: false,
        ),
        (r) => state.copyWith(
          posts: r,
          loading: false,
        ),
      ),
    );
  }

  FutureOr<void> _onGetCommentsEvent(
    GetCommentsEvent event,
    Emitter<PostsState> emit,
  ) async {
    if (state.lastPostId != null && state.lastPostId == event.postId) return;

    emit(state.copyWith(loading: true));

    final response = await getComments(CommentsParams(postId: event.postId));

    emit(response.fold(
      (l) => state.copyWith(
        errorMessage: _mapFailureToMessage(l),
        loading: false,
      ),
      (r) => state.copyWith(
        comments: r,
        lastPostId: event.postId,
        loading: false,
      ),
    ));
  }

  String _mapFailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure _:
        return 'Ocurrió un error inesperado. Intente de nuevo';
      case NetworkFailure _:
        return 'No tienes conexión a internet';
      default:
        return 'Error inesperado';
    }
  }
}
