import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:message_app/services/chat/chat_services.dart';

class BlockedUsersPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final currentUserID = FirebaseAuth.instance.currentUser!.uid;
    final ChatService chatService = ChatService();

    return Scaffold(
      appBar: AppBar(
        title: Text('Engellenmiş Kullanıcılar'),
      ),
      body: StreamBuilder<List<Map<String, dynamic>>>(
        stream: chatService.getBlockedUsersStream(currentUserID),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }

          final blockedUsers = snapshot.data ?? [];
          return ListView.builder(
            itemCount: blockedUsers.length,
            itemBuilder: (context, index) {
              final user = blockedUsers[index];
              final userName = user['name'] ?? 'Bilinmiyor';
              final userEmail = user['email'] ?? 'Bilinmiyor';

              return ListTile(
                title: Text(userName),
                subtitle: Text(userEmail),
                trailing: IconButton(
                  icon: Icon(Icons.block),
                  onPressed: () async {
                    await chatService.unblockUser(user['uid']);
                  },
                ),
              );
            },
          );
        },
      ),
    );
  }
}
