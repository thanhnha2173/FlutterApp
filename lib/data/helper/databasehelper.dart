import 'package:path/path.dart';
import 'package:shoes_flutter_app/data/model/user_model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';

class DatabaseHelper {
  static const _databaseName = "shoes_database.db";
  static const _databaseVersion = 2;

  static const tableUsers = 'users';

  // Singleton pattern
  DatabaseHelper._privateConstructor();
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  static Database? _database;
  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  _initDatabase() async {
    var documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, _databaseName);
    return await openDatabase(path,
        version: _databaseVersion,
        onCreate: _onCreate,
        onUpgrade: _onUpgrade);
  }

  Future _onCreate(Database db, int version) async {
    await db.execute('''
          CREATE TABLE $tableUsers (
            id INTEGER PRIMARY KEY,
            username TEXT NOT NULL,
            password TEXT NOT NULL,
            email TEXT NOT NULL UNIQUE,
            role TEXT NOT NULL

          )
          ''');
  }

  Future _onUpgrade(Database db, int oldVersion, int newVersion) async {
    if (oldVersion < 2) {
      // Cập nhật cho version 2
      await db.execute('ALTER TABLE $tableUsers ADD COLUMN address TEXT');
      await db.execute('ALTER TABLE $tableUsers ADD COLUMN phone TEXT');
      await db.execute('ALTER TABLE $tableUsers ADD COLUMN gender TEXT');
      await db.execute('ALTER TABLE $tableUsers ADD COLUMN birthday TEXT');
    }
    if (oldVersion < 4) {
      // Cập nhật cho version 3 và 4
      await db.execute('ALTER TABLE $tableUsers MODIFY address TEXT NULL');
      await db.execute('ALTER TABLE $tableUsers MODIFY phone TEXT NULL');
      await db.execute('ALTER TABLE $tableUsers MODIFY gender TEXT NULL');
      await db.execute('ALTER TABLE $tableUsers MODIFY birthday TEXT NULL');
    }
  }


  // --- CRUD operations ---
  Future<int> insertUser(UserModel user) async {
    Database db = await instance.database;
    return await db.insert(tableUsers, {
      'username': user.username,
      'password': user.password,
      'email': user.email,
      'role': user.role,
    }
    );
  }

  Future<UserModel?> getUserByUsername(String username) async {
    Database db = await instance.database;
    List<Map<String, dynamic>> maps = await db.query(tableUsers,
        where: 'username = ?',
        whereArgs: [username],
        limit: 1); 
    if (maps.isNotEmpty) {
      return UserModel.fromJson(maps.first);
    }
    return null;
  }

  Future<List<UserModel>> getAllUsers() async {
    Database db = await instance.database;
    final List<Map<String, dynamic>> maps = await db.query(tableUsers);
    return List.generate(maps.length, (i) {
      return UserModel.fromJson(maps[i]);
    });
  }

  Future<int> updateUser(UserModel user) async {
    Database db = await instance.database;
    return await db.update(tableUsers, user.toMap(),
        where: 'id = ?', whereArgs: [user.id]);
  }

  Future<int> deleteUser(int id) async {
    Database db = await instance.database;
    return await db.delete(tableUsers, where: 'id = ?', whereArgs: [id]);
  }
  
}
