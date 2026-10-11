
import 'package:flutter/material.dart';

void main() {
  runApp(const ForjaDosMundosApp());
}

const fundo = Color(0xFF090911);
const painel = Color(0xFF10101B);
const roxo = Color(0xFF7900F5);
const roxoClaro = Color(0xFFB15CFF);
const texto = Color(0xFFF5F1FA);
const textoSecundario = Color(0xFF8F8B9C);
const borda = Color(0xFF393344);

class ForjaDosMundosApp extends StatelessWidget {
  const ForjaDosMundosApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Forja dos Mundos',
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: fundo,
        useMaterial3: true,
      ),
      home: const AparenciaScreen(),
    );
  }
}

class AparenciaScreen extends StatefulWidget {
  const AparenciaScreen({super.key});

  @override
  State<AparenciaScreen> createState() => _AparenciaScreenState();
}

class _AparenciaScreenState extends State<AparenciaScreen> {
  int tomSelecionado = 1;
  int cabeloSelecionado = 0;
  int corCabeloSelecionada = 0;
  int formatoOlhoSelecionado = 0;
  int corOlhosSelecionada = 0;
  int corpoSelecionado = 1;
  int alturaSelecionada = 1;

  final List<Color> tonsPele = const [
    Color(0xFFF5D0B8),
    Color(0xFFC18A67),
    Color(0xFF8B5A43),
    Color(0xFF613B30),
    Color(0xFFA96745),
  ];

  final List<Color> coresCabelo = const [
    Color(0xFF17131D),
    Color(0xFF75472D),
    Color(0xFFB67B36),
    Color(0xFFDD2828),
    Color(0xFFE8E5EA),
    Color(0xFF8620D5),
  ];

  final List<Color> coresOlhos = const [
    Color(0xFF8743F4),
    Color(0xFF347D68),
    Color(0xFF9B673D),
    Color(0xFF43B8CF),
    Color(0xFFB6A8CE),
  ];

  final List<String> formatosOlhos = const [
    'Amendoados',
    'Redondos',
    'Estreitos',
    'Caídos',
    'Puxados',
  ];

  final List<String> cabelos = const [
    'assets/cabelos/cabelo_01.png',
    'assets/cabelos/cabelo_02.png',
    'assets/cabelos/cabelo_03.png',
    'assets/cabelos/cabelo_04.png',
    'assets/cabelos/cabelo_05.png',
    'assets/cabelos/cabelo_06.png',
  ];

  final List<String> formatosCorpo = const [
    'Magro',
    'Atlético',
    'Musculoso',
    'Robusto',
    'Curvilíneo',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            _cabecalho(),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'APARÊNCIA',
                      style: TextStyle(
                        color: texto,
                        fontSize: 20,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    const SizedBox(height: 4),
                    const Text(
                      'Personalize seu personagem do seu jeito.',
                      style: TextStyle(
                        color: textoSecundario,
                        fontSize: 11,
                      ),
                    ),
                    const SizedBox(height: 18),

                                        
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: 112,
                            height: 280,
                            child: _personagem(),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: SizedBox(
                              height: 420,
                              child: SingleChildScrollView(
                                padding: const EdgeInsets.only(
                                  right: 4,
                                  bottom: 12,
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    _titulo('Tom de pele'),
                                    const SizedBox(height: 8),
                                    _seletorCores(
                                      cores: tonsPele,
                                      selecionado: tomSelecionado,
                                      aoSelecionar: (i) {
                                        setState(() {
                                          tomSelecionado = i;
                                        });
                                      },
                                    ),

                                    const SizedBox(height: 17),
                                    _titulo('Cabelo'),
                                    const SizedBox(height: 8),
                                    _seletorCabelos(),

                                    const SizedBox(height: 17),
                                    _titulo('Cor do cabelo'),
                                    const SizedBox(height: 8),
                                    _seletorCores(
                                      cores: coresCabelo,
                                      selecionado: corCabeloSelecionada,
                                      aoSelecionar: (i) {
                                        setState(() {
                                          corCabeloSelecionada = i;
                                        });
                                      },
                                    ),

                                    const SizedBox(height: 17),
                                    _titulo('Formato dos olhos'),
                                    const SizedBox(height: 8),
                                    _seletorFormatoOlhos(),

                                    const SizedBox(height: 17),
                                    _titulo('Cor dos olhos'),
                                    const SizedBox(height: 8),
                                    _seletorCores(
                                      cores: coresOlhos,
                                      selecionado: corOlhosSelecionada,
                                      aoSelecionar: (i) {
                                        setState(() {
                                          corOlhosSelecionada = i;
                                        });
                                      },
                                    ),

                                    const SizedBox(height: 17),
                                    _titulo('Tipo de corpo'),
                                    const SizedBox(height: 8),
                                    _seletorCorpo(),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),


                    const SizedBox(height: 24),
                    _divisor(),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ),
            _botoes(),
          ],
        ),
      ),
    );
  }

  Widget _cabecalho() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(8, 8, 12, 0),
      child: Column(
        children: [
          Row(
            children: [
              IconButton(
                onPressed: () => Navigator.maybePop(context),
                icon: const Icon(
                  Icons.arrow_back_ios,
                  color: texto,
                  size: 18,
                ),
              ),
              const Icon(
                Icons.auto_awesome,
                color: roxoClaro,
                size: 22,
              ),
              const SizedBox(width: 8),
              const Expanded(
                child: Text(
                  'FORJA DOS MUNDOS',
                  style: TextStyle(
                    color: texto,
                    fontSize: 11,
                    fontWeight: FontWeight.w900,
                    letterSpacing: 1,
                  ),
                ),
              ),
              const Text(
                '3/5',
                style: TextStyle(
                  color: textoSecundario,
                  fontSize: 11,
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8),
            child: Row(
              children: List.generate(5, (i) {
                return Expanded(
                  child: Container(
                    height: 4,
                    margin: const EdgeInsets.only(right: 4),
                    decoration: BoxDecoration(
                      color: i < 3
                          ? roxo
                          : const Color(0xFF292433),
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                );
              }),
            ),
          ),
        ],
      ),
    );
  }

  Widget _personagem() {
    return Container(
      decoration: BoxDecoration(
        color: painel,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: borda),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Stack(
          fit: StackFit.expand,
          children: [
            CustomPaint(
              painter: PersonagemPainter(
                tipo: corpoSelecionado,
                altura: alturaSelecionada,
                pele: tonsPele[tomSelecionado],
                corCabelo: coresCabelo[corCabeloSelecionada],
                corOlhos: coresOlhos[corOlhosSelecionada],
                formatoOlhos: formatoOlhoSelecionado,
              ),
            ),
            Positioned(
              left: 6,
              right: 6,
              bottom: 8,
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 4,
                  vertical: 6,
                ),
                decoration: BoxDecoration(
                  color: Colors.black.withValues(alpha: 0.7),
                  borderRadius: BorderRadius.circular(6),
                ),
                child: const Text(
                  'PERSONAGEM',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: texto,
                    fontSize: 9,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _titulo(String titulo) {
    return Text(
      titulo,
      style: const TextStyle(
        color: texto,
        fontSize: 12,
        fontWeight: FontWeight.w600,
      ),
    );
  }

  Widget _divisor() {
    return Container(
      height: 1,
      color: Colors.white.withValues(alpha: 0.08),
    );
  }

  Widget _seletorCores({
    required List<Color> cores,
    required int selecionado,
    required ValueChanged<int> aoSelecionar,
  }) {
    return Wrap(
      spacing: 5,
      runSpacing: 7,
      children: List.generate(cores.length, (i) {
        final ativo = selecionado == i;

        return GestureDetector(
          onTap: () => aoSelecionar(i),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 150),
            width: 25,
            height: 25,
            padding: const EdgeInsets.all(2),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: ativo ? roxoClaro : Colors.transparent,
                width: 1.5,
              ),
            ),
            child: DecoratedBox(
              decoration: BoxDecoration(
                color: cores[i],
                shape: BoxShape.circle,
                border: Border.all(
                  color: Colors.white24,
                  width: 0.5,
                ),
              ),
            ),
          ),
        );
      }),
    );
  }

  Widget _seletorCabelos() {
    return Wrap(
      spacing: 6,
      runSpacing: 7,
      children: List.generate(cabelos.length, (i) {
        final ativo = cabeloSelecionado == i;

        return GestureDetector(
          onTap: () {
            setState(() {
              cabeloSelecionado = i;
            });
          },
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 150),
            width: 48,
            height: 53,
            padding: const EdgeInsets.all(3),
            decoration: BoxDecoration(
              color: painel,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                color: ativo ? roxoClaro : borda,
                width: ativo ? 1.5 : 1,
              ),
            ),
            child: Image.asset(
              cabelos[i],
              fit: BoxFit.contain,
              errorBuilder: (_, __, ___) {
                return const Icon(
                  Icons.face,
                  color: Colors.white38,
                  size: 23,
                );
              },
            ),
          ),
        );
      }),
    );
  }

  Widget _seletorFormatoOlhos() {
    return Wrap(
      spacing: 5,
      runSpacing: 6,
      children: List.generate(formatosOlhos.length, (i) {
        final ativo = formatoOlhoSelecionado == i;

        return GestureDetector(
          onTap: () {
            setState(() {
              formatoOlhoSelecionado = i;
            });
          },
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 150),
            width: 49,
            height: 49,
            padding: const EdgeInsets.all(3),
            decoration: BoxDecoration(
              color: painel,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                color: ativo ? roxoClaro : borda,
                width: ativo ? 1.5 : 1,
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomPaint(
                  size: const Size(37, 17),
                  painter: OlhoPainter(
                    formato: i,
                    cor: coresOlhos[corOlhosSelecionada],
                  ),
                ),
                const SizedBox(height: 3),
                Text(
                  '${i + 1}',
                  style: TextStyle(
                    color: ativo ? roxoClaro : textoSecundario,
                    fontSize: 9,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        );
      }),
    );
  }

  Widget _seletorCorpo() {
    return Wrap(
      spacing: 5,
      runSpacing: 6,
      children: List.generate(formatosCorpo.length, (i) {
        final ativo = corpoSelecionado == i;

        return GestureDetector(
          onTap: () {
            setState(() {
              corpoSelecionado = i;
            });
          },
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 150),
            width: 49,
            height: 49,
            padding: const EdgeInsets.all(3),
            decoration: BoxDecoration(
              color: painel,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                color: ativo ? roxoClaro : borda,
                width: ativo ? 1.5 : 1,
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomPaint(
                  size: const Size(37, 29),
                  painter: SilhuetaCorpoPainter(
                    tipo: i,
                    cor: ativo ? roxoClaro : textoSecundario,
                  ),
                ),
                const SizedBox(height: 1),
                Text(
                  '${i + 1}',
                  style: TextStyle(
                    color: ativo ? roxoClaro : textoSecundario,
                    fontSize: 9,
                    fontWeight:
                        ativo ? FontWeight.bold : FontWeight.normal,
                  ),
                ),
              ],
            ),
          ),
        );
      }),
    );
  }

  Widget _botoes() {
    return Container(
      padding: const EdgeInsets.fromLTRB(12, 10, 12, 12),
      decoration: BoxDecoration(
        color: fundo,
        border: Border(
          top: BorderSide(
            color: Colors.white.withValues(alpha: 0.06),
          ),
        ),
      ),
      child: Row(
        children: [
          Expanded(
            child: OutlinedButton(
              onPressed: () => Navigator.maybePop(context),
              style: OutlinedButton.styleFrom(
                foregroundColor: texto,
                side: const BorderSide(
                  color: Color(0xFF494254),
                ),
                minimumSize: const Size(0, 44),
              ),
              child: const Text('VOLTAR'),
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: ElevatedButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    backgroundColor: roxo,
                    content: Text(
                      '${formatosCorpo[corpoSelecionado]} • '
                      'Aparência personalizada',
                    ),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: roxo,
                foregroundColor: Colors.white,
                minimumSize: const Size(0, 44),
              ),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'PRÓXIMO',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 11,
                    ),
                  ),
                  SizedBox(width: 4),
                  Icon(Icons.arrow_forward, size: 15),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// Desenha a silhueta nos cartões de tipo de corpo.
class SilhuetaCorpoPainter extends CustomPainter {
  final int tipo;
  final Color cor;

  SilhuetaCorpoPainter({
    required this.tipo,
    required this.cor,
  });

  @override
  void paint(Canvas canvas, Size size) {
    canvas.save();
    canvas.scale(size.width / 37, size.height / 60);

    final tinta = Paint()
      ..color = cor
      ..style = PaintingStyle.fill;

    const cx = 18.5;

    canvas.drawOval(
      Rect.fromCenter(
        center: const Offset(cx, 8),
        width: 13,
        height: 15,
      ),
      tinta,
    );

    double ombros;
    double cintura;
    double quadril;

    switch (tipo) {
      case 0:
        ombros = 18;
        cintura = 12;
        quadril = 14;
        break;
      case 1:
        ombros = 27;
        cintura = 15;
        quadril = 19;
        break;
      case 2:
        ombros = 34;
        cintura = 20;
        quadril = 22;
        break;
      case 3:
        ombros = 31;
        cintura = 27;
        quadril = 29;
        break;
      default:
        ombros = 25;
        cintura = 15;
        quadril = 30;
    }

    final tronco = Path()
      ..moveTo(cx - 4, 15)
      ..lineTo(cx - ombros / 2, 20)
      ..quadraticBezierTo(
        cx - ombros / 2 - 1,
        28,
        cx - cintura / 2,
        39,
      )
      ..lineTo(cx - quadril / 2, 43)
      ..lineTo(cx + quadril / 2, 43)
      ..lineTo(cx + cintura / 2, 39)
      ..quadraticBezierTo(
        cx + ombros / 2 + 1,
        28,
        cx + ombros / 2,
        20,
      )
      ..lineTo(cx + 4, 15)
      ..close();

    canvas.drawPath(tronco, tinta);

    canvas.drawRRect(
      RRect.fromRectAndRadius(
        Rect.fromLTWH(cx - ombros / 2 - 3, 22, 4, 20),
        const Radius.circular(2),
      ),
      tinta,
    );

    canvas.drawRRect(
      RRect.fromRectAndRadius(
        Rect.fromLTWH(cx + ombros / 2 - 1, 22, 4, 20),
        const Radius.circular(2),
      ),
      tinta,
    );

    canvas.drawRRect(
      RRect.fromRectAndRadius(
        Rect.fromLTWH(cx - 8, 41, 7, 18),
        const Radius.circular(2),
      ),
      tinta,
    );

    canvas.drawRRect(
      RRect.fromRectAndRadius(
        Rect.fromLTWH(cx + 1, 41, 7, 18),
        const Radius.circular(2),
      ),
      tinta,
    );

    canvas.restore();
  }

  @override
  bool shouldRepaint(covariant SilhuetaCorpoPainter oldDelegate) {
    return oldDelegate.tipo != tipo || oldDelegate.cor != cor;
  }
}

// Desenha a prévia do personagem.
class PersonagemPainter extends CustomPainter {
  final int tipo;
  final int altura;
  final Color pele;
  final Color corCabelo;
  final Color corOlhos;
  final int formatoOlhos;

  PersonagemPainter({
    required this.tipo,
    required this.altura,
    required this.pele,
    required this.corCabelo,
    required this.corOlhos,
    required this.formatoOlhos,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final cx = size.width / 2;
    final escalaAltura = [0.88, 1.0, 1.10][altura];

    canvas.save();
    canvas.translate(0, size.height * (1 - escalaAltura));
    canvas.scale(1, escalaAltura);

    final pelePaint = Paint()
      ..color = pele
      ..style = PaintingStyle.fill;

    final cabeloPaint = Paint()
      ..color = corCabelo
      ..style = PaintingStyle.fill;

    final olhoPaint = Paint()
      ..color = corOlhos
      ..style = PaintingStyle.fill;

    // Pescoço.
    canvas.drawRRect(
      RRect.fromRectAndRadius(
        Rect.fromCenter(
          center: Offset(cx, 82),
          width: 15,
          height: 25,
        ),
        const Radius.circular(5),
      ),
      pelePaint,
    );

    // Cabeça.
    canvas.drawOval(
      Rect.fromCenter(
        center: Offset(cx, 62),
        width: 47,
        height: 57,
      ),
      pelePaint,
    );

    // Cabelo e franja.
    final cabelo = Path()
      ..moveTo(cx - 24, 64)
      ..lineTo(cx - 23, 45)
      ..quadraticBezierTo(cx - 19, 28, cx, 29)
      ..quadraticBezierTo(cx + 23, 30, cx + 24, 49)
      ..lineTo(cx + 23, 58)
      ..lineTo(cx + 12, 49)
      ..lineTo(cx + 3, 55)
      ..lineTo(cx - 7, 49)
      ..lineTo(cx - 16, 58)
      ..close();

    canvas.drawPath(cabelo, cabeloPaint);

    // Olhos.
    final larguraOlho = formatoOlhos == 1 ? 10.0 : 12.0;
    final alturaOlho = formatoOlhos == 2 ? 3.0 : 5.0;
    final deslocamento = formatoOlhos == 3 ? 2.0 : 0.0;

    for (final lado in [-1.0, 1.0]) {
      final olhoRect = Rect.fromCenter(
        center: Offset(
          cx + lado * 10,
          65 + (lado < 0 ? deslocamento : -deslocamento),
        ),
        width: larguraOlho,
        height: alturaOlho,
      );

      canvas.drawOval(
        olhoRect,
        Paint()..color = Colors.white,
      );

      canvas.drawOval(
        Rect.fromCenter(
          center: olhoRect.center,
          width: alturaOlho,
          height: alturaOlho,
        ),
        olhoPaint,
      );

      canvas.drawCircle(
        olhoRect.center,
        1.2,
        Paint()..color = Colors.black,
      );
    }

    // Nariz.
    final nariz = Paint()
      ..color = pele.withValues(alpha: 0.75)
      ..strokeWidth = 1.3
      ..style = PaintingStyle.stroke;

    canvas.drawLine(
      Offset(cx, 68),
      Offset(cx - 1, 75),
      nariz,
    );

    // Boca.
    final boca = Paint()
      ..color = const Color(0xFF783F48)
      ..strokeWidth = 1.5
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke;

    canvas.drawLine(
      Offset(cx - 5, 81),
      Offset(cx + 5, 81),
      boca,
    );

    double larguraOmbros;
    double larguraCintura;
    double larguraQuadril;

    switch (tipo) {
      case 0:
        larguraOmbros = 43;
        larguraCintura = 27;
        larguraQuadril = 32;
        break;
      case 1:
        larguraOmbros = 58;
        larguraCintura = 35;
        larguraQuadril = 43;
        break;
      case 2:
        larguraOmbros = 69;
        larguraCintura = 43;
        larguraQuadril = 49;
        break;
      case 3:
        larguraOmbros = 65;
        larguraCintura = 56;
        larguraQuadril = 59;
        break;
      default:
        larguraOmbros = 53;
        larguraCintura = 34;
        larguraQuadril = 62;
    }

    final tronco = Path()
      ..moveTo(cx - 8, 89)
      ..lineTo(cx - larguraOmbros / 2, 98)
      ..quadraticBezierTo(
        cx - larguraOmbros / 2 - 2,
        111,
        cx - larguraCintura / 2,
        137,
      )
      ..lineTo(cx - larguraQuadril / 2, 158)
      ..lineTo(cx + larguraQuadril / 2, 158)
      ..lineTo(cx + larguraCintura / 2, 137)
      ..quadraticBezierTo(
        cx + larguraOmbros / 2 + 2,
        111,
        cx + larguraOmbros / 2,
        98,
      )
      ..lineTo(cx + 8, 89)
      ..close();

    canvas.drawPath(tronco, pelePaint);

    // Braços.
    final larguraBraco = tipo == 2 ? 13.0 : 9.0;

    canvas.drawRRect(
      RRect.fromRectAndRadius(
        Rect.fromLTRB(
          cx - larguraOmbros / 2 - larguraBraco + 3,
          101,
          cx - larguraOmbros / 2 + 3,
          154,
        ),
        const Radius.circular(6),
      ),
      pelePaint,
    );

    canvas.drawRRect(
      RRect.fromRectAndRadius(
        Rect.fromLTRB(
          cx + larguraOmbros / 2 - 3,
          101,
          cx + larguraOmbros / 2 + larguraBraco - 3,
          154,
        ),
        const Radius.circular(6),
      ),
      pelePaint,
    );

    // Pernas.
    final larguraPerna = tipo == 2 || tipo == 3 ? 17.0 : 12.0;

    canvas.drawRRect(
      RRect.fromRectAndRadius(
        Rect.fromLTWH(
          cx - larguraQuadril / 2 + 2,
          151,
          larguraPerna,
          76,
        ),
        const Radius.circular(6),
      ),
      pelePaint,
    );

    canvas.drawRRect(
      RRect.fromRectAndRadius(
        Rect.fromLTWH(
          cx + larguraQuadril / 2 - larguraPerna - 2,
          151,
          larguraPerna,
          76,
        ),
        const Radius.circular(6),
      ),
      pelePaint,
    );

    canvas.restore();
  }

  @override
  bool shouldRepaint(covariant PersonagemPainter oldDelegate) {
    return oldDelegate.tipo != tipo ||
        oldDelegate.altura != altura ||
        oldDelegate.pele != pele ||
        oldDelegate.corCabelo != corCabelo ||
        oldDelegate.corOlhos != corOlhos ||
        oldDelegate.formatoOlhos != formatoOlhos;
  }
}

class OlhoPainter extends CustomPainter {
  final int formato;
  final Color cor;

  OlhoPainter({
    required this.formato,
    required this.cor,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final contorno = Paint()
      ..color = texto
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.4
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round;

    final iris = Paint()..color = cor;
    final pupila = Paint()..color = fundo;
    final path = Path();

    switch (formato) {
      case 0:
        path.moveTo(1, size.height / 2);
        path.quadraticBezierTo(
          size.width / 2,
          -2,
          size.width - 1,
          size.height / 2,
        );
        path.quadraticBezierTo(
          size.width / 2,
          size.height + 2,
          1,
          size.height / 2,
        );
        break;

      case 1:
        path.moveTo(1, size.height / 2);
        path.quadraticBezierTo(
          size.width / 2,
          -4,
          size.width - 1,
          size.height / 2,
        );
        path.quadraticBezierTo(
          size.width / 2,
          size.height + 4,
          1,
          size.height / 2,
        );
        break;

      case 2:
        path.moveTo(1, size.height / 2);
        path.quadraticBezierTo(
          size.width / 2,
          3,
          size.width - 1,
          size.height / 2,
        );
        path.quadraticBezierTo(
          size.width / 2,
          size.height - 3,
          1,
          size.height / 2,
        );
        break;

      case 3:
        path.moveTo(1, 2);
        path.quadraticBezierTo(
          size.width / 2,
          size.height + 2,
          size.width - 1,
          size.height - 2,
        );
        path.quadraticBezierTo(
          size.width / 2,
          size.height - 1,
          1,
          2,
        );
        break;

      default:
        path.moveTo(1, size.height / 2 + 3);
        path.quadraticBezierTo(
          size.width / 2,
          -2,
          size.width - 1,
          1,
        );
        path.quadraticBezierTo(
          size.width / 2,
          size.height + 2,
          1,
          size.height / 2 + 3,
        );
    }

    canvas.save();
    canvas.clipRect(Offset.zero & size);
    canvas.drawPath(path, contorno);

    final centro = Offset(
      size.width / 2,
      size.height / 2,
    );
    final raio = formato == 1 ? 5.5 : 4.0;

    canvas.drawCircle(centro, raio, iris);
    canvas.drawCircle(centro, raio * 0.45, pupila);
    canvas.drawCircle(
      Offset(centro.dx - 1.2, centro.dy - 1.2),
      1,
      Paint()..color = Colors.white,
    );

    canvas.restore();
  }

  @override
  bool shouldRepaint(covariant OlhoPainter oldDelegate) {
    return oldDelegate.formato != formato ||
        oldDelegate.cor != cor;
  }
}
