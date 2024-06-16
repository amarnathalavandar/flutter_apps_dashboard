import 'dart:convert';
import 'dart:html';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_apps_dashboard/screens/home/widgets/custom_app_bar.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

/// Represents ResumeScreen for Navigation
class ResumeScreen extends StatefulWidget {
  @override
  _ResumeScreen createState() => _ResumeScreen();
}

class _ResumeScreen extends State<ResumeScreen> {
  final GlobalKey<SfPdfViewerState> _pdfViewerKey = GlobalKey();
  final PdfViewerController _pdfViewerController = PdfViewerController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: Center(child: const Text('Amarnath Alavandar Resume')),
        actionList: [
          SizedBox(
            height: 100,
            width: 150 ,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white, // Background color
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(bottomRight: Radius.circular(30.5)),
                ),
                elevation: 5,
                shadowColor: Colors.purpleAccent,
              ),
              onPressed: () {_downloadFile(context);},
              child: Row(
                children: [
                  Icon(Icons.save_alt_outlined, color:Colors.grey.shade600,),
                  const SizedBox(width: 5),
                  Text(
                    'Download',
                    style: TextStyle(color: Colors.grey.shade600),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 200),
          child: Column(
            children: [
              ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
                  overlayColor: MaterialStateProperty.all<Color>(Colors.grey.shade300),
                  surfaceTintColor: MaterialStateProperty.all(Colors.white),
                  shadowColor: MaterialStateProperty.all<Color>(Colors.grey),
                  elevation: MaterialStateProperty.all<double>(2.1),
                  fixedSize: MaterialStateProperty.all<Size>(Size(double.infinity, 180)),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  side: MaterialStateProperty.all(
                    BorderSide(color: Colors.white24),
                  ),
                ),
                onPressed: () {

                },
                child: SizedBox(
                  height: 180, // Fixed height
                  width: double.infinity, // Full width
                  child: Image.asset(
                    'assets/icon/paynow.png',
                    fit: BoxFit.cover, // Adjust this to fit your needs: cover, contain, fill, etc.
                  ),
                ),
              )

            ],
          ),
        ),
      ),
    );
  }
  String getFormattedDate() {
    // Get the current date
    DateTime now = DateTime.now();

    // Format the date
    DateFormat formatter = DateFormat('dd_MMM_yyyy');
    String formattedDate = formatter.format(now).toUpperCase();
    return formattedDate;
  }
  void _downloadFile(BuildContext context) async {
    try {
      final ByteData data = await rootBundle.load('assets/resume.pdf');
      final Uint8List bytes = data.buffer.asUint8List();
      final blob = Blob([bytes]);
      final url = Url.createObjectUrlFromBlob(blob);
      final anchor = AnchorElement(href: url)
        ..setAttribute('download', 'Amarnath_Alavandar_${getFormattedDate()}.pdf')
        ..click();
      Url.revokeObjectUrl(url);
    } catch (e) {
      print('Error downloading PDF: $e');
      // Handle error
    }
  }
}


class SaveHelper {
  static Future<void> save(List<int> bytes, String fileName) async {
    AnchorElement(
      href:
      'data:application/octet-stream;charset=utf-16le;base64,${base64.encode(bytes)}',
    )
      ..setAttribute('download', fileName)
      ..click();
  }
}
