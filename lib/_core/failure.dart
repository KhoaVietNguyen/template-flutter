import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

enum FailureType {
  network,
  badRequest,
  unauthorized,
  cancel,
  timeout,
  server,
  unknown,
}

class Failure {
  late String? message;
  late FailureType type;

  Failure(Exception? error) {
    if (error is DioError) {
      debugPrint(
        'Failure(DioError): '
        'type is ${error.type}, message is ${error.message}',
      );
      message = error.message;
      switch (error.type) {
        case DioErrorType.unknown:
          if (error.error is SocketException) {
            // SocketException: Failed host lookup: '***'
            // (OS Error: No address associated with hostname, errno = 7)
            type = FailureType.network;
          } else {
            type = FailureType.unknown;
          }
          break;
        case DioErrorType.connectionTimeout:
        case DioErrorType.receiveTimeout:
          type = FailureType.timeout;
          break;
        case DioErrorType.sendTimeout:
          type = FailureType.network;
          break;
        case DioErrorType.badCertificate:
        case DioErrorType.badResponse:
          // TODO: (api) need define more http status;
          switch (error.response?.statusCode) {
            case HttpStatus.badRequest: // 400
              type = FailureType.badRequest;
              break;
            case HttpStatus.unauthorized: // 401
              type = FailureType.unauthorized;
              break;
            case HttpStatus.internalServerError: // 500
            case HttpStatus.badGateway: // 502
            case HttpStatus.serviceUnavailable: // 503
            case HttpStatus.gatewayTimeout: // 504
              type = FailureType.server;
              break;
            default:
              type = FailureType.unknown;
              break;
          }
          break;
        case DioErrorType.cancel:
          type = FailureType.cancel;
          break;
        case DioErrorType.connectionError:
        default:
          type = FailureType.unknown;
      }
    } else {
      debugPrint('Failure(UnKnown): $error');
      type = FailureType.unknown;
      message = 'Failure: $error';
    }
  }
}
