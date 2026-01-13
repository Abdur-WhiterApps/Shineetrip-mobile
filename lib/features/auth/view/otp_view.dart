import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shineetrip_mobile/features/home/bloc/home_bloc.dart';
import '../bloc/auth_bloc.dart';
import '../bloc/auth_event.dart';
import '../../../core/widgets/primary_button.dart';
import '../widget/otp_box.dart';
import '../../../features/home/view/home_view.dart';

class OtpView extends StatelessWidget {
  const OtpView({super.key});

  @override
  Widget build(BuildContext context) {
    final controllers =
    List.generate(4, (_) => TextEditingController());

    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      insetPadding: const EdgeInsets.all(16),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "LOG IN OR SIGN UP",
                  style: TextStyle(fontSize: 16),
                ),
                IconButton(
                  icon: const Icon(Icons.close),
                  onPressed: () => Navigator.pop(context),
                )
              ],
            ),

            const SizedBox(height: 10),
            const Text(
              "Verify OTP",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 6),
            const Text("Enter 4 digit OTP sent to +91-9874536745"),

            const SizedBox(height: 24),

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
                ),
              ],
            ),

            const SizedBox(height: 20),

            PrimaryButton(
              title: "Submit",
              onTap: () {
                context.read<AuthBloc>().add(VerifyOtp("9870"));

                Navigator.pop(context);

                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (_) => BlocProvider(
                          create: (_)=>HomeBloc(),
                        child: const HomeView(),
                      ),
                  ),
                );
              },
            ),

            const SizedBox(height: 12),
            const Center(
              child: Text(
                "Our experts will help you find the perfect travel package.",
                style: TextStyle(fontSize: 12),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
