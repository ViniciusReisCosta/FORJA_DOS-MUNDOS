
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:forja/pages/aparencia_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // A arte já contém a barra de status.
  await SystemChrome.setEnabledSystemUIMode(
    SystemUiMode.immersiveSticky,
  );

  runApp(const ForjaApp());
}

class ForjaApp extends StatelessWidget {
  const ForjaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Forja dos Mundos',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: const Color(0xFF08051B),
        useMaterial3: true,
      ),
      home: const ForjaSplashPage(),
    );
  }
}

class ForjaSplashPage extends StatelessWidget {
  const ForjaSplashPage({super.key});

  void _abrirCriacao(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => const CriacaoPersonagemPage(),
      ),
    );
  }

  void _abrirLogin(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Tela de login em desenvolvimento.'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          return Stack(
            fit: StackFit.expand,
            children: [
              // Arte completa da tela inicial.
              Image.asset(
                'assets/forja_splash.png',
                fit: BoxFit.cover,
                alignment: Alignment.center,
                errorBuilder: (context, error, stackTrace) {
                  return const ColoredBox(
                    color: Color(0xFF08051B),
                    child: Center(
                      child: Text(
                        'Imagem não encontrada.\n'
                        'Verifique assets/forja_splash.png',
                        textAlign: TextAlign.center,
                      ),
                    ),
                  );
                },
              ),

              // Área clicável posicionada sobre COMEÇAR.
             Positioned(
                  left: constraints.maxWidth * 0.18,
                  right: constraints.maxWidth * 0.18,
                  bottom: constraints.maxHeight * 0.16,
                  height: constraints.maxHeight * 0.10,
                  child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                      onTap: () => _abrirCriacao(context),
                      borderRadius: BorderRadius.circular(18),
                      child: Container(
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          gradient: const LinearGradient(
                            colors: [
                              Color(0xFF35006B),
                              Color(0xFF19002F),
                              Color(0xFF35006B),
                            ],
                          ),
                          borderRadius: BorderRadius.circular(18),
                          border: Border.all(
                            color: const Color(0xFFE34BFF),
                            width: 1.5,
                          ),
                          boxShadow: const [
                            BoxShadow(
                              color: Color(0xFFB52BFF),
                              blurRadius: 10,
                              spreadRadius: 1,
                            ),
                          ],
                        ),
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'COMEÇAR',
                              style: TextStyle(
                                color: Color(0xFFFFF0FF),
                                fontSize: 18,
                                letterSpacing: 2,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            SizedBox(width: 35),
                            Icon(
                              Icons.chevron_right,
                              color: Color(0xFFFFF0FF),
                              size: 26,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
            Positioned(
                left: constraints.maxWidth * 0.18,
                right: constraints.maxWidth * 0.18,
                bottom: constraints.maxHeight * 0.06,
                height: constraints.maxHeight * 0.08,
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    onTap: () => _abrirLogin(context),
                    borderRadius: BorderRadius.circular(18),
                    child: Container(
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          colors: [
                            Color(0xFF10051F),
                            Color(0xFF080315),
                            Color(0xFF180729),
                          ],
                        ),
                        borderRadius: BorderRadius.circular(18),
                        border: Border.all(
                          color: const Color(0xFF922BFF),
                          width: 1.3,
                        ),
                        boxShadow: const [
                          BoxShadow(
                            color: Color(0xFF7B20FF),
                            blurRadius: 9,
                          ),
                        ],
                      ),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.person_outline,
                            color: Color(0xFFDDBBFF),
                            size: 23,
                          ),
                          SizedBox(width: 18),
                          Text(
                            '│',
                            style: TextStyle(
                              color: Color(0xFF922BFF),
                              fontSize: 20,
                            ),
                          ),
                          SizedBox(width: 18),
                          Text(
                            'LOGIN',
                            style: TextStyle(
                              color: Color(0xFFD8C6E8),
                              fontSize: 13,
                              letterSpacing: 2,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

// Próxima tela: início da criação do personagem.
class CriacaoPersonagemPage extends StatefulWidget {
  const CriacaoPersonagemPage({super.key});

  @override
  State<CriacaoPersonagemPage> createState() =>
      _CriacaoPersonagemPageState();
}

class _CriacaoPersonagemPageState
    extends State<CriacaoPersonagemPage> {
  String classeSelecionada = 'Guerreiro';

  final List<Map<String, String>> classes = [
    {
      'nome': 'Guerreiro',
      'descricao': 'Força, resistência e combate corpo a corpo.',
      'icone': '⚔',
    },
    {
      'nome': 'Mago',
      'descricao': 'Domine a magia e os poderes elementais.',
      'icone': '✧',
    },
    {
      'nome': 'Arqueiro',
      'descricao': 'Precisão, agilidade e ataques à distância.',
      'icone': '➶',
    },
    {
      'nome': 'Sacerdote',
      'descricao': 'Cura, suporte e proteção dos aliados.',
      'icone': '✦',
    },
    {
      'nome': 'Ladino',
      'descricao': 'Velocidade, furtividade e estratégia.',
      'icone': '☠',
    },
  ];

  static const dourado = Color(0xFFFFC45C);
  static const roxo = Color(0xFF8B24F5);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xFF100A23),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () => Navigator.pop(context),
          ),
          title: const Text(
            'FORJA DOS MUNDOS',
            style: TextStyle(
              fontFamily: 'serif',
              fontSize: 16,
              letterSpacing: 1.5,
              color: dourado,
            ),
          ),
          centerTitle: true,
        ),
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color(0xFF100A23),
                Color(0xFF080812),
              ],
            ),
          ),
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(22),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    '1/5  •  SUA JORNADA COMEÇA',
                    style: TextStyle(
                      color: dourado,
                      fontSize: 11,
                      letterSpacing: 2,
                    ),
                  ),
                  const SizedBox(height: 18),
                  const Text(
                    'ESCOLHA SUA CLASSE',
                    style: TextStyle(
                      fontFamily: 'serif',
                      fontSize: 27,
                      fontWeight: FontWeight.bold,
                      color: dourado,
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'Cada herói possui habilidades únicas. '
                    'Qual será o seu caminho?',
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 14,
                      height: 1.5,
                    ),
                  ),
                  const SizedBox(height: 22),
      
                  Expanded(
                    child: ListView.separated(
                      itemCount: classes.length,
                      separatorBuilder: (_, __) =>
                          const SizedBox(height: 10),
                      itemBuilder: (context, index) {
                        final item = classes[index];
                        final nome = item['nome']!;
                        final selecionado =
                            classeSelecionada == nome;
      
                        return InkWell(
                          borderRadius: BorderRadius.circular(14),
                          onTap: () {
                            setState(() {
                              classeSelecionada = nome;
                            });
                          },
                          child: AnimatedContainer(
                            duration:
                                const Duration(milliseconds: 180),
                            padding: const EdgeInsets.all(15),
                            decoration: BoxDecoration(
                              color: selecionado
                                  ? const Color(0xFF281440)
                                  : const Color(0xFF11101C),
                              borderRadius: BorderRadius.circular(14),
                              border: Border.all(
                                color: selecionado
                                    ? roxo
                                    : const Color(0xFF373044),
                                width: selecionado ? 1.5 : 1,
                              ),
                            ),
                            child: Row(
                              children: [
                                Container(
                                  width: 48,
                                  height: 48,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.circular(12),
                                    border: Border.all(
                                      color: dourado.withValues(
                                        alpha: 0.55,
                                      ),
                                    ),
                                  ),
                                  child: Text(
                                    item['icone']!,
                                    style: const TextStyle(
                                      color: dourado,
                                      fontSize: 25,
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 14),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        nome,
                                        style: const TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      const SizedBox(height: 5),
                                      Text(
                                        item['descricao']!,
                                        style: const TextStyle(
                                          color: Colors.white60,
                                          fontSize: 12,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                if (selecionado)
                                  const Icon(
                                    Icons.check_circle,
                                    color: dourado,
                                  ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
      
                  const SizedBox(height: 16),
                  SizedBox(
                    width: double.infinity,
                    height: 54,
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          colors: [
                            Color(0xFF922BFF),
                            Color(0xFF5A16B8),
                          ],
                        ),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.transparent,
                          shadowColor: Colors.transparent,
                        ),
                        onPressed: () {
                           Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (_) => const aparenciapage(),
                          ),
                        );
                        },
                        child: const Text(
                          'PRÓXIMO  ›',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            letterSpacing: 2,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}