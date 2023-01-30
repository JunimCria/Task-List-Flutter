import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:tasklist/models/task-class.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class TaskItem extends StatelessWidget {
  const TaskItem({
    Key? key,
    required this.task,
    required this.deleteTask,
  }) : super(key: key);

  final Task task;
  final Function deleteTask;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2),
      child: Slidable(
        closeOnScroll: true,
        endActionPane: ActionPane(
          motion: const DrawerMotion(),
          extentRatio: 0.2,
          children: [
            SlidableAction(
              backgroundColor: Colors.red,
              label: 'Delete',
              icon: Icons.delete_forever,
              onPressed: (e) {
                deleteTask(task);
              },
            )
          ],
        ),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4),
            color: Colors.grey[200],
          ),
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                DateFormat('dd/MM/yyyy - HH:mm - E').format(task.date),
                style: TextStyle(
                  fontSize: 12,
                ),
              ),
              Text(
                task.title,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
