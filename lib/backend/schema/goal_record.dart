import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'goal_record.g.dart';

abstract class GoalRecord implements Built<GoalRecord, GoalRecordBuilder> {
  static Serializer<GoalRecord> get serializer => _$goalRecordSerializer;

  @BuiltValueField(wireName: 'created_at')
  DateTime? get createdAt;

  @BuiltValueField(wireName: 'created_by')
  DocumentReference? get createdBy;

  GoalInformationStruct get goalInformation;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(GoalRecordBuilder builder) =>
      builder..goalInformation = GoalInformationStructBuilder();

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('goal');

  static Stream<GoalRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<GoalRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  GoalRecord._();
  factory GoalRecord([void Function(GoalRecordBuilder) updates]) = _$GoalRecord;

  static GoalRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createGoalRecordData({
  DateTime? createdAt,
  DocumentReference? createdBy,
  GoalInformationStruct? goalInformation,
}) {
  final firestoreData = serializers.toFirestore(
    GoalRecord.serializer,
    GoalRecord(
      (g) => g
        ..createdAt = createdAt
        ..createdBy = createdBy
        ..goalInformation = GoalInformationStructBuilder(),
    ),
  );

  // Handle nested data for "goalInformation" field.
  addGoalInformationStructData(
      firestoreData, goalInformation, 'goalInformation');

  return firestoreData;
}
