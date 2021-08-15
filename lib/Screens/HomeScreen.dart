import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:yellow_class_proj/Screens/addMovie.dart';
import 'package:yellow_class_proj/movie_model.dart';
import 'package:hive_flutter/hive_flutter.dart';
class HomeScreen extends StatelessWidget {
 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: (){
         Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => AddMovie()),);
      }),
      appBar: AppBar(
        centerTitle: true,
        title: Text("Yellow Class",style: TextStyle(fontFamily: 'Montserrat'),
        ),
        
      ),
      body: ValueListenableBuilder(
        valueListenable: Hive.box<MovieModel>('movieData').listenable(),
        builder: (context,Box<MovieModel> box,_){
          if(box.values.isEmpty){
            return Center(
              child: Text("Yellow Class",style: TextStyle(fontFamily: 'Montserrat'),
            )
            );
          }
          return ListView.builder(
            itemCount: 1,
            itemBuilder: (context,index){
              MovieModel movieModel=box.getAt(index);
              return ListTile(
                onLongPress: ()async{
                      await box.delete(index);
                },
                title: Text(
                    "movieModel.title",
                    style: TextStyle(fontSize: 20, fontFamily: 'Montserrat'),
                  ),
                  subtitle: Text(
                    "movieModel.detail",
                    style: TextStyle(fontSize: 16, fontFamily: 'Montserrat'),
                  ),
              );
            },
          );
        },

        ),
      
    );
  }
}