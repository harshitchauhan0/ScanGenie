import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'package:scangenie/scangenie.dart';

void main() async {
  try {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp(
      options: const FirebaseOptions(
          apiKey: "AIzaSyD0pDsddIzU4-4jQPeB_zsBRaMpyFRY_CQ",
          authDomain: "scangenie-85651.firebaseapp.com",
          projectId: "scangenie-85651",
          storageBucket: "scangenie-85651.appspot.com",
          messagingSenderId: "1043608474940",
          appId: "1:1043608474940:web:fb6c8ba028722570b03a39",
          measurementId: "G-W4F8RZ8496"),
    );
    // await FirebaseApi().initNotifications();
    // await ScannedQRDatabaseProvider.instance.initialize();

    runApp(const Scangenie());
  } catch (e) {
    print('Error initializing app: $e');
  }
}