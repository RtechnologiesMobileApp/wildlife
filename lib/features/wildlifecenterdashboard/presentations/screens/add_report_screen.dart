import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wildlife/config/constants/colors.dart';
import 'package:wildlife/features/wildlifecenterdashboard/model/wild_life_report_model.dart';

class AddReportScreen extends StatefulWidget {
  const AddReportScreen({super.key});

  @override
  State<AddReportScreen> createState() => _AddReportScreenState();
}

class _AddReportScreenState extends State<AddReportScreen> {
  final _formKey = GlobalKey<FormState>();
  final _animalCtrl = TextEditingController();
  final _conditionCtrl = TextEditingController();
  final _locationCtrl = TextEditingController();

  void _submit() {
    if (!_formKey.currentState!.validate()) return;

    final newReport = WildlifeReportModel(
      animal: _animalCtrl.text,
      condition: _conditionCtrl.text,
      time: 'Just now',
      location: _locationCtrl.text,
      photo: null,
    );

    Get.back(result: newReport); // return to dashboard
  }

  @override
  void dispose() {
    _animalCtrl.dispose();
    _conditionCtrl.dispose();
    _locationCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text('Add New Report'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _animalCtrl,
                decoration: InputDecoration(
                  labelText: 'Animal Name',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                ),
                validator: (v) =>
                    (v ?? '').isEmpty ? 'Enter animal name' : null,
              ),
              const SizedBox(height: 12),
              TextFormField(
                controller: _conditionCtrl,
                decoration: InputDecoration(
                  labelText: 'Condition (Critical / Moderate / Minor)',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                ),
                validator: (v) => (v ?? '').isEmpty ? 'Enter condition' : null,
              ),
              const SizedBox(height: 12),
              TextFormField(
                controller: _locationCtrl,
                decoration: InputDecoration(
                  labelText: 'Location',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                ),
                validator: (v) => (v ?? '').isEmpty ? 'Enter location' : null,
              ),
              const SizedBox(height: 24),
              SizedBox(
                width: double.infinity,
                height: 48,
                child: ElevatedButton(
                  onPressed: _submit,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14),
                    ),
                  ),
                  child: const Text(
                    'Add Report',
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
