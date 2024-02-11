import 'package:dart_firebase_admin/auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:projectuas/firebase_options.dart';
import 'package:dart_firebase_admin/dart_firebase_admin.dart';
import 'package:projectuas/service_data.dart';
import 'package:projectuas/View/login.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  //maap kalo ga bisa liat ServiceData, ini file rahasia, isinya private key, email, dll
  ServiceData.admin = FirebaseAdminApp.initializeApp(ServiceData.projectId, Credential.fromServiceAccountParams(clientId: ServiceData.clientId, privateKey: ServiceData.privateKey, email: ServiceData.email));
  ServiceData.auth = Auth(ServiceData.admin!);
  runApp(const MyApp());
  //ServiceData.admin!.close();
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.blue[900],
      ),
      home: const LoginPage(),
    );
  }
}
