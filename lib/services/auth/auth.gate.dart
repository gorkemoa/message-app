import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:message_app/pages/home_page.dart';
import 'package:message_app/services/auth/login_or_register.dart';

class AuthGate extends StatelessWidget {
  // AuthGate sınıfı, kullanıcı oturum durumuna göre ekranı gösterir.
  const AuthGate({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Scaffold, uygulamanın temel yapısını sağlar.
      body: StreamBuilder<User?>(
        // StreamBuilder, bir akış (stream) üzerinde widget'lar oluşturmanıza olanak tanır.
        stream: FirebaseAuth.instance.authStateChanges(),
        // FirebaseAuth'dan kullanıcı oturum durumunu dinleyen bir akış sağlanır.
        builder: (context, snapshot) {
          // snapshot, akıştan gelen veriyi içerir ve kullanıcı oturum durumunu gösterir.
         
          if (snapshot.hasData) {
            // Eğer snapshot veri içeriyorsa, kullanıcı giriş yapmış demektir.
            return HomePage(); // Kullanıcı giriş yapmışsa gösterilecek ana sayfa.
          } else {
            // Eğer snapshot veri içermiyorsa, kullanıcı giriş yapmamış demektir.
            return const LoginOrRegister(); // Kullanıcı giriş yapmamışsa gösterilecek giriş sayfası.
          }
        },
      ),
    );
  }
}
