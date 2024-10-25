// // import 'dart:convert';
// //
// // import 'package:http/http.dart' as http;
// // import 'package:news_app/api/api_constants.dart';
// // import 'package:news_app/model/SourceResponse.dart';
// // /*
// // https://newsapi.org/v2/top-headlines/sources?apiKey=f2160ab8496c4767ae62b62c25326cbc
// // */
// // class ApiManager{
// //   static Future<SourceResponse?> getSources()async{
// //     Uri url = Uri.https(ApiConstants.baseUrl,ApiConstants.sourceApi,
// //     {
// //       'apiKey' : ApiConstants.apiKey,
// //     });
// //     try{
// //       var response = await http.get(url);
// //       var responseBody = response.body; /// String
// //       var json = jsonDecode(responseBody); /// json
// //       SourceResponse.fromJson(json);  /// object
// //     }catch(e){
// //       throw e;
// //     }
// //
// //   }
// // }
//
// import 'dart:convert';
// import 'package:http/http.dart' as http;
// import 'package:news_app/api/model/news_response/NewsResponse.dart';
// import 'package:news_app/api/model/sources_response/SourceResponse.dart';
//
// class ApiManger {
//   static const String baseUrl = 'newsapi.org';
//   static const String apiKey = 'f2160ab8496c4767ae62b62c25326cbc';
//
//   static Future<SourceResponse> getSources(
//     String categoryId,
//   ) async {
//     var url = Uri.https(baseUrl, '/v2/top-headlines/sources',
//         {
//           'apiKey': apiKey,
//           'category': categoryId,
//         });
//     var response = await http.get(url);
//     var json = jsonDecode(response.body);
//     var sourcesResponse = SourceResponse.fromJson(json);
//     return sourcesResponse;
//   }
//
//   static Future<NewsResponse> getNews(String sourceId) async {
//     var url = Uri.https(baseUrl, '/v2/everything', {
//       'apiKey': apiKey,
//       'sources': sourceId,
//     });
//     var response = await http.get(url);
//     var json = jsonDecode(response.body);
//     var newsResponse = NewsResponse.fromJson(json);
//     return newsResponse;
//   }
// }

import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news_app/api/model/news_response/NewsResponse.dart';
import 'package:news_app/api/model/sources_response/SourceResponse.dart';

class ApiManager {
  static const String baseUrl = 'newsapi.org';
  static const String apiKey = 'f2160ab8496c4767ae62b62c25326cbc';

  static Future<SourceResponse> getSources(
    String categoryId,
  ) async {
    var url = Uri.https(baseUrl, 'v2/top-headlines/sources',
        {'apiKey': apiKey, 'category': categoryId});
    var response = await http.get(url);
    var json = jsonDecode(response.body);
    var sourcesResponse = SourceResponse.fromJson(json);
    return sourcesResponse;
  }

  static Future<NewsResponse> getNews(String sourceId) async {
    var url = Uri.https(baseUrl, '/v2/everything', {
      'apiKey': apiKey,
      'sources': sourceId,
    });
    var response = await http.get(url);

    var json = jsonDecode(response.body);
    var newsResponse = NewsResponse.fromJson(json);
    return newsResponse;
  }

  static Future<NewsResponse> searchNews(String query) async {
    var url = Uri.https(baseUrl, '/v2/everything', {
      'apiKey': apiKey,
      'q': query,
    });
    var response = await http.get(url);

    try {
      return NewsResponse.fromJson(jsonDecode(response.body));
    } catch (e) {
      rethrow;
    }
  }
}
