import 'package:flutter_test_app/data/models/places_suggessions_model.dart';

class MapsState {}

class MapsInitial extends MapsState {}

class MapsLoadedPlaces extends MapsState {
  final List<PlaceSuggession> suggessions;

  MapsLoadedPlaces(this.suggessions);
}
