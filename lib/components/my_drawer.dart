import 'package:flutter/material.dart';
import 'package:message_app/pages/settings_page.dart';
import 'package:message_app/services/auth/auth_service.dart';
import 'package:message_app/pages/news_page.dart';


class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

   Future<void> logout() async {
    final _auth = AuthService();
    await _auth.signOut(); // Asenkron işlem olması ihtimaline karşı 'await' eklenmiştir
  }


  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.background,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              DrawerHeader(
                child: Center(
                  child: Icon(
                    Icons.message,
                    color: Theme.of(context).colorScheme.primary,
                    size: 40,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 25.0),
                child: ListTile(
                  title:const  Text("H O M E"),
                  leading:const  Icon(Icons.home),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
              ),
                Padding(
                padding: const EdgeInsets.only(left: 25.0),
                child: ListTile(
                  title: const Text("N E W S"),
                  leading:const  Icon(Icons.newspaper),
                  onTap: () {
                    Navigator.pop(context);  // Çekmeceyi kapat
                    Navigator.push(          // Yeni sayfaya git
                      context,
                      MaterialPageRoute(builder: (context) =>  NewsPage()),
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 25.0),
                child: ListTile(
                  title: const Text("S E T T I N G S"),
                  leading:const  Icon(Icons.settings),
                  onTap: () {
                    Navigator.pop(context);  // Çekmeceyi kapat
                    Navigator.push(          // Yeni sayfaya git
                      context,
                      MaterialPageRoute(builder: (context) => const SettingsPage()),
                    );
                  },
                ),
              ),
         
              Padding(
                padding: const EdgeInsets.only(left: 25.0, bottom: 25),
                child: ListTile(
                  title: const Text("L O G O U T",),
                  leading: const Icon(Icons.logout),
                  
                  onTap: () {
                    // Çıkış işlemi buraya eklenebilir
                    logout();
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
