import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'todo_list_record.g.dart';

abstract class TodoListRecord
    implements Built<TodoListRecord, TodoListRecordBuilder> {
  static Serializer<TodoListRecord> get serializer =>
      _$todoListRecordSerializer;

  @BuiltValueField(wireName: 'todo_name')
  String? get todoName;

  @BuiltValueField(wireName: 'todo_time')
  DateTime? get todoTime;

  String? get priority;

  @BuiltValueField(wireName: 'created_by')
  DocumentReference? get createdBy;

  @BuiltValueField(wireName: 'created_at')
  DateTime? get createdAt;

  bool? get status;

  String? get uid;

  DateTime? get todoDate;

  String? get category;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(TodoListRecordBuilder builder) => builder
    ..todoName = ''
    ..priority = ''
    ..status = false
    ..uid = ''
    ..category = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('todoList');

  static Stream<TodoListRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<TodoListRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  TodoListRecord._();
  factory TodoListRecord([void Function(TodoListRecordBuilder) updates]) =
      _$TodoListRecord;

  static TodoListRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createTodoListRecordData({
  String? todoName,
  DateTime? todoTime,
  String? priority,
  DocumentReference? createdBy,
  DateTime? createdAt,
  bool? status,
  String? uid,
  DateTime? todoDate,
  String? category,
}) {
  final firestoreData = serializers.toFirestore(
    TodoListRecord.serializer,
    TodoListRecord(
      (t) => t
        ..todoName = todoName
        ..todoTime = todoTime
        ..priority = priority
        ..createdBy = createdBy
        ..createdAt = createdAt
        ..status = status
        ..uid = uid
        ..todoDate = todoDate
        ..category = category,
    ),
  );

  return firestoreData;
}
