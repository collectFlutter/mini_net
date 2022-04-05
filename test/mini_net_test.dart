import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:mini_net/mini_net.dart';

void main() {
  test('net_manager', () async {
    void printLog(Object object, Map<String, dynamic> extra) {
      print(object);
      print(extra.mapToStructureString());
    }

    NetManager? manager = NetManager.internal(
      interceptors: [MiniLogInterceptor(printResponse: printLog)],
      baseUrl: 'http://xxxx',
      contentType: Headers.formUrlEncodedContentType,
    );
    var response = await manager.post(
      '/auth/account',
      body: {'AccountNo': '27017', 'Password': '123456'},
      extra: {"tag": 'login'},
    );

    var token = response.response?.data['data'];

    manager = NetManager.internal(
        interceptors: [MiniLogInterceptor(printResponse: printLog)],
        baseUrl: 'http://xxxx',
        contentType: Headers.formUrlEncodedContentType,
        headers: {'Authorization': 'Bearer $token'});

    await manager.get(
      '/api/suggestion/suggestion/bugQuestions',
      body: {'pageIndex': 1, 'pageSize': 20},
      extra: {'tag': 'question'},
    );
  });
}
