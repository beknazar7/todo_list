// import 'dart:io';

// import 'package:drift/drift.dart';
// import 'package:drift/native.dart';
// import 'package:flutter/foundation.dart';
// import 'package:path_provider/path_provider.dart';
// import 'package:path/path.dart' as p;
// import 'package:todo_list_04flu/database/todos.dart';
// part 'app_database.g.dart';


// @DriftDatabase(tables: [Todos])
// class AppDatabase extends _$AppDatabase{
//   AppDatabase() : super(_openConnection());

//   @override
//   int get schemaVersion => 1;

//   Future <List<Todo>> getTodoList() {
//     return select(todos).get();

//   }

//   Future <int> insertTodo(TodosConpanion todo) {
//     return into(todos).insert(todo);
//   }
  

// } 

// LazyDatabase _openConnection() {
//   return LazyDatabase(() async {
//     final dbFolder = await getApplicationCacheDirectory();
//     final file = File(p.join(dbFolder.path, 'app.db'));
//     return NativeDatabase(file); 
//   });
// }