import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'folder_record.g.dart';

abstract class FolderRecord
    implements Built<FolderRecord, FolderRecordBuilder> {
  static Serializer<FolderRecord> get serializer => _$folderRecordSerializer;

  String? get title;

  @BuiltValueField(wireName: 'created_at')
  DateTime? get createdAt;

  @BuiltValueField(wireName: 'created_by')
  DocumentReference? get createdBy;

  BuiltList<DocumentReference>? get notes;

  String? get uid;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(FolderRecordBuilder builder) => builder
    ..title = ''
    ..notes = ListBuilder()
    ..uid = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('folder');

  static Stream<FolderRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<FolderRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  FolderRecord._();
  factory FolderRecord([void Function(FolderRecordBuilder) updates]) =
      _$FolderRecord;

  static FolderRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createFolderRecordData({
  String? title,
  DateTime? createdAt,
  DocumentReference? createdBy,
  String? uid,
}) {
  final firestoreData = serializers.toFirestore(
    FolderRecord.serializer,
    FolderRecord(
      (f) => f
        ..title = title
        ..createdAt = createdAt
        ..createdBy = createdBy
        ..notes = null
        ..uid = uid,
    ),
  );

  return firestoreData;
}
