import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:bookenchange/UI/Chat.dart';


import '../../Database/Firebase.dart';
import '../../Domain/Models/Chat/chat.dart';
import '../Profile/profileView.dart';

class ContributionPage extends StatefulWidget {
  final String contributionId;

  const ContributionPage({super.key, required this.contributionId});

  @override
  State<ContributionPage> createState() => _ContributionPageState();
}

class _ContributionPageState extends State<ContributionPage> {
  late Future<Map<String, dynamic>> _contributionFuture;
  final PageController _pageController = PageController();
  int _currentImageIndex = 0;

  @override
  void initState() {
    super.initState();
    _contributionFuture = fetchContribution();
  }

  Future<Map<String, dynamic>> fetchContribution() async {
    final doc = await FirebaseFirestore.instance
        .collection('contributions')
        .doc(widget.contributionId)
        .get();

    if (!doc.exists) throw Exception('Contribution not found');

    final data = doc.data()!;
    if (data['iduser'] != null) {
      final userDoc = await FirebaseFirestore.instance
          .collection('users')
          .doc(data['iduser'])
          .get();

      if (userDoc.exists) {
        data['profileImageUrl'] = userDoc.data()?['profileImageUrl'];
        data['username'] = userDoc.data()?['username'];
      }
    }

    return data;
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

@override
Widget build(BuildContext context) {
  return Scaffold(
    backgroundColor: const Color(0xFFFDFDFD),
    appBar: AppBar(
      backgroundColor: const Color(0xFF819DD4),
      leading: IconButton(
        icon: const Icon(Icons.arrow_back, color: Colors.white),
        onPressed: () => Navigator.pop(context),
      ),
      actions: [],
      elevation: 0,
    ),
    body: FutureBuilder<Map<String, dynamic>>(
      future: _contributionFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else if (!snapshot.hasData) {
          return const Center(child: Text('No data found'));
        }

        final data = snapshot.data!;
        return _buildContributionContent(data, Firebase.instance.auth.userid ?? '');
      },
    ),
  );
}

void _confirmDelete(BuildContext context, String? contributionId) {
  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: const Text('Delete Contribution'),
      content: const Text('Are you sure you want to delete this contribution?'),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('Cancel'),
        ),
        TextButton(
          onPressed: () async {
            Navigator.pop(context);
            await _deleteContribution(contributionId);
          },
          child: const Text('Delete'),
        ),
      ],
    ),
  );
}

Future<void> _deleteContribution(String? contributionId) async {
  if (contributionId == null) return;

  try {
    await FirebaseFirestore.instance
        .collection('contributions')
        .doc(contributionId)
        .delete();

    if (context.mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Contribution deleted successfully')),
      );
      Navigator.pop(context); // Go back to the previous page
    }
  } catch (e) {
    if (context.mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error deleting contribution: $e')),
      );
    }
  }
}

  Widget _buildContributionContent(Map<String, dynamic> data, String currentUserId) {
    final images = (data['images'] as List<dynamic>?)?.cast<String>() ?? [];
    final username = data['username'] ?? 'Unknown User';
    final title = data['name'] ?? 'No Title';
    final description = data['description'] ?? 'No Description';
    final isbn = data['isbn'] ?? 'Unknown';
    final condition = data['condition'] ?? 'Unknown';
    final profileImageUrl = data['profileImageUrl'] ??
        'https://via.placeholder.com/150';

    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          _buildImageCarousel(images),
          const SizedBox(height: 16),
          _buildProfileSection(
            username,
            profileImageUrl,
            data['iduser'] ?? '',
            currentUserId,
            data['id'],
          ),

          const SizedBox(height: 16),
          _buildBookInfoCard(title, condition, isbn, description),
        ],
      ),
    );
  }

  Widget _buildImageCarousel(List<String> images) {
    if (images.isEmpty) {
      return const Center(child: Text('No images available'));
    }

    return Column(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: SizedBox(
            height: 250,
            child: PageView.builder(
              controller: _pageController,
              onPageChanged: (index) {
                setState(() {
                  _currentImageIndex = index;
                });
              },
              itemCount: images.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => FullScreenImageViewer(imageUrl: images[index]),
                      ),
                    );
                  },
                  child: Image.network(
                    images[index],
                    fit: BoxFit.cover,
                    width: double.infinity,
                  ),
                );
              },
            ),
          ),
        ),
        const SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(images.length, (index) {
            return AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              margin: const EdgeInsets.symmetric(horizontal: 4),
              width: _currentImageIndex == index ? 12 : 8,
              height: _currentImageIndex == index ? 12 : 8,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: _currentImageIndex == index
                    ? const Color(0xFF819DD4)
                    : Colors.black26,
              ),
            );
          }),
        ),
      ],
    );
  }
  Widget _buildProfileSection(String username, String profileImageUrl, String userId, String currentUserId, String contributionId) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProfileView(userId: userId),
          ),
        );
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
          color: const Color(0xFF819DD4),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          children: [
            CircleAvatar(
              radius: 20,
              backgroundColor: Colors.white,
              backgroundImage: NetworkImage(profileImageUrl),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                username,
                style: const TextStyle(color: Colors.white, fontSize: 16),
              ),
            ),
            if (currentUserId == userId)
              IconButton(
                icon: const Icon(Icons.delete, color: Color(0xffd6eadf)),
                onPressed: () => _confirmDelete(context, contributionId),
              )
            else
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  foregroundColor: const Color(0xFF819DD4),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                onPressed: () async {
                  // existing ASK button logic...
                },
                child: const Text('ASK'),
              ),
          ],
        )
      ),
    );
  }

  Widget _buildBookInfoCard(
      String title, String condition, String isbn, String description) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFFE6EAF4),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InfoRow(label: 'Title', value: title),
          InfoRow(label: 'Condition', value: condition),
          InfoRow(label: 'ISBN', value: isbn),
          const SizedBox(height: 12),
          const Text(
            'Description:',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          const SizedBox(height: 6),
          Text(description),
        ],
      ),
    );
  }
}

class InfoRow extends StatelessWidget {
  final String label;
  final String value;

  const InfoRow({super.key, required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        children: [
          Text('$label: ',
              style: const TextStyle(
                  fontWeight: FontWeight.bold, color: Colors.black)),
          Expanded(
            child: Text(value, style: const TextStyle(color: Colors.black)),
          ),
        ],
      ),
    );
  }
}

class FullScreenImageViewer extends StatelessWidget {
  final String imageUrl;

  const FullScreenImageViewer({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: GestureDetector(
        onTap: () => Navigator.pop(context),
        child: Center(
          child: Image.network(
            imageUrl,
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }
}