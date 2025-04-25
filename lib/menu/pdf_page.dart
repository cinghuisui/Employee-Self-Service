import 'package:flutter/material.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

void main() {
  runApp(PdfPage());
}

class PdfPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PDF Dummy',
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  // Fungsi buat PDF
  Future<pw.Document> generatePdf() async {
    final pdf = pw.Document();

    pdf.addPage(
      pw.Page(
        build: (pw.Context context) {
          return pw.Center(
            child: pw.Text('Ini adalah PDF Dummy 🎉', style: pw.TextStyle(fontSize: 32)),
          );
        },
      ),
    );

    return pdf;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Buat dan Tampilkan PDF")),
      body: Center(
        child: ElevatedButton(
          child: Text("Download PDF"),
          onPressed: () async {
            final pdf = await generatePdf();
            await Printing.layoutPdf(
              onLayout: (PdfPageFormat format) async => pdf.save(),
            );
          },
        ),
      ),
    );
  }
}
