import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'api_data_event.dart';
part 'api_data_state.dart';

class ApiDataBloc<T> extends Bloc<DataEvent, DataState> {
  ApiDataBloc() : super(DataLoadingState()) {
    on<DataIndexEvent>(_index);
  }

  void _index(DataIndexEvent event, Emitter emit) {

  }
}
