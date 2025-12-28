import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:jobs_app/presentation/components/my_button.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(
          left: 40,
          right: 40,
          bottom: 40,
          top: 40,
        ),
        child: MyButton(
          text: "Start",
          onPressed: () => context.push('/Home'),
          icon: Icons.arrow_forward_rounded,
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 35),
          child: SizedBox(
            height: double.infinity,
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  'Crie seu Catalago',
                  style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
                Text(
                  'Crie tabelas de preços de seus serviços e produtos para se organizar melhor e não passar preços errados',
                  style: TextStyle(fontSize: 20, color: Colors.grey[600]),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
