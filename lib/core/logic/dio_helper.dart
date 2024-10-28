import 'package:dio/dio.dart';
import 'package:quick_log/quick_log.dart';

const log = Logger('');

class DioHelper {
  DioHelper() {
    _dio.interceptors.add(AppInterceptor());
  }

  final _dio = Dio(
    BaseOptions(
      //baseUrl: "https://rickandmortyapi.com/api/",
      //baseUrl: "https://project2.amit-learning.com/api/",
      baseUrl: '',
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'multipart/form-data',
        //'Authorization': '13358|0hELCcZwjkFfnmr2cEucQsC48z5V3BPoZVjzeVyv'
        'Authorization':'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOi8vMTI3LjAuMC4xOjgwMDAvYXBpL2xvZ2luIiwiaWF0IjoxNjUxOTk3NjY5LCJleHAiOjE2ODM1MzM2NjksIm5iZiI6MTY1MTk5NzY2OSwianRpIjoiT3psNnoxS29STG43SUlDZiIsInN1YiI6IjIiLCJwcnYiOiIyM2JkNWM4OTQ5ZjYwMGFkYjM5ZTcwMWM0MDA4NzJkYjdhNTk3NmY3In0.RknnxKEnLWIlQlbycuh6Yx3kRMX3oYPvYyA2T6WxjTo'
      },
      connectTimeout: const Duration(seconds: 5),
      receiveDataWhenStatusError: true,
      receiveTimeout: const Duration(seconds: 3),
    ),
  );

  Future<CustomResponse> get(String path) async {
    try {
      if (path.isEmpty) {
        // Fake API
        await Future.delayed(const Duration(seconds: 2));
        return CustomResponse(isSuccess: true);
      } else {
        final response = await _dio.get(path);
        return CustomResponse(isSuccess: true, data: response.data);
      }
    } on DioException catch (ex) {
      return handleException(ex);
    }
  }

  Future<CustomResponse> post(String path, {Map<String, dynamic>? data}) async {
    try {
      if (path.isEmpty) {
        await Future.delayed(const Duration(seconds: 2));
        return CustomResponse(isSuccess: true);
      } else {
        final response =
            await _dio.post(path, data: FormData.fromMap(data ?? {}));
        return CustomResponse(isSuccess: true, data: response.data);
      }
    } on DioException catch (ex) {
      return handleException(ex);
    } catch (e) {
      log.error('Unexpected error in push method: $e');
      return CustomResponse(
          isSuccess: false, message: 'An unexpected error occurred');
    }
  }

  CustomResponse handleException(DioException ex) {
    String? msg = ex.response?.data['message'];
    // print("*" * 30);
    // log.error("DioException type: ${ex.type}");
    // log.error("DioException message: ${ex.message}");
    // log.error("DioException message: ${ex.response?.statusCode}");
    // log.error("DioException response: ${ex.response?.data}");
    return CustomResponse(
        isSuccess: false,
        message: msg ?? ex.type.name,
        data: ex.response?.data);
  }
}

class CustomResponse {
  final bool isSuccess;
  final dynamic data;
  String? message;

  CustomResponse({required this.isSuccess, this.message, this.data}) {
    message = message ?? data?['message'] ?? 'Failed Try Again Later';
  }
}

class AppInterceptor extends Interceptor {
  final log = const Logger('');



}
