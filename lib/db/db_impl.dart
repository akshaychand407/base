import 'package:sqflite/sqflite.dart';
import '../app/app.locator.dart';
import '../services/db_service.dart';
import 'database_helper.dart';
import 'model/profile_model.dart';
import 'tables.dart';

class DbImpl extends DbService {
  final DatabaseHelper _dbProvider = locator<DatabaseHelper>();
  late Database _db;

  @override
  Future<bool> isProfilePresent(String? id) async {
    _db = (await _dbProvider.database)!;
    final result = await _db.rawQuery(
        'SELECT ${ProfilePhotoFields.id} FROM ${Tables.profilePhoto} WHERE ${ProfilePhotoFields.id}=?',
        [id]);
    if (result.isNotEmpty) {
      return true;
    } else {
      return false;
    }
  }

  @override
  Future<bool> insertProfilePhoto(ProfileModel profilePhoto) async {
    _db = (await _dbProvider.database)!;
    final result = await _db.insert(Tables.profilePhoto, profilePhoto.toMap());
    if (result > 0) {
      return true;
    } else {
      return false;
    }
  }

  @override
  Future<ProfileModel> getProfilePhoto(String id) async {
    _db = (await _dbProvider.database)!;
    var maps = await _db.query(Tables.profilePhoto,
        where: '${ProfilePhotoFields.id} = ?', whereArgs: [id]);
    return ProfileModel.fromMap(maps.first);
  }

  @override
  Future<bool> updateProfilePhoto(ProfileModel model) async {
    _db = (await _dbProvider.database)!;
    var complaintModel = {
      ProfilePhotoFields.id: model.id,
      ProfilePhotoFields.title: model.title,
      ProfilePhotoFields.picture: model.picture,
    };
    final result = await _db.update(Tables.profilePhoto, complaintModel,
        where: '${ProfilePhotoFields.id} = ?', whereArgs: [model.id]);
    if (result > 0) {
      return true;
    } else {
      return false;
    }
  }
}
