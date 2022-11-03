// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'todo_list_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<TodoListRecord> _$todoListRecordSerializer =
    new _$TodoListRecordSerializer();

class _$TodoListRecordSerializer
    implements StructuredSerializer<TodoListRecord> {
  @override
  final Iterable<Type> types = const [TodoListRecord, _$TodoListRecord];
  @override
  final String wireName = 'TodoListRecord';

  @override
  Iterable<Object?> serialize(Serializers serializers, TodoListRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.todoName;
    if (value != null) {
      result
        ..add('todo_name')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.todoTime;
    if (value != null) {
      result
        ..add('todo_time')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.priority;
    if (value != null) {
      result
        ..add('priority')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
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
    value = object.status;
    if (value != null) {
      result
        ..add('status')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.uid;
    if (value != null) {
      result
        ..add('uid')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.todoDate;
    if (value != null) {
      result
        ..add('todoDate')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.category;
    if (value != null) {
      result
        ..add('category')
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
  TodoListRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new TodoListRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'todo_name':
          result.todoName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'todo_time':
          result.todoTime = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
          break;
        case 'priority':
          result.priority = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
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
        case 'status':
          result.status = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'uid':
          result.uid = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'todoDate':
          result.todoDate = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
          break;
        case 'category':
          result.category = serializers.deserialize(value,
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

class _$TodoListRecord extends TodoListRecord {
  @override
  final String? todoName;
  @override
  final DateTime? todoTime;
  @override
  final String? priority;
  @override
  final DocumentReference<Object?>? createdBy;
  @override
  final DateTime? createdAt;
  @override
  final bool? status;
  @override
  final String? uid;
  @override
  final DateTime? todoDate;
  @override
  final String? category;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$TodoListRecord([void Function(TodoListRecordBuilder)? updates]) =>
      (new TodoListRecordBuilder()..update(updates))._build();

  _$TodoListRecord._(
      {this.todoName,
      this.todoTime,
      this.priority,
      this.createdBy,
      this.createdAt,
      this.status,
      this.uid,
      this.todoDate,
      this.category,
      this.ffRef})
      : super._();

  @override
  TodoListRecord rebuild(void Function(TodoListRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  TodoListRecordBuilder toBuilder() =>
      new TodoListRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is TodoListRecord &&
        todoName == other.todoName &&
        todoTime == other.todoTime &&
        priority == other.priority &&
        createdBy == other.createdBy &&
        createdAt == other.createdAt &&
        status == other.status &&
        uid == other.uid &&
        todoDate == other.todoDate &&
        category == other.category &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc(
                        $jc(
                            $jc(
                                $jc(
                                    $jc($jc(0, todoName.hashCode),
                                        todoTime.hashCode),
                                    priority.hashCode),
                                createdBy.hashCode),
                            createdAt.hashCode),
                        status.hashCode),
                    uid.hashCode),
                todoDate.hashCode),
            category.hashCode),
        ffRef.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'TodoListRecord')
          ..add('todoName', todoName)
          ..add('todoTime', todoTime)
          ..add('priority', priority)
          ..add('createdBy', createdBy)
          ..add('createdAt', createdAt)
          ..add('status', status)
          ..add('uid', uid)
          ..add('todoDate', todoDate)
          ..add('category', category)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class TodoListRecordBuilder
    implements Builder<TodoListRecord, TodoListRecordBuilder> {
  _$TodoListRecord? _$v;

  String? _todoName;
  String? get todoName => _$this._todoName;
  set todoName(String? todoName) => _$this._todoName = todoName;

  DateTime? _todoTime;
  DateTime? get todoTime => _$this._todoTime;
  set todoTime(DateTime? todoTime) => _$this._todoTime = todoTime;

  String? _priority;
  String? get priority => _$this._priority;
  set priority(String? priority) => _$this._priority = priority;

  DocumentReference<Object?>? _createdBy;
  DocumentReference<Object?>? get createdBy => _$this._createdBy;
  set createdBy(DocumentReference<Object?>? createdBy) =>
      _$this._createdBy = createdBy;

  DateTime? _createdAt;
  DateTime? get createdAt => _$this._createdAt;
  set createdAt(DateTime? createdAt) => _$this._createdAt = createdAt;

  bool? _status;
  bool? get status => _$this._status;
  set status(bool? status) => _$this._status = status;

  String? _uid;
  String? get uid => _$this._uid;
  set uid(String? uid) => _$this._uid = uid;

  DateTime? _todoDate;
  DateTime? get todoDate => _$this._todoDate;
  set todoDate(DateTime? todoDate) => _$this._todoDate = todoDate;

  String? _category;
  String? get category => _$this._category;
  set category(String? category) => _$this._category = category;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  TodoListRecordBuilder() {
    TodoListRecord._initializeBuilder(this);
  }

  TodoListRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _todoName = $v.todoName;
      _todoTime = $v.todoTime;
      _priority = $v.priority;
      _createdBy = $v.createdBy;
      _createdAt = $v.createdAt;
      _status = $v.status;
      _uid = $v.uid;
      _todoDate = $v.todoDate;
      _category = $v.category;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(TodoListRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$TodoListRecord;
  }

  @override
  void update(void Function(TodoListRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  TodoListRecord build() => _build();

  _$TodoListRecord _build() {
    final _$result = _$v ??
        new _$TodoListRecord._(
            todoName: todoName,
            todoTime: todoTime,
            priority: priority,
            createdBy: createdBy,
            createdAt: createdAt,
            status: status,
            uid: uid,
            todoDate: todoDate,
            category: category,
            ffRef: ffRef);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
