# ⚔️ Forja dos Mundos

**Forja dos Mundos** é um projeto de jogo desenvolvido com Flutter, com uma proposta de aventura e fantasia medieval. A aplicação apresenta uma tela inicial temática e uma interface de criação de personagens, permitindo ao jogador escolher sua classe antes de iniciar sua jornada.

O projeto está em desenvolvimento e busca construir uma experiência visual imersiva, com uma identidade inspirada em RPGs de fantasia.

## ✨ Funcionalidades

### Implementadas
- Tela inicial personalizada com arte temática.
- Botão **Começar** para iniciar a criação do personagem.
- Botão **Login** com indicação de que a funcionalidade está em desenvolvimento.
- Tela de seleção de classe do personagem.
- Seleção interativa de classes.
- Destaque visual para a classe selecionada.
- Interface com tema escuro, detalhes roxos e elementos dourados.
- Navegação entre telas.

### Classes disponíveis

| Classe | Descrição |
|---|---|
| ⚔️ Guerreiro | Força, resistência e combate corpo a corpo. |
| ✨ Mago | Magia e poderes elementais. |
| 🏹 Arqueiro | Precisão, agilidade e ataques à distância. |
| ✦ Sacerdote | Cura, suporte e proteção dos aliados. |
| ☠️ Ladino | Velocidade, furtividade e estratégia. |

## 🛠️ Tecnologias utilizadas

- **Flutter** — desenvolvimento da interface multiplataforma.
- **Dart** — linguagem de programação.
- **Material Design 3** — componentes e estrutura visual.
- **SystemChrome** — configuração da exibição em tela cheia.
- **Assets locais** — utilização de imagens personalizadas.

## 📋 Pré-requisitos

Antes de executar o projeto, você precisará ter instalado:

- [Flutter SDK](https://docs.flutter.dev/get-started/install)
- [Dart SDK](https://dart.dev/get-dart) — normalmente incluído no Flutter.
- [Git](https://git-scm.com/downloads)
- Um editor de código, como [Visual Studio Code](https://code.visualstudio.com/) ou Android Studio.

## 🚀 Como executar o projeto

### 1. Clone o repositório

```bash
git clone https://github.com/SEU-USUARIO/forja-dos-mundos.git
```

### 2. Entre na pasta do projeto

```bash
cd forja-dos-mundos
```

> Se a pasta do seu projeto tiver outro nome, utilize o nome correto no comando.

### 3. Instale as dependências

```bash
flutter pub get
```

### 4. Verifique a configuração do Flutter

```bash
flutter doctor
```

### 5. Execute a aplicação

```bash
flutter run
```

É necessário ter um dispositivo ou emulador configurado para executar o aplicativo.

## 🖼️ Assets

A tela inicial utiliza uma imagem personalizada localizada em:

```text
assets/forja_splash.png
```

Verifique se o arquivo existe e se está declarado no `pubspec.yaml`:

```yaml
flutter:
  uses-material-design: true
  assets:
    - assets/forja_splash.png
```

Após alterar o arquivo `pubspec.yaml`, execute:

```bash
flutter pub get
```

## 📁 Estrutura do projeto

A estrutura abaixo representa uma organização sugerida para a evolução do projeto:

```text
forja-dos-mundos/
├── android/
├── ios/
├── lib/
│   └── main.dart
├── assets/
│   └── forja_splash.png
├── test/
├── pubspec.yaml
├── analysis_options.yaml
└── README.md
```

A estrutura real pode variar conforme a evolução do desenvolvimento.

## 🗺️ Próximas etapas

- [ ] Implementar a tela de login.
- [ ] Desenvolver as próximas etapas da criação de personagens.
- [ ] Criar atributos e habilidades específicas para cada classe.
- [ ] Implementar a confirmação e o armazenamento do personagem criado.
- [ ] Desenvolver o sistema de cadastro e autenticação de usuários.
- [ ] Criar novas telas e elementos do universo do jogo.
- [ ] Implementar testes automatizados.

## 🎨 Identidade visual

A interface utiliza uma estética de fantasia medieval, com:

- Fundo escuro para uma experiência imersiva.
- Roxo para destaques e elementos interativos.
- Dourado para títulos e detalhes importantes.
- Cartões de seleção com realce visual para a classe escolhida.

## 📌 Status do projeto

**Em desenvolvimento.**

O projeto está na fase inicial de construção da interface e do fluxo de criação de personagens. Novas funcionalidades serão adicionadas progressivamente.

## 👨‍💻 Autor

Desenvolvido por **SEU NOME**.

---

*Forja dos Mundos — sua jornada começa aqui.*
