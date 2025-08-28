import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controller/mar/mar_controller.dart';
import '../../theme/app_theme.dart';
import '../../widgets/app_bar.dart';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:http/http.dart' as http;

class MarCertificateScreen extends StatelessWidget {
  const MarCertificateScreen({super.key});

  Future<void> _downloadCertificate(String url, String fileName, BuildContext context) async {
    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final dir = await getApplicationDocumentsDirectory();
        final file = File('${dir.path}/$fileName');
        await file.writeAsBytes(response.bodyBytes);
        Get.snackbar('Download Complete', 'Certificate saved to Documents folder.');
      } else {
        Get.snackbar('Download Failed', 'Could not download certificate.');
      }
    } catch (e) {
      Get.snackbar('Error', 'Failed to download: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    final marController = Get.put(MarController());
    return Scaffold(
      appBar: const CustomAppBar(title: 'MAR Certificates', showBackButton: true),
      backgroundColor: AppTheme.lightGrey,
      body: Obx(() => ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: marController.certificates.length,
        itemBuilder: (context, index) {
          final cert = marController.certificates[index];
          return Card(
            margin: const EdgeInsets.only(bottom: 20),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            elevation: 4,
            child: Padding(
              padding: const EdgeInsets.all(18),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(cert.title, style: AppTheme.heading3.copyWith(color: AppTheme.primaryBlue)),
                  const SizedBox(height: 8),
                  Text(cert.description, style: AppTheme.bodyMedium),
                  const SizedBox(height: 16),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton.icon(
                      icon: const Icon(Icons.download, color: AppTheme.white),
                      label: const Text('Download PDF'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppTheme.primaryBlue,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                        padding: const EdgeInsets.symmetric(vertical: 14),
                      ),
                      onPressed: () => _downloadCertificate(cert.downloadUrl, '${cert.title}.pdf', context),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      )),
    );
  }
}
