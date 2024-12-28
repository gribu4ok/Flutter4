import 'dart:io';

import 'package:lab4_flutter/main.dart';
import 'package:lab4_flutter/src/data_source/firebase_data_source.dart';
import 'package:lab4_flutter/src/model/my_user.dart';
import 'package:lab4_flutter/src/repository/my_user_repository.dart';



class MyUserRepositoryImp extends MyUserRepository {
  final FirebaseDataSource _fDataSource = getIt();

  @override
  String newId() {
    return _fDataSource.newId();
  }

  @override
  Stream<Iterable<MyUser>> getMyUsers() {
    return _fDataSource.getMyUsers();
  }

  @override
  Future<void> saveMyUser(MyUser myUser, File? image) {
    return _fDataSource.saveMyUser(myUser, image);
  }

  @override
  Future<void> deleteMyUser(MyUser myUser) {
    return _fDataSource.deleteMyUser(myUser);
  }
}
