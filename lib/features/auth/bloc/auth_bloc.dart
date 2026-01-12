import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'auth_event.dart';
import 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  int timer = 30;
  Timer? _countdown;

  AuthBloc() : super(AuthInitial()) {
    on<AppStarted>((e, emit) async {
      await Future.delayed(const Duration(seconds: 2));
      emit(AuthInitial());
    });

    on<SendOtp>((e, emit) async {
      emit(AuthLoading());
      await Future.delayed(const Duration(seconds: 1));
      _startTimer();
      emit(OtpSent());
    });

    on<VerifyOtp>((e, emit) async {
      emit(AuthLoading());
      await Future.delayed(const Duration(seconds: 1));
      emit(AuthSuccess());
    });

    on<ResendOtp>((e, emit) {
      _startTimer();
      emit(OtpSent());
    });
  }

  void _startTimer() {
    timer = 30;
    _countdown?.cancel();
    _countdown = Timer.periodic(const Duration(seconds: 1), (t) {
      timer--;
      if (timer == 0) t.cancel();
    });
  }
}
