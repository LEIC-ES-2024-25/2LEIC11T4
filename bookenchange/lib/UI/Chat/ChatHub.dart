import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'Chat.dart';

class ChatHub extends StatefulWidget {
  const ChatHub({super.key});

  @override
  State<ChatHub> createState() => _ChatHubState();
}

class _ChatHubState extends State<ChatHub> {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> _confirmDelete(BuildContext context, String chatId) async {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Delete Chat'),
        content: const Text('Are you sure you want to delete this chat?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () async {
              Navigator.pop(context);
              await _deleteChat(chatId);
            },
            child: const Text('Delete'),
          ),
        ],
      ),
    );
  }

  Future<void> _deleteChat(String chatId) async {
    try {
      final messagesCollection = FirebaseFirestore.instance
          .collection('chats')
          .doc(chatId)
          .collection('messages');

      final messagesSnapshot = await messagesCollection.get();
      for (var message in messagesSnapshot.docs) {
        await message.reference.delete();
      }
      await FirebaseFirestore.instance.collection('chats').doc(chatId).delete();
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Chat deleted successfully')),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error deleting chat: $e')),
      );
    }
  }


  @override
  Widget build(BuildContext context) {
    final currentUser = _auth.currentUser;

    if (currentUser == null) {
      return const Center(child: Text('No user logged in'));
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Chats'),
        backgroundColor: Color(0xff809bce),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection('chats')
            .where('participants', arrayContains: _auth.currentUser?.uid)
            .snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }

          if (snapshot.data!.docs.isEmpty) {
            return const Center(child: Text('No chats available'));
          }

          final chats = snapshot.data!.docs;

          return ListView.builder(
            itemCount: chats.length,
            itemBuilder: (context, index) {
              final chat = chats[index];
              final participants = chat['participants'] as List<dynamic>;
              final chatId = chat.id;

              final otherUserId = participants.firstWhere(
                (id) => id != _auth.currentUser?.uid,
                orElse: () => null,
              );

              if (otherUserId == null) {
                return const SizedBox.shrink();
              }

              return FutureBuilder<DocumentSnapshot>(
                future: FirebaseFirestore.instance.collection('users').doc(otherUserId).get(),
                builder: (context, userSnapshot) {
                  if (!userSnapshot.hasData) {
                    return const SizedBox.shrink();
                  }

                  final userData = userSnapshot.data!.data() as Map<String, dynamic>;
                  final firstName = userData['First_name'] ?? 'Unknown';
                  final lastName = userData['Last_name'] ?? 'User';
                  final profileImageUrl = userData['profileImageUrl'] ?? 'https://via.placeholder.com/150';

                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ChatPage(chatId: chat.id, participants: List<String>.from(participants)),
                        ),
                      );
                    },
                    child: Container(
                      margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                      padding: const EdgeInsets.all(12.0),
                      decoration: BoxDecoration(
                        color: const Color(0xff95b8d1),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Row(
                        children: [
                          CircleAvatar(
                            radius: 40,
                            backgroundImage: NetworkImage(profileImageUrl),
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: Text(
                              '$firstName $lastName',
                              style: const TextStyle(fontSize: 18),
                            ),
                          ),
                          IconButton(
                            icon: const Icon(Icons.delete, color: Color(0xffd6eadf)),
                            onPressed: () => _confirmDelete(context, chatId),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            },
          );
        },
      )
    );
  }
}