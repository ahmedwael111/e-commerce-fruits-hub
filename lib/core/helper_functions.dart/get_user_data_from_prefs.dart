import 'dart:convert';

import 'package:e_commerce_fruits_hub/constants.dart';
import 'package:e_commerce_fruits_hub/core/services/shared_prefrenseces_singleton.dart';
import 'package:e_commerce_fruits_hub/featurs/auth/data/models/user_model.dart';

getUserDataFromPrefs(){  // get user data from local prefs as json string and convert it to user entity
  var jsonString = Prefs.getString(kUserDataKey);
  var userEntity = UserModel.fromMap(jsonDecode(jsonString));
  return userEntity;
}
