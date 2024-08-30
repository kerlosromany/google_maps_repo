import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test_app/buisness_logic/cubit/maps_cubit/maps_cubit.dart';
import 'package:flutter_test_app/buisness_logic/cubit/phone_auth_cubit/auth_cubit.dart';
import 'package:flutter_test_app/consts/strings.dart';
import 'package:flutter_test_app/data/repo/map_repo.dart';
import 'package:flutter_test_app/data/web_services/places_webservices.dart';
import 'package:flutter_test_app/presentation/screens/login_screen.dart';
import 'package:flutter_test_app/presentation/screens/map_screen.dart';
import 'package:flutter_test_app/presentation/screens/otp_screen.dart';

class AppRouter {
  PhoneAuthCubit? phoneAuthCubit;

  AppRouter() {
    phoneAuthCubit = PhoneAuthCubit();
  }

  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
    
      case loginScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider<PhoneAuthCubit>.value(
            value: phoneAuthCubit!,
            child: LoginScreen(),
          ),
        );

      case otpScreen:
        final phoneNumber = settings.arguments;
        return MaterialPageRoute(
          builder: (_) => BlocProvider<PhoneAuthCubit>.value(
            value: phoneAuthCubit!,
            child: OtpScreen(phoneNumber: phoneNumber),
          ),
        );

      case mapScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (BuildContext context) =>
                MapsCubit(MapRepo(PlacesWebservices())),
            child: const MapScreen(),
          ),
        );
    }
  }
}