import 'package:cloud_firestore/cloud_firestore.dart';

class Message {
  final String senderID;
  final String senderEmail;
  final String receiverID;
  final String message;
  final Timestamp timestamp;

  Message({
    required this.senderID,
    required this.senderEmail,
    required this.receiverID,
    required this.message,
    required this.timestamp,
  });

  // Message nesnesini Map'e dönüştürmek için kullanılır
  Map<String, dynamic> toMap() {
    return {
      'senderID': senderID,
      'senderEmail': senderEmail,
      'receiverID': receiverID,
      'message': message,
      'timestamp': timestamp,
    };
  }

  // Map'ten Message nesnesi oluşturmak için kullanılır
  factory Message.fromMap(Map<String, dynamic> map) {
    return Message(
      senderID: map['senderID'] as String? ?? '',
      senderEmail: map['senderEmail'] as String? ?? '',
      receiverID: map['receiverID'] as String? ?? '',
      message: map['message'] as String? ?? '',
      timestamp: map['timestamp'] as Timestamp? ?? Timestamp.now(),
    );
  }
}
