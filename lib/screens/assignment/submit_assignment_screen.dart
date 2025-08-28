import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:file_picker/file_picker.dart';
import '../../models/assignment_models.dart';
import '../../theme/app_theme.dart';
import '../../widgets/app_bar.dart';

class SubmitAssignmentScreen extends StatefulWidget {
  final Assignment assignment;
  const SubmitAssignmentScreen({super.key, required this.assignment});

  @override
  State<SubmitAssignmentScreen> createState() => _SubmitAssignmentScreenState();
}

class _SubmitAssignmentScreenState extends State<SubmitAssignmentScreen> {
  PlatformFile? _selectedFile;
  final TextEditingController _messageController = TextEditingController();

  Future<void> _pickFile() async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf', 'png', 'jpg', 'jpeg', 'xlsx', 'xls'],
    );
    if (result != null && result.files.isNotEmpty) {
      setState(() {
        _selectedFile = result.files.first;
      });
    }
  }

  void _submit() {
    // Demo submit logic
    if (_selectedFile != null) {
      Get.snackbar('Assignment Submitted', 'Your assignment has been submitted.');
      Navigator.of(context).pop();
    } else {
      Get.snackbar('Error', 'Please select a file to upload.');
    }
  }

  @override
  Widget build(BuildContext context) {
    final assignment = widget.assignment;
    return Scaffold(
      appBar: CustomAppBar(title: 'Submit Assignment', showBackButton: true),
      backgroundColor: AppTheme.lightGrey,
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              assignment.subjectName,
              style: AppTheme.heading2.copyWith(color: AppTheme.primaryBlue),
            ),
            const SizedBox(height: 8),
            Text('Topic: ${assignment.topic}', style: AppTheme.bodyMedium),
            const SizedBox(height: 8),
            Text(assignment.description, style: AppTheme.bodySmall),
            const SizedBox(height: 24),
            Text('Upload your assignment file:', style: AppTheme.bodyMedium),
            const SizedBox(height: 8),
            GestureDetector(
              onTap: _pickFile,
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(vertical: 18),
                decoration: BoxDecoration(
                  color: AppTheme.white,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: AppTheme.primaryBlue.withOpacity(0.2)),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.upload_file, color: AppTheme.primaryBlue),
                    const SizedBox(width: 10),
                    Text(_selectedFile?.name ?? 'Choose file (pdf, image, excel)', style: AppTheme.bodyMedium),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24),
            Text('Message for Teacher:', style: AppTheme.bodyMedium),
            const SizedBox(height: 8),
            TextField(
              controller: _messageController,
              maxLines: 3,
              decoration: InputDecoration(
                hintText: 'Type your message here...',
                filled: true,
                fillColor: AppTheme.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(color: AppTheme.primaryBlue.withOpacity(0.2)),
                ),
              ),
            ),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: _submit,
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppTheme.primaryBlue,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                  padding: const EdgeInsets.symmetric(vertical: 16),
                ),
                child: const Text('Submit Assignment'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
