import 'package:dio/dio.dart';

class ResponseModel {
  DioErrorType _type;
  Response? _response;
  bool _success;

  ResponseModel._(this._success, this._response, this._type);

  bool get success => _success;

  Response? get response => _response;

  DioErrorType get type => _type;

  factory ResponseModel.success(Response _response) {
    return ResponseModel._(true, _response, DioErrorType.response);
  }

  factory ResponseModel.fail([DioErrorType type = DioErrorType.other]) {
    return ResponseModel._(false, null, type);
  }

  @override
  String toString() {
    return 'ResponseModel{_type: $_type, _response: $_response, _success: $_success}';
  }
}
