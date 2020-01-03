import 'package:flutter/material.dart';
import 'package:flutter_blocs_dev/bloc/bloc_provider.dart';
import 'package:flutter_blocs_dev/bloc/counter_bloc.dart';
import 'package:flutter_blocs_dev/bloc/text_bloc.dart';
import 'package:flutter_blocs_dev/ui/counter_screen.dart';
import 'package:flutter_blocs_dev/ui/text_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
      
        primarySwatch: Colors.blue,
      ),
      home: Interface(title: 'Mon premier bloc'),
    );
  }
}

class Interface extends StatelessWidget {
  final String title;
  final CounterBloc bloc = CounterBloc();
  Interface({this.title});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text('Veuillez faire un choix'),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              RaisedButton(
                onPressed: (){
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) {
                      return BlocProvider<CounterBloc>(
                        child: CounterScreen(),
                        bloc: CounterBloc(),
                      );
                    }
                  ));
                },
                child: Text('Compteur'),
              ),
              SizedBox(width: 10,),
              RaisedButton(
                onPressed: (){
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) {
                      return BlocProvider<TextBloc>(
                        child: TextScreen(title: 'TextBloc',),
                        bloc: TextBloc(),
                      );
                    }
                  ));
                },
                child: Text('Text'),
              )
            ],
          )
        ],
      ),
      
    );
  }
}

