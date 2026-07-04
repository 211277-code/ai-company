import '../agents/ceo_agent.dart';
import '../agents/pm_agent.dart';

class MeetingResult {
  final List<String> discussions;
  final List<String> tasks;

  MeetingResult({
    required this.discussions,
    required this.tasks,
  });
}

class MeetingEngine {
  final CEOAgent ceo = CEOAgent();
  final PMAgent pm = PMAgent();

  MeetingResult startMeeting() {
    List<String> discussions = [];
    List<String> tasks = [];

    // CEO 發言
    discussions.add("👨‍💼 CEO：${ceo.getAdvice()}");
    tasks.addAll(ceo.getTasks());

    // PM 發言
    discussions.add("📋 PM：${pm.getAdvice()}");
    tasks.addAll(pm.getTasks());

    return MeetingResult(
      discussions: discussions,
      tasks: tasks,
    );
  }
}