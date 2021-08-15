import 'package:hive/hive.dart';
// import 'package:hive_flutter/hive_flutter.dart';
// import 'package:path_provider/path_provider.dart';


part 'movie_model.g.dart';
@HiveType(typeId: 1)
class MovieModel{
  @HiveField(0)
   String title;
  @HiveField(1)
   String detail;
  @HiveField(2)
   bool isCompleted;

  MovieModel({this.title, this.detail, this.isCompleted});

}