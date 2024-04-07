// Automatic FlutterFlow imports
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

// Set your widget name, define your parameter, and then add the
// boilerplate code using the green button on the right!
import 'package:qr_flutter/qr_flutter.dart';
import 'package:flutter/services.dart';

import 'pago_q_r_model.dart';

class PagoQRWidget extends StatefulWidget {
  const PagoQRWidget({Key? key}) : super(key: key);

  @override
  State<PagoQRWidget> createState() => _PagoQRWidgetState();
}

class _PagoQRWidgetState extends State<PagoQRWidget> {
  late PagoQRModel _model;

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = PagoQRModel();
    _model.init();
  }

  @override
  void dispose() {
    _model.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Color(0xFFF1F4F8),
      appBar: AppBar(
        backgroundColor: Color(0xFF19DB8A),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_rounded, color: Color(0xFF14181B)),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(
          'Payment QR Code',
          style: TextStyle(
            color: Color(0xFF14181B),
            fontSize: 22,
            fontWeight: FontWeight.w500,
          ),
        ),
        centerTitle: false,
        elevation: 4,
      ),
      body: SafeArea(
        top: true,
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(24, 24, 24, 0),
                child: Text(
                  'Your Personal QR Code',
                  style: TextStyle(
                    color: Color(0xFF14181B),
                    fontSize: 24,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(24, 8, 24, 24),
                child: Text(
                  'Enter the amount you want to request and a personalized QR code will be generated for you.',
                  style: TextStyle(
                    color: Color(0xFF57636C),
                    fontSize: 16,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              Padding(
                padding: EdgeInsets.all(16),
                child: TextFormField(
                  controller: _model.textController,
                  decoration: InputDecoration(
                    labelText: 'Amount',
                    hintText: 'Enter amount...',
                  ),
                  keyboardType: TextInputType.number,
                ),
              ),
              Padding(
                padding: EdgeInsets.all(16),
                child: Container(
                  width: double.infinity,
                  height: 300,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Center(
                    child: QrImage(
                      data: _model.textController.text,
                      size: 200,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(16),
                child: ElevatedButton(
                  onPressed: () async {
                    // Simulated payment processing
                    final amount = double.tryParse(_model.textController.text);
                    if (amount != null) {
                      final paymentStatus = await _model.processPayment(amount);
                      if (paymentStatus) {
                        scaffoldKey.currentState!.showSnackBar(
                          SnackBar(
                            content: Text(
                                'Payment request for \$${amount.toStringAsFixed(2)} sent.'),
                          ),
                        );
                      } else {
                        scaffoldKey.currentState!.showSnackBar(
                          SnackBar(
                            content: Text('Failed to process payment.'),
                          ),
                        );
                      }
                    } else {
                      scaffoldKey.currentState!.showSnackBar(
                        SnackBar(
                          content: Text('Invalid amount.'),
                        ),
                      );
                    }
                  },
                  child: Text('Generate QR Code'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
