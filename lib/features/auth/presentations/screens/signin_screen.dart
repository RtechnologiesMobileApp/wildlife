import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wildlife/config/constants/colors.dart';
import 'package:wildlife/features/auth/presentations/screens/signup_screen.dart';
import 'package:wildlife/features/home/presentations/screens/home_screen.dart';

class SigninScreen extends StatefulWidget {
  const SigninScreen({super.key});

  @override
  State<SigninScreen> createState() => _SigninScreenState();
}

class _SigninScreenState extends State<SigninScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailCtrl = TextEditingController();
  final _passwordCtrl = TextEditingController();
  bool _loading = false;

  void _submit() async {
    if (!_formKey.currentState!.validate()) return;
    setState(() => _loading = true);
    await Future.delayed(const Duration(seconds: 1));
    setState(() => _loading = false);
    // Prototype: navigate to home
    Get.offAll(HomeScreen());
  }

  @override
  void dispose() {
    _emailCtrl.dispose();
    _passwordCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final primary = Theme.of(context).primaryColor;
    return Scaffold(
      appBar: AppBar(title: const Text('Sign in')),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(minHeight: constraints.maxHeight),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: SizedBox(
                      width: constraints.maxWidth < 560 ? double.infinity : 560,
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 28, horizontal: 18),
                        decoration: BoxDecoration(
                          color: Colors.transparent,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Form(
                          key: _formKey,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              // Colored circular header instead of raised card
                              Align(
                                alignment: Alignment.center,
                                child: Container(
                                  width: 92,
                                  height: 92,
                                  decoration: BoxDecoration(
                                    color: primary,
                                    shape: BoxShape.circle,
                                  ),
                                  child: const Icon(Icons.login, size: 44, color: Colors.white),
                                ),
                              ),
                              const SizedBox(height: 16),
                              const Text('Welcome back', textAlign: TextAlign.center, style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700)),
                              const SizedBox(height: 18),

                              TextFormField(
                                controller: _emailCtrl,
                                decoration: InputDecoration(
                                  focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(14), borderSide: BorderSide(color: primary)),
                                  labelText: 'Email',
                                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(14)),
                                ),
                                keyboardType: TextInputType.emailAddress,
                                onChanged: (v) {
                                  _formKey.currentState?.validate();
                                  setState(() {});
                                },
                                validator: (v) {
                                  final email = v ?? '';
                                  final emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+$');
                                  return emailRegex.hasMatch(email) ? null : 'Enter a valid email (e.g., user@domain.com)';
                                },
                              ),
                              const SizedBox(height: 12),
                              TextFormField(
                                controller: _passwordCtrl,
                                decoration: InputDecoration(
                                  focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(14), borderSide: BorderSide(color: primary)),
                                  labelText: 'Password',
                                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(14)),
                                ),
                                obscureText: true,
                                onChanged: (v) {
                                  _formKey.currentState?.validate();
                                  setState(() {});
                                },
                                validator: (v) {
                                  if ((v ?? '').isEmpty) return 'Enter your password';
                                  if (v!.length < 6) return 'Password must be at least 6 characters';
                                  return null;
                                },
                              ),

                              const SizedBox(height: 18),
                              SizedBox(
                                height: 48,
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(backgroundColor: AppColors.primary),
                                  onPressed: _loading ? null : _submit,
                                  child: _loading
                                      ? const Center(
                                          child: SizedBox(
                                            height: 24,
                                            width: 24,
                                            child: CircularProgressIndicator(
                                              color: AppColors.primary,
                                              strokeWidth: 2,
                                            ),
                                          ),
                                        )
                                      : const Text('Sign in', style: TextStyle(color: Colors.white),),
                                ),
                              ),

                              const SizedBox(height: 12),
                              TextButton(
                                onPressed: () => Get.to(SignupScreen()),
                                child: const Text('Don\'t have an account? Create one',style: TextStyle(color: AppColors.primary),),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
