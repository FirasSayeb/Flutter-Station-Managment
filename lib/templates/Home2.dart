

import 'package:app/Model/Station.dart';
import 'package:app/Model/Voyager.dart';
import 'package:app/db/databaseManager.dart';
import 'package:flutter/material.dart';

void main(){
  runApp(app());
}
class app extends StatelessWidget {
  const app({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(home:App());
  }
} 
class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  DatabaseManager manager=DatabaseManager();
 List<Station> list=[];
 
  final fkey=GlobalKey<FormState>();
  Voyager voyager=Voyager.em();
  @override
  void initState() {
    // TODO: implement initState 
   getAll()  ;
    
  }
  getAll()async{
list=await manager.getStations() ;
print(list); 
print("hello");
  }
  @override
  Widget build(BuildContext context) {  
    return Scaffold( 
      body: Form(key: fkey,
      child: Padding(
        padding: const EdgeInsets.all(30.0), 
        child: Column(children: [
          
       
          TextFormField(
            decoration: InputDecoration(label: Text("Duree de Voyage")),
            keyboardType: TextInputType.number,
            validator: (value) {
              if(value==null || value.length==0)return "champs obligatiore";
              return null;
            },
            onSaved: (newValue) {
              voyager.duree=int.parse(newValue!);  
            },
          ),Padding(
            padding: const EdgeInsets.all(20.0),
            child: ElevatedButton(onPressed: (){
              if(fkey.currentState!.validate()){ 
                    fkey.currentState!.save();   
                    manager.addVoyage(voyager);}
            }, child: Text("Ajouter Voyage")),
          )
        ]), 
      ),
      ),
    );
  }
}