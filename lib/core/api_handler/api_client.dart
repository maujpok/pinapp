// import 'package:http/http.dart' as http;
// import 'package:pinapp_challenge/app/injection.dart';
// import 'package:pinapp_challenge/core/network/network_info.dart';
// import 'package:pinapp_challenge/core/network/network_info_impl.dart';

// typedef GetCall = Future<http.Response> Function(
//   Uri, {
//   Map<String, String>? headers,
// });

// class ApiClient {
//   ApiClient(
//     this.networkInfo, {
//     GetCall getCall = http.get,
//   }) : _get = getCall;

//   final GetCall _get;
//   final NetworkInfo networkInfo;

//   Future<http.Response> get(
//     String path, {
//     Map<String, String>? queryParameters,
//     Map<String, String>? modifiedHeaders,
//     bool isJson = true,
//   }) async {
//     final connectivityResult = await networkInfo.isConnected;
//     if (!connectivityResult) {
//       return http.Response(

//       );
//     }

//     final uri = Uri.parse('${baseURL}/$path').replace(queryParameters: queryParameters);
//     final response = await _get(
//       uri,
//     ).onError((error, stackTrace) {
//       return http.Response(

//         // jsonEncode(ApiHelperErrorEnum.unexpectedError.errorDescription),
//         // ApiHelperErrorEnum.unexpectedError.errorId,
//       );
//     });

//     // if (isJson) {
//     //   try {
//     //     jsonDecode(response.body);
//     //   } catch (e) {
//     //     return http.Response(
//     //       jsonEncode(ApiHelperErrorEnum.decodeError.errorDescription),
//     //       ApiHelperErrorEnum.decodeError.errorId,
//     //     );
//     //   }
//     // }

//     // if (response.statusCode == 401) {
//     //   return http.Response(
//     //     jsonEncode(ApiHelperErrorEnum.unauthorizedError.errorDescription),
//     //     ApiHelperErrorEnum.unauthorizedError.errorId,
//     //   );
//     // }

//     return response;
//   }
// }
