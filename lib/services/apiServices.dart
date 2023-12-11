import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class ApiServices {
  // String url = 'https://jsonplaceholder.typicode.com/posts';
  late Response response;
  Dio dio = Dio();
  Future? getApicall({
    required BuildContext? context,
    required String endpoint,
  }) async {
    try {
      response = await dio
          .get(
            '$endpoint',
          )
          .timeout(Duration(seconds: 10));
      if (response.statusCode == 200) {
        return response.data;
      }
    } on DioException catch (error) {
      log('$error');
    } catch (error) {
      log('$error');
    }
  }

  Future getHomedata({required BuildContext context}) async {
    var result = await getApicall(
        context: context,
        endpoint: 'https://jsonplaceholder.typicode.com/posts');
    return result;
  }

  Future getDetailsdata({required BuildContext context}) async {
    var result = await getApicall(
        context: context,
        endpoint: 'https://jsonplaceholder.typicode.com/posts/1');
    return result;
  }
}
