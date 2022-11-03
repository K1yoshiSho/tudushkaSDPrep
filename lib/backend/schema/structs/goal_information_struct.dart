import 'dart:async';

import '../index.dart';
import '../serializers.dart';
import 'package:built_value/built_value.dart';

part 'goal_information_struct.g.dart';

abstract class GoalInformationStruct
    implements Built<GoalInformationStruct, GoalInformationStructBuilder> {
  static Serializer<GoalInformationStruct> get serializer =>
      _$goalInformationStructSerializer;

  String? get goalName;

  String? get goalDescription;

  DateTime? get dateStart;

  DateTime? get dateEnd;

  /// Utility class for Firestore updates
  FirestoreUtilData get firestoreUtilData;

  static void _initializeBuilder(GoalInformationStructBuilder builder) =>
      builder
        ..goalName = ''
        ..goalDescription = ''
        ..firestoreUtilData = FirestoreUtilData();

  GoalInformationStruct._();
  factory GoalInformationStruct(
          [void Function(GoalInformationStructBuilder) updates]) =
      _$GoalInformationStruct;
}

GoalInformationStruct createGoalInformationStruct({
  String? goalName,
  String? goalDescription,
  DateTime? dateStart,
  DateTime? dateEnd,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    GoalInformationStruct(
      (g) => g
        ..goalName = goalName
        ..goalDescription = goalDescription
        ..dateStart = dateStart
        ..dateEnd = dateEnd
        ..firestoreUtilData = FirestoreUtilData(
          clearUnsetFields: clearUnsetFields,
          create: create,
          delete: delete,
          fieldValues: fieldValues,
        ),
    );

GoalInformationStruct? updateGoalInformationStruct(
  GoalInformationStruct? goalInformation, {
  bool clearUnsetFields = true,
}) =>
    goalInformation != null
        ? (goalInformation.toBuilder()
              ..firestoreUtilData =
                  FirestoreUtilData(clearUnsetFields: clearUnsetFields))
            .build()
        : null;

void addGoalInformationStructData(
  Map<String, dynamic> firestoreData,
  GoalInformationStruct? goalInformation,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (goalInformation == null) {
    return;
  }
  if (goalInformation.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  if (!forFieldValue && goalInformation.firestoreUtilData.clearUnsetFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final goalInformationData =
      getGoalInformationFirestoreData(goalInformation, forFieldValue);
  final nestedData =
      goalInformationData.map((k, v) => MapEntry('$fieldName.$k', v));

  final create = goalInformation.firestoreUtilData.create;
  firestoreData.addAll(create ? mergeNestedFields(nestedData) : nestedData);

  return;
}

Map<String, dynamic> getGoalInformationFirestoreData(
  GoalInformationStruct? goalInformation, [
  bool forFieldValue = false,
]) {
  if (goalInformation == null) {
    return {};
  }
  final firestoreData = serializers.toFirestore(
      GoalInformationStruct.serializer, goalInformation);

  // Add any Firestore field values
  goalInformation.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getGoalInformationListFirestoreData(
  List<GoalInformationStruct>? goalInformations,
) =>
    goalInformations
        ?.map((g) => getGoalInformationFirestoreData(g, true))
        .toList() ??
    [];
