import 'package:dio/dio.dart';
import 'package:get_storage/get_storage.dart';
import 'package:mvvm_app/core/client/interceptors/refresh_token_interceptors.dart';
String baseUrl="";
class Client {
  static final Client _client = Client._internal();
  factory Client() {
    return _client;
  }
  Client._internal();
  Dio dio = Dio();
  GetStorage? box;
  init() {
    dio.options.baseUrl = baseUrl;
    dio.options.connectTimeout = 50000;
    dio.options.receiveTimeout = 30000;
    dio.options.headers['content-Type'] = 'application/json';
    // String token = box.read("authToken");
    // if(token !=null)
    //   dio.options.headers['token']='$token';
    _initializeInterceptors();
  }

  _initializeInterceptors() {
    dio.interceptors.add(RefreshTokenInterceptor());
    // dio.interceptors.add(InterceptorsWrapper(
    //   onRequest: (RequestOptions options, RequestInterceptorHandler handler) {
    //     String token = box!.read("authToken");
    //     if (token != null) options.headers['token'] = '$token';
    //     return handler.next(options);
    //   },
    // ));
    // dio.interceptors.add(RefreshTokenInterceptor());
    // dio.interceptors.add(RetryOnConnectionChangeInterceptor(
    //     requestRetrier: DioConnectivityRequestRetrier(
    //         connectivity: Connectivity(),
    //         dio: dio
    //     )
    // ));
  }
}
