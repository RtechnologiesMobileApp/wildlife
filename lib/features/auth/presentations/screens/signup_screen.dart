import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wildlife/config/constants/colors.dart';
import 'package:wildlife/features/auth/presentations/screens/user_otp_screen.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameCtrl = TextEditingController();
  final _emailCtrl = TextEditingController();
  final _passwordCtrl = TextEditingController();
  bool _agree = false;
  bool _loading = false;

  void _submit() async {
    if (!_formKey.currentState!.validate()) return;
    if (!_agree) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Please accept the terms to continue')));
      return;
    }
    setState(() => _loading = true);
    await Future.delayed(const Duration(seconds: 1));
    setState(() => _loading = false);
    // Navigate to OTP verification screen
    Get.to(UserOtpScreen(email: _emailCtrl.text));
  }

  @override
  void dispose() {
    _nameCtrl.dispose();
    _emailCtrl.dispose();
    _passwordCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final primary = Theme.of(context).primaryColor;
    return Scaffold(
      appBar: AppBar(title: const Text('Sign up')),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(minHeight: constraints.maxHeight),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: SizedBox(
                      width: constraints.maxWidth < 560 ? double.infinity : 560,
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
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
                              Align(
                                alignment: Alignment.center,
                                child: Container(
                                  width: 92,
                                  height: 92,
                                  decoration: BoxDecoration(
                                    color: primary,
                                    shape: BoxShape.circle,
                                  ),
                                  child: const Icon(Icons.person_add, size: 44, color: Colors.white),
                                ),
                              ),
                              const SizedBox(height: 12),
                              const Text('Create your account', textAlign: TextAlign.center, style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700)),
                              const SizedBox(height: 16),

                              TextFormField(
                                
                                controller: _nameCtrl,
                                decoration:  InputDecoration(
                                  focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(14), borderSide: BorderSide(color: primary)),
                                  focusColor: primary,
                                  labelText: 'Full name',border: OutlineInputBorder(borderRadius: BorderRadius.circular(14))),
                                
                                onChanged: (v) {
                                  _formKey.currentState?.validate();
                                  setState(() {});
                                },
                                validator: (v) => (v ?? '').trim().isEmpty ? 'Enter your name' : null,
                              ),
                              const SizedBox(height: 12),
                              TextFormField(
                                controller: _emailCtrl,
                                
                                decoration:  InputDecoration(
                                   focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(14), borderSide: BorderSide(color: primary)),
                                  labelText: 'Email',border: OutlineInputBorder(borderRadius: BorderRadius.circular(14)),),
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
                                decoration:  InputDecoration(
                                   focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(14), borderSide: BorderSide(color: primary)),
                                  labelText: 'Password',border: OutlineInputBorder(borderRadius: BorderRadius.circular(14)),),
                                obscureText: true,
                                onChanged: (v) {
                                  _formKey.currentState?.validate();
                                  setState(() {});
                                },
                                validator: (v) {
                                  if ((v ?? '').isEmpty) return 'Enter a password';
                                  if (v!.length < 6) return 'Password must be at least 6 characters';
                                  return null;
                                },
                              ),

                              const SizedBox(height: 12),
                              Row(children: [
                                Checkbox(value: _agree, onChanged: (v) => setState(() => _agree = v ?? false)),
                                const Expanded(child: Text('I agree that my report and location may be shared with licensed rehab centers.')),
                              ]),

                              const SizedBox(height: 12),
                              SizedBox(
                                height: 48,
                                child: ElevatedButton(
                                  onPressed: _loading ? null : _submit,
                                  child: _loading
                                      ? const Center(
                                          child: SizedBox(
                                            height: 24,
                                            width: 24,
                                            child: CircularProgressIndicator(
                                              color: Colors.white,
                                              strokeWidth: 2,
                                            ),
                                          ),
                                        )
                                      : const Text('Create account', style: TextStyle(color: Colors.white),),
                                  style: ElevatedButton.styleFrom(backgroundColor: AppColors.primary),
                                ),
                              ),

                              const SizedBox(height: 8),
                              TextButton(
                                onPressed: () => Get.back(),
                                child: const Text('Already have an account? Sign in',style: TextStyle(color: AppColors.primary),),
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
