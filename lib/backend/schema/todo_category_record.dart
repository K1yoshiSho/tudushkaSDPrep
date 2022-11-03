import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'todo_category_record.g.dart';

abstract class TodoCategoryRecord
    implements Built<TodoCategoryRecord, TodoCategoryRecordBuilder> {
  static Serializer<TodoCategoryRecord> get serializer =>
      _$todoCategoryRecordSerializer;

  @BuiltValueField(wireName: 'category_name')
  String? get categoryName;

  BuiltList<DocumentReference>? get todo;

  @BuiltValueField(wireName: 'created_by')
  DocumentReference? get createdBy;

  @BuiltValueField(wireName: 'created_at')
  DateTime? get createdAt;

  String? get uid;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(TodoCategoryRecordBuilder builder) => builder
    ..categoryName = ''
    ..todo = ListBuilder()
    ..uid = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('todoCategory');

  static Stream<TodoCategoryRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<TodoCategoryRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then(
          (s) => serializers.deserializeWith(serializer, serializedData(s))!);

  TodoCategoryRecord._();
  factory TodoCategoryRecord(
          [void Function(TodoCategoryRecordBuilder) updates]) =
      _$TodoCategoryRecord;

  static TodoCategoryRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createTodoCategoryRecordData({
  String? categoryName,
  DocumentReference? createdBy,
  DateTime? createdAt,
  String? uid,
}) {
  final firestoreData = serializers.toFirestore(
    TodoCategoryRecord.serializer,
    TodoCategoryRecord(
      (t) => t
        ..categoryName = categoryName
        ..todo = null
        ..createdBy = createdBy
        ..createdAt = createdAt
        ..uid = uid,
    ),
  );

  return firestoreData;
}
