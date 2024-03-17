// import 'package:path/path.dart' as p;
// import 'package:sqflite/sqflite.dart';

// class ToDoModelClass {
//   int? idNo;
//   String title;
//   String description;
//   String date;
//   ToDoModelClass(
//       {this.idNo,
//       required this.title,
//       required this.description,
//       required this.date});

//   Map<String, dynamic> getMap() {
//     return {
//       'idNo': idNo,
//       'title': title,
//       'description': description,
//       'date': date,
//     };
//   }

//   @override
//   String toString() {
//     return '{idNo:$idNo,title:$title,description:$description,date:$date }';
//   }
// }

// Future<void> insertData(ToDoModelClass obj) async {
//   count++;
//   print("************************************In insertDATA + ");

//   final localDB = await database;
//   if (localDB == null) {
//     print("Error: localDB is null");
//     return;
//   }
//   await localDB.insert(
//     "apptodo",
//     obj.getMap(),
//     conflictAlgorithm: ConflictAlgorithm.replace,
//   );
//   print(await getData());
// }

// Future<void> deleteOrderData(int idNo) async {
//   count--;
//   print("In deleter DATAbase");
//   final localDB = await database;
//   await localDB.delete(
//     "apptodo",
//     where: "idNo = ?",
//     whereArgs: [idNo],
//   );
//   print(await getData());
// }

// Future<void> updateData(ToDoModelClass obj) async {
//   print("In Update Database");
//   final localDB = await database;

//   await localDB.update(
//     "apptodo",
//     obj.getMap(),
//     where: 'idNo=?',
//     whereArgs: [obj.idNo],
//   );
//   print(await getData());
// }

// Future<List<ToDoModelClass>> getData() async {
//   print("**************************************In MODEL CLASS");
//   final localDB = await database;
//   List<Map<String, dynamic>> dataMap = await localDB.query("apptodo");
//   return List.generate(dataMap.length, (i) {
//     return ToDoModelClass(
//       idNo: dataMap[i]['idNo'],
//       title: dataMap[i]['title'],
//       description: dataMap[i]['description'],
//       date: dataMap[i]['date'],
//     );
//   });
// }

// dynamic database;
// int count = 0;
// // List<ToDoModelClass> todoList = List.empty(growable: true);
// // Future allToList() async {
// //   List<ToDoModelClass> list = await getData();
// //   for (ToDoModelClass a in list) {
// //     todoList.add(a);
// //   }
// // }

// Future<void> databasecreate() async {
//   print("**********************************in void main");
//   database = openDatabase(
//     p.join(await getDatabasesPath(), "apptododata.db"),
//     version: 1,
//     onCreate: (db, version) async {
//       await db.execute('''
// CREATE TABLE apptodo(
// idNo INTEGER PRIMARY KEY,
// title TEXT,
// description TEXT,
// date TEXT
// )
// ''');
//     },
//   );
//   print(await getDatabasesPath());
//   // ToDoModelClass obj =
//   //     ToDoModelClass(title: "mohit", description: "pawar", date: "12/jun");
//   // await insertData(obj);
//   print(await getData());
// }
import 'package:path/path.dart' as p;
import 'package:sqflite/sqflite.dart';

class ToDoModelClass {
  int? idNo;
  String title;
  String description;
  String date;
  ToDoModelClass(
      {this.idNo,
      required this.title,
      required this.description,
      required this.date});

  Map<String, dynamic> getMap() {
    return {
      'idNo': idNo,
      'title': title,
      'description': description,
      'date': date,
    };
  }

  @override
  String toString() {
    return '{idNo:$idNo,title:$title,description:$description,date:$date }';
  }
}

Future<void> insertData(ToDoModelClass obj) async {
  print("************************************   In INSERT DATABASE + ");

  final localDB = await database;
  if (localDB == null) {
    print("Error: localDB is null");
    return;
  }
  await localDB.insert(
    "tododata",
    obj.getMap(),
    conflictAlgorithm: ConflictAlgorithm.replace,
  );
  print(await getData());
}

Future<void> deleteOrderData(int? idNo) async {
  print("************************************   In DELETE DATABASE + ");
  final localDB = await database;
  await localDB.delete(
    "tododata",
    where: "idNo = ?",
    whereArgs: [idNo],
  );
  print(await getData());
}

Future<void> updateData(ToDoModelClass obj) async {
  print("************************************   In UPDATE DATABASE + ");
  final localDB = await database;

  await localDB.update(
    "tododata",
    obj.getMap(),
    where: 'idNo=?',
    whereArgs: [obj.idNo],
  );
  print(await getData());
}

Future<List<ToDoModelClass>> getData() async {
  print("**************************************In MODEL CLASS");
  final localDB = await database;
  List<Map<String, dynamic>> dataMap = await localDB.query("tododata");

  print(
      "****************************length of data ******************************");
  print(dataMap.length);
  return List.generate(dataMap.length, (i) {
    return ToDoModelClass(
      idNo: dataMap[i]['idNo'],
      title: dataMap[i]['title'],
      description: dataMap[i]['description'],
      date: dataMap[i]['date'],
    );
  });
}

dynamic database;

Future<void> databasecreate() async {
  print("**********************************  In VOID MAIN");
  database = openDatabase(
    p.join(await getDatabasesPath(), "appdata.db"),
    version: 1,
    onCreate: (db, version) async {
      await db.execute('''
CREATE TABLE tododata(
idNo INTEGER PRIMARY KEY,
title TEXT,
description TEXT,
date TEXT
)
''');
    },
  );
  print(await getDatabasesPath());
  // ToDoModelClass obj =
  //     ToDoModelClass(title: "mohit", description: "pawar", date: "12/jun");
  // await insertData(obj);
  print(await getData());
}
