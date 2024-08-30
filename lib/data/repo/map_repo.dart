import 'package:flutter_test_app/data/models/places_suggessions_model.dart';
import 'package:flutter_test_app/data/web_services/places_webservices.dart';

class MapRepo {
  final PlacesWebservices placesWebservices;

  MapRepo(this.placesWebservices);

  Future<List<PlaceSuggession>> fetchSuggestions(
      {required String place, required String sessionToken}) async {
    final suggessions = await placesWebservices.fetchSuggestions(
        place: place, sessionToken: sessionToken);

    return suggessions
        .map((suggession) => PlaceSuggession.fromJson(suggession))
        .toList();
  }
}
