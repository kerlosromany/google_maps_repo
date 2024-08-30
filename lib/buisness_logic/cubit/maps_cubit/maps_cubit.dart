import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test_app/buisness_logic/cubit/maps_cubit/maps_states.dart';
import 'package:flutter_test_app/data/repo/map_repo.dart';

class MapsCubit extends Cubit<MapsState> {
  final MapRepo mapRepo;

  MapsCubit(this.mapRepo) : super(MapsInitial());

  void emitNewPlacesSuggessions(
      {required String query, required String sessionToken}) {
    mapRepo
        .fetchSuggestions(place: query, sessionToken: sessionToken)
        .then((suggessions) {
      emit(MapsLoadedPlaces(suggessions));
    });
  }
}
