import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:message_app/services/auth/auth.gate.dart';
import 'package:message_app/services/firebase_messaging_service.dart';
import 'package:message_app/themes/light_mode.dart';
import 'package:message_app/themes/theme_provider.dart';
import 'package:message_app/services/chat/chat_services.dart'; // ChatService import edilmelidir
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  FirebaseMessagingService.initialize(); // Firebase Messaging'i başlatın
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ThemeProvider()),
        ChangeNotifierProvider(create: (context) => ChatService()), // ChatService sağlayıcısını ekleyin
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Message App',
      theme: Provider.of<ThemeProvider>(context).themeData,
      home: AuthGate(),
    );
  }
}
