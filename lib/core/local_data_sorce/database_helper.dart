import 'dart:developer';
import 'package:sqflite/sqflite.dart';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';
import 'package:wallpaper_app/core/utels/shared_func.dart';
import 'package:wallpaper_app/feature/home/data/model/response/photo_response_model.dart';

class DatabaseDataSource {
  DatabaseDataSource._privateConstructor();

  static final DatabaseDataSource instance =
      DatabaseDataSource._privateConstructor();
  static Database? _database;

  Future<Database> get database async => _database ??= await _initDatabase();

  Future<Database> _initDatabase() async {
    log("<<initialization of DB>>");
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, 'wallpaper.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
    );
  }

  Future _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE photo(
          id INTEGER PRIMARY KEY,
          width INTEGER,
          height INTEGER,
          url TEXT,
          photographer TEXT,
          photographer_url TEXT,
          photographer_id INTEGER,
          avg_color TEXT,
          large2x TEXT,
          tiny TEXT,
          liked INTEGER,
          alt TEXT
      )
      ''');
  }

  Future<List<PhotoModel>> getPhotoList() async {
    Database db = await database;
    var photos = await db.query('photo');

    List<PhotoModel> photoList = photos.isNotEmpty
        ? photos.map((c) => PhotoModel.fromJson(c, false)).toList()
        : [];
    return photoList;
  }

  Future<int> savePhotoData(PhotoModel photoData) async {
    Database db = await database;
    int value = await db.rawInsert(
        "insert or replace into photo (id, width, height, url, photographer, photographer_url, photographer_id, avg_color, large2x, tiny, liked, alt) values "
        "((select id from photo where url = '${photoData.url}' ), "
        "'${photoData.width}',"
        "'${photoData.height}', "
        "'${photoData.url}',"
        "'${photoData.photographer}',"
        "'${photoData.photographerUrl}',"
        "'${photoData.photographerId}',"
        "'${photoData.avgColor}',"
        "'${photoData.large2X}',"
        "'${photoData.tiny}',"
        "'${AppUtils.boolToInt(photoData.liked)}',"
        "'${photoData.alt}'"
        ")");

    log("Value inserted: $value");
    return value;
  }

  Future<int> removePhotoData(String id) async {
    Database db = await instance.database;
    return await db.delete('photo', where: 'id = ?', whereArgs: [id]);
  }
}
