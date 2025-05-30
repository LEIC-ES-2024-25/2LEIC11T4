import 'package:bookexchange/Database/Firebase.dart';
import 'package:bookexchange/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:bookexchange/Logic/Navigation/navigation.dart';
import 'package:bookexchange/Logic/Navigation/transitions.dart';

Map<String, String> getSettings(BuildContext context) {
  return {
    'Previous Contributions': S.of(context).previous_contributions,
    'Change Password': S.of(context).change_password,
    'Log out': S.of(context).logout,
    'Delete Account': S.of(context).delete_account,
    'Verify Email': S.of(context).verify_email,
    'Verified': S.of(context).verified,
  };
}

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  String? profileImgUrl;
  bool isEmailVerified = false;

  @override
  void initState() {
    super.initState();
    loadUserProfileImage();
    checkEmailVerification();
  }

  Future<void> checkEmailVerification() async {
    final user = Firebase.instance.auth.currentUser;
    await user?.reload(); // Refresh latest status
    setState(() {
      isEmailVerified = user?.emailVerified ?? false;
    });
  }

  Future<void> loadUserProfileImage() async {
    final uid = Firebase.instance.auth.userid;
    final doc = await Firebase.instance.db.collection('users').doc(uid).get();
    final data = doc.data();
    if (data != null && data['profileImageUrl'] != null) {
      setState(() {
        profileImgUrl = data['profileImageUrl'];
      });
    }
  }

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
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
              ],
            ),

            // Foreground content
            ListView(
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
                          backgroundImage:
                          profileImgUrl != null && profileImgUrl!.isNotEmpty
                              ? NetworkImage(profileImgUrl!)
                              : null,
                          child:
                          profileImgUrl == null || profileImgUrl!.isEmpty
                              ? Icon(
                            Icons.person,
                            size: 48,
                            color:
                            Theme.of(context).colorScheme.primary,
                          )
                              : null,
                        ),
                      ],
                    ),
                  ),
                ),

                const SizedBox(height: 30),

                // Settings Options
                _buildSettingsOption(
                  Icons.chat_bubble_outline,
                  'Previous Contributions',
                  context,
                ),
                _buildSettingsOption(
                  Icons.lock_outline,
                  'Change Password',
                  context,
                ),
                _buildSettingsOption(Icons.logout, 'Log out', context),
                _buildSettingsOption(
                  Icons.delete_forever_outlined,
                  'Delete Account',
                  context,
                ),
                _buildSettingsOption(
                  isEmailVerified ? Icons.verified : Icons.verified_outlined,
                  isEmailVerified ? 'Verified' : 'Verify Email',
                  context,
                ),
              ],
            )
            
          ],
        ),
      ),
    );
  }

  Widget _buildSettingsOption(
      IconData icon,
      String name,
      BuildContext context,
      ) {
    final theme = Theme.of(context);
    final settings = getSettings(context);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      child: Container(
        decoration: BoxDecoration(
          color: theme.colorScheme.surface.withAlpha(
            229,
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
          title: Text(settings[name]!, style: theme.textTheme.bodyMedium),
          trailing: Icon(
            Icons.arrow_forward_ios,
            size: 16,
            color: theme.colorScheme.primary,
          ),
          onTap: () async {
            switch (name) {
              case "Log out":
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
                  if (shouldDelete == true && context.mounted) {
                    await Firebase.instance.deleteAccount(context);
                  }
                });

                break;
              case "Verified":
              case "Verify Email":
                if (isEmailVerified) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("Your email is already verified.")),
                  );
                } else {
                  final user = Firebase.instance.auth.currentUser;
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: const Text("Verify Your Email"),
                        content: Text(
                          "Send a verification email to ${user?.email}?",
                        ),
                        actions: [
                          TextButton(
                            onPressed: () => Navigator.pop(context),
                            child: const Text("Cancel"),
                          ),
                          TextButton(
                            onPressed: () async {
                              Navigator.pop(context);
                              await user?.sendEmailVerification();
                              if (context.mounted) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(
                                      "Verification email sent to ${user?.email}",
                                    ),
                                  ),
                                );
                              }
                            },
                            child: const Text("Send"),
                          ),
                        ],
                      );
                    },
                  );
                }
                break;
            }
          },
        ),
      ),
    );
  }
}