import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';
import 'dart:io';
import 'package:myfirstapp/Model/Student.dart';


class DBHelper {
  DBHelper._();
  static final DBHelper db = DBHelper._();
  Database _database;

  Future<Database> get database async {
    if (_database != null) return _database;
    _database = await initDB();
    return _database;
  }

  initDB() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, "myDB.db");
    return await openDatabase(
        path,
        version: 1,
        onOpen: (db) {},
        onCreate: (Database db, int version) async {
          await db.execute("CREATE TABLE Student ("
              "id INTEGER PRIMARY KEY,"
              "first TEXT,"
              "last TEXT,"
              "major TEXT,"
              "phone TEXT"
              ")");
        });
  }

  newStudent(Student s) async {
    final db = await database;
    var raw = await db.rawInsert(
        "INSERT Into Student (id,first,last,major,phone)"
            " VALUES (?,?,?,?,?)",
        [s.id, s.fName, s.lName, s.major, s.phone]);
    return raw;
  }

  updateStudent(Student s) async {
    final db = await database;
    var res = await db.update("Student", s.toJson(),
        where: "id = ?", whereArgs: [s.id]);
    return res;
  }

  getStudent(int id) async {
    final db = await database;
    var res = await db.query(
        "Student",
        where: "id = ?",
        whereArgs: [id]
    );
    return res.isNotEmpty ? Student.fromJson(res.first) : null;
  }

  Future<List<Student>> getAllStudents() async {
    final db = await database;
    var res = await db.query("Student");
    print("This is again : ");
    print(res);
    List<Student> list = res.isNotEmpty ? res.map((c) => Student.fromJson(c)).toList() : [];
    print("This is first : ");
    print(list);
    return list;
  }

  deleteStudent(int id) async {
    final db = await database;
    return db.delete(
        "Student",
        where: "id = ?",
        whereArgs: [id]
    );
  }

  deleteAll() async {
    final db = await database;
    db.rawDelete("Delete * from Student");
  }

}

