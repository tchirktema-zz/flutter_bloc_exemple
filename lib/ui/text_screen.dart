import 'package:flutter/material.dart';
import 'package:flutter_blocs_dev/bloc/bloc_provider.dart';
import 'package:flutter_blocs_dev/bloc/text_bloc.dart';

class TextScreen extends StatelessWidget {
  final String title;
  TextScreen({@required this.title});

  @override
  @Deprecated('')
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<TextBloc>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          StreamBuilder(
            stream: bloc.stream,
            builder: (context,snp){
              if(snp == null){
                return Text("Le snpashot est null");
              }else if(snp.hasData){
                return Column(
                  children: <Widget>[
                    Text('Vous avez entrer :'),
                    Text(snp.data.toString())
                  ],
                );
              }else {
                return Text("Le snapshot n'a pas de donnees");
              }
            },
          ),
          TextField(
            decoration: InputDecoration(
              hintText: "Saissez un text"
            ),
            onChanged: ((string) => bloc.updateText(string)),
          )
        ],
      ),
    );
  }
}