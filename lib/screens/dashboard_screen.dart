import '../agents/pm_agent.dart';
import 'package:flutter/material.dart';
import '../agents/ceo_agent.dart';
final CEOAgent ceo = CEOAgent();
class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  final CEOAgent ceo = CEOAgent();

  String advice = "等待 CEO Agent 分析...";
  List<String> tasks = [];

  void startMeeting() {
    setState(() {
      advice = ceo.getAdvice();
      tasks = ceo.getTasks();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("AI 自我進化系統"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            const Text(
              "🧠 CEO Agent",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 10),

            Text(advice),

            const SizedBox(height: 20),

            ElevatedButton(
              onPressed: startMeeting,
              child: const Text("開始 AI 會議"),
            ),

            const SizedBox(height: 30),

            const Text(
              "📋 今日任務",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 10),

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