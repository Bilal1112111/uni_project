import 'package:dio/dio.dart';
import 'package:hello_world/core/network/api_service.dart';
import 'package:hello_world/data/models/comment_model.dart';
import 'package:hello_world/utils/app_url.dart';

import '../../models/base_model.dart';

class CommentsRemoteDataSource {
  final ApiServices _apiServices;
  CommentsRemoteDataSource(this._apiServices);

  Future<BaseModel<CommentModel>> addComment(
      {required String comment, required int offerId}) async {
    final response = await _apiServices.post(
      AppUrl.addComment,
      formData: FormData.fromMap({
        'comment': comment,
        'offer_id': offerId,
      }),
    );
    return BaseModel.fromJson(
      response,
      (json) => CommentModel.fromJson(json),
    );
  }

  Future<BaseModel<CommentModel>> updateComment(
      {required String comment}) async {
    final response = await _apiServices.post(
      AppUrl.updateComment,
      formData: FormData.fromMap({
        'comment': comment,
      }),
    );
    return BaseModel.fromJson(
      response,
      (json) => CommentModel.fromJson(json),
    );
  }

  Future<BaseModel<CommentModel>> deleteComment() async {
    final response = await _apiServices.get(AppUrl.deleteComment);
    return BaseModel.fromJson(
      response,
      (json) => CommentModel.fromJson(json),
    );
  }

  Future<BaseModel> getAllComments() async {
    final response = await _apiServices.get(AppUrl.getAllCommentsOnOffer);
    return BaseModel.fromJson(
      response,
      (json) => BaseModels.fromJson(
          json, (itemJson) => CommentModel.fromJson(itemJson)),
    );
  }
}
