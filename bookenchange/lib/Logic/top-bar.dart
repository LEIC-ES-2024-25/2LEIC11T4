import 'package:flutter/material.dart';

class TopBar extends StatelessWidget implements PreferredSizeWidget {
  const TopBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // You can pull these colors from your theme or define them directly.
    // For demonstration, let's pick some example colors.
    final Color backgroundColor = const Color(0xFF728FB6); // The bluish bar color
    final Color pillColor = const Color(0xFFC9F4DF);       // The greenish pill color
    final Color iconColor = Colors.black54;

    return SafeArea(
      // Using a SafeArea ensures the content is not obstructed by the status bar.
      child: Container(
        color: backgroundColor,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        // The entire top area is a Container with a colored background.
        child: Row(
          children: [
            // The pill-shaped container that holds the hamburger icon, text, and search icon.
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: pillColor,
                  borderRadius: BorderRadius.circular(25),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                child: Row(
                  children: [
                    // Hamburger menu icon
                    Icon(Icons.menu, color: iconColor),
                    const SizedBox(width: 12),
                    // Placeholder text
                    Expanded(
                      child: Text(
                        'Hinted search text',
                        style: TextStyle(color: iconColor),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    const SizedBox(width: 12),
                    // Search icon
                    Icon(Icons.search, color: iconColor),
                  ],
                ),
              ),
            ),
            const SizedBox(width: 16),
            // Circular user icon on the right
            InkWell(
              onTap: () {
                // Handle user icon press here
              },
              child: Container(
                width: 40,
                height: 40,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                ),
                child: Icon(Icons.person, color: iconColor),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Because we're implementing PreferredSizeWidget, we must define preferredSize.
  // kToolbarHeight is the standard AppBar height; adjust if you need more/less height.
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight + 8);
}
