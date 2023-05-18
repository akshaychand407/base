import '../db/model/profile_model.dart';

abstract class DbService {
  Future<bool> insertProfilePhoto(ProfileModel profilePhoto);
  Future<ProfileModel> getProfilePhoto(String id);
  Future<bool> updateProfilePhoto(ProfileModel model);
  Future<bool> isProfilePresent(String? id);
}
