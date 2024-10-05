import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:software_lab/data/models/register_request_model.dart';
import 'package:software_lab/data/services/failures.dart';

class AuthServices {
  final FlutterSecureStorage _secureStorage = const FlutterSecureStorage();
  final Dio _dio = Dio();
  final String baseUrl = 'https://sowlab.com/assignment/';

  //! Register
  Future<ServerFailure?> registerUser({
    required RegisterRequestModel registerRequest,
  }) async {
    final String url = '${baseUrl}user/register/';
    _dio.options.contentType = Headers.jsonContentType;

    FormData formData = FormData.fromMap(await registerRequest.toMap());
    log('FormData: ${formData.fields}');

    try {
      final Response response = await _dio.post(url, data: formData);

      log(registerRequest.toString());

      log(response.statusCode.toString());

      if (response.statusCode == 200 || response.statusCode == 201) {
        log('message : ${response.data['success']}');
        log('message : ${response.data['message']}');
        return null;
      } else {
        log('message : ${response.data['message']}');
        return ServerFailure.fromResponse(response.statusCode!, response.data);
      }
    } on DioException catch (dioError) {
      log(dioError.toString());

      return ServerFailure.fromDioError(dioError);
    } catch (e) {
      log('7');

      return ServerFailure(errMessage: 'An unexpected error occurred');
    }
  }

  //! Login
  Future<ServerFailure?> loginUser({
    required String email,
    required String password,
  }) async {
    final String url = '$baseUrl/user/login/';

    _dio.options.contentType = Headers.jsonContentType;

    FormData formData = FormData.fromMap({
      "email": email,
      "password": password,
      "role": "farmer",
      "device_token": "0imfnc8mVLWwsAawjYr4Rx-Af50DDqtlx",
      "type": "email/facebook/google/apple",
      "social_id": "0imfnc8mVLWwsAawjYr4Rx-Af50DDqtlx"
    });

    try {
      final Response response = await _dio.post(url, data: formData);

      if (response.statusCode == 200 || response.statusCode == 201) {
        final token = response.data['token'];
        await _secureStorage.write(key: 'auth_token', value: token);
        return null;
      } else {
        return ServerFailure.fromResponse(response.statusCode!, response.data);
      }
    } on DioException catch (dioError) {
      return ServerFailure.fromDioError(dioError);
    } catch (e) {
      return ServerFailure(errMessage: 'An unexpected error occurred');
    }
  }

  //! Forgot Password
  Future<ServerFailure?> forgotPassword({
    required String mobile,
  }) async {
    final String url = '$baseUrl/user/forgot-password';

    _dio.options.contentType = Headers.jsonContentType;

    FormData formData = FormData.fromMap({"mobile": mobile});
    log('FormData: ${formData.fields}');

    try {
      final Response response = await _dio.post(url, data: formData);
      log(response.statusCode.toString());
      if (response.statusCode == 200 || response.statusCode == 201) {
        log(response.data['message']);
        return null;
      } else {
        return ServerFailure.fromResponse(response.statusCode!, response.data);
      }
    } on DioException catch (dioError) {
      return ServerFailure.fromDioError(dioError);
    } catch (e) {
      return ServerFailure(errMessage: 'An unexpected error occurred');
    }
  }

  //! Verify Otp
  Future<ServerFailure?> verifyOtp({
    required String otp,
  }) async {
    final String url = '$baseUrl/user/verify-otp';

    _dio.options.contentType = Headers.jsonContentType;

    FormData formData = FormData.fromMap({
      'otp': otp,
    });

    try {
      final Response response = await _dio.post(url, data: formData);
      if (response.statusCode == 200 || response.statusCode == 201) {
        return null;
      } else {
        return ServerFailure.fromResponse(response.statusCode!, response.data);
      }
    } on DioException catch (dioError) {
      return ServerFailure.fromDioError(dioError);
    } catch (e) {
      return ServerFailure(errMessage: 'An unexpected error occurred');
    }
  }

  //! Reset Password
  Future<ServerFailure?> resetPassword({
    required String token,
    required String password,
    required String cpassword,
  }) async {
    final String url = '$baseUrl/user/reset-password';

    _dio.options.contentType = Headers.jsonContentType;

    FormData formData = FormData.fromMap({
      "token": token,
      "password": password,
      "cpassword": cpassword,
    });

    try {
      final Response response = await _dio.put(url, data: formData);
      log(response.statusCode.toString());
      if (response.statusCode == 200 || response.statusCode == 201) {
        return null;
      } else {
        return ServerFailure.fromResponse(response.statusCode!, response.data);
      }
    } on DioException catch (dioError) {
      return ServerFailure.fromDioError(dioError);
    } catch (e) {
      return ServerFailure(errMessage: 'An unexpected error occurred');
    }
  }
}
