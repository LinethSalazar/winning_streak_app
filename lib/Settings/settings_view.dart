import 'package:flutter/material.dart';
import 'package:winning_streak_app/high_score/cubit/local_high_score_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<LocalHighScoreCubit>();

    return Scaffold(
      appBar: AppBar(title: Text('Settings')),
      body: ListView(
        children: [
          SettingsTile(
            icon: Icons.phonelink_erase_rounded,
            title: 'Clear Winning Streaks',
            subtitle: 'Frees up winning history',
            onTap: () => showConfirmDialog(
              context,
              title: 'Are you sure?',
              message: 'Erased :)',
              onConfirm: () => cubit.clear_winning_streak_cache(),
            ),
          ),
          SettingsTile(
            icon: Icons.abc_sharp,
            title: 'Name set up',
            subtitle: 'Name to be used in the high scores',
            onTap: () => showNameDialog(context, cubit: cubit),
          ),
        ],
      ),
    );
  }
}

void showNameDialog(
  BuildContext context, {
  required LocalHighScoreCubit cubit,
}) {
  final TextEditingController nameController = TextEditingController();

  showDialog(
    context: context,
    builder: (_) => AlertDialog(
      title: Text('Enter your name'),
      content: TextField(
        controller: nameController,
        decoration: InputDecoration(hintText: 'Enter your name'),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: Text('Cancel'),
        ),
        TextButton(
          onPressed: () {
            final newName = nameController.text.trim();
            if (newName.isNotEmpty) {
              Navigator.pop(context);
              cubit.setName(newName);
            }
          },
          child: Text('Save', style: TextStyle(color: Colors.blue)),
        ),
      ],
    ),
  );
}

void showConfirmDialog(
  BuildContext context, {
    required String title,
    required String message,
    required VoidCallback onConfirm,
  }) {
  showDialog(
    context: context,
    builder: (_) => AlertDialog(
      title: Text(title),
      content: Text(message),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: Text('Cancel'),
        ),
        TextButton(
          onPressed: () {
            Navigator.pop(context);
            onConfirm();
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text('$title done!')));
          },
          child: Text('Confirm', style: TextStyle(color: Colors.red)),
        ),
      ],
    ),
  );
}

class SettingsTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final VoidCallback onTap;

  const SettingsTile({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon, color: Colors.redAccent),
      title: Text(title, style: TextStyle(fontWeight: FontWeight.w600)),
      subtitle: Text(subtitle),
      trailing: Icon(Icons.chevron_right),
      onTap: onTap,
    );
  }
}
