import 'package:flutter/material.dart';
import 'package:message_app/components/my_button.dart';
import 'package:message_app/components/my_textfield.dart';
import 'package:message_app/services/auth/auth_service.dart';

class LoginPage extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _pwController = TextEditingController();
  final void Function()? onTap;

  LoginPage({super.key, required this.onTap});

  void login(BuildContext context) async {
    try {
      await AuthService().signInWithEmailPassword(
          _emailController.text, _pwController.text);
    } catch (e) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text(e.toString()),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // LOGO
            Icon(
              Icons.messenger,
              size: 60,
              color: Theme.of(context).colorScheme.primary,
            ),
            const SizedBox(height: 25),
            // HOŞGELDİNİZ MESAJI
            Text(
              "Hoşgeldiniz!, Seni Özledik...",
              style: TextStyle(
                color: Theme.of(context).colorScheme.primary,
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 25),
            // MAİL YAZMA KUTUSU
            MyTextField(
              hintText: "    ePosta Adresi",
              obscureText: false,
              controller: _emailController,
              focusNode: FocusNode(), // focusNode ekleniyor
            ),
            const SizedBox(height: 10),
            // Şifre
            MyTextField(
              hintText: "   Şifre",
              obscureText: true,
              controller: _pwController,
              focusNode: FocusNode(), // focusNode ekleniyor
            ),
            // Giriş Butonu
            const SizedBox(height: 20),
            MyButton(
              text: "Giriş Yap",
              onTap: () => login(context),
            ),
            // kayıt olma buton
            const SizedBox(height: 25),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Üyemiz değil misin? Seni şuraya alalım",
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
                Icon(
                  Icons.turn_right,
                  color: Colors.blue,
                ),
                const SizedBox(width: 8),
                GestureDetector(
                  onTap: onTap,
                  child: Text(
                    "Kayıt Ol",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.blue,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
