import 'package:flutter/material.dart';
import 'package:tasklist/widgets/task-list-items.dart';
import 'package:tasklist/models/task-class.dart';

class TaskListPage extends StatefulWidget {
  TaskListPage({Key? key}) : super(key: key);

  @override
  State<TaskListPage> createState() => _TaskListPageState();
}

class _TaskListPageState extends State<TaskListPage> {
  final TextEditingController taskController = TextEditingController();

  List<Task> taskList = [];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: Row(
                    children: const [
                      Icon(
                        Icons.add_alert_sharp,
                        size: 30,
                      ),
                      Text(
                        'Task List',
                        style: TextStyle(
                          fontSize: 28,
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                      child: TextField(
                        onSubmitted: addTask,
                        controller: taskController,
                        decoration: InputDecoration(
                          labelText: 'Adicione uma Tarefa',
                          hintText: 'Ex - Estudar',
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 17),
                        backgroundColor: Colors.purple,
                      ),
                      onPressed: () => {addTask(null)},
                      child: Icon(
                        Icons.add,
                        size: 25,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 16,
                ),
                Flexible(
                  child: ListView(
                    shrinkWrap: true,
                    children: [
                      for (Task task in taskList)
                        TaskItem(
                          task: task,
                          deleteTask: deleteTask,
                        ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 16,
                ),
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        'Você possui ${taskList.length} tarefas pendentes',
                      ),
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.purple,
                      ),
                      onPressed: () => {},
                      child: Text('Limpar Tudo'),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void addTask(String? text) {
    text = taskController.text;
    if (text != '') {
      setState(() {
        Task taskObject = Task(
          title: taskController.text,
          date: DateTime.now(),
        );
        taskList.add(taskObject);
        taskController.clear();
      });
    } else {
      print('Error - Invalid Task');
    }
  }

  void deleteTask(Task task){
    setState(() {
      taskList.remove(task);
    });
  }
}
