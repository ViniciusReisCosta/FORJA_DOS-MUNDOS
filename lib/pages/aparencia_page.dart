
import 'package:flutter/material.dart';

class aparenciapage extends StatefulWidget {
  const aparenciapage({super.key});

  @override
  State<aparenciapage> createState() =>
      _EscolhaGeneroPageState();
}

class _EscolhaGeneroPageState extends State<aparenciapage> {
  String generoSelecionado = 'Masculino';

  static const fundo = Color(0xFF080812);
  static const roxo = Color(0xFF922BFF);
  static const dourado = Color(0xFFFFC45C);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: fundo,
      body: SafeArea(
        child: Column(
          children: [
            // Cabeçalho
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 12, 16, 8),
              child: Row(
                children: [
                  IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: const Icon(
                      Icons.arrow_back_ios,
                      size: 18,
                      color: Colors.white,
                    ),
                  ),
                  const Expanded(
                    child: Text(
                      'FORJA DOS MUNDOS',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 11,
                        letterSpacing: 1.5,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  const SizedBox(width: 40),
                ],
              ),
            ),

            // Progresso 2/5
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 24,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    '2/5',
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 11,
                    ),
                  ),
                  const SizedBox(height: 8),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: const LinearProgressIndicator(
                      value: 0.4,
                      minHeight: 4,
                      backgroundColor: Color(0xFF252033),
                      valueColor: AlwaysStoppedAnimation<Color>(
                        roxo,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // Título
            const Padding(
              padding: EdgeInsets.fromLTRB(24, 22, 24, 18),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'ESCOLHA SEU GÊNERO',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 0.5,
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    'Esta escolha não limita sua experiência '
                    'de jogo.',
                    style: TextStyle(
                      color: Colors.white60,
                      fontSize: 11,
                    ),
                  ),
                ],
              ),
            ),

            // Cartões de gênero
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: _cartaoGenero(
                        titulo: 'Masculino',
                        imagem: 'assets/personagem_masculino.png',
                      ),
                    ),
                    const SizedBox(width: 14),
                    Expanded(
                      child: _cartaoGenero(
                        titulo: 'Feminino',
                        imagem: 'assets/personagem_feminino.png',
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // Botões inferiores
            Padding(
              padding: const EdgeInsets.fromLTRB(
                24, 12, 24, 20,
              ),
              child: Row(
                children: [
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () => Navigator.pop(context),
                      style: OutlinedButton.styleFrom(
                        foregroundColor: Colors.white70,
                        side: const BorderSide(
                          color: Color(0xFF494052),
                        ),
                        minimumSize: const Size(0, 42),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: const Text(
                        'VOLTAR',
                        style: TextStyle(fontSize: 11),
                      ),
                    ),
                  ),
                  const SizedBox(width: 14),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              'Gênero selecionado: '
                              '$generoSelecionado',
                            ),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: roxo,
                        foregroundColor: Colors.white,
                        minimumSize: const Size(0, 42),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'PRÓXIMO',
                            style: TextStyle(
                              fontSize: 11,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(width: 6),
                          Icon(Icons.chevron_right, size: 18),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _cartaoGenero({
    required String titulo,
    required String imagem,
  }) {
    final selecionado = generoSelecionado == titulo;

    return GestureDetector(
      onTap: () {
        setState(() {
          generoSelecionado = titulo;
        });
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        height: 240,
        decoration: BoxDecoration(
          color: const Color(0xFF100D19),
          borderRadius: BorderRadius.circular(14),
          border: Border.all(
            color: selecionado
                ? roxo
                : const Color(0xFF393240),
            width: selecionado ? 1.5 : 1,
          ),
          boxShadow: selecionado
              ? [
                  BoxShadow(
                    color: roxo.withValues(alpha: 0.25),
                    blurRadius: 12,
                  ),
                ]
              : [],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Column(
            children: [
              Expanded(
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    Image.asset(
                      imagem,
                      fit: BoxFit.cover,
                      errorBuilder: (_, __, ___) {
                        return Container(
                          color: const Color(0xFF1B1428),
                          child: const Center(
                            child: Icon(
                              Icons.person,
                              color: Colors.white38,
                              size: 70,
                            ),
                          ),
                        );
                      },
                    ),
                    Positioned(
                      top: 8,
                      right: 8,
                      child: Icon(
                        selecionado
                            ? Icons.check_circle
                            : Icons.radio_button_unchecked,
                        color: selecionado
                            ? roxo
                            : Colors.white38,
                        size: 22,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 12,
                  horizontal: 4,
                ),
                child: Text(
                  titulo,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: selecionado
                        ? Colors.white
                        : Colors.white70,
                    fontSize: 12,
                    fontWeight: selecionado
                        ? FontWeight.bold
                        : FontWeight.normal,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
