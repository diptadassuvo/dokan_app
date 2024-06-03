import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:dokan_app/core/error/failure.dart';
import 'package:dokan_app/utils/services/hive/main_box.dart';

typedef ResponseConverter<T> = T Function(dynamic response);

class DioClient with MainBoxMixin {
  String baseUrl = const String.fromEnvironment("BASE_URL");

  String? _auth;

  late Dio _dio;

  DioClient() {
    try {
      _auth = getData(MainBoxKeys.token);
    } catch (_) {}

    _dio = _createDio();

    // _dio.interceptors.add(DioInterceptor());
  }

  Dio get dio {
    /// We need to recreate dio to avoid token issue after login
    try {
      _auth = getData(MainBoxKeys.token);
    } catch (_) {}

    final dio = _createDio();

    // dio.interceptors.add(DioInterceptor());

    return dio;
  }

  Dio _createDio() => Dio(
        BaseOptions(
          baseUrl: baseUrl,
          headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json',
            if (_auth != null) ...{
              'Authorization': _auth,
            },
          },
          receiveTimeout: const Duration(minutes: 1),
          connectTimeout: const Duration(minutes: 1),
          validateStatus: (int? status) {
            return status! > 0;
          },
        ),
      );

  Future<Either<Failure, T>> postRequest<T>(
    String url, {
    Map<String, dynamic>? data,
    required ResponseConverter<T> converter,
  }) async {
    try {
      final response = await dio.post(url, data: data);
      if ((response.statusCode ?? 0) < 200 ||
          (response.statusCode ?? 0) > 201) {
        throw DioException(
          requestOptions: response.requestOptions,
          response: response,
        );
      }
      return Right(converter(response.data));
    } on DioException catch (e, stackTrace) {
      return Left(
        ServerFailure(
          e.response?.data['error'] as String? ?? e.message,
        ),
      );
    }
  }
}
