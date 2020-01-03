import 'dart:async';

import 'package:flutter_blocs_dev/bloc/bloc.dart';

class CounterBloc extends Bloc{

  int count = 0;
  final _streamController = StreamController<int>();

  Sink<int> get sink => _streamController.sink;
  Stream<int> get stream => _streamController.stream;

  CounterBloc(){
    sink.add(count);
  }

  increment(){
    count = count +1;
    sink.add(count);
  }

  decrement(){
    count = count -1;
    sink.add(count);
  }


  @override
  dispose() => _streamController.close();

}