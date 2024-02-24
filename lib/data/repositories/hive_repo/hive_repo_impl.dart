import 'package:flutter/material.dart';
import 'package:school_ai/data/data_sources/hive_helper.dart';
import 'package:school_ai/data/repositories/hive_repo/hive_repo.dart';

class HiveRepoImpl implements HiveRepo {
  @override
  Future<void> put(String key, String data) async {
    try {
      await HiveHelper.storeData(key, data);
    } catch (e) {
      debugPrint("hive repo impl Store Data : $e");
    }
  }

  @override
  String? get(String key) {
    try {
      return HiveHelper.getData(key);
    } catch (e) {
      debugPrint("hive repo impl get Data : $e");
    }
    return null;
  }

  @override
  Future<void> delete(String key) async {
    try {
      await HiveHelper.deleteData(key);
    } catch (e) {
      debugPrint("hive repo impl Delete : $e");
    }
  }
}
