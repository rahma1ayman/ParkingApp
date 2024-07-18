import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class QRCodeSender extends StatefulWidget {
  @override
  _QRCodeSenderState createState() => _QRCodeSenderState();
}

class _QRCodeSenderState extends State<QRCodeSender> {
  final String espUrl =
      'http://192.168.197.209'; // Replace with your ESP's IP address
  final TextEditingController _controller = TextEditingController();
  String _response = '';

  Future<void> sendQRData(String qrData) async {
    try {
      final response = await http.post(
        Uri.parse('$espUrl/qrdata'),
        body: {'qrdata': qrData},
      );

      setState(() {
        _response = response.statusCode == 200
            ? 'QR Code sent successfully'
            : 'Failed to send QR Code: ${response.statusCode}';
      });
    } catch (e) {
      setState(() {
        _response = 'Error: $e';
        print(_response);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Send QR Code to ESP32'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            TextField(
              controller: _controller,
              decoration: InputDecoration(
                labelText: 'Enter QR Code',
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                sendQRData(_controller.text);
              },
              child: Text('Send QR Code'),
            ),
            SizedBox(height: 20),
            Text(_response),
          ],
        ),
      ),
    );
  }
}
