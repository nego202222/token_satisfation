import 'package:token_satisfation/model/voto_model.dart';

class VotarController{

String? opc;
String? idterminal;
VotoModel? resultado;

Future<VotoModel> votar() async {
  return await VotoModel.votar(idterminal, opc);
}
  
}

