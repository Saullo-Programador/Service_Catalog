import 'package:flutter/material.dart';
import 'package:jobs_app/data/models/service_model.dart';
import 'package:jobs_app/presentation/components/Input_menu.dart';
import 'package:jobs_app/presentation/components/dialog_icon_menu.dart';
import 'package:jobs_app/presentation/components/my_button.dart';
import 'package:jobs_app/presentation/components/my_input.dart';
import 'package:jobs_app/presentation/controller/service_controller.dart';
import 'package:provider/provider.dart';

class ResisterScreen extends StatefulWidget {
  const ResisterScreen({super.key});

  @override
  State<ResisterScreen> createState() => _ResisterScreenState();
}

class _ResisterScreenState extends State<ResisterScreen> {
  final _formKey = GlobalKey<FormState>();
  final nameService = TextEditingController();
  final subtituloService = TextEditingController();
  final valorService = TextEditingController();
  String? tpmService;
  final descricaoService = TextEditingController();
  IconData? selectedIcon;

  void _showIconPicker() {
    showDialog(
      context: context,
      builder: (context) {
        return DialogIconMenu(
          onIconSelected: (icon) {
            setState(() {
              selectedIcon = icon;
            });
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('Criar Serviço', style: TextStyle(fontSize: 25)),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              child: SizedBox(
                width: double.infinity,
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      SizedBox(
                        height: 90,
                        width: 90,
                        child: Material(
                          color: Theme.of(context).primaryColor,
                          borderRadius: BorderRadius.circular(15),
                          child: InkWell(
                            borderRadius: BorderRadius.circular(15),
                            onTap: _showIconPicker,
                            child: Icon(
                              selectedIcon ?? Icons.add_rounded, // ou settings
                              color: Colors.white,
                              size: 40,
                            ),
                          ),
                        ),
                      ),

                      SizedBox(height: 20),

                      MyInput(
                        label: 'Nome',
                        controller: nameService,
                        height: 60,
                        hint: 'Office 19',
                        validator: (nameService) {
                          if (nameService == null || nameService.isEmpty) {
                            return 'Por favor, insira um Nome valido, Ex: Fume 100% completo';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 10),
                      MyInput(
                        label: 'Subtitulo',
                        controller: subtituloService,
                        height: 60,
                        hint: 'Vitalicio',
                        validator: (subtituloService) {
                          if (subtituloService == null ||
                              subtituloService.isEmpty) {
                            return 'Por favor, insira um subtitulo valido';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 10),
                      Row(
                        children: [
                          Expanded(
                            child: MyInput(
                              label: 'Valor',
                              controller: valorService,
                              height: 60,
                              hint: '1520',
                              keyboardType: TextInputType.number,
                              validator: (valorService) {
                                if (valorService == null ||
                                    valorService.isEmpty) {
                                  return 'Por favor, insira um valor existente';
                                }
                                if (double.tryParse(valorService) == null) {
                                  return 'Digite apenas números';
                                }
                                return null;
                              },
                            ),
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: InputMenu(
                              onChanged: (tpm) => tpmService = tpm,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      MyInput(
                        label: 'Descrição',
                        controller: descricaoService,
                        maxLines: 3,
                        hint: 'descrição detalhada',
                        validator: (descricaoService) {
                          if (descricaoService == null ||
                              descricaoService.isEmpty) {
                            return 'Por favor, insira um valor valido';
                          }
                          return null;
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Consumer<ServiceController>(
              builder: (_, controller, __) {
                if (!controller.isLoading) return const SizedBox.shrink();

                return Container(
                  child: const Center(child: CircularProgressIndicator()),
                );
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(20),
        child: Consumer<ServiceController>(
          builder: (_, controller, _) {
            return MyButton(
              text: 'Resistrar',
              onPressed: controller.isLoading
                  ? null
                  : () async {
                      if (!_formKey.currentState!.validate()) {
                        return;
                      }
                      final doubleValue =
                          double.tryParse(
                            valorService.text.replaceAll(',', '.'),
                          ) ??
                          0.0;

                      final service = ServiceModel(
                        id: '',
                        iconCode:
                            (selectedIcon ?? Icons.android_rounded).codePoint,
                        titulo: nameService.text,
                        subTitulo: subtituloService.text,
                        tpm: tpmService ?? '∞',
                        valor: doubleValue,
                        descricao: descricaoService.text,
                      );

                      try {
                        await context.read<ServiceController>().addService(
                          service,
                        );

                        if (context.mounted) {
                          Navigator.pop(context);
                        }
                      } catch (e) {
                        ScaffoldMessenger.of(
                          context,
                        ).showSnackBar(SnackBar(content: Text(e.toString())));
                      }
                    },
            );
          },
        ),
      ),
    );
  }
}
