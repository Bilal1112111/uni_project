import 'package:hello_world/core/network/error_handler/network_exception.dart';
import 'package:hello_world/data/dataproviders/remote/comments_remote_data_source.dart';
import 'package:hello_world/data/models/base_model.dart';

import '../../core/network/api_response.dart';

class CommentsRepository {
  final CommentsRemoteDataSource _commentsRemoteDataSource;
  CommentsRepository(this._commentsRemoteDataSource);

  Future<ApiResponse<BaseModel>> addComment(
      {required String comment, required int offerId}) async {
    try {
      final response = await _commentsRemoteDataSource.addComment(
          comment: comment, offerId: offerId);
      return ApiResponse.success(response);
    } catch (error) {
      return ApiResponse.failure(NetworkExceptions.getException(error));
    }
  }

  Future<ApiResponse<BaseModel>> updateComment(
      {required String comment}) async {
    try {
      final response =
          await _commentsRemoteDataSource.updateComment(comment: comment);
      return ApiResponse.success(response);
    } catch (error) {
      return ApiResponse.failure(NetworkExceptions.getException(error));
    }
  }

  Future<ApiResponse<BaseModel>> deleteComment() async {
    try {
      final response = await _commentsRemoteDataSource.deleteComment();
      return ApiResponse.success(response);
    } catch (error) {
      return ApiResponse.failure(NetworkExceptions.getException(error));
    }
  }

  Future<ApiResponse<BaseModel>> getAllComments() async {
    try {
      final response = await _commentsRemoteDataSource.getAllComments();
      return ApiResponse.success(response);
    } catch (error) {
      return ApiResponse.failure(NetworkExceptions.getException(error));
    }
  }
}
