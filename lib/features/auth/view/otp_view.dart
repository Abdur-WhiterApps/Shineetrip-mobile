import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/auth_bloc.dart';
import '../bloc/auth_event.dart';
import '../../../core/widgets/primary_button.dart';
import '../widget/otp_box.dart';

class OtpView extends StatelessWidget {
  const OtpView({super.key});

  @override
  Widget build(BuildContext context) {
    final controllers =
    List.generate(4, (_) => TextEditingController());

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text("LOG IN OR SIGN UP",
                  style: TextStyle(fontSize: 18)),
              const SizedBox(height: 20),
              const Text("Verify OTP",
                  style: TextStyle(
                      fontSize: 22, fontWeight: FontWeight.bold)),
              const SizedBox(height: 6),
              const Text("Enter 4 digit OTP sent to +91-9874536745"),

              const SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: controllers
                    .map((c) => OtpBox(controller: c))
                    .toList(),
              ),

              const SizedBox(height: 20),
              Row(
                children: [
                  const Text("Didn't get the OTP? "),
                  TextButton(
                    onPressed: () {
                      context.read<AuthBloc>().add(ResendOtp());
                    },
                    child: const Text("Resend OTP"),
                  )
                ],
              ),

              const Spacer(),
              PrimaryButton(
                title: "Submit",
                onTap: () {
                  context.read<AuthBloc>().add(
                    VerifyOtp("9870"),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
