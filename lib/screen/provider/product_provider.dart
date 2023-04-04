
import 'dart:convert';
import 'package:api_with_producta/screen/modal/product_modal.dart';
import 'package:http/http.dart' as http;

import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';


import 'package:http/http.dart' as http;

class Api_Provider extends ChangeNotifier {
  List<dynamic> ProductList = [];

  // Future<void> jsonPrasing() async

  Future<void> ProductApiCall() async {
    // post api link online data  call
    String apilink = "https://fakestoreapi.com/products";

    //api call

    Uri uri = Uri.parse(apilink);
    var resonse = await http.get(uri);
    var json = jsonDecode(resonse.body);

    List<dynamic> apiModalList =
    json.map((e) => Product_Modal().product(e)).toList();

    // print(resonse.body);
    ProductList = apiModalList;
    notifyListeners();

    //
  }
}