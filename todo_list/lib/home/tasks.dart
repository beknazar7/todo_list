import 'package:flutter/material.dart';
import 'package:todo_list_04flu/add/add_page.dart';
import 'package:todo_list_04flu/settings/settings_page.dart';

class Task {
  String title;
  String date;
  bool isDone;

  Task({required this.title, required this.date, this.isDone = false});
}

class TaskListScreen extends StatefulWidget {
  const TaskListScreen({super.key});

  @override
  State<TaskListScreen> createState() => _TaskListScreenState();
}

class _TaskListScreenState extends State<TaskListScreen> {
  final List<Task> tasks = [];
  bool _isDarkMode = false; // храним здесь

  void _toggleTask(int index) {
    setState(() {
      tasks[index].isDone = !tasks[index].isDone;
    });
  }

  Future<void> _navigateToAddPage() async {
    final result = await Navigator.push<String>(
      context,
      MaterialPageRoute(builder: (_) => AddPage(isDarkMode: _isDarkMode)),
    );

    if (result != null && result.isNotEmpty) {
      final now = DateTime.now();
      final date =
          '${now.day.toString().padLeft(2, '0')}.${now.month.toString().padLeft(2, '0')}.${now.year.toString().substring(2)}';

      setState(() {
        tasks.insert(0, Task(title: result, date: date));
      });
    }
  }

  Future<void> _navigateToSettings() async {
    final result = await Navigator.push<bool>(
      context,
      MaterialPageRoute(
        builder: (_) => SettingsPage(isDarkMode: _isDarkMode), // передаём текущее значение
      ),
    );

    if (result != null) {
      setState(() {
        _isDarkMode = result; // получаем обратно и перерисовываем
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final backgroundColor = _isDarkMode ? const Color(0xFF1C1C1E) : const Color(0xFFF2F2F7);
    final appBarColor = _isDarkMode ? const Color(0xFF1C1C1E) : Colors.white;
    final textColor = _isDarkMode ? Colors.white : Colors.black;

    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: appBarColor,
        elevation: 0,
        title: Text(
          'Мои задачи',
          style: TextStyle(
            color: textColor,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.settings, color: textColor),
            onPressed: _navigateToSettings,
          ),
        ],
        bottom: const PreferredSize(
          preferredSize: Size.fromHeight(1),
          child: Divider(height: 1, color: Color(0xFFE0E0E0)),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: tasks.isEmpty
                ? Center(
                    child: Text(
                      'Нет задач',
                      style: TextStyle(color: _isDarkMode ? Colors.grey[400] : Colors.grey, fontSize: 16),
                    ),
                  )
                : ListView.builder(
                    padding: const EdgeInsets.only(top: 12),
                    itemCount: tasks.length,
                    itemBuilder: (context, index) {
                      return TaskCard(
                        task: tasks[index],
                        onToggle: () => _toggleTask(index),
                      );
                    },
                  ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 8, 16, 32),
            child: SizedBox(
              width: double.infinity,
              height: 52,
              child: ElevatedButton.icon(
                onPressed: _navigateToAddPage,
                icon: const Icon(Icons.add, color: Colors.white),
                label: const Text(
                  'Добавить задачу',
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF1A73E8),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                  elevation: 0,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class TaskCard extends StatelessWidget {
  final Task task;
  final VoidCallback onToggle;

  const TaskCard({super.key, required this.task, required this.onToggle});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      decoration: BoxDecoration(
        color: const Color(0xFF1A73E8),
        borderRadius: BorderRadius.circular(12),
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
        leading: GestureDetector(
          onTap: onToggle,
          child: Container(
            width: 28,
            height: 28,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(6),
            ),
            child: task.isDone
                ? const Icon(Icons.check, size: 20, color: Colors.black87)
                : null,
          ),
        ),
        title: Text(
          task.title,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
        subtitle: Row(
          children: [
            const Icon(Icons.calendar_today, color: Colors.white70, size: 14),
            const SizedBox(width: 4),
            Text(
              task.date,
              style: const TextStyle(color: Colors.white70, fontSize: 13),
            ),
          ],
        ),
      ),
    );
  }
}