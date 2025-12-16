import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wildlife/config/constants/colors.dart';
import 'package:wildlife/features/wildlifecenterdashboard/presentations/screens/center_otp_screen.dart';

class CenterSignupScreen extends StatefulWidget {
  const CenterSignupScreen({super.key});

  @override
  State<CenterSignupScreen> createState() => _CenterSignupScreenState();
}

class _CenterSignupScreenState extends State<CenterSignupScreen> {
  final _formKey = GlobalKey<FormState>();
  final _centerNameCtrl = TextEditingController();
  final _emailCtrl = TextEditingController();
  final _phoneCtrl = TextEditingController();
  final _addressCtrl = TextEditingController();
  final _licenseCtrl = TextEditingController();
  bool _loading = false;

  void _submit() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() => _loading = true);
    await Future.delayed(const Duration(seconds: 1));
    setState(() => _loading = false);

    // Navigate to OTP verification screen
    Get.to(
      CenterOtpScreen(email: _emailCtrl.text),
    );
  }

  @override
  void dispose() {
    _centerNameCtrl.dispose();
    _emailCtrl.dispose();
    _phoneCtrl.dispose();
    _addressCtrl.dispose();
    _licenseCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final primary = Theme.of(context).primaryColor;

    return Scaffold(
      appBar: AppBar(title: const Text('Center Registration')),
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
                                  child: const Icon(Icons.location_on, size: 44, color: Colors.white),
                                ),
                              ),
                              const SizedBox(height: 12),
                              const Text(
                                'Register Your Wildlife Center',
                                textAlign: TextAlign.center,
                                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
                              ),
                              const SizedBox(height: 16),
                              // Center Name
                              TextFormField(
                                controller: _centerNameCtrl,
                                decoration: InputDecoration(
                                  focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(14), borderSide: BorderSide(color: primary)),
                                  labelText: 'Center Name',
                                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(14)),
                                ),
                                onChanged: (v) {
                                  _formKey.currentState?.validate();
                                  setState(() {});
                                },
                                validator: (v) => (v ?? '').trim().isEmpty ? 'Enter center name' : null,
                              ),
                              const SizedBox(height: 12),
                              // Email
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
                              // Phone
                              TextFormField(
                                controller: _phoneCtrl,
                                decoration: InputDecoration(
                                  focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(14), borderSide: BorderSide(color: primary)),
                                  labelText: 'Phone Number',
                                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(14)),
                                ),
                                keyboardType: TextInputType.phone,
                                onChanged: (v) {
                                  _formKey.currentState?.validate();
                                  setState(() {});
                                },
                                validator: (v) => (v ?? '').length >= 10 ? null : 'Enter a valid phone number',
                              ),
                              const SizedBox(height: 12),
                              // Address
                              TextFormField(
                                controller: _addressCtrl,
                                decoration: InputDecoration(
                                  focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(14), borderSide: BorderSide(color: primary)),
                                  labelText: 'Center Address',
                                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(14)),
                                ),
                                maxLines: 2,
                                onChanged: (v) {
                                  _formKey.currentState?.validate();
                                  setState(() {});
                                },
                                validator: (v) => (v ?? '').trim().isEmpty ? 'Enter address' : null,
                              ),
                              const SizedBox(height: 12),
                              // License Number
                              TextFormField(
                                controller: _licenseCtrl,
                                decoration: InputDecoration(
                                  focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(14), borderSide: BorderSide(color: primary)),
                                  labelText: 'License Number',
                                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(14)),
                                ),
                                onChanged: (v) {
                                  _formKey.currentState?.validate();
                                  setState(() {});
                                },
                                validator: (v) => (v ?? '').trim().isEmpty ? 'Enter license number' : null,
                              ),
                              const SizedBox(height: 18),
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
                                        : const Text('Verify & Continue', style: TextStyle(color: Colors.white),),
                                  style: ElevatedButton.styleFrom(backgroundColor: primary),
                                ),
                              ),
                              const SizedBox(height: 12),
                              TextButton(
                                onPressed: () => Get.back(),
                                child: const Text('Already registered? Sign in',style: TextStyle(color: AppColors.primary),),
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
