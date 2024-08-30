part of 'auth_cubit.dart';

class PhoneAuthState {}

class PhoneAuthInitial extends PhoneAuthState {}

class PhoneAuthLoadingState extends PhoneAuthState {}

class PhoneAuthErrorState extends PhoneAuthState {
  final String errMSG;

  PhoneAuthErrorState({required this.errMSG});
}

class PhoneAuthSubmitted extends PhoneAuthState {}

class PhoneAuthOtpVerified extends PhoneAuthState {}
