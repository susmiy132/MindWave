import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:mindwave/features/journaling/data/model/journal_hive_model.dart';

class DeleteViewScreen extends StatelessWidget {
  const DeleteViewScreen({super.key});

  Future<void> _deleteAllJournals(BuildContext context) async {
    final box = Hive.box<JournalHiveModel>('journals');

    if (box.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('No journals to delete.')),
      );
      return;
    }

    // Confirm dialog
    final confirm = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Delete All Journals'),
        content: Text('Are you sure you want to delete all journal entries?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: Text('Cancel'),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red,
            ),
            onPressed: () => Navigator.of(context).pop(true),
            child: Text('Delete'),
          ),
        ],
      ),
    );

    if (confirm == true) {
      await box.clear();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('All journals deleted!')),
      );
      Navigator.of(context).pop(); // Go back after deletion
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Saved Journal Entry'),
        backgroundColor: Colors.deepPurple,
      ),
      body: Center(
        child: Text(
        'No journals found.',
        style: TextStyle(
          fontSize: 18,
          color: Colors.red[700],
          fontWeight: FontWeight.w500,
        ),
      ),
        // child: ElevatedButton.icon(
        //   onPressed: () => _deleteAllJournals(context),
        //   icon: Icon(Icons.delete),
        //   label: Text('Delete All Journals'),
        //   style: ElevatedButton.styleFrom(
        //     backgroundColor: Colors.red,
        //     foregroundColor: Colors.white,
        //     padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        //     textStyle: TextStyle(fontSize: 16),
        //   ),
        // ),
      ),
    );
  }
}
