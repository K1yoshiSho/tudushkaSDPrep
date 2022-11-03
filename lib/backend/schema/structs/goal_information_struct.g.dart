// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'goal_information_struct.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GoalInformationStruct> _$goalInformationStructSerializer =
    new _$GoalInformationStructSerializer();

class _$GoalInformationStructSerializer
    implements StructuredSerializer<GoalInformationStruct> {
  @override
  final Iterable<Type> types = const [
    GoalInformationStruct,
    _$GoalInformationStruct
  ];
  @override
  final String wireName = 'GoalInformationStruct';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GoalInformationStruct object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'firestoreUtilData',
      serializers.serialize(object.firestoreUtilData,
          specifiedType: const FullType(FirestoreUtilData)),
    ];
    Object? value;
    value = object.goalName;
    if (value != null) {
      result
        ..add('goalName')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.goalDescription;
    if (value != null) {
      result
        ..add('goalDescription')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.dateStart;
    if (value != null) {
      result
        ..add('dateStart')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.dateEnd;
    if (value != null) {
      result
        ..add('dateEnd')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    return result;
  }

  @override
  GoalInformationStruct deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GoalInformationStructBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'goalName':
          result.goalName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'goalDescription':
          result.goalDescription = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'dateStart':
          result.dateStart = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
          break;
        case 'dateEnd':
          result.dateEnd = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
          break;
        case 'firestoreUtilData':
          result.firestoreUtilData = serializers.deserialize(value,
                  specifiedType: const FullType(FirestoreUtilData))!
              as FirestoreUtilData;
          break;
      }
    }

    return result.build();
  }
}

class _$GoalInformationStruct extends GoalInformationStruct {
  @override
  final String? goalName;
  @override
  final String? goalDescription;
  @override
  final DateTime? dateStart;
  @override
  final DateTime? dateEnd;
  @override
  final FirestoreUtilData firestoreUtilData;

  factory _$GoalInformationStruct(
          [void Function(GoalInformationStructBuilder)? updates]) =>
      (new GoalInformationStructBuilder()..update(updates))._build();

  _$GoalInformationStruct._(
      {this.goalName,
      this.goalDescription,
      this.dateStart,
      this.dateEnd,
      required this.firestoreUtilData})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        firestoreUtilData, r'GoalInformationStruct', 'firestoreUtilData');
  }

  @override
  GoalInformationStruct rebuild(
          void Function(GoalInformationStructBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GoalInformationStructBuilder toBuilder() =>
      new GoalInformationStructBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GoalInformationStruct &&
        goalName == other.goalName &&
        goalDescription == other.goalDescription &&
        dateStart == other.dateStart &&
        dateEnd == other.dateEnd &&
        firestoreUtilData == other.firestoreUtilData;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc($jc($jc(0, goalName.hashCode), goalDescription.hashCode),
                dateStart.hashCode),
            dateEnd.hashCode),
        firestoreUtilData.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GoalInformationStruct')
          ..add('goalName', goalName)
          ..add('goalDescription', goalDescription)
          ..add('dateStart', dateStart)
          ..add('dateEnd', dateEnd)
          ..add('firestoreUtilData', firestoreUtilData))
        .toString();
  }
}

class GoalInformationStructBuilder
    implements Builder<GoalInformationStruct, GoalInformationStructBuilder> {
  _$GoalInformationStruct? _$v;

  String? _goalName;
  String? get goalName => _$this._goalName;
  set goalName(String? goalName) => _$this._goalName = goalName;

  String? _goalDescription;
  String? get goalDescription => _$this._goalDescription;
  set goalDescription(String? goalDescription) =>
      _$this._goalDescription = goalDescription;

  DateTime? _dateStart;
  DateTime? get dateStart => _$this._dateStart;
  set dateStart(DateTime? dateStart) => _$this._dateStart = dateStart;

  DateTime? _dateEnd;
  DateTime? get dateEnd => _$this._dateEnd;
  set dateEnd(DateTime? dateEnd) => _$this._dateEnd = dateEnd;

  FirestoreUtilData? _firestoreUtilData;
  FirestoreUtilData? get firestoreUtilData => _$this._firestoreUtilData;
  set firestoreUtilData(FirestoreUtilData? firestoreUtilData) =>
      _$this._firestoreUtilData = firestoreUtilData;

  GoalInformationStructBuilder() {
    GoalInformationStruct._initializeBuilder(this);
  }

  GoalInformationStructBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _goalName = $v.goalName;
      _goalDescription = $v.goalDescription;
      _dateStart = $v.dateStart;
      _dateEnd = $v.dateEnd;
      _firestoreUtilData = $v.firestoreUtilData;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GoalInformationStruct other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GoalInformationStruct;
  }

  @override
  void update(void Function(GoalInformationStructBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GoalInformationStruct build() => _build();

  _$GoalInformationStruct _build() {
    final _$result = _$v ??
        new _$GoalInformationStruct._(
            goalName: goalName,
            goalDescription: goalDescription,
            dateStart: dateStart,
            dateEnd: dateEnd,
            firestoreUtilData: BuiltValueNullFieldError.checkNotNull(
                firestoreUtilData,
                r'GoalInformationStruct',
                'firestoreUtilData'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
