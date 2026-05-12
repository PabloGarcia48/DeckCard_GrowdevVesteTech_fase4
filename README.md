# 🃏 Card Quiz (Flutter)

Aplicativo Flutter para criação de baralhos de estudo e prática de perguntas e respostas em formato de quiz.

---

## 🎬 Demonstração

<p align="center">
  <img src="assets/Screen Recording 2026-05-12 at 19.18.21.gif" alt="Demo App" width="300"/>
</p>

---

## 📱 Sobre o Projeto

O Card Quiz foi desenvolvido para praticar conceitos de organização de estado, persistência local e fluxo de navegação no Flutter.

Com ele, é possível:

- Criar decks (baralhos) personalizados
- Adicionar cartões com pergunta e resposta
- Iniciar um quiz por deck
- Marcar respostas como corretas ou incorretas
- Visualizar o resultado final da sessão
- Manter os dados salvos localmente com Hive

---

## 🛠️ Tecnologias Utilizadas

- Flutter
- Dart
- MobX
- flutter_mobx
- Hive
- hive_flutter

---

## 📐 Funcionalidades Implementadas

📚 Decks
- Criação de novos decks
- Listagem de decks na tela inicial
- Exibição da quantidade de cartões por deck
- Estado vazio com chamada para criar o primeiro deck

📝 Cartões
- Cadastro de cartões com pergunta e resposta
- Associação de cartões a um deck específico

🧠 Quiz
- Exibição de progresso da sessão (ex.: 1/10)
- Alternância entre visualização de pergunta e resposta
- Registro de acertos e erros por cartão
- Tela de resultado com pontuação final

💾 Persistência local
- Armazenamento de decks e cartões em banco local usando Hive
- Dados preservados entre execuções do aplicativo

---

## 🏗️ Arquitetura

O projeto está organizado em camadas para facilitar manutenção e evolução:

📦 Models
- `Deck`
- `QuizCard`

🌐 Repository
- `DeckRepository`: leitura e escrita de decks na box do Hive

🧠 Stores
- `DeckStore`: carregamento, criação de deck e inclusão de cartões
- `QuizStore`: controle de progresso, acertos/erros e resultado do quiz

🎨 UI (Pages)
- `Home`: listagem de decks e estado vazio
- `AddDeckPage`: criação de deck
- `DeckDetailPage`: detalhes do deck e ações principais
- `AddCardPage`: cadastro de cartões
- `QuizAQPage`: execução do quiz
- `QuizResultPage`: resultado final

---

## 📚 Aprendizados

Durante o desenvolvimento deste projeto, foram praticados:

- Persistência local com Hive e adapters
- Organização de responsabilidades entre model, store e repository
- Estado reativo com MobX
- Navegação entre múltiplas telas no Flutter
- Construção de fluxo de quiz com controle de progresso

---

## 🚀 Como Executar o Projeto

1. Verifique se o Flutter está instalado:
	```bash
	flutter --version
	```

2. Clone o repositório:
	```bash
	git clone https://github.com/PabloGarcia48/DeckCard_GrowdevVesteTech_fase4
	```

3. Acesse a pasta do projeto:
	```bash
	cd card_quiz
	```

4. Instale as dependências:
	```bash
	flutter pub get
	```

5. Execute o aplicativo:
	```bash
	flutter run
	```

---

## 📂 Estrutura Principal

```text
lib/
  core/
  models/
  pages/
	 card/
	 deck/
	 home/
	 quiz/
  repositories/
  stores/
```

---


## 📄 Licença

Este projeto foi desenvolvido para fins educacionais e de estudo com Flutter.
