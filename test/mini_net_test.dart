import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:mini_net/mini_net.dart';

import 'package:mini_net/src/log_interceptor.dart';
import 'package:mini_net/src/net_manager.dart';

void main() {
  test('net_manager', () async {
    void printLog(Object object, Map<String, dynamic> extra) {
      print(object);
      print(extra?.mapToStructureString());
    }

    NetManager manager = NetManager.internal(
      interceptors: [MiniLogInterceptor(printResponse: printLog)],
      baseUrl: 'https://www.wanandroid.com',
      contentType: Headers.jsonContentType,
    );
    var response = await manager.get(
      '/wxarticle/chapters/json',
      extra: {"tag": '1'},
    );

    // var token = response.response.data['data'];

    // manager = NetManager.internal(
    //     interceptors: [MiniLogInterceptor(printResponse: printLog)],
    //     baseUrl: 'http://10.30.100.105:6080',
    //     contentType: Headers.formUrlEncodedContentType,
    //     headers: {'Authorization': 'Bearer $token'});

    // await manager.get(
    //   '/api/suggestion/suggestion/bugQuestions',
    //   body: {'pageIndex': 1, 'pageSize': 20},
    //   extra: {'tag': 'question'},
    // );
  });
}
