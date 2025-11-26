import 'package:flutter/material.dart';

class RankingScreen extends StatelessWidget {
  const RankingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final userStats = {
      'pontos': 50,
      'diasSeguidos': 2,
      'posicao': 2,
    };

    final ranking = [
      {'pos': 1, 'nome': 'Joãozinho multitarefas', 'pontos': 80, 'cor': Colors.amber[100]},
      {'pos': 2, 'nome': 'Thaís Felício', 'pontos': 50, 'cor': Colors.grey[300]},
      {'pos': 3, 'nome': 'Nic', 'pontos': 45, 'cor': Colors.orange[100]},
      {'pos': 4, 'nome': 'Fulano', 'pontos': 45, 'cor': Colors.green[100]},
    ];

    return Scaffold(
      backgroundColor: const Color(0xFFFFF4EC), // cor de fundo suave
      bottomNavigationBar: _BottomBar(), // mesma barra do seu app
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 16),

            // Cabeçalho com estatísticas
            Container(
              decoration: BoxDecoration(
                color: Color(0xFFFFB2E0)
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _StatCard(
                      icon: 'lib/images/rating_star.png',
                      titulo: 'Meus pontos de\nmotivação',
                      valor: '${userStats['pontos']}',
                    ),
                    _StatCard(
                      icon: 'lib/images/cute_sun.png',
                      titulo: 'Dias de motivação\nseguidos',
                      valor: '${userStats['diasSeguidos']}',
                    ),
                    _StatCard(
                      icon: 'lib/images/medal.png',
                      titulo: 'Meu lugar no\nranking',
                      valor: '${userStats['posicao']}º',
                    ),
                  ],
                ),
              ),
            ),
            

            const SizedBox(height: 24),

            // Lista de ranking
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                itemCount: ranking.length,
                itemBuilder: (context, index) {
                  final item = ranking[index];
                  return Container(
                    margin: const EdgeInsets.only(bottom: 8),
                    decoration: BoxDecoration(
                      // color: //item['cor'],
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: ListTile(
                      leading: Text(
                        '${item['pos']}º',
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                      title: Text(
                        item['nome'].toString(),
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Image.asset('lib/images/rating_star.png'),
                          // const Icon(Icons.star, color: Colors.amber),
                          const SizedBox(width: 4),
                          Text(
                            '${item['pontos']}',
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _StatCard extends StatelessWidget {
  final String icon;
  final String titulo;
  final String valor;

  const _StatCard({
    required this.icon,
    required this.titulo,
    required this.valor,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          titulo,
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
        ),
        Row(
          children: [
            Image.asset(icon, width: 30,),
            // Text(emoji, style: const TextStyle(fontSize: 28)),
            const SizedBox(height: 6),
            
            const SizedBox(height: 4),
            Text(
              valor,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
          ],
        )
        
      ],
    );
  }
}

class _BottomBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFF9999FF),
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: const [
          _BottomIcon(icon: Icons.menu, label: 'Mais'),
          _BottomIcon(icon: Icons.checklist, label: 'Tarefas'),
          _BottomIcon(icon: Icons.calendar_today, label: 'Calendário'),
          _BottomIcon(icon: Icons.person, label: 'Perfil'),
          _BottomIcon(icon: Icons.emoji_events, label: 'Ranking'),
        ],
      ),
    );
  }
}

class _BottomIcon extends StatelessWidget {
  final IconData icon;
  final String label;

  const _BottomIcon({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, color: Colors.yellow, size: 26),
        const SizedBox(height: 4),
        Text(
          label,
          style: const TextStyle(color: Colors.yellow, fontSize: 12),
        ),
      ],
    );
  }
}
