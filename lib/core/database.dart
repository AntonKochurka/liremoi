import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

part 'database.g.dart';

class Books extends Table {
  TextColumn get id => text()();

  TextColumn get title => text()();

  TextColumn get filePath => text()();
  DateTimeColumn get createdAt => dateTime()();

  @override
  Set<Column> get primaryKey => {id};
}

enum AnnotationType { highlight, underline, note }

class Annotations extends Table {
  TextColumn get id => text()();

  TextColumn get bookId =>
      text().references(Books, #id, onDelete: KeyAction.cascade)();

  IntColumn get page => integer()();
  IntColumn get startOffset => integer()();
  IntColumn get endOffset => integer()();

  TextColumn get type => textEnum<AnnotationType>()();
  IntColumn get color => integer()();
  TextColumn get noteText => text().nullable()();

  DateTimeColumn get createdAt => dateTime()();

  @override
  Set<Column> get primaryKey => {id};
}

@DriftDatabase(tables: [Books, Annotations])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dir = await getApplicationDocumentsDirectory();
    final file = File(p.join(dir.path, 'liremoi.sqlite'));
    return NativeDatabase(file);
  });
}
