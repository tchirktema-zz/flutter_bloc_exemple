import 'dart:async';

import 'package:flutter_blocs_dev/bloc/bloc.dart';

class TextBloc extends Bloc {
  String text;
  StreamController _streamController = StreamController<String>();
  Sink get sink => _streamController.sink;
  Stream get stream => _streamController.stream;

  TextBloc() {
    sink.add(text);
  }

  updateText(String string){

    sink.add(string);
  }

  @override
  dispose() => _streamController.close();

}