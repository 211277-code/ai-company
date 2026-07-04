import 'package:flutter/material.dart';
import '../services/meeting_engine.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  final MeetingEngine meetingEngine = MeetingEngine();

  List<String> discussions = [];
  List<String> tasks = [];

  void startMeeting() {
    final result = meetingEngine.startMeeting();

    setState(() {
      discussions = result.discussions;
      tasks = result.tasks;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("AI Meeting Room"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ElevatedButton(
              onPressed: startMeeting,
              child: const Text("召開 AI 會議"),
            ),
            const SizedBox(height: 20),
            const Text(
              "💬 會議討論",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: discussions.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      title: Text(discussions[index]),
                    ),
                  );
                },
              ),
            ),
            const Text(
              "✅ 今日任務",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: tasks.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      leading: const Icon(Icons.task_alt),
                      title: Text(tasks[index]),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}