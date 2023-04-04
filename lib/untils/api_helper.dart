import 'dart:convert';

import 'package:http/http.dart' as http;

class ApiHelper {
// api call
  Future<void> postApiCall() async {
    // post api link online data  call
    String apilink = "https://fakestoreapi.com/products";

    //api call

    Uri uri = Uri.parse(apilink);
    var resonse = await http.get(uri);

    print(resonse.body);
    // var json = jsonDecode(resonse.body);

    //
  }
}
