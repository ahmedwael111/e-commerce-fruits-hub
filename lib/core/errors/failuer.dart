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

// import 'package:dio/dio.dart';

// abstract class Failuer {
//   final String errorMassage;

//   const Failuer(this.errorMassage);
// }

// class ServerFailure extends Failuer {
//   ServerFailure(super.errorMassage);

//   factory ServerFailure.fromDioException(DioException dioexp) {
//     switch (dioexp.type) {
//       case DioExceptionType.connectionTimeout:
//         return ServerFailure('Connection timeout with ApiServer');
//       case DioExceptionType.sendTimeout:
//         return ServerFailure('Send timeout with ApiServer');
//       case DioExceptionType.receiveTimeout:
//         return ServerFailure('Receive timeout with ApiServer');
//       case DioExceptionType.badResponse:
//         return ServerFailure.fromResponse(
//             dioexp.response!.statusCode, dioexp.response!.data);
//       case DioExceptionType.cancel:
//         return ServerFailure('Request to ApiServer was canceld');
//       case DioExceptionType.unknown:
//         if (dioexp.message!.contains('SocketException')) {
//           return ServerFailure('No Internet Connection');
//         }
//         return ServerFailure('Unexpected Error, Please try again!');
//       default:
//         return ServerFailure('Opps There was an Error, Please try again');
//     }
//   }

//   factory ServerFailure.fromResponse(int? statusCode, dynamic response) {
//     if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
//       return ServerFailure(response['error']['message']);
//     } else if (statusCode == 404) {
//       return ServerFailure('Your request not found, Please try later!');
//     } else if (statusCode == 500) {
//       return ServerFailure('Internal Server error, Please try later');
//     } else {
//       return ServerFailure('Opps There was an Error, Please try again');
//     }
//   }
// }
