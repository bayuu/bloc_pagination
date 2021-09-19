import 'dart:convert';

import 'package:http/http.dart' show Client, Response;
import 'package:login_app/modules/home/model/post.dart';

class EndPoint {
  Client client = Client();
  // ignore: non_constant_identifier_names
  String base_url = "https://jsonplaceholder.typicode.com/";

  Future<List<ResponsePost>> getData(int start, int limit) async {
    Response response;
    response = await client
        .get(Uri.parse("https://jsonplaceholder.typicode.com/posts?_start=$start&_limit=$limit"));
    print(response.body);
    if (response.statusCode == 200) {
      var datas = json
          .decode(response.body) as List;

      return datas.map((data) => ResponsePost.fromJson(data))
          .toList();
    } else {
      throw Exception('gagal');
    }
  }
}
