
import 'package:app/Model/Station.dart';
import 'package:app/Model/Voyager.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseManager{
  Database? _database;

  get database async {
   if(_database!=null) return _database;
   _database=await init();
   return _database;
  }


  init()async {
    String path=join(await getDatabasesPath(),"Examen.db");
    return await openDatabase(path,version: 1,onCreate: (db, version)async {
      await db.execute('''
      Create Table Station(id INTEGER PRIMARY KEY AUTOINCREMENT,nomstation TEXT);
''');
await db.execute('''
      Create Table Voyager(id INTEGER PRIMARY KEY AUTOINCREMENT,depart Integer references Station(id) ,arrive Integer  references Station(id),duree INTEGER);
''');
print("Table is creating ");
    },);  
  }
  addStation(Station station) async {
   final Database db=await database; 
   db.insert('Station', station.toMap());
  }
  getStations()async{
   final Database db=await database; 
     return db.query("Station")  ;  
  
  } 
  addVoyage(Voyager voyager)async{
final Database db=await database;
   return db.insert("Voyager",voyager.toMap());
  }
  
  
}