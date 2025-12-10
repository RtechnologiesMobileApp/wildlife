import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wildlife/config/constants/colors.dart';

class CenterProfileScreen extends StatefulWidget {
  const CenterProfileScreen({super.key});

  @override
  State<CenterProfileScreen> createState() => _CenterProfileScreenState();
}

class _CenterProfileScreenState extends State<CenterProfileScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameCtrl = TextEditingController(text: 'Green Valley Wildlife Center');
  final _emailCtrl = TextEditingController(text: 'center@example.org');
  final _phoneCtrl = TextEditingController(text: '+1 555 123 456');
  final _addressCtrl = TextEditingController(text: '1234 Forest Lane, Greenville');
  final _licenseCtrl = TextEditingController(text: 'LIC-000123');
  bool _loading = false;

  void _save() async {
    if (!_formKey.currentState!.validate()) return;
    setState(() => _loading = true);
    await Future.delayed(const Duration(seconds: 1));
    setState(() => _loading = false);
    Get.snackbar('Saved', 'Center information updated');
  }

  @override
  void dispose() {
    _nameCtrl.dispose();
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
      appBar: AppBar(title: const Text('Center Profile')),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(minHeight: constraints.maxHeight),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: SizedBox(
                  width: constraints.maxWidth < 640 ? double.infinity : 640,
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Align(
                          alignment: Alignment.center,
                          child: Container(
                            width: 92,
                            height: 92,
                            decoration: BoxDecoration(color: primary, shape: BoxShape.circle),
                            child: const Icon(Icons.business, size: 44, color: Colors.white),
                          ),
                        ),
                        const SizedBox(height: 12),
                        TextFormField(
                          controller: _nameCtrl,
                          decoration: const InputDecoration(labelText: 'Center Name'),
                          validator: (v) => (v ?? '').trim().isEmpty ? 'Enter center name' : null,
                        ),
                        const SizedBox(height: 12),
                        TextFormField(
                          controller: _emailCtrl,
                          decoration: const InputDecoration(labelText: 'Email'),
                          keyboardType: TextInputType.emailAddress,
                          validator: (v) => (v ?? '').contains('@') ? null : 'Enter a valid email',
                        ),
                        const SizedBox(height: 12),
                        TextFormField(
                          controller: _phoneCtrl,
                          decoration: const InputDecoration(labelText: 'Phone'),
                          keyboardType: TextInputType.phone,
                          validator: (v) => (v ?? '').length >= 8 ? null : 'Enter a valid phone',
                        ),
                        const SizedBox(height: 12),
                        TextFormField(
                          controller: _addressCtrl,
                          decoration: const InputDecoration(labelText: 'Address'),
                          maxLines: 2,
                          validator: (v) => (v ?? '').trim().isEmpty ? 'Enter address' : null,
                        ),
                        const SizedBox(height: 12),
                        TextFormField(
                          controller: _licenseCtrl,
                          decoration: const InputDecoration(labelText: 'License Number'),
                          validator: (v) => (v ?? '').trim().isEmpty ? 'Enter license number' : null,
                        ),
                        const SizedBox(height: 18),
                        SizedBox(
                          height: 48,
                          child: ElevatedButton(
                            onPressed: _loading ? null : _save,
                            child: _loading ? const CircularProgressIndicator(color: Colors.white) : const Text('Save Changes', style: TextStyle(color: Colors.white)),
                            style: ElevatedButton.styleFrom(backgroundColor: AppColors.primary),
                          ),
                        ),
                        const SizedBox(height: 12),
                        TextButton(onPressed: () => Get.back(), child: const Text('Close',style: TextStyle(color: AppColors.primary),)),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
