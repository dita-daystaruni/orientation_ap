import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:orientation_app/constants/custom_colors.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

class PreviewPage extends StatelessWidget {
  final List<dynamic> statisticsData;

  const PreviewPage({super.key, required this.statisticsData});

  Future<Uint8List> _generatePdf(PdfPageFormat format) async {
    final pdf = pw.Document();

    pdf.addPage(
      pw.Page(
        pageFormat: format,
        build: (pw.Context context) => pw.Column(
          children: [
            pw.Text('Students Report',
                style:
                    pw.TextStyle(fontSize: 16, fontWeight: pw.FontWeight.bold)),
            pw.SizedBox(height: 20),
            pw.TableHelper.fromTextArray(
              headers: [
                'Admission Number',
                'Name',
                'Email',
                'Phone',
                'Course',
                'Campus',
                'Gender',
                'Accommodation',
              ],
              data: statisticsData.map((item) {
                return [
                  "${item['admission_number']}",
                  "${item['first_name']} ${item['last_name']}",
                  "${item['email']}",
                  "${item['phone_number']}",
                  "${item['course']}",
                  "${item['campus']}",
                  "${item['gender']}",
                  "${item['accomodation']}",
                ];
              }).toList(),
              cellStyle:
                  const pw.TextStyle(fontSize: 8),
              headerStyle:
                  pw.TextStyle(fontSize: 10, fontWeight: pw.FontWeight.bold),
              headerDecoration:
                  const pw.BoxDecoration(color: PdfColors.grey300),
              cellAlignment: pw.Alignment.centerLeft,
              columnWidths: {
                0: const pw.FlexColumnWidth(1.5),
                1: const pw.FlexColumnWidth(1.5),
                2: const pw.FlexColumnWidth(2.0),
                3: const pw.FlexColumnWidth(1.8),
                4: const pw.FlexColumnWidth(1.8),
                5: const pw.FlexColumnWidth(1.5),
                6: const pw.FlexColumnWidth(1.5),
                7: const pw.FlexColumnWidth(2.0),
              },
            ),
          ],
        ),
      ),
    );

    return pdf.save();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.backgroundColor,
      appBar: AppBar(
        backgroundColor: CustomColors.backgroundColor,
        title: const Text('Preview'),
      ),
      body: PdfPreview(
        build: (format) => _generatePdf(format),
        actionBarTheme:
            const PdfActionBarTheme(backgroundColor: CustomColors.buttonColor),
        loadingWidget:
            const CircularProgressIndicator(color: CustomColors.buttonColor),
      ),
    );
  }
}
