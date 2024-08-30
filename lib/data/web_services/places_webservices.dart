import 'dart:developer';

import 'package:dio/dio.dart';

const suggestionsBaseUrl =
    'https://maps.googleapis.com/maps/api/place/autocomplete/json';

const googleAPIKey = "AIzaSyBFVDuiRA4LINFh1WQwg1HWlFB34dfR0Cc";

class PlacesWebservices {
  late Dio dio;

  PlacesWebservices() {
    BaseOptions options = BaseOptions(
      connectTimeout: const Duration(minutes: 1),
      receiveTimeout: const Duration(minutes: 1),
      receiveDataWhenStatusError: true,
    );
    dio = Dio(options);
  }

  Future<List<dynamic>> fetchSuggestions(
      {required String place, required String sessionToken}) async {
    try {
      Response response = await dio.get(
        suggestionsBaseUrl,
        queryParameters: {
          'input': place,
          'types': 'address',
          'components': 'country:eg',
          'key': googleAPIKey,
          'sessiontoken': sessionToken
        },
      );
      print(response.data.toString());
      return response.data["predictions"];
    } catch (e) {
      log(e.toString());
      return [];
    }
  }
}
