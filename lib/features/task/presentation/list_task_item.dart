import 'package:flutter/material.dart';
import '../domain/task_db.dart';
import 'package:pocketdad/features/common/theme.dart';

class ListTaskItem extends StatelessWidget {
  const ListTaskItem({Key? key, required this.task}) : super(key: key);

  final TaskData task;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        child: SizedBox(
          child: Center(
            child: Wrap(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Text(
                        task.name,
                        style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                          color: Theme.of(context).colorScheme.onBackground,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(task.description,
                          style: TextStyle(
                              fontSize: 14,
                              color: Colors.black,
                              fontWeight: FontWeight.w400
                          )
                      ),
                      SizedBox(height: 10),
                      Text(task.dueDate.toString()),
                    ]
                  ),
                ),
              ]
            ),
          )
        )
      ),
    );
  }
}

//
// class ListTaskItem extends StatelessWidget {
//   Widget build(BuildContext context) {
//     return const ListTile(
//       leading: CircleAvatar(
//         backgroundColor: Colors.orange,
//       ),
//       title: Text(
//         'Task name'
//       )
//     );
//   }
// }