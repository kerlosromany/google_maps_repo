class PlaceSuggession {
  late String description;
  late String placeId;

  PlaceSuggession.fromJson(Map<String, dynamic> json) {
    description = json['description'];
    placeId = json['place_id'];
  }
}
