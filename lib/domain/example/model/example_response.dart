import 'package:base_bbs/domain/base/base_response.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'example_response.freezed.dart';
part 'example_response.g.dart';

@freezed
class Post with _$Post {
  const factory Post({
    @Default(0) int userId,
    @Default(0) int id,
    @Default('') String title,
    @Default('') String body,
  }) = _Post;

  factory Post.fromJson(Map<String, dynamic> json) =>
      _$PostFromJson(json);
}

@freezed
class ExampleResponse extends BaseResponse with _$ExampleResponse {
  const factory ExampleResponse({
    required List<Post> listPost,
  }) = _ExampleResponse;

}