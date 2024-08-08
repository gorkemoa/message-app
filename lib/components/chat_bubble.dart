import 'package:flutter/material.dart';
import 'package:message_app/services/chat/chat_services.dart';
import 'package:message_app/themes/theme_provider.dart';
import 'package:provider/provider.dart';

class ChatBubble extends StatelessWidget {
  final String message;
  final bool isCurrentUser;
  final String messageId;
  final String userId;

  const ChatBubble({
    super.key,
    required this.isCurrentUser,
    required this.message,
    required this.messageId,
    required this.userId,
  });

  void _showOptions(BuildContext context, String messageId, String userId) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return SafeArea(
          child: Consumer<ChatService>(
            builder: (context, chatService, child) {
              return Wrap(
                children: [
                  ListTile(
                    leading: const Icon(Icons.flag),
                    title: const Text('Şikayet Et'),
                    onTap: () {
                      Navigator.pop(context);
                      _reportMessage(context, messageId, userId, chatService);
                    },
                  ),
                  ListTile(
                    leading: const Icon(Icons.block),
                    title: const Text('Engelle'),
                    onTap: () {
                      Navigator.pop(context);
                      _blockUser(context, userId, chatService);
                    },
                  ),
                  ListTile(
                    leading: const Icon(Icons.cancel),
                    title: const Text('Kapat'),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                ],
              );
            },
          ),
        );
      },
    );
  }

  void _reportMessage(BuildContext context, String messageId, String userId, ChatService chatService) async {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Mesajı Şikayet Et"),
          content: const Text("Bu mesajı şikayet etmek istediğinizden emin misiniz?"),
          actions: <Widget>[
            TextButton(
              child: const Text("İptal"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text("Şikayet Et"),
              onPressed: () async {
                Navigator.of(context).pop();
                try {
                  await chatService.reportUser(messageId, userId);
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("Mesaj başarıyla şikayet edildi."))
                  );
                } catch (e) {
                  print('Şikayet Hatası: $e');
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("Mesajı şikayet ederken bir hata oluştu."))
                  );
                }
              },
            ),
          ],
        );
      },
    );
  }

  Future<void> _blockUser(BuildContext context, String userId, ChatService chatService) async {
    try {
      await chatService.blockUser(userId);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Kullanıcı başarıyla engellendi."))
      );
    } catch (e) {
      print('Engelleme Hatası: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Kullanıcıyı engellerken bir hata oluştu."))
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    bool isDarkMode =
        Provider.of<ThemeProvider>(context, listen: false).isDarkMode;

    return GestureDetector(
      onLongPress: () {
        if (!isCurrentUser) {
          _showOptions(context, messageId, userId);
        }
      },
      child: Container(
        decoration: BoxDecoration(
          color: isCurrentUser
              ? (isDarkMode ? Colors.green.shade600 : Colors.grey.shade500)
              : (isDarkMode ? Colors.grey.shade800 : Colors.grey.shade200),
          borderRadius: BorderRadius.circular(25),
        ),
        padding: const EdgeInsets.all(16),
        margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 25),
        child: Text(
          message,
          style: TextStyle(
              color: isCurrentUser
                  ? Colors.white
                  : (isDarkMode ? Colors.white : Colors.black)),
        ),
      ),
    );
  }
}
