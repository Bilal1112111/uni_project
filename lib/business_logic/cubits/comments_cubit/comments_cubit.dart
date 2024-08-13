import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hello_world/business_logic/cubits/comments_cubit/comments_state.dart';
import 'package:hello_world/core/network/api_response.dart';

import '../../../data/repo/comments_repository.dart';

class CommentsCubit extends Cubit<CommentsState> {
  final CommentsRepository _commentsRepository;
  CommentsCubit(this._commentsRepository) : super(CommentsInitialState());
  static CommentsCubit get(context) => BlocProvider.of(context);

  Future<void> addComment() async {
    emit(AddCommentLoadingState());
    ApiResponse response =
        await _commentsRepository.addComment(comment: "comment", offerId: 7);
    response.when(
      success: (data) => emit(AddCommentSuccessState()),
      failure: (networkExceptions) => emit(AddCommentErrorState()),
    );
  }

  Future<void> updateComment() async {
    emit(UpdateCommentLoadingState());
    ApiResponse response =
        await _commentsRepository.updateComment(comment: "comment");
    response.when(
      success: (data) => emit(UpdateCommentSuccessState()),
      failure: (networkExceptions) => emit(UpdateCommentErrorState()),
    );
  }

  Future<void> deleteComment() async {
    emit(DeleteCommentLoadingState());
    ApiResponse response = await _commentsRepository.deleteComment();
    response.when(
      success: (data) => emit(DeleteCommentSuccessState()),
      failure: (networkExceptions) => emit(DeleteCommentErrorState()),
    );
  }

  Future<void> getAllComments() async {
    emit(GetAllCommentLoadingState());
    ApiResponse response = await _commentsRepository.getAllComments();
    response.when(
      success: (data) => emit(GetAllCommentSuccessState()),
      failure: (networkExceptions) => emit(GetAllCommentErrorState()),
    );
  }
}
