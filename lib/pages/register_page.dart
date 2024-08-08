import 'package:flutter/material.dart';
import 'package:message_app/components/my_button.dart';
import 'package:message_app/components/my_textfield.dart';
import 'package:message_app/services/auth/auth_service.dart';

class RegisterPage extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _pwController = TextEditingController();
  final TextEditingController _confirmController = TextEditingController();
  final void Function()? onTap;

  RegisterPage({super.key, required this.onTap});

  Future<void> register(BuildContext context) async {
    final _auth = AuthService();

    if (_pwController.text == _confirmController.text) {
      try {
        await _auth.signUpWithEmailPassword(
          _emailController.text,
          _pwController.text,
        );

        await _auth.signInWithEmailPassword(
          _emailController.text,
          _pwController.text,
        );

        if (context.mounted) {
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: Row(
                children: [
                  Icon(
                    Icons.check_circle_outline,
                    color: Colors.green,
                    size: 24,
                  ),
                  const SizedBox(width: 8),
                  const Text("Başarıyla Kayıt Oldunuz"),
                ],
              ),
              content: const Text(
                "Hesabınız başarıyla oluşturuldu ve otomatik olarak giriş yapıldı.",
                style: TextStyle(
                  color: Colors.black87,
                ),
              ),
              actions: [
                TextButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: const Text(
                    "Tamam",
                    style: TextStyle(color: Colors.blue),
                  ),
                ),
              ],
            ),
          );
        }
      } catch (e) {
        if (context.mounted) {
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: Row(
                children: [
                  Icon(
                    Icons.error_outline,
                    color: Colors.red,
                    size: 24,
                  ),
                  const SizedBox(width: 8),
                  const Text("Kayıt Başarısız"),
                ],
              ),
              content: Text(
                e.toString(),
                style: const TextStyle(
                  color: Colors.redAccent,
                ),
              ),
              actions: [
                TextButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: const Text(
                    "Tamam",
                    style: TextStyle(color: Colors.blue),
                  ),
                ),
              ],
            ),
          );
        }
      }
    } else {
      if (context.mounted) {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Row(
              children: [
                Icon(
                  Icons.error_outline,
                  color: Colors.red,
                  size: 24,
                ),
                const SizedBox(width: 8),
                const Text("Şifreler Uyuşmuyor"),
              ],
            ),
            content: const Text(
              "Girilen şifreler birbiriyle uyuşmuyor. Lütfen tekrar deneyin.",
              style: TextStyle(
                color: Colors.redAccent,
              ),
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: const Text(
                  "Tamam",
                  style: TextStyle(color: Colors.blue),
                ),
              ),
            ],
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 50),
                const Icon(Icons.lock, size: 100),
                const SizedBox(height: 50),
                Text(
                  "Hesap Oluştur",
                  style: TextStyle(color: Colors.grey.shade700, fontSize: 24),
                ),
                const SizedBox(height: 25),
                MyTextField(
                  controller: _emailController,
                  hintText: "Email",
                  obscureText: false,
                  focusNode: FocusNode(),
                ),
                const SizedBox(height: 10),
                MyTextField(
                  controller: _pwController,
                  hintText: "Şifre",
                  obscureText: true,
                  focusNode: FocusNode(),
                ),
                const SizedBox(height: 10),
                MyTextField(
                  controller: _confirmController,
                  hintText: "Şifre Tekrarı",
                  obscureText: true,
                  focusNode: FocusNode(),
                ),
                const SizedBox(height: 25),
                MyButton(
                  onTap: () => register(context),
                  text: "Kayıt Ol",
                ),
                const SizedBox(height: 50),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Zaten bir hesabınız var mı?",
                      style: TextStyle(color: Colors.grey.shade700),
                    ),
                    const SizedBox(width: 4),
                    GestureDetector(
                      onTap: onTap,
                      child: const Text(
                        "Giriş Yapın!",
                        style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
