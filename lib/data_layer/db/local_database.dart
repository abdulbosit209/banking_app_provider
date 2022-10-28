import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import 'cached_username_message.dart';


class LocalDatabase {
  static final LocalDatabase getInstance = LocalDatabase._init();
  static Database? _database;

  factory LocalDatabase() {
    return getInstance;
  }

  Future<Database> get database async {
    if (_database != null) {
      return _database!;
    } else {
      _database = await _initDB("shop_app.db");
      return _database!;
    }
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);
    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  LocalDatabase._init();

  Future _createDB(Database db, int version) async {
    const idType = "INTEGER PRIMARY KEY AUTOINCREMENT";
    const textType = "TEXT NOT NULL";
    const intType = "INTEGER DEFAULT 0";

    await db.execute('''
    CREATE TABLE $userNameMessageTable (
    ${CachedUserMessageModelFields.id} $idType,
    ${CachedUserMessageModelFields.time} $textType,
    ${CachedUserMessageModelFields.sentMessage} $textType
    )
    ''');

  }

  //-------------------Cached User Message Table-------------------

  static Future<CachedUserMessageModel> insertCachedUserMessage(
      CachedUserMessageModel cachedUserMessageModel) async {
    final db = await getInstance.database;
    final id = await db.insert(userNameMessageTable, cachedUserMessageModel.toJson());
    return cachedUserMessageModel.copyWith(id: id);
  }

static Future<List<CachedUserMessageModel>> getAllCachedUserMessage() async {
  final db = await getInstance.database;
  const orderBy = "${CachedUserMessageModelFields.sentMessage} ASC";
  final result = await db.query(
    userNameMessageTable,
    orderBy: orderBy,
  );
  return result.map((json) => CachedUserMessageModel.fromJson(json)).toList();
}


static Future<int> deleteAllCachedUserMessage() async {
  final db = await getInstance.database;
  return await db.delete(userNameMessageTable);
}

  // static Future<CachedUserModel> insertCachedUserFromApi(
  //     UserData userData) async {
  //
  //   final db = await getInstance.database;
  //   CachedUserModel cachedUserModel = CachedUserModel(
  //       count: userData.count,
  //       name: userData.name,
  //       age: userData.age);
  //
  //   final id = await db.insert(userNameTable, cachedUserModel.toJson());
  //   return cachedUserModel.copyWith(id: id);
  }

  // static Future<CachedUserModel> getSingleProductById(int id) async {
  //   final db = await getInstance.database;
  //   final results = await db.query(
  //     userNameTable,
  //     columns: CachedUserModelFields.values,
  //     where: '${CachedUserModelFields.id} = ?',
  //     whereArgs: [id],
  //   );
  //   if (results.isNotEmpty) {
  //     return CachedUserModel.fromJson(results.first);
  //   } else {
  //     throw Exception('ID $id not found');
  //   }
  // }




  // static Future<int> deleteCachedProductById(int id) async {
  //   final db = await getInstance.database;
  //   var t = await db
  //       .delete(productsTable, where: "${ProductFields.id}=?", whereArgs: [id]);
  //   if (t > 0) {
  //     return t;
  //   } else {
  //     return -1;
  //   }
  // }

  // static Future<Future<int>> updateCachedUser(
  //     {required int id, required CachedUserModel cachedUserModel}) async {
  //   Map<String, dynamic> row = {
  //     CachedUserModelFields.name: cachedUserModel.name,
  //     CachedUserModelFields.age: cachedUserModel.age,
  //     CachedUserModelFields.count: cachedUserModel.count,
  //
  //   };
  //   final db = await getInstance.database;
  //   return db.update(
  //     userNameTable,
  //     row,
  //     where: '${CachedUserModelFields.id} = ?',
  //     whereArgs: [id],
  //   );
  // }

  // static Future<int> deleteCachedUserById(int id) async {
  //   final db = await getInstance.database;
  //   var t = await db.delete(userNameTable,
  //       where: '${CachedUserModelFields.id} = ?', whereArgs: [id]);
  //   return (t > 0) ? t : (-1);
  // }

  // static Future<int> updateCachedProductCount(
  //     {required int id, required int count}) async {
  //   Map<String, dynamic> row = {
  //     ProductFields.count: count,
  //   };
  //   final db = await getInstance.database;
  //   return db.update(
  //     productsTable,
  //     row,
  //     where: '${ProductFields.id} = ?',
  //     whereArgs: [id],
  //   );
  // }

  // Future close() async {
  //   final db = await getInstance.database;
  //   db.close();
  // }
// }