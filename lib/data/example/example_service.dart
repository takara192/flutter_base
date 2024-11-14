import 'package:base_bbs/domain/base/base_request.dart';
import 'package:base_bbs/domain/example/model/example_response.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'example_service.g.dart';


@RestApi(baseUrl: "https://jsonplaceholder.typicode.com")
abstract class ExampleService {
  factory ExampleService(Dio dio, {String baseUrl}) = _ExampleService;

  @GET("/posts")
  Future<List<Post>> getPosts(NoParamRequest request);
}
