import 'package:flutter/material.dart';
import 'package:flutter_blocs_dev/bloc/bloc.dart';

class BlocProvider<T extends Bloc> extends StatefulWidget {
  // Bloc en question
  final T bloc;
  // child  va s'occuper du bloc
  final Widget child;
  //contructeur
  BlocProvider({@required this.bloc,@required this.child});
  // valeur du Type
  static Type _providerType<T>() => T;

  //configuration du bloc
  @Deprecated('')
  static T of<T extends Bloc>(BuildContext context){
    final type = _providerType<BlocProvider<T>>();
    final BlocProvider provider = context.ancestorWidgetOfExactType(type);
    return provider.bloc;
  }


  State createState() => _BlocProvider();
}

class _BlocProvider extends State<BlocProvider>{

 @override
  void dispose() {
    widget.bloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    
    return widget.child;
  }

}