import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:jobs_app/presentation/components/filter_button.dart';
import 'package:jobs_app/presentation/components/item_service.dart';
import 'package:jobs_app/presentation/components/my_input.dart';
import 'package:jobs_app/presentation/components/my_sheet.dart';
import 'package:jobs_app/presentation/controller/service_controller.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  void _showExcluirServico(VoidCallback onTab) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text('Excluir serviço'),
        content: Text('Tem certeza que deseja excluir este serviço'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancelar'),
          ),
          TextButton(
            onPressed: () {
              onTab();
              Navigator.pop(context);
            },
            child: const Text('Excluir', style: TextStyle(color: Colors.red)),
          ),
        ],
      ),
    );
  }

  final search = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final services = context.watch<ServiceController>().items;
    final controller = context.watch<ServiceController>();
    final deleteService = context.watch<ServiceController>().deleteService;

    return Scaffold(
      appBar: AppBar(
        title: Text('Catalago', style: TextStyle(fontSize: 25)),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).primaryColor,
        onPressed: () => context.push('/Resister'),
        child: const Icon(Icons.add_rounded, color: Colors.white, size: 30),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
          child: SizedBox(
            width: double.infinity,
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: MyInput(
                        label: 'Serviço',
                        controller: search,
                        height: 60,
                        hint: 'Office',
                        icon: Icons.search_rounded,
                        validator: (search) {
                          if (search == null || search.isEmpty) {
                            return 'Por favor, insira um serviço existente';
                          }
                          return null;
                        },
                      ),
                    ),

                    const SizedBox(width: 12),

                    FilterButton(
                      onTap: () {},
                    ),
                  ],
                ),
                SizedBox(height: 10),

                Expanded(
                  child: controller.isLoading
                      ? const Center(child: CircularProgressIndicator())
                      : controller.items.isEmpty
                      ? const Center(child: Text('Nenhum Serviço'))
                      : RefreshIndicator(
                          onRefresh: controller.refresh,
                          child: ListView.builder(
                            itemCount: services.length,
                            itemBuilder: (_, i) {
                              final s = services[i];
                              return ItemService(
                                icon: s.icon,
                                title: s.titulo,
                                subtitulo: s.subTitulo,
                                valor: s.valor,
                                onDelete: () {
                                  _showExcluirServico(() => deleteService(s.id));
                                },
                                onEdit: () {},
                                onTap: () {
                                  showModalBottomSheet(
                                    backgroundColor: Colors.transparent,
                                    context: context,
                                    isScrollControlled: true,
                                    builder: (_) => MySheet(
                                      icon: s.icon,
                                      valor: s.valor,
                                      titulo: s.titulo,
                                      duracao: s.tpm,
                                      subTitulo: s.subTitulo,
                                      descricao: s.descricao,
                                    ),
                                  );
                                },
                              );
                            },
                          ),
                        ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
