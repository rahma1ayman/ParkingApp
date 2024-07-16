import 'package:flutter/material.dart';
import 'package:parking_app/helper/load_data.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

import '../helper/constants.dart';

class ScannerView extends StatefulWidget {
  const ScannerView({super.key});

  @override
  State<ScannerView> createState() => _ScannerViewState();
}

class _ScannerViewState extends State<ScannerView> {
  QRViewController? controller;
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  String result = "";

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Scanner"),
      ),
      body: Center(
        child: QRView(
          key: qrKey,
          onQRViewCreated: _onQRViewCreated,
          overlay: QrScannerOverlayShape(
            borderColor: Colors.white,
            borderRadius: 10,
            borderWidth: 10,
            cutOutSize: MediaQuery.of(context).size.width * 0.8,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _clearResult,
        label: const Text('Clear Result'),
        icon: const Icon(Icons.clear),
      ),
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    this.controller = controller;
    controller.scannedDataStream.listen((scanData) {
      setState(() async {
        result = scanData.code!;
        // Process the scanned data (extract ID)
        String id = extractIdFromScannedContent(result);
        controller.dispose();
        await _showDataDialog(id);
      });
    });
  }

  void _clearResult() {
    setState(() {
      result = "";
    });
  }

  String extractIdFromScannedContent(String scannedContent) {
    if (scannedContent.isNotEmpty) {
      return scannedContent;
    }
    return "";
  }

  Future<void> _showDataDialog(String id) async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Ticket Data"),
          content: SingleChildScrollView(
            child: loadData(users, id), // Display the extracted ID
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('OK'),
              onPressed: () => {
                Navigator.of(context).pop(),
                Navigator.of(context).pop(),
              },
            ),
          ],
          clipBehavior: Clip.antiAlias, // Optional: improve rendering quality
          insetPadding: const EdgeInsets.symmetric(
              horizontal: 20.0, vertical: 50.0), // Adjust inset padding
        );
      },
    );
  }
}
