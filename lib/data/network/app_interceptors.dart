import 'package:dio/dio.dart';

import 'package:flutter_translate/flutter_translate.dart';

import '../sharedpref/shared_preference_helper.dart';


class AppInterceptors extends Interceptor {
  final Dio dio;
  SharedPreferenceHelper sharedPreferenceHelper;

  AppInterceptors({required this.dio, required this.sharedPreferenceHelper});
  final _cache = <Uri, Response>{};
  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    // TODO: implement onRequest
    super.onRequest(options, handler);
    var token = sharedPreferenceHelper.loggedinToken;

    if (token != null) {
      // var expiration =  sharedPreferenceHelper.tokenRemainingTime;
      //  dio.interceptors.requestLock.lock();
      // dio.interceptors.errorLock.lock();
      //   tokenDio.get('/token').then((d) {
      //     //update csrfToken
      // await TokenRepository().persistAccessToken(response.accessToken);
      //       accessToken = response.accessToken;
      //     }).catchError((error, stackTrace) {
      //       handler.reject(error, true);
      //     }).whenComplete(() => dio.interceptors.requestLock.unlock());
      options.headers.putIfAbsent('Authorization', () => "Bearer " + token);
      options.headers.putIfAbsent('Locale', () => null);
    } else {
      print('Auth token is null');
    }
    return handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    _cache[response.requestOptions.uri] = response;
    super.onResponse(response, handler);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    // TODO: implement onError
    super.onError(err, handler);
    switch (err.type) {
      case DioErrorType.connectTimeout:
      case DioErrorType.sendTimeout:
      case DioErrorType.receiveTimeout:
        throw DeadlineExceededException(err.requestOptions);
      case DioErrorType.response:
        switch (err.response!.statusCode) {
          case 400:
            throw BadRequestException(err.requestOptions);
          case 401:
          // ErrorMessage errorMessage = ErrorMessage.fromJson(err.response!.data);
          // print('INTER_ERROR' + errorMessage.message!);
          // throw UnauthorizedException(errorMessage.message!, err.requestOptions);
          case 500:
          // ErrorMessage errorMessage = ErrorMessage.fromJson(err.response!.data);
          // print('INTER_ERROR' + errorMessage.message!);
          // throw NoQueryResultException(errorMessage.message!, err.requestOptions);
        }
        break;
      case DioErrorType.cancel:
        break;
      case DioErrorType.other:
        throw NoInternetConnectionException(err.requestOptions);
      default:
    }
    return handler.next(err);
  }
}

class BadRequestException extends DioError {
  BadRequestException(RequestOptions r) : super(requestOptions: r);

  @override
  String toString() {
    return 'Invalid request';
  }
}

class InternalServerErrorException extends DioError {
  InternalServerErrorException(RequestOptions r) : super(requestOptions: r);

  @override
  String toString() {
    return 'Unknown error occurred, please try again later.';
  }
}

class ConflictException extends DioError {
  ConflictException(RequestOptions r) : super(requestOptions: r);
  @override
  String toString() {
    return 'Conflict occurred';
  }
}

class UnauthorizedException extends DioError {
  String message;
  UnauthorizedException(this.message, r) : super(requestOptions: r);

  @override
  String toString() {
    return message;
  }
}

class NoQueryResultException extends DioError {
  String message;
  NoQueryResultException(this.message, r) : super(requestOptions: r);

  @override
  String toString() {
    return message;
  }
}

class WrongPasswordException extends DioError {
  WrongPasswordException(RequestOptions r) : super(requestOptions: r);

  @override
  String toString() {
    // TODO: implement toString
    return 'Your Password was not Correct';
  }
}

class NoInternetConnectionException extends DioError {
  NoInternetConnectionException(RequestOptions r) : super(requestOptions: r);

  @override
  String toString() {
    return 'No internet connection detected, please try again.';
  }
}

class DeadlineExceededException extends DioError {
  DeadlineExceededException(RequestOptions r) : super(requestOptions: r);

  @override
  String toString() {
    return 'The connection has timed out, please try again.';
  }
}
