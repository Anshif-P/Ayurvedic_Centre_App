import 'dart:io';
import 'package:flutter/material.dart';
import 'package:noviindus_machine_task/src/feature/register/widgets/generate_pdf.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';
import 'package:printing/printing.dart';

class PdfPreviewPage extends StatelessWidget {
  final String name;
  final String whatsappNumber;
  final String address;
  final String location;
  final String branch;
  final String treatment;
  final int numberOfMale;
  final int numberOfFemale;
  final String totalAmount;
  final String discountAmount;
  final String advanceAmount;
  final String balanceAmount;
  final String treatmentDate;

  final String paymentOption;
  final String date;
  final String time;

  const PdfPreviewPage({
    super.key,
    required this.date,
    required this.time,
    required this.name,
    required this.whatsappNumber,
    required this.address,
    required this.location,
    required this.branch,
    required this.treatment,
    required this.numberOfMale,
    required this.numberOfFemale,
    required this.totalAmount,
    required this.discountAmount,
    required this.advanceAmount,
    required this.balanceAmount,
    required this.treatmentDate,
    required this.paymentOption,
  });

  Future<void> _sharePdf(BuildContext context) async {
    try {
      final pdfData = await generatePdf(
        time: time,
        date: date,
        name: name,
        whatsappNumber: whatsappNumber,
        address: address,
        location: location,
        branch: branch,
        treatment: treatment,
        numberOfMale: numberOfMale,
        numberOfFemale: numberOfFemale,
        totalAmount: totalAmount,
        discountAmount: discountAmount,
        advanceAmount: advanceAmount,
        balanceAmount: balanceAmount,
        treatmentDate: treatmentDate,
        paymentOption: paymentOption,
      );

      final tempDir = await getTemporaryDirectory();
      final file = File('${tempDir.path}/registration_details.pdf');
      await file.writeAsBytes(pdfData);

      // ignore: deprecated_member_use
      await Share.shareFiles([file.path],
          text: 'Here is your registration details');
    } catch (e) {
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Error sharing PDF: $e')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PDF Preview'),
        actions: [
          IconButton(
            icon: const Icon(Icons.share),
            onPressed: () => _sharePdf(context),
          ),
        ],
      ),
      body: PdfPreview(
        build: (format) => generatePdf(
          date: date,
          time: time,
          name: name,
          whatsappNumber: whatsappNumber,
          address: address,
          location: location,
          branch: branch,
          treatment: treatment,
          numberOfMale: numberOfMale,
          numberOfFemale: numberOfFemale,
          totalAmount: totalAmount,
          discountAmount: discountAmount,
          advanceAmount: advanceAmount,
          balanceAmount: balanceAmount,
          treatmentDate: treatmentDate,
          paymentOption: paymentOption,
        ),
      ),
    );
  }
}
