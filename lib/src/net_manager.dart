import 'package:dio/dio.dart';
import 'package:mini_net/src/response_model.dart';

class NetManager {
  static NetManager? _instance;
  Dio? _dio;

  Dio get dio => _dio!;

  NetManager._();

  static NetManager internal({
    String contentType = Headers.jsonContentType,
    String baseUrl = '',
    Map<String, dynamic> headers = const {},
    Duration connectTimeout = const Duration(seconds: 3),
    Duration receiveTimeout = const Duration(minutes: 10),
    Duration sendTimeout = const Duration(seconds: 3),
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
    _instance!._dio!.options.baseUrl = baseUrl;
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
    dio.options.extra = extra;
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
    List? list,
    CancelToken? cancelToken,
    Map<String, dynamic> extra = const {},
  }) async {
    dio.options.extra = extra;
    ResponseModel responseModel;
    try {
      Response response = await dio.post(
        path,
        data: body ?? list,
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

  /// post-file 上传文件
  /// [path] 请求路径
  /// [data] 请求数据
  /// [extra] 自定义参数，可用于拦截器
  Future<ResponseModel> postFile(
    String path,
    MultipartFile data, {
    CancelToken? cancelToken,
    Map<String, dynamic> extra = const {},
  }) async {
    dio.options.extra = extra;
    ResponseModel responseModel;
    try {
      Response response = await dio.post(
        path,
        data: FormData.fromMap({'file': data}),
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
    _dio!.options.extra = extra;
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
    _dio!.options.extra = extra;
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
    _dio!.options.extra = extra;
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
