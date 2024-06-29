import 'dart:io';
import 'package:either_dart/either.dart';
import 'package:noviindus_machine_task/src/util/app_exception/app_exception.dart';
import 'package:noviindus_machine_task/src/util/typedef/type_def.dart';
import 'package:dio/dio.dart';

class ApiService {
  static final Map<String, String> _header = {
    'Content-Type': 'application/json',
    'token': ''
  };

  static final Dio _dio = Dio();

  static EitherResponse postApi(String url, Map<String, dynamic> map,
      [String? userToken]) async {
    print(url);
    print(map);
    if (userToken != null) {
      _header['token'] = userToken;
    }
    final formData = FormData.fromMap(map);

    try {
      final response = await _dio.post(url, data: formData);
      final fetchedData = _getResponse(response);
      return Right(fetchedData);
    } on DioError catch (e) {
      if (e.error is SocketException) {
        return Left(InternetException());
      } else {
        return Left(BadRequestException());
      }
    } catch (e) {
      return Left(BadRequestException());
    }
  }

  static EitherResponse getApi(String url, [String? token]) async {
    if (token != null) {
      _header['token'] = token;
    }
    try {
      final response = await _dio.get(url, options: Options(headers: _header));
      final fetchedData = _getResponse(response);
      return Right(fetchedData);
    } on DioError catch (e) {
      if (e.error is SocketException) {
        return Left(InternetException());
      } else {
        return Left(BadRequestException());
      }
    } catch (e) {
      return Left(BadRequestException());
    }
  }

  static _getResponse(Response response) {
    switch (response.statusCode) {
      case 200:
        return response.data;
      case 400:
        return throw BadRequestException();
      default:
        throw BadRequestException();
    }
  }
}
