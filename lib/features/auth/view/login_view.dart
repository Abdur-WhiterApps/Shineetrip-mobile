import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/auth_bloc.dart';
import '../bloc/auth_event.dart';
import '../bloc/auth_state.dart';
import '../../../core/widgets/primary_button.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    final phoneController = TextEditingController();

    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is OtpSent) {
          Navigator.pushNamed(context, '/otp');
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
                const SizedBox(height: 6),
                const Text("LOG IN OR SIGN UP"),

                const SizedBox(height: 30),
                const Text("COUNTRY/REGION"),
                const SizedBox(height: 6),
                Container(
                  padding: const EdgeInsets.all(14),
                  decoration: _box(),
                  child: const Text("🇮🇳 India (+91)"),
                ),

                const SizedBox(height: 20),
                const Text("PHONE NUMBER"),
                const SizedBox(height: 6),
                TextField(
                  controller: phoneController,
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                    hintText: "Phone number",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),

                const SizedBox(height: 20),
                BlocBuilder<AuthBloc, AuthState>(
                  builder: (_, state) {
                    if (state is AuthLoading) {
                      return const Center(child: CircularProgressIndicator());
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
              ],
            ),
          ),
        ),
      ),
    );
  }

  BoxDecoration _box() => BoxDecoration(
    border: Border.all(color: Colors.grey.shade300),
    borderRadius: BorderRadius.circular(8),
  );
}
