part of 'api_data_bloc.dart';

abstract class DataEvent extends Equatable {
  const DataEvent();

  @override
  List<Object> get props => [];
}

class IndexDataEvent extends DataEvent{
  final WhereCriteria? where;

  const IndexDataEvent({this.where});
}
class StreamDataEvent extends DataEvent{
  final WhereCriteria? where;

  const StreamDataEvent({this.where});
}

class DeleteDataEvent extends DataEvent{
  final String id;
  final String modelKey;
  final List<String>? files;
  // final List<String>? image;

  const DeleteDataEvent({required this.id, this.modelKey = 'id', this.files,});
}
class DeleteMessageDataEvent extends DataEvent{
  final String id;
  final String modelKey;
  final List<String>? files;
  // final List<String>? image;

  const DeleteMessageDataEvent({required this.id, this.modelKey = 'id', this.files,});
}

class UpdateDataEvent extends DataEvent{
  final String id;
  final Map<String, dynamic> data;
  final String modelKey;

  const UpdateDataEvent({
    required this.id, 
    required this.data,
    this.modelKey = 'id',
  });
}

class StoreDataEvent extends DataEvent{
  final Map<String, dynamic> data;

  const StoreDataEvent({
    required this.data,
  });
}
class StoreMessageDataEvent extends DataEvent{
  final Map<String, dynamic> data;

  const StoreMessageDataEvent({
    required this.data,
  });
}

// Query<Map<String, dynamic>> where(
//   Object field, {
//   Object? isEqualTo,
//   Object? isNotEqualTo,
//   Object? isLessThan,
//   Object? isLessThanOrEqualTo,
//   Object? isGreaterThan,
//   Object? isGreaterThanOrEqualTo,
//   Object? arrayContains,
//   List<Object?>? arrayContainsAny,
//   List<Object?>? whereIn,
//   List<Object?>? whereNotIn,
//   bool? isNull,
// });