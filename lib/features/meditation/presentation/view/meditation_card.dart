import 'package:flutter/material.dart';
import 'package:mindwave/features/meditation/presentation/view/meditation_record_view_screen.dart';

class MeditationCard extends StatelessWidget {
  final String title;
  final String description;
  final String duration;

  const MeditationCard({
    Key? key,
    required this.title,
    required this.description,
    required this.duration,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      margin: const EdgeInsets.only(bottom: 16),
      color: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ListTile(
        leading: const Icon(Icons.self_improvement, color: Colors.deepPurple),
        title: Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text(description),
        trailing: Text(duration),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => RecordingTimeScreen(
                title: title,
                duration: duration,
              ),
            ),
          );
        },
      ),
    );
  }
}
