import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:wallbunch/models/listmodel.dart';

class CallApi {
  Future<ListModel> callapi(keyword) async {
    var url =
        "https://wallhaven.cc/api/v1/search?q=$keyword&categories=111&purity=100&sorting=random&order=desc&page=1";
    var response = await http.get(Uri.parse(url));

    //print(response.body);

    return ListModel.fromJson(jsonDecode(response.body));
  }
}
