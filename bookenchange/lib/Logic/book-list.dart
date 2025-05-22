import 'package:flutter/material.dart';

class BookListPage extends StatefulWidget {
  const BookListPage({Key? key}) : super(key: key);

  @override
  State<BookListPage> createState() => _BookListPageState();
}

class _BookListPageState extends State<BookListPage> {
  int _selectedIndex = 0;

  // Dummy list of books to show in the grid
  final List<Map<String, String>> books = [
    {
      'title': 'Software Engineering',
      'subtitle': 'Introduction to Algorithms\nMuito bom\nFEUP',
      'imageUrl':
      'https://via.placeholder.com/300x400.png?text=Software+Engineering'
    },
    {
      'title': 'Software Engineering',
      'subtitle': 'Introduction to Algorithms\nMuito bom\nFEUP',
      'imageUrl':
      'https://via.placeholder.com/300x400.png?text=Software+Engineering'
    },
    {
      'title': 'Software Engineering',
      'subtitle': 'Introduction to Algorithms\nMuito bom\nFEUP',
      'imageUrl':
      'https://via.placeholder.com/300x400.png?text=Software+Engineering'
    },
    {
      'title': 'Software Engineering',
      'subtitle': 'Introduction to Algorithms\nMuito bom\nFEUP',
      'imageUrl':
      'https://via.placeholder.com/300x400.png?text=Software+Engineering'
    },
    {
      'title': 'Software Engineering',
      'subtitle': 'Introduction to Algorithms\nMuito bom\nFEUP',
      'imageUrl':
      'https://via.placeholder.com/300x400.png?text=Software+Engineering'
    },
    {
      'title': 'Software Engineering',
      'subtitle': 'Introduction to Algorithms\nMuito bom\nFEUP',
      'imageUrl':
      'https://via.placeholder.com/300x400.png?text=Software+Engineering'
    },
  ];

  final List<Widget> widgetOptions = const [
    Text('Chat'),
    Text('Settings'),
    Text('New Contribution')
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  // Build a single book card
  Widget _buildBookCard(Map<String, String> bookData) {
    return Card(
      elevation: 2,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Book image
          Expanded(
            child: Image.network(
              bookData['imageUrl'] ?? '',
              fit: BoxFit.cover,
              width: double.infinity,
            ),
          ),
          // Title
          Padding(
            padding: const EdgeInsets.only(left: 8, top: 8, right: 8),
            child: Text(
              bookData['title'] ?? '',
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          // Subtitle
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              bookData['subtitle'] ?? '',
              style: const TextStyle(fontSize: 14),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // If you want to show the other pages from widgetOptions,
    // you could do so conditionally. For now, we will always show the
    // book list. Adjust as you need for your actual navigation.
    final currentWidget = (_selectedIndex == 0)
        ? _buildBookGrid()
        : widgetOptions[_selectedIndex];

    return Scaffold(
      body: currentWidget,
    );
  }

  Widget _buildBookGrid() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GridView.builder(
        itemCount: books.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,    // 2 columns
          mainAxisSpacing: 8,   // vertical spacing
          crossAxisSpacing: 8,  // horizontal spacing
          childAspectRatio: 0.6, // adjust to taste
        ),
        itemBuilder: (context, index) {
          return _buildBookCard(books[index]);
        },
      ),
    );
  }
}

