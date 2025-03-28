import 'package:bookenchange/generated/l10n.dart';
import 'package:flutter/material.dart';

class Newcontribution extends StatelessWidget {
  const Newcontribution({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context); // Fetch the theme

    return Scaffold(
      appBar: AppBar(
        title: Text(
          S.of(context).settings,
          style: theme.textTheme.displaySmall, // Using theme text styles
        ),
        backgroundColor: Theme.of(context).colorScheme.primary,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Theme.of(context).colorScheme.onPrimary,
          ),
          onPressed: () {
            Navigator.pop(context, '/'); // Goes back to HomePage
          },
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          // Profile Section
          Container(
            height: 180,
            decoration: BoxDecoration(
              color: theme.colorScheme.secondary,
              borderRadius: const BorderRadius.vertical(
                bottom: Radius.circular(30),
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Stack(
                  alignment: Alignment.center,
                  children: [
                    CircleAvatar(
                      radius: 50,
                      backgroundColor: Colors.transparent,
                      child: Icon(
                        Icons.person,
                        size: 50,
                        color: theme.colorScheme.primary,
                      ),
                    ),
                    Positioned(
                      bottom: 5,
                      right: 5,
                      child: CircleAvatar(
                        radius: 14,
                        backgroundColor: theme.colorScheme.surface,
                        child: Icon(
                          Icons.edit,
                          size: 16,
                          color: theme.colorScheme.primary,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),

          // Settings Options
          _buildSettingsOption(
            Icons.chat_bubble_outline,
            "Previous contributions",
            context,
          ),
          _buildSettingsOption(Icons.lock_outline, "Change Password", context),
          _buildSettingsOption(Icons.help_outline, "Help", context),
          _buildSettingsOption(Icons.logout, "Log out", context),
        ],
      ),
    );
  }

  Widget _buildSettingsOption(
    IconData icon,
    String title,
    BuildContext context,
  ) {
    final theme = Theme.of(context); // Fetch the theme

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      child: Container(
        decoration: BoxDecoration(
          color: theme.colorScheme.surface,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: theme.shadowColor.withOpacity(0.2),
              spreadRadius: 1,
              blurRadius: 5,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: ListTile(
          leading: Icon(icon, color: theme.colorScheme.primary),
          title: Text(title, style: theme.textTheme.bodyMedium),
          trailing: Icon(
            Icons.arrow_forward_ios,
            size: 16,
            color: theme.colorScheme.primary,
          ),
          onTap: () {},
        ),
      ),
    );
  }
}
