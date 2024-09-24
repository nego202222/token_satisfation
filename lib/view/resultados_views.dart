import 'package:flutter/material.dart';
import 'package:token_satisfation/controller/resultado_controller.dart';
import 'package:token_satisfation/model/resultado_model.dart';

class ResultadosView extends StatefulWidget {
  const ResultadosView({super.key});

  @override
  State<ResultadosView> createState() => _ResultadosViewState();
}

ResultadosController controller = ResultadosController();

class _ResultadosViewState extends State<ResultadosView> {
  ResultadosController controller = ResultadosController();
  Future<ResultadoModel>? resultados;

  Future<ResultadoModel> carregarDados() async {
    return await controller.obterResultado();
  }

  void initState() {
    super.initState();
    resultados = carregarDados();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Resultados')),
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              children: [
                FutureBuilder<ResultadoModel>(
                    future: resultados,
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return CircularProgressIndicator();
                      } else {
                        return Column(
                          children: [
                            Text('1 Estrela: ${snapshot.data!.resultados!.i1}\n' +
                                '2 Estrelas: ${snapshot.data!.resultados!.i2}\n' +
                                '3 Estrelas: ${snapshot.data!.resultados!.i3}\n' +
                                '4 Estrelas: ${snapshot.data!.resultados!.i4}\n' +
                                '5 Estrelas: ${snapshot.data!.resultados!.i5}'),
                            SizedBox(height: 10),
                            Text('votos por terminal'),
                            SizedBox(height: 10),
                            Text('T5002: ${snapshot.data!.votosPorTerminal!.t5002}\n' +
                                'T5003: ${snapshot.data!.votosPorTerminal!.t5003}\n' +
                                'T5004: ${snapshot.data!.votosPorTerminal!.t5004}\n' +
                                'T5005: ${snapshot.data!.votosPorTerminal!.t5005}\n' +
                                'T5006: ${snapshot.data!.votosPorTerminal!.t5006}\n')
                          ],
                        );
                      }
                    }),
                SizedBox(height: 20),
                TextField(
                  controller: controller.inputIdTerminal,
                  decoration: InputDecoration(labelText: "Número do Terminal"),
                ),
                SizedBox(height: 20),
                ElevatedButton.icon(
                    onPressed: () {
                      controller.iniciarVotacao(context);
                    }, label: Text("Iniciar Votação"))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
