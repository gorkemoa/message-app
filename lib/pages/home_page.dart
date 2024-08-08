import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:message_app/components/my_drawer.dart';
import 'package:message_app/components/user_tile.dart';
import 'package:message_app/pages/chat_page.dart';
import 'package:message_app/pages/settings_page.dart';
import 'package:message_app/services/chat/chat_services.dart';
import 'package:message_app/services/auth/auth_service.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final ChatService _chatService = ChatService();
  final AuthService _authService = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.grey,
        title: const Text("Ana Sayfa"),
        elevation: 0,
        actions: [
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const SettingsPage()),
              );
            },
          ),
        ],
      ),
      drawer: const MyDrawer(),
      body: _buildUserList(),
    );
  }

  Widget _buildUserList() {
    return StreamBuilder<List<Map<String, dynamic>>>(
      stream: _chatService.getUsersStreamExcludingBlocked(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return const Center(child: Text("Error"));
        }
        if (!snapshot.hasData) {
          return const Center(child: CircularProgressIndicator());
        }

        List<Map<String, dynamic>> users = snapshot.data!;
        return ListView.builder(
          itemCount: users.length,
          itemBuilder: (context, index) {
            return StreamBuilder<QuerySnapshot>(
              stream: _chatService.getLastMessage(
                _authService.getCurrentUser()!.uid,
                users[index]['uid'],
              ),
              builder: (context, lastMessageSnapshot) {
                if (lastMessageSnapshot.hasError) {
                  return ListTile(
                    title: Text(users[index]['email'].split('@')[0]),
                    subtitle: const Text('Error loading message'),
                  );
                }
                if (!lastMessageSnapshot.hasData) {
                  return ListTile(
                    title: Text(users[index]['email'].split('@')[0]),
                    subtitle: const Text('Yükleniyor...'),
                  );
                }

                String lastMessageText = 'mesaj yazın';
                if (lastMessageSnapshot.data!.docs.isNotEmpty) {
                  var lastMessage = lastMessageSnapshot.data!.docs.first;
                  lastMessageText = lastMessage['message'] as String? ?? 'mesaj yazın';
                }

                return UserTile(
                  text: users[index]['email'].split('@')[0], // Sadece @'den önceki kısmı göster
                  subtitle: lastMessageText,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ChatPage(
                          receiverEmail: users[index]['email'],
                          receiverID: users[index]['uid'],
                        ),
                      ),
                    );
                  },
                );
              },
            );
          },
        );
      },
    );
  }
}
