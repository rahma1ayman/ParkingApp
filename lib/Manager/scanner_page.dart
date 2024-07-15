import 'package:barcode_scan2/barcode_scan2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ScannerView extends StatefulWidget {
  ScannerView({super.key, required this.updateParent});
  void Function() updateParent;
  @override
  State<ScannerView> createState() => _ScannerViewState();
}

class _ScannerViewState extends State<ScannerView> {
  String result = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Scanner"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(result), // Display the scanned result (optional)
            ElevatedButton(
              onPressed: _scanBarcode, // Allow manual scanning if needed
              child: const Text("Scan QR Code"),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _scanBarcode() async {
    try {
      ScanResult qr = await BarcodeScanner.scan();
      setState(() {
        result = qr.rawContent;
      });

      // Extract ID from scanned content (replace with your logic)
      String id = extractIdFromScannedContent(result);

      // Display or handle data based on the extracted ID (replace with your logic)
      if (id.isNotEmpty) {
        // Show data based on the extracted ID (e.g., using a dialog or another view)
        _showDataDialog(id);
      } else {
        // Handle case where no ID is found
        setState(() {
          result = "No ID found in QR Code";
        });
      }
    } on PlatformException catch (e) {
      if (e.code == BarcodeScanner.cameraAccessDenied) {
        setState(() {
          result = "Grant Camera Permission";
        });
      } else {
        setState(() {
          result = "Unknown Error $e";
        });
      }
    } on FormatException {
      setState(() {
        result = "No QR Code Scanned";
      });
    } catch (e) {
      setState(() {
        result = "Unknown Error $e";
      });
    }
  }

  // Replace this with your logic to extract the ID from the scanned content
  String extractIdFromScannedContent(String scannedContent) {
    // Your logic to parse the scanned content and extract the ID
    // This is a placeholder, replace with your actual implementation
    if (scannedContent.startsWith("ID:")) {
      return scannedContent
          .substring(3)
          .trim(); // Assuming ID starts with "ID:"
    } else {
      return "";
    }
  }

  Future<void> _showDataDialog(String id) async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Scanned Data"),
          content: SingleChildScrollView(
            child: Text("ID: $id"), // Display the extracted ID
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('OK'),
              onPressed: () => Navigator.of(context).pop(),
            ),
          ],
        );
      },
    );
  }
}
