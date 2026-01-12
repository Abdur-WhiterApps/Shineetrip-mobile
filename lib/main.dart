import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'features/auth/bloc/auth_bloc.dart';
import 'features/auth/view/login_view.dart';
import 'features/auth/view/otp_view.dart';
import 'features/auth/view/splash_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => AuthBloc(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          '/': (_) => const SplashView(),
          '/login': (_) => const LoginView(),
          '/otp': (_) => const OtpView(),
        },
      ),
    );
  }
}
