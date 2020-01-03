
import 'package:flutter/material.dart';
import 'package:flutter_blocs_dev/bloc/bloc_provider.dart';
import 'package:flutter_blocs_dev/bloc/counter_bloc.dart';

class CounterScreen extends StatelessWidget {
  
  @override
  @Deprecated('')
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<CounterBloc>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Compteur'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          StreamBuilder(
            stream: bloc.stream,
            builder: (context,snapshot){
              if(snapshot.hasData){
                return Text(
                  snapshot.data.toString(),
                  style: TextStyle(
                    fontSize: 30
                  ),
                );
              } else{
                return Text('Le compteur est null');
              }
            },
          ),
          SizedBox(height: 10,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              RaisedButton(
                color: Colors.green,
                child: Text('+'),
                onPressed: () => bloc.increment(),
              ),
              SizedBox(
                width: 10,
              ),
              RaisedButton(
                color: Colors.deepOrange,
                child: Text('-'),
                onPressed: () => bloc.decrement(),
              )
            ],
          )
        ],
      ),
    );
  }
}