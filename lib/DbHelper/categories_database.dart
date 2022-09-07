// import 'package:path_provider/path_provider.dart';
// import 'package:monthly_expense_manage/Models/categories_model.dart';
// import 'package:sqflite/sqflite.dart';
// import 'package:path/path.dart';
// import 'dart:io' as io;
//
// class CategoriesDBHelper {
//
//   static Database? _db;
//   Future<Database?> get db async {
//     if (_db != null) {
//       return _db!;
//     }
//     _db = await initDatabase();
//     return _db!;
//   }
//
//   initDatabase() async {
//     io.Directory documentDirectory = await getApplicationDocumentsDirectory();
//     String path = join(documentDirectory.path, 'categories.db');
//     var db = await openDatabase(path, version: 1, onCreate: _onCreate );
//     return db;
//   }
//
//   _onCreate(Database db, int version) async {
//     await  db.execute(
//       "CREATE TABLE categories (id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT NOT NULL)",
//     );
//   }
//
//
//   Future<CategoriesModel> insert(CategoriesModel categoriesModel) async {
//     var dbClient = await db;
//     await dbClient!.insert('categories', categoriesModel.toMap());
//     return categoriesModel;
//   }
//
//
//   Future<List<CategoriesModel>> getCartListWithUserId() async {
//     var dbClient = await db;
//
//     final List<Map<String, Object?>> queryResult = await dbClient!.query('categories' );
//     return queryResult.map((e) => CategoriesModel.fromMap(e)).toList();
//
//   }
//
//   // Deleting Data From Database
//   Future<int> delete(int id) async{
//     var dbClient = await db;
//     return await dbClient!.delete(
//         'categories',
//         where: 'id = ?',
//         whereArgs: [id]
//     );
//   }
//
//   // Update Data In Database
//   Future<int> update(CategoriesModel categoriesModel) async{
//     var dbClient = await db;
//     return await dbClient!.update(
//         "categories",
//         categoriesModel.toMap(),
//         where: 'id = ?',
//         whereArgs: [categoriesModel.id]
//     );
//   }
//
// }

// import 'package:path/path.dart';
// import 'package:path_provider/path_provider.dart';
// import 'package:monthly_expense_manage/Models/account_model.dart';
// import 'package:sqflite/sqflite.dart';
// import 'dart:io' as io;
//
// class AccountDBHelper {
//
//   static Database? _db;
//   Future<Database?> get db async {
//     if (_db != null) {
//       return _db!;
//     }
//     _db = await initDatabase();
//     return _db!;
//   }
//
//   initDatabase() async {
//     io.Directory documentDirectory = await getApplicationDocumentsDirectory();
//     String path = join(documentDirectory.path, 'account.db');
//     var db = await openDatabase(path, version: 1, onCreate: _onCreate );
//     return db;
//   }
//
//   _onCreate(Database db, int version) async {
//     await  db.execute(
//       "CREATE TABLE account (id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT NOT NULL, amount INTEGER NOT NULL)",
//     );
//   }
//
//
//   Future<AccountModel> insert(AccountModel accountModel) async {
//     var dbClient = await db;
//     await dbClient!.insert('account', accountModel.toMap());
//     return accountModel;
//   }
//
//
//   Future<List<AccountModel>> getCartListWithUserId() async {
//     var dbClient = await db;
//
//     final List<Map<String, Object?>> queryResult = await dbClient!.query('account' );
//     return queryResult.map((e) => AccountModel.fromMap(e)).toList();
//
//   }
//
//   // Deleting Data From Database
//   Future<int> delete(int id) async{
//     var dbClient = await db;
//     return await dbClient!.delete(
//         'account',
//         where: 'id = ?',
//         whereArgs: [id]
//     );
//   }
//
//   // Update Data In Database
//   Future<int> update(AccountModel accountModel) async{
//     var dbClient = await db;
//     return await dbClient!.update(
//         "account",
//         accountModel.toMap(),
//         where: 'id = ?',
//         whereArgs: [accountModel.id]
//     );
//   }
//
// }
import 'package:monthly_expense_manage/Models/account_model.dart';
import 'package:monthly_expense_manage/Models/categories_model.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'dart:io' as io;

class CategoriesDBHelper {

  static Database? _db;
  Future<Database?> get db async {
    if (_db != null) {
      return _db!;
    }
    _db = await initDatabase();
    return _db!;
  }

  initDatabase() async {
    io.Directory directory = await getApplicationDocumentsDirectory();
    String path = join(directory.path, 'categories.db');
    var db = await openDatabase(path, version: 1, onCreate: _onCreate );
    return db;
  }

  _onCreate(Database db, int version) async {
    await  db.execute(
      "CREATE TABLE myCategories (id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT NOT NULL)",
    );
  }


  Future<CategoriesModel> insert(CategoriesModel categoriesModel) async {
    var dbClient = await db;
    await dbClient!.insert('myCategories', categoriesModel.toMap());
    return categoriesModel;
  }


  Future<List<CategoriesModel>> getCartListWithUserId() async {
    var dbClient = await db;

    final List<Map<String, Object?>> queryResult = await dbClient!.query('myCategories' );
    return queryResult.map((e) => CategoriesModel.fromMap(e)).toList();

  }

  // Deleting Data From Database
  Future<int> delete(int id) async{
    var dbClient = await db;
    return await dbClient!.delete(
        'myCategories',
        where: 'id = ?',
        whereArgs: [id]
    );
  }

  // Update Data In Database
  Future<int> update(CategoriesModel categoriesModel) async{
    var dbClient = await db;
    return await dbClient!.update(
        "myCategories",
        categoriesModel.toMap(),
        where: 'id = ?',
        whereArgs: [categoriesModel.id]
    );
  }

}
