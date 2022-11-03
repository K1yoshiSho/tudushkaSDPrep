// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'todo_category_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<TodoCategoryRecord> _$todoCategoryRecordSerializer =
    new _$TodoCategoryRecordSerializer();

class _$TodoCategoryRecordSerializer
    implements StructuredSerializer<TodoCategoryRecord> {
  @override
  final Iterable<Type> types = const [TodoCategoryRecord, _$TodoCategoryRecord];
  @override
  final String wireName = 'TodoCategoryRecord';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, TodoCategoryRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.categoryName;
    if (value != null) {
      result
        ..add('category_name')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.todo;
    if (value != null) {
      result
        ..add('todo')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(BuiltList, const [
              const FullType(
                  DocumentReference, const [const FullType.nullable(Object)])
            ])));
    }
    value = object.createdBy;
    if (value != null) {
      result
        ..add('created_by')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    value = object.createdAt;
    if (value != null) {
      result
        ..add('created_at')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
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
  TodoCategoryRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new TodoCategoryRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'category_name':
          result.categoryName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'todo':
          result.todo.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, const [
                const FullType(
                    DocumentReference, const [const FullType.nullable(Object)])
              ]))! as BuiltList<Object?>);
          break;
        case 'created_by':
          result.createdBy = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
        case 'created_at':
          result.createdAt = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
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

class _$TodoCategoryRecord extends TodoCategoryRecord {
  @override
  final String? categoryName;
  @override
  final BuiltList<DocumentReference<Object?>>? todo;
  @override
  final DocumentReference<Object?>? createdBy;
  @override
  final DateTime? createdAt;
  @override
  final String? uid;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$TodoCategoryRecord(
          [void Function(TodoCategoryRecordBuilder)? updates]) =>
      (new TodoCategoryRecordBuilder()..update(updates))._build();

  _$TodoCategoryRecord._(
      {this.categoryName,
      this.todo,
      this.createdBy,
      this.createdAt,
      this.uid,
      this.ffRef})
      : super._();

  @override
  TodoCategoryRecord rebuild(
          void Function(TodoCategoryRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  TodoCategoryRecordBuilder toBuilder() =>
      new TodoCategoryRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is TodoCategoryRecord &&
        categoryName == other.categoryName &&
        todo == other.todo &&
        createdBy == other.createdBy &&
        createdAt == other.createdAt &&
        uid == other.uid &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc($jc($jc(0, categoryName.hashCode), todo.hashCode),
                    createdBy.hashCode),
                createdAt.hashCode),
            uid.hashCode),
        ffRef.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'TodoCategoryRecord')
          ..add('categoryName', categoryName)
          ..add('todo', todo)
          ..add('createdBy', createdBy)
          ..add('createdAt', createdAt)
          ..add('uid', uid)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class TodoCategoryRecordBuilder
    implements Builder<TodoCategoryRecord, TodoCategoryRecordBuilder> {
  _$TodoCategoryRecord? _$v;

  String? _categoryName;
  String? get categoryName => _$this._categoryName;
  set categoryName(String? categoryName) => _$this._categoryName = categoryName;

  ListBuilder<DocumentReference<Object?>>? _todo;
  ListBuilder<DocumentReference<Object?>> get todo =>
      _$this._todo ??= new ListBuilder<DocumentReference<Object?>>();
  set todo(ListBuilder<DocumentReference<Object?>>? todo) =>
      _$this._todo = todo;

  DocumentReference<Object?>? _createdBy;
  DocumentReference<Object?>? get createdBy => _$this._createdBy;
  set createdBy(DocumentReference<Object?>? createdBy) =>
      _$this._createdBy = createdBy;

  DateTime? _createdAt;
  DateTime? get createdAt => _$this._createdAt;
  set createdAt(DateTime? createdAt) => _$this._createdAt = createdAt;

  String? _uid;
  String? get uid => _$this._uid;
  set uid(String? uid) => _$this._uid = uid;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  TodoCategoryRecordBuilder() {
    TodoCategoryRecord._initializeBuilder(this);
  }

  TodoCategoryRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _categoryName = $v.categoryName;
      _todo = $v.todo?.toBuilder();
      _createdBy = $v.createdBy;
      _createdAt = $v.createdAt;
      _uid = $v.uid;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(TodoCategoryRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$TodoCategoryRecord;
  }

  @override
  void update(void Function(TodoCategoryRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  TodoCategoryRecord build() => _build();

  _$TodoCategoryRecord _build() {
    _$TodoCategoryRecord _$result;
    try {
      _$result = _$v ??
          new _$TodoCategoryRecord._(
              categoryName: categoryName,
              todo: _todo?.build(),
              createdBy: createdBy,
              createdAt: createdAt,
              uid: uid,
              ffRef: ffRef);
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'todo';
        _todo?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'TodoCategoryRecord', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
