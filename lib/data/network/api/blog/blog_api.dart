import 'package:http/http.dart';

import '../../dio_client.dart';
import '../../rest_client.dart';

class BlogApi {
  // dio instance
  final DioClient _dioClient;

  // rest-client instance
  final RestClient _restClient;

  // injecting dio instance
  BlogApi(this._dioClient, this._restClient);
  //
  // Future<PostModel> getPosts() async {
  //   final res = await _dioClient.get(Endpoints.posts);
  //
  //   print("POSTLIST");
  //   return PostModel.fromJson(res);
  // }

  // Future<PostDetailModel> getVehiclesDetail(String slug) async {
  //
  //   final res = await _dioClient.get(Endpoints.posts+'/'+slug);
  //   return PostDetailModel.fromJson(res);
  // }

}
