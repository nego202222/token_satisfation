import 'package:flutter/material.dart';
import 'package:flutter_emoji_feedback/flutter_emoji_feedback.dart';
import 'package:status_alert/status_alert.dart';
import 'package:token_satisfation/controller/votar_controller.dart';
import 'package:token_satisfation/view/resultados_views.dart';

class VotarView extends StatefulWidget {
  final String idTerminal;
  const VotarView({super.key, required this.idTerminal});

  @override
  State<VotarView> createState() => _VotarViewState();
}
VotarController controller = VotarController();

class _VotarViewState extends State<VotarView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Feedback'),
      ),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Gostou do papazinho?',
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            EmojiFeedback(
              animDuration: const Duration(milliseconds: 300),
              curve: Curves.bounceIn,
              inactiveElementScale: .5,
              labelTextStyle:
                  TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              customLabels: [
                'porcaria',
                'bem ruim',
                'quase la',
                'top',
                'show de bola '
              ],
              onChanged: (value) async{

                controller.opc = value.toString();
                controller.idterminal = widget.idTerminal;
               
                controller.resultado = await controller.votar();
                  
                StatusAlert.show(
                  context,
                  duration: Duration(seconds: 2),
                  title: controller.resultado!.msg,
                  subtitle: '',
                  configuration: IconConfiguration(
                    icon: controller.resultado!.codMsg == '1' ? Icons.done : Icons.error,),


                  maxWidth: 260,
                );
                setState(() {
                  print(value);
                });
              },
            )
          ],
        ),
      ),
    );
  }
}
