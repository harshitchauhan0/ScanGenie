import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scangenie/features/generate/providers/qr_provider.dart';
import 'package:scangenie/features/generate/screens/widgets/generate_body_content.dart';
import 'package:scangenie/utils/constants/colors.dart';

class GenerateQRCode extends StatefulWidget {
  final String itemText;

  const GenerateQRCode({super.key, required this.itemText});

  @override
  State<GenerateQRCode> createState() =>
      _GenerateQRCodeState(itemText: itemText);
}

class _GenerateQRCodeState extends State<GenerateQRCode> {
  final String itemText;

  _GenerateQRCodeState({required this.itemText});

  @override
  Widget build(BuildContext context) {
    QRState qrState = Provider.of<QRState>(context);

    return Scaffold(
      backgroundColor: const Color(0xffe7ebee),
      appBar: AppBar(
        title: Text(itemText,
            style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontFamily: 'Poppins',
                color: AppColors.primary)),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: BodyContent(itemText: itemText, qrState: qrState),
    );
  }
}
