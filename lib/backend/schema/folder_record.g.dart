// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'folder_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<FolderRecord> _$folderRecordSerializer =
    new _$FolderRecordSerializer();

class _$FolderRecordSerializer implements StructuredSerializer<FolderRecord> {
  @override
  final Iterable<Type> types = const [FolderRecord, _$FolderRecord];
  @override
  final String wireName = 'FolderRecord';

  @override
  Iterable<Object?> serialize(Serializers serializers, FolderRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.title;
    if (value != null) {
      result
        ..add('title')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
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
    value = object.notes;
    if (value != null) {
      result
        ..add('notes')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(BuiltList, const [
              const FullType(
                  DocumentReference, const [const FullType.nullable(Object)])
            ])));
    }
    value = object.uid;
    if (value != null) {
      result
        ..add('uid')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
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
  FolderRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new FolderRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'title':
          result.title = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
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
        case 'notes':
          result.notes.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, const [
                const FullType(
                    DocumentReference, const [const FullType.nullable(Object)])
              ]))! as BuiltList<Object?>);
          break;
        case 'uid':
          result.uid = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
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

class _$FolderRecord extends FolderRecord {
  @override
  final String? title;
  @override
  final DateTime? createdAt;
  @override
  final DocumentReference<Object?>? createdBy;
  @override
  final BuiltList<DocumentReference<Object?>>? notes;
  @override
  final String? uid;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$FolderRecord([void Function(FolderRecordBuilder)? updates]) =>
      (new FolderRecordBuilder()..update(updates))._build();

  _$FolderRecord._(
      {this.title,
      this.createdAt,
      this.createdBy,
      this.notes,
      this.uid,
      this.ffRef})
      : super._();

  @override
  FolderRecord rebuild(void Function(FolderRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  FolderRecordBuilder toBuilder() => new FolderRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is FolderRecord &&
        title == other.title &&
        createdAt == other.createdAt &&
        createdBy == other.createdBy &&
        notes == other.notes &&
        uid == other.uid &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc($jc($jc(0, title.hashCode), createdAt.hashCode),
                    createdBy.hashCode),
                notes.hashCode),
            uid.hashCode),
        ffRef.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'FolderRecord')
          ..add('title', title)
          ..add('createdAt', createdAt)
          ..add('createdBy', createdBy)
          ..add('notes', notes)
          ..add('uid', uid)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class FolderRecordBuilder
    implements Builder<FolderRecord, FolderRecordBuilder> {
  _$FolderRecord? _$v;

  String? _title;
  String? get title => _$this._title;
  set title(String? title) => _$this._title = title;

  DateTime? _createdAt;
  DateTime? get createdAt => _$this._createdAt;
  set createdAt(DateTime? createdAt) => _$this._createdAt = createdAt;

  DocumentReference<Object?>? _createdBy;
  DocumentReference<Object?>? get createdBy => _$this._createdBy;
  set createdBy(DocumentReference<Object?>? createdBy) =>
      _$this._createdBy = createdBy;

  ListBuilder<DocumentReference<Object?>>? _notes;
  ListBuilder<DocumentReference<Object?>> get notes =>
      _$this._notes ??= new ListBuilder<DocumentReference<Object?>>();
  set notes(ListBuilder<DocumentReference<Object?>>? notes) =>
      _$this._notes = notes;

  String? _uid;
  String? get uid => _$this._uid;
  set uid(String? uid) => _$this._uid = uid;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  FolderRecordBuilder() {
    FolderRecord._initializeBuilder(this);
  }

  FolderRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _title = $v.title;
      _createdAt = $v.createdAt;
      _createdBy = $v.createdBy;
      _notes = $v.notes?.toBuilder();
      _uid = $v.uid;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(FolderRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$FolderRecord;
  }

  @override
  void update(void Function(FolderRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  FolderRecord build() => _build();

  _$FolderRecord _build() {
    _$FolderRecord _$result;
    try {
      _$result = _$v ??
          new _$FolderRecord._(
              title: title,
              createdAt: createdAt,
              createdBy: createdBy,
              notes: _notes?.build(),
              uid: uid,
              ffRef: ffRef);
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'notes';
        _notes?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'FolderRecord', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
