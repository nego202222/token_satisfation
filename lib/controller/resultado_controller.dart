import 'package:flutter/material.dart';
import 'package:token_satisfation/model/resultado_model.dart';
import 'package:token_satisfation/view/votar_views.dart';

class ResultadosController{
  TextEditingController inputIdTerminal = TextEditingController();
  ResultadoModel resultadoModel = ResultadoModel();

  Future<ResultadoModel> obterResultado() async{
    return await ResultadoModel.obterResultado();
  }

 void iniciarVotacao(context){
    Navigator.push(context, 
    MaterialPageRoute(builder: (context) => VotarView(idTerminal:  inputIdTerminal.text)));
  } 
}