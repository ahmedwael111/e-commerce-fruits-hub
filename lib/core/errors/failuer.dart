import 'package:dio/dio.dart';

abstract class Failuer {
  final String errMessage;

  Failuer(this.errMessage);
}

class ServerFailuer extends Failuer {
  ServerFailuer(super.errMessage);

  factory ServerFailuer.fromDioExeption(DioException dioException) {
    switch (dioException.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailuer('Connection time out with Api Server');
      case DioExceptionType.sendTimeout:
        return ServerFailuer('Send time out with Api Server');
      case DioExceptionType.receiveTimeout:
        return ServerFailuer('Receive time out with Api Server');
      case DioExceptionType.badCertificate:
        return ServerFailuer('Its Bad Certificate, Please try again!');
      case DioExceptionType.badResponse:
        return ServerFailuer.fromResponse(
          dioException.response!.statusCode!,
          dioException.response!.data,
        );
      case DioExceptionType.cancel:
        return ServerFailuer('Receive time out with Api Server');
      case DioExceptionType.connectionError:
        if (dioException.message!.contains('SocketException')) {
          return ServerFailuer('No Internet Connection');
        }
        return ServerFailuer('No Internet Connection!');
      case DioExceptionType.unknown:
        return ServerFailuer('Unexpected Error, Please try later!');
      default:
        return ServerFailuer('Opps There was an Error, Please try again');
    }
  }
  factory ServerFailuer.fromResponse(int? statusCode, dynamic response) {
    if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
      return ServerFailuer(response['error']['message']);
    } else if (statusCode == 404) {
      return ServerFailuer('Your request not found, Please try later!');
    } else if (statusCode == 500) {
      return ServerFailuer('Internal Server error, Please try later');
    } else {
      return ServerFailuer('Opps there was an error, please try agian');
    }
  }
}

