
import 'package:app/Model/Station.dart';
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
  final fkey=GlobalKey<FormState>();
  Station station=Station.em();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(key: fkey,
      child: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(children: [
          TextFormField(
            decoration: InputDecoration(label: Text("Nom de Station")),
            validator: (value) {
              if(value==null || value.length==0){
                return "champs obligatiore";}
                else if(value.length<5 || value.length >10){
                  return "nom de station comprise entre 5 e 10 caractéres.";
                }return null;
              
            },onSaved: (newValue) {
              
                station.nomstation=newValue!;
             
              
              
            },
          ),Padding(
            padding: const EdgeInsets.all(20.0),
            child: ElevatedButton(onPressed: (){
                
              if(fkey.currentState!.validate()){
                fkey.currentState!.save(); 
              
                print(station.nomstation);
             manager.addStation(station);
              }
            }, child: Text("Ajouter Station")),
          )
        ]),
      ), 
      ),
    );
  }
}