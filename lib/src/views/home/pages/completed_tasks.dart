import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../data_models/task_db.dart';
import '../../../data_models/user_db.dart';
import '../components/list_task_item.dart';

class CompletedTasks extends ConsumerWidget {
  CompletedTasks({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final TaskDB taskDB = ref.watch(taskDBProvider);
    return MaterialApp(
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
              bottom: const TabBar(
                tabs: [
                  Tab(text: 'All'),
                  Tab(text: 'Filter by'),
                ],
              ),
              centerTitle: true,
              backgroundColor: Theme.of(context).colorScheme.primary,
              title: const Text(
                  "Completed Tasks",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  )
              )
          ),
          body: ListView(
              padding: const EdgeInsets.symmetric(vertical: 8),
              children: taskDB.getTasks(currentUserID).map((task) => ListTaskItem(task: task)).toList()
          ),
        ),
      ),
    );
  }
}