import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wildlife/config/constants/colors.dart';

class UserProfileScreen extends StatefulWidget {
  const UserProfileScreen({super.key});

  @override
  State<UserProfileScreen> createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<UserProfileScreen> {
   final _formKey = GlobalKey<FormState>();
   final _nameCtrl = TextEditingController(text: 'John Smith');
   final _emailCtrl = TextEditingController(text: 'john.smith@example.com');
   final _phoneCtrl = TextEditingController(text: '+1 555 456 789');
   final _locationCtrl = TextEditingController(text: 'Greenville, CA');
   bool _loading = false;
   String? _profileImage;

  void _save() async {
    if (!_formKey.currentState!.validate()) return;
    setState(() => _loading = true);
    await Future.delayed(const Duration(seconds: 1));
    setState(() => _loading = false);
    Get.snackbar('Saved', 'Profile information updated');
  }

  void _pickImage() {
    // Simulate picking image
    setState(() => _profileImage = 'https://via.placeholder.com/150');
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Profile picture updated')));
  }

  @override
  void dispose() {
    _nameCtrl.dispose();
    _emailCtrl.dispose();
    _phoneCtrl.dispose();
    _locationCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final primary = Theme.of(context).primaryColor;
    return Scaffold(
      appBar: AppBar(title: const Text('My Profile')),
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
                          child: Stack(
                            children: [
                              Container(
                                width: 92,
                                height: 92,
                                decoration: BoxDecoration(
                                  color: primary,
                                  shape: BoxShape.circle,
                                  image: _profileImage != null
                                      ? DecorationImage(
                                          image: NetworkImage(_profileImage!),
                                          fit: BoxFit.cover,
                                        )
                                      : null,
                                ),
                                child: _profileImage == null
                                    ? const Icon(Icons.person, size: 44, color: Colors.white)
                                    : null,
                              ),
                              Positioned(
                                bottom: 0,
                                right: 0,
                                child: IconButton(
                                  onPressed: _pickImage,
                                  icon: const Icon(Icons.camera_alt, size: 20, color: Colors.white),
                                  style: IconButton.styleFrom(
                                    backgroundColor: primary,
                                    padding: const EdgeInsets.all(6),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 12),
                        TextFormField(
                          controller: _nameCtrl,
                          decoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(14), borderSide: BorderSide(color: primary)),
                            labelText: 'Full Name',
                            border: OutlineInputBorder(borderRadius: BorderRadius.circular(14)),
                            prefixIcon: const Icon(Icons.person),
                          ),
                          validator: (v) => (v ?? '').trim().isEmpty ? 'Enter your name' : null,
                        ),
                        const SizedBox(height: 12),
                        TextFormField(
                          controller: _emailCtrl,
                          decoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(14), borderSide: BorderSide(color: primary)),
                            labelText: 'Email',
                            border: OutlineInputBorder(borderRadius: BorderRadius.circular(14)),
                            prefixIcon: const Icon(Icons.email),
                          ),
                          keyboardType: TextInputType.emailAddress,
                          validator: (v) {
                            final email = v ?? '';
                            final emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+$');
                            return emailRegex.hasMatch(email) ? null : 'Enter a valid email (e.g., user@domain.com)';
                          },
                        ),
                        const SizedBox(height: 12),
                        TextFormField(
                          controller: _phoneCtrl,
                          decoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(14), borderSide: BorderSide(color: primary)),
                            labelText: 'Phone',
                            border: OutlineInputBorder(borderRadius: BorderRadius.circular(14)),
                            prefixIcon: const Icon(Icons.phone),
                          ),
                          keyboardType: TextInputType.phone,
                          validator: (v) => (v ?? '').length >= 8 ? null : 'Enter a valid phone',
                        ),
                        const SizedBox(height: 12),
                        TextFormField(
                          controller: _locationCtrl,
                          decoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(14), borderSide: BorderSide(color: primary)),
                            labelText: 'Location',
                            border: OutlineInputBorder(borderRadius: BorderRadius.circular(14)),
                            prefixIcon: const Icon(Icons.location_on),
                          ),
                          validator: (v) => (v ?? '').trim().isEmpty ? 'Enter your location' : null,
                        ),
                        const SizedBox(height: 18),
                        SizedBox(
                          height: 48,
                          child: ElevatedButton(
                            onPressed: _loading ? null : _save,
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
                                : const Text('Save Changes', style: TextStyle(color: Colors.white),),
                            style: ElevatedButton.styleFrom(backgroundColor: AppColors.primary),
                          ),
                        ),
                        const SizedBox(height: 12),
                        TextButton(onPressed: () => Get.back(), child: const Text('Close', style: TextStyle(color: AppColors.primary))),
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
