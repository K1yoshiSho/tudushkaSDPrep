// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'goal_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GoalRecord> _$goalRecordSerializer = new _$GoalRecordSerializer();

class _$GoalRecordSerializer implements StructuredSerializer<GoalRecord> {
  @override
  final Iterable<Type> types = const [GoalRecord, _$GoalRecord];
  @override
  final String wireName = 'GoalRecord';

  @override
  Iterable<Object?> serialize(Serializers serializers, GoalRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'goalInformation',
      serializers.serialize(object.goalInformation,
          specifiedType: const FullType(GoalInformationStruct)),
    ];
    Object? value;
    value = object.createdAt;
    if (value != null) {
      result
        ..add('created_at')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.createdBy;
    if (value != null) {
      result
        ..add('created_by')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    value = object.ffRef;
    if (value != null) {
      result
        ..add('Document__Reference__Field')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    return result;
  }

  @override
  GoalRecord deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GoalRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'created_at':
          result.createdAt = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
          break;
        case 'created_by':
          result.createdBy = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
        case 'goalInformation':
          result.goalInformation.replace(serializers.deserialize(value,
                  specifiedType: const FullType(GoalInformationStruct))!
              as GoalInformationStruct);
          break;
        case 'Document__Reference__Field':
          result.ffRef = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
      }
    }

    return result.build();
  }
}

class _$GoalRecord extends GoalRecord {
  @override
  final DateTime? createdAt;
  @override
  final DocumentReference<Object?>? createdBy;
  @override
  final GoalInformationStruct goalInformation;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$GoalRecord([void Function(GoalRecordBuilder)? updates]) =>
      (new GoalRecordBuilder()..update(updates))._build();

  _$GoalRecord._(
      {this.createdAt,
      this.createdBy,
      required this.goalInformation,
      this.ffRef})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        goalInformation, r'GoalRecord', 'goalInformation');
  }

  @override
  GoalRecord rebuild(void Function(GoalRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GoalRecordBuilder toBuilder() => new GoalRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GoalRecord &&
        createdAt == other.createdAt &&
        createdBy == other.createdBy &&
        goalInformation == other.goalInformation &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc(0, createdAt.hashCode), createdBy.hashCode),
            goalInformation.hashCode),
        ffRef.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GoalRecord')
          ..add('createdAt', createdAt)
          ..add('createdBy', createdBy)
          ..add('goalInformation', goalInformation)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class GoalRecordBuilder implements Builder<GoalRecord, GoalRecordBuilder> {
  _$GoalRecord? _$v;

  DateTime? _createdAt;
  DateTime? get createdAt => _$this._createdAt;
  set createdAt(DateTime? createdAt) => _$this._createdAt = createdAt;

  DocumentReference<Object?>? _createdBy;
  DocumentReference<Object?>? get createdBy => _$this._createdBy;
  set createdBy(DocumentReference<Object?>? createdBy) =>
      _$this._createdBy = createdBy;

  GoalInformationStructBuilder? _goalInformation;
  GoalInformationStructBuilder get goalInformation =>
      _$this._goalInformation ??= new GoalInformationStructBuilder();
  set goalInformation(GoalInformationStructBuilder? goalInformation) =>
      _$this._goalInformation = goalInformation;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  GoalRecordBuilder() {
    GoalRecord._initializeBuilder(this);
  }

  GoalRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _createdAt = $v.createdAt;
      _createdBy = $v.createdBy;
      _goalInformation = $v.goalInformation.toBuilder();
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GoalRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GoalRecord;
  }

  @override
  void update(void Function(GoalRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GoalRecord build() => _build();

  _$GoalRecord _build() {
    _$GoalRecord _$result;
    try {
      _$result = _$v ??
          new _$GoalRecord._(
              createdAt: createdAt,
              createdBy: createdBy,
              goalInformation: goalInformation.build(),
              ffRef: ffRef);
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'goalInformation';
        goalInformation.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GoalRecord', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
