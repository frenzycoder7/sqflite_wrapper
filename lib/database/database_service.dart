import 'package:sqflite_wrapper/database/return_types/return_types.dart';

abstract class DatabaseService {
  bool get isOpen;
  Future<DataInsertionResponse> insert(
    String tableName,
    List<Map<String, dynamic>> json,
  );

  Function(
    String, {
    List<String>? columns,
    bool? distinct,
    String? groupBy,
    String? having,
    int? limit,
    int? offset,
    String? orderBy,
    String? where,
    List<Object?>? whereArgs,
  }) query();

  Future<DataUpdateResponse> update(
    String tableName,
    Map<String, dynamic> json, {
    String? where,
    List<Object?>? whereArgs,
  });

  Future<DataDeleteResponse> delete(
    String tableName, {
    String? where,
    List<Object?>? whereArgs,
  });
}
