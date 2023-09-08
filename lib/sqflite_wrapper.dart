library sqflite_wrapper;

import 'package:get/get.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite_wrapper/database/database_service.dart';
import 'package:sqflite_wrapper/database/database_service_impl.dart';

export 'database/return_types/return_types.dart';
export 'database/manager/datatypes.dart';
export 'database/exceptions/database_exception.dart';

class SqFieldEntity {
  String fieldName;
  String fieldType;
  List<String> fieldConstraints;

  SqFieldEntity({
    required this.fieldName,
    required this.fieldType,
    this.fieldConstraints = const [],
  });
}

Future<String> fetchDatabasePath() async {
  return await getDatabasesPath();
}

Future<void> initilizeDatabase({
  required List<String> queries,
  required String databaseName,
}) async {
  String databasePath = await fetchDatabasePath();
  String path = "$databasePath/$databaseName.db";
  Get.put(DatabaseServiceImpl(databasePath: path, queries: queries));
}

String createMasterQuery({required List<SqFieldEntity> entity, required String tableName}) {
  return '''
  CREATE TABLE $tableName (
    ${entity.map((e) => "${e.fieldName} ${e.fieldType} ${e.fieldConstraints.join(" ")}").join(", ")}
  )
''';
}

DatabaseService get databaseService => Get.find<DatabaseServiceImpl>();
