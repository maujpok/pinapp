// import 'package:freezed_annotation/freezed_annotation.dart';
// import 'dart:convert';

// part 'comment_model.freezed.dart';
// part 'comment_model.g.dart';

// List<CommentModel> commentModelFromJson(String str) => List<CommentModel>.from(json.decode(str).map((x) => CommentModel.fromJson(x)));

// String commentModelToJson(List<CommentModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

// @freezed
// class CommentModel with _$CommentModel {
//   const factory CommentModel({
//     required int postId,
//     required int id,
//     required String name,
//     required String email,
//     required String body,
//   }) = _CommentModel;

//   factory CommentModel.fromJson(Map<String, dynamic> json) => _$CommentModelFromJson(json);
// }
