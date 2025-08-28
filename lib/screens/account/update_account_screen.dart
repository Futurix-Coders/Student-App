import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../models/account_models.dart';
import '../../theme/app_theme.dart';
import '../../widgets/app_bar.dart';

class UpdateAccountScreen extends StatefulWidget {
  const UpdateAccountScreen({super.key});

  @override
  State<UpdateAccountScreen> createState() => _UpdateAccountScreenState();
}

class _UpdateAccountScreenState extends State<UpdateAccountScreen> {
  late UserProfile userProfile;
  final _formKey = GlobalKey<FormState>();
  late TextEditingController nameController;
  late TextEditingController emailController;
  late TextEditingController phoneController;
  late TextEditingController semesterController;
  late TextEditingController departmentController;
  late TextEditingController classRollController;
  late TextEditingController makautRollController;
  late TextEditingController dobController;

  @override
  void initState() {
    super.initState();
    userProfile = Get.arguments as UserProfile;
    nameController = TextEditingController(text: userProfile.name);
    emailController = TextEditingController(text: userProfile.email);
    phoneController = TextEditingController(text: userProfile.phoneNumber);
    semesterController = TextEditingController(text: userProfile.semester);
    departmentController = TextEditingController(text: userProfile.department);
    classRollController = TextEditingController(text: userProfile.classRoll);
    makautRollController = TextEditingController(text: userProfile.makautRoll);
    dobController = TextEditingController(text: userProfile.formattedDateOfBirth);
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    semesterController.dispose();
    departmentController.dispose();
    classRollController.dispose();
    makautRollController.dispose();
    dobController.dispose();
    super.dispose();
  }

  void _updateProfile() {
    if (_formKey.currentState!.validate()) {
      // Simulate update
      Get.snackbar('Success', 'Account details updated!', snackPosition: SnackPosition.BOTTOM);
      Get.back(result: true);
    }
  }

  InputDecoration _inputDecoration(String label) {
    return InputDecoration(
      labelText: label,
      filled: true,
      fillColor: AppTheme.white,
      contentPadding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: AppTheme.primaryBlue.withValues(alpha: 0.2)),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: AppTheme.primaryBlue.withValues(alpha: 0.2)),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: AppTheme.primaryBlue, width: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Update Account'),
      backgroundColor: AppTheme.lightGrey,
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Card(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            elevation: 8,
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Edit your details', style: AppTheme.heading3.copyWith(color: AppTheme.primaryBlue)),
                    const SizedBox(height: 24),
                    TextFormField(
                      controller: nameController,
                      decoration: _inputDecoration('Name'),
                      validator: (v) => v == null || v.isEmpty ? 'Enter name' : null,
                    ),
                    const SizedBox(height: 16),
                    TextFormField(
                      controller: emailController,
                      decoration: _inputDecoration('Email'),
                      validator: (v) => v == null || v.isEmpty ? 'Enter email' : null,
                    ),
                    const SizedBox(height: 16),
                    TextFormField(
                      controller: phoneController,
                      decoration: _inputDecoration('Phone Number'),
                      validator: (v) => v == null || v.isEmpty ? 'Enter phone number' : null,
                    ),
                    const SizedBox(height: 16),
                    TextFormField(
                      controller: semesterController,
                      decoration: _inputDecoration('Semester'),
                      validator: (v) => v == null || v.isEmpty ? 'Enter semester' : null,
                    ),
                    const SizedBox(height: 16),
                    TextFormField(
                      controller: departmentController,
                      decoration: _inputDecoration('Department'),
                      validator: (v) => v == null || v.isEmpty ? 'Enter department' : null,
                    ),
                    const SizedBox(height: 16),
                    TextFormField(
                      controller: classRollController,
                      decoration: _inputDecoration('Class Roll'),
                      validator: (v) => v == null || v.isEmpty ? 'Enter class roll' : null,
                    ),
                    const SizedBox(height: 16),
                    TextFormField(
                      controller: makautRollController,
                      decoration: _inputDecoration('MAKAUT Roll'),
                      validator: (v) => v == null || v.isEmpty ? 'Enter MAKAUT roll' : null,
                    ),
                    const SizedBox(height: 16),
                    TextFormField(
                      controller: dobController,
                      decoration: _inputDecoration('Date of Birth (DD/MM/YYYY)'),
                      validator: (v) => v == null || v.isEmpty ? 'Enter date of birth' : null,
                    ),
                    const SizedBox(height: 32),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: _updateProfile,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppTheme.primaryBlue,
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                        ),
                        child: const Text('Update', style: TextStyle(fontSize: 18)),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
