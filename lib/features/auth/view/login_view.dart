import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/widgets/country_code_dropdown.dart';
import '../bloc/auth_bloc.dart';
import '../bloc/auth_event.dart';
import '../bloc/auth_state.dart';
import '../../../core/widgets/primary_button.dart';
import '../../../core/widgets/social_icon.dart';
import 'otp_view.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    final phoneController = TextEditingController();

    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is OtpSent) {
          showDialog(
            context: context,
            barrierDismissible: false,
            builder: (_) => const OtpView(),
          );
        }
      },
      child: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 30),

                const Text(
                  "WELCOME\nTO SHINEE TRIP",
                  style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 60),
                const Text("LOG IN OR SIGN UP"),

                const SizedBox(height: 20),
                const Text("COUNTRY/REGION"),
                const SizedBox(height: 6),

                const CountryDropdown(),

                const SizedBox(height: 20),
                const Text("PHONE NUMBER"),
                const SizedBox(height: 6),

                TextField(
                  controller: phoneController,
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                    hintText: "Phone number",
                    filled: true,
                    fillColor: const Color(0xFFF9FAFB),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide:
                      BorderSide(color: Colors.grey.shade300),
                    ),
                  ),
                ),

                const SizedBox(height: 30),
                const Text(
                  "We'll call or text you to confirm your number. Standard message and data rates apply. Privacy Policy",
                  style: TextStyle(fontSize: 12),
                ),

                const SizedBox(height: 25),

                BlocBuilder<AuthBloc, AuthState>(
                  builder: (_, state) {
                    if (state is AuthLoading) {
                      return const Center(
                          child: CircularProgressIndicator());
                    }
                    return PrimaryButton(
                      title: "Continue",
                      onTap: () {
                        context.read<AuthBloc>().add(
                          SendOtp(phoneController.text),
                        );
                      },
                    );
                  },
                ),

                const SizedBox(height: 30),

                Row(
                  children: const [
                    Expanded(child: Divider()),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8),
                      child: Text("or"),
                    ),
                    Expanded(child: Divider()),
                  ],
                ),

                const SizedBox(height: 60),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: const [
                    SocialIcon(icon: Icons.apple),
                    SocialIcon(icon: Icons.g_mobiledata),
                    SocialIcon(icon: Icons.email),
                    SocialIcon(icon: Icons.facebook),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
