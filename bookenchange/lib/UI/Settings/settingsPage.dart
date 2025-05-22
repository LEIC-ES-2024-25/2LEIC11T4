import 'package:bookenchange/Database/Firebase.dart';
import 'package:bookenchange/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:bookenchange/Logic/Navigation/navigation.dart';
import 'package:bookenchange/Logic/Navigation/transitions.dart';



class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            S.of(context).settings,
            style: Theme.of(context).textTheme.titleMedium,
          ),
          backgroundColor: Theme.of(context).colorScheme.primary,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Theme.of(context).colorScheme.onPrimary,
            ),
            onPressed: () {
              Navigator.pop(context); // Goes back to HomePage
            },
          ),
          centerTitle: true,
        ),
        body: Stack(
          children: [
            // Background split
            Column(
              children: [
                Container(height: 160, color: Colors.white),
                Expanded(
                  child: Container(
                    color: const Color(0xFFB0D9E8), // slightly darker soft blue
                  ),
                ),
              ],
            ),

            // Foreground content
            Column(
              children: [
                const SizedBox(height: 20),

                // Avatar
                Center(
                  child: Container(
                    margin: const EdgeInsets.only(top: 10),
                    height: 120,
                    width: 120,
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        CircleAvatar(
                          radius: 50,
                          backgroundColor:
                              Theme.of(context).colorScheme.secondary,
                          child: Icon(
                            Icons.person,
                            size: 50,
                            color: Theme.of(context).colorScheme.primary,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                const SizedBox(height: 30),

                // Settings Options
                _buildSettingsOption(
                  Icons.chat_bubble_outline,
                  "Previous Contributions",
                  context,
                ),
                _buildSettingsOption(
                  Icons.lock_outline,
                  "Change Password",
                  context,
                ),
                _buildSettingsOption(Icons.logout, "Log Out", context),
                _buildSettingsOption(
                  Icons.delete_forever_outlined,
                  "Delete Account",
                  context,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSettingsOption(
    IconData icon,
    String title,
    BuildContext context,
  ) {
    final theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      child: Container(
        decoration: BoxDecoration(
          color: theme.colorScheme.surface.withOpacity(
            0.9,
          ), // Slight transparency
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: Colors.grey.shade200),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 8,
              offset: const Offset(0, 4),
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
          onTap: () async {
            switch (title) {
              case "Log Out":
                await Firebase.instance.logout(context);
                break;
              case "Previous Contributions":
                Navigator.push(
                  context,
                  CustomPageRoute(destination: Navigation.prevContribution),
                );
                break;
              case "Change Password":
                Navigator.push(
                  context,
                  CustomPageRoute(destination: Navigation.changePass),
                );
                break;
              case "Delete Account":
                // Show a confirmation dialog before deleting
                showDialog<bool>(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: const Text('Delete Account?'),
                      content: const Text(
                        'Are you sure you want to permanently delete your account? This action cannot be undone.',
                      ),
                      actions: <Widget>[
                        TextButton(
                          onPressed:
                              () => Navigator.of(context).pop(false), // Dismiss
                          child: const Text('Cancel'),
                        ),
                        TextButton(
                          onPressed:
                              () => Navigator.of(context).pop(true), // Confirm
                          child: const Text('Delete'),
                        ),
                      ],
                    );
                  },
                ).then((shouldDelete) async {
                  if (shouldDelete == true) {
                    await Firebase.instance.deleteAccount(context);
                  }
                });
              default:
                break;
            }
          },
        ),
      ),
    );
  }
}
