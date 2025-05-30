import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'Profile/profileView.dart';

class ChatPage extends StatefulWidget {
  final String chatId; // Unique ID for the chat
  final List<String> participants;
  const ChatPage({super.key, required this.chatId, required this.participants});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final TextEditingController _messageController = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  void _sendMessage() async {
    if (_messageController.text.trim().isEmpty) return;

    final user = _auth.currentUser;
    if (user == null) return;

    await FirebaseFirestore.instance
        .collection('chats')
        .doc(widget.chatId)
        .collection('messages')
        .add({
      'text': _messageController.text.trim(),
      'senderId': user.uid,
      'timestamp': FieldValue.serverTimestamp(),
    });

    _messageController.clear();
  }

  @override
  Widget build(BuildContext context) {
    final currentUserId = _auth.currentUser?.uid;
    final otherUserId = widget.participants.firstWhere((id) => id != currentUserId, orElse: () => '');
    final isKeyboardOpen = MediaQuery.of(context).viewInsets.bottom != 0;

    return SafeArea(child:Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: const Color(0xff809bce),
          title: FutureBuilder<DocumentSnapshot>(
            future: FirebaseFirestore.instance.collection('users').doc(otherUserId).get(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator(color: Colors.white));
              } else if (snapshot.hasError || !snapshot.hasData || !snapshot.data!.exists) {
                return const Text('User not found', style: TextStyle(color: Colors.white));
              }

              final userData = snapshot.data!.data() as Map<String, dynamic>;
              final username = userData['username'] ?? 'Unknown User';
              final firstName = userData['First_name'] ?? 'Unknown';
              final lastName = userData['Last_name'] ?? 'User';
              final profileImageUrl = userData['profileImageUrl'] ?? 'https://via.placeholder.com/150';

              return Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back, color: Colors.white),
                    onPressed: () => Navigator.pop(context),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ProfileView(userId: otherUserId),
                        ),
                      );
                    },
                    child: Row(
                      children: [
                        CircleAvatar(backgroundImage: NetworkImage(profileImageUrl)),
                        const SizedBox(width: 8),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("$username", style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500)),
                            Text("$firstName $lastName", style: const TextStyle(color: Colors.black, fontSize: 12)),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: StreamBuilder<QuerySnapshot>(
              stream: FirebaseFirestore.instance
                  .collection('chats')
                  .doc(widget.chatId)
                  .collection('messages')
                  .orderBy('timestamp', descending: true)
                  .snapshots(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return const Center(child: CircularProgressIndicator());
                }

                final messages = snapshot.data!.docs;

                return ListView.builder(
                  reverse: true,
                  itemCount: messages.length,
                  itemBuilder: (context, index) {
                    final message = messages[index];
                    final isMe = message['senderId'] == _auth.currentUser?.uid;

                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 6.0, horizontal: 10),
                      child: Row(
                        mainAxisAlignment: isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
                        children: [
                          if (!isMe) ...[
                            const CircleAvatar(
                              radius: 15,
                              backgroundColor: Color(0xff809bce),
                              child: Icon(Icons.person, size: 16, color: Colors.white),
                            ),
                            const SizedBox(width: 5),
                          ],
                          Flexible(
                            child: Container(
                              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
                              decoration: BoxDecoration(
                                color: isMe ? const Color(0xff809bce) : const Color(0xffd9ede4),
                                borderRadius: BorderRadius.circular(16),
                              ),
                              child: Text(
                                message['text'],
                                style: TextStyle(color: isMe ? Colors.white : Colors.black),
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 28),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 14 ),
                    decoration: BoxDecoration(
                      color: const Color(0xff809bce),
                      borderRadius: BorderRadius.circular(16),
                    ),

                    child: TextField(
                      controller: _messageController,
                      style: const TextStyle(color: Colors.white),
                      decoration: const InputDecoration(
                        hintText: "Enviar mensagem....",
                        hintStyle: TextStyle(color: Colors.white70),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                Container(
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color(0xff809bce),
                  ),
                  child: IconButton(
                    icon: const Icon(Icons.send, color: Colors.white),
                    onPressed: _sendMessage,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ),
    );
  }
}
