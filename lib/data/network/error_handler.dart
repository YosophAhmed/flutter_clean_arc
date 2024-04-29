import 'package:clean_arc_project/data/network/failure.dart';
import 'package:dio/dio.dart';

class ErrorHandler implements Exception {
  late Failure failure;

  ErrorHandler.handle(
    dynamic error,
  ) {
    if (error is DioException) {
      failure = _handleError(error);
    } else {
      failure = DataSource.typeDefault.getFailure();
    }
  }
}

Failure _handleError(DioException error) {
  switch (error.type) {
    case DioExceptionType.badResponse:
      if (error.response != null &&
          error.response?.statusCode != null &&
          error.response?.statusMessage != null) {
        return Failure(
          error.response!.statusCode!,
          error.response!.statusMessage!,
        );
      } else {
        return DataSource.typeDefault.getFailure();
      }
    case DioExceptionType.connectionTimeout:
      return DataSource.connectionTimeout.getFailure();
    case DioExceptionType.sendTimeout:
      return DataSource.sendTimeOut.getFailure();
    case DioExceptionType.receiveTimeout:
      return DataSource.receiveTimeout.getFailure();
    case DioExceptionType.cancel:
      return DataSource.cancel.getFailure();
    case DioExceptionType.unknown:
      return DataSource.typeDefault.getFailure();
    case DioExceptionType.badCertificate:
      return DataSource.forbidden.getFailure();
    case DioExceptionType.connectionError:
      return DataSource.connectionTimeout.getFailure();
  }
}

enum DataSource {
  success,
  noContent,
  badRequest,
  forbidden,
  unauthorised,
  notFound,
  internalServerError,
  connectionTimeout,
  cancel,
  receiveTimeout,
  sendTimeOut,
  cacheError,
  noInternetConnection,
  typeDefault,
}

extension DataSourceExtension on DataSource {
  Failure getFailure() {
    switch (this) {
      case DataSource.success:
        return Failure(
          ResponseCode.success,
          ResponseMessage.success,
        );
      case DataSource.noContent:
        return Failure(
          ResponseCode.noContent,
          ResponseMessage.noContent,
        );
      case DataSource.badRequest:
        return Failure(
          ResponseCode.badRequest,
          ResponseMessage.badRequest,
        );
      case DataSource.forbidden:
        return Failure(
          ResponseCode.forbidden,
          ResponseMessage.forbidden,
        );
      case DataSource.unauthorised:
        return Failure(
          ResponseCode.unauthorised,
          ResponseMessage.unauthorised,
        );
      case DataSource.notFound:
        return Failure(
          ResponseCode.notFound,
          ResponseMessage.notFound,
        );
      case DataSource.internalServerError:
        return Failure(
          ResponseCode.internalServerError,
          ResponseMessage.internalServerError,
        );
      case DataSource.connectionTimeout:
        return Failure(
          ResponseCode.connectionTimeout,
          ResponseMessage.connectionTimeout,
        );
      case DataSource.cancel:
        return Failure(
          ResponseCode.cancel,
          ResponseMessage.cancel,
        );
      case DataSource.receiveTimeout:
        return Failure(
          ResponseCode.receiveTimeout,
          ResponseMessage.receiveTimeout,
        );
      case DataSource.sendTimeOut:
        return Failure(
          ResponseCode.sendTimeOut,
          ResponseMessage.sendTimeOut,
        );
      case DataSource.cacheError:
        return Failure(
          ResponseCode.cacheError,
          ResponseMessage.cacheError,
        );
      case DataSource.noInternetConnection:
        return Failure(
          ResponseCode.noInternetConnection,
          ResponseMessage.noInternetConnection,
        );
      case DataSource.typeDefault:
        return Failure(
          ResponseCode.typeDefault,
          ResponseMessage.typeDefault,
        );
    }
  }
}

class ResponseCode {
  static const int success = 200; // success with data
  static const int noContent = 201; // success with no data
  static const int badRequest = 400; // failure, API rejected request
  static const int forbidden = 403; // failure, API rejected request
  static const int unauthorised = 401; // failure, user is not authorised
  static const int notFound = 200;
  static const int internalServerError = 500; // failure, server crash

  // local status codes
  static const int connectionTimeout = -1;
  static const int cancel = -2;
  static const int receiveTimeout = -3;
  static const int sendTimeOut = -4;
  static const int cacheError = -5;
  static const int noInternetConnection = -6;
  static const int typeDefault = -7;
}

class ResponseMessage {
  static const String success = 'success'; // success with data
  static const String noContent = 'success'; // success with no data
  static const String badRequest =
      'Bad Request, please try again later'; // failure, API rejected request
  static const String forbidden =
      'user is unauthorised, try again later'; // failure, API rejected request
  static const String unauthorised =
      'Forbidden Request, please try again later'; // failure, user is not authorised
  static const String notFound = 'Request not found';
  static const String internalServerError =
      'Something went wrong, please try again later'; // failure, server crash

  // local status messages
  static const String connectionTimeout =
      'Time out error, please try again later';
  static const String cancel = 'Request was cancelled, please try again';
  static const String receiveTimeout = 'Time out error, please try again later';
  static const String sendTimeOut = 'Time out error, please try again later';
  static const String cacheError = 'Cache error, please try again later';
  static const String noInternetConnection =
      'please check your internet connection';
  static const String typeDefault =
      'Something went wrong, please try again later';
}

class ApiInternalStatus {
  static const int success = 0;
  static const int failure = 1;
}