import 'package:dio/dio.dart';
import 'package:mini_net/src/response_model.dart';

class NetManager {
  static NetManager? _instance;
  Dio? _dio;

  NetManager._();

  static NetManager internal({
    String contentType = Headers.jsonContentType,
    String baseUrl = '',
    Map<String, String> headers = const {},
    int connectTimeout = 3000,
    int receiveTimeout = 600000,
    int sendTimeout = 3000,
    ResponseType responseType = ResponseType.json,
    List<Interceptor> interceptors = const [],
  }) {
    bool flag = _instance == null ||
        _instance!._dio == null ||
        _instance!._dio?.options == null;
    if (flag) {
      _instance = NetManager._();
      _instance!._dio = Dio(BaseOptions());
    }
    _instance!._dio!.options.responseType = responseType;
    _instance!._dio!.options.contentType = contentType;
    _instance!._dio!.options.connectTimeout = connectTimeout;
    _instance!._dio!.options.sendTimeout = sendTimeout;
    _instance!._dio!.options.receiveTimeout = receiveTimeout;
    _instance!._dio!.options.headers = headers;
    _instance!._dio!.interceptors
      ..clear()
      ..addAll(interceptors);
    return _instance!;
  }

  Dio get dio => _dio!;

  /// get请求
  /// [path] 请求路径
  /// [body] 请求数据
  /// [extra] 自定义参数，可用于拦截器
  Future<ResponseModel> get(
    String path, {
    Map<String, dynamic>? body,
    CancelToken? cancelToken,
    Map<String, dynamic> extra = const {},
  }) async {
    dio.options..extra = extra;
    ResponseModel responseModel;
    try {
      Response response = await dio.get(
        path,
        queryParameters: body,
        cancelToken: cancelToken,
      );
      responseModel = ResponseModel.success(response);
    } on DioError catch (error) {
      responseModel = ResponseModel.fail(error.type);
    } on Exception {
      responseModel = ResponseModel.fail();
    }

    return responseModel;
  }

  /// post请求
  /// [path] 请求路径
  /// [body] 请求数据
  /// [extra] 自定义参数，可用于拦截器
  Future<ResponseModel> post(
    String path, {
    Map<String, dynamic>? body,
    CancelToken? cancelToken,
    Map<String, dynamic> extra = const {},
  }) async {
    dio.options..extra = extra;
    ResponseModel responseModel;
    try {
      Response response = await dio.post(
        path,
        data: body,
        cancelToken: cancelToken,
      );
      responseModel = ResponseModel.success(response);
    } on DioError catch (error) {
      responseModel = ResponseModel.fail(error.type);
    } on Exception {
      responseModel = ResponseModel.fail();
    }

    return responseModel;
  }

  /// put请求
  /// [path] 请求路径
  /// [body] 请求数据
  /// [extra] 自定义参数，可用于拦截器
  Future<ResponseModel> put(
    String path, {
    Map<String, dynamic>? body,
    CancelToken? cancelToken,
    Map<String, dynamic> extra = const {},
  }) async {
    _dio!.options..extra = extra;
    ResponseModel responseModel;
    try {
      Response response = await dio.put(
        path,
        data: body,
        cancelToken: cancelToken,
      );
      responseModel = ResponseModel.success(response);
    } on DioError catch (error) {
      responseModel = ResponseModel.fail(error.type);
    } on Exception {
      responseModel = ResponseModel.fail();
    }
    return responseModel;
  }

  /// delete请求
  /// [path] 请求路径
  /// [body] 请求数据
  /// [extra] 自定义参数，可用于拦截器
  Future<ResponseModel> delete(
    String path, {
    Map<String, dynamic>? body,
    CancelToken? cancelToken,
    Map<String, dynamic> extra = const {},
  }) async {
    _dio!.options..extra = extra;
    ResponseModel responseModel;
    try {
      Response response = await dio.delete(
        path,
        data: body,
        cancelToken: cancelToken,
      );
      responseModel = ResponseModel.success(response);
    } on DioError catch (error) {
      responseModel = ResponseModel.fail(error.type);
    } on Exception {
      responseModel = ResponseModel.fail();
    }
    return responseModel;
  }

  /// head请求
  /// [path] 请求路径
  /// [body] 请求数据
  /// [extra] 自定义参数，可用于拦截器
  Future<ResponseModel> head(
    String path, {
    Map<String, dynamic>? body,
    CancelToken? cancelToken,
    Map<String, dynamic> extra = const {},
  }) async {
    _dio!.options..extra = extra;
    ResponseModel responseModel;
    try {
      Response response = await dio.head(
        path,
        data: body,
        cancelToken: cancelToken,
      );
      responseModel = ResponseModel.success(response);
    } on DioError catch (error) {
      responseModel = ResponseModel.fail(error.type);
    } on Exception {
      responseModel = ResponseModel.fail();
    }
    return responseModel;
  }
}
