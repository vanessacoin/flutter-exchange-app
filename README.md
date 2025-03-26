# Exchange Coin

Exchange Coin é um aplicativo de estudo desenvolvido em Flutter que permite consultar cotações atuais, realizar conversões de moedas e vizualizar conversões feitas. O foco deste projeto é aprofundar conceitos essenciais como consumo de API, gerenciamento de estado e armazenamento local com SQFlite.s localmente com SQFlite. O aplicativo permite consultar cotações e realizar conversões de moedas em tempo real, explorando conceitos fundamentais do Flutter.

## Descrição

Este projeto foi criado para fins de estudo e experimentação, permitindo a prática dos seguintes conceitos:

- Consumo de API: Obtenção de dados de cotação atual em tempo real utilizando a API do [Exchange Rates API](https://exchangeratesapi.io/)

- Gerenciamento de Estado: Implementação do gerenciamento de estado utilizando o Provider, facilitando a comunicação entre widgets.

- Armazenamento Local: Uso do SQFlite para salvar dados localmente, permitindo a persistência de um histórico de conversões.

- Design e UI: Criação de uma interface agradável com um SplashScreen personalizado, tema Material customizado (usando Material Theme Builder) e uso de imagens de fundo.

## Tecnologias Utilizadas

Flutter – Framework para desenvolvimento de apps nativos para iOS e Android.

Provider – Gerenciamento de estado.

SQFlite – Banco de dados local para persistência dos dados.

Exchange Rates API – API para obtenção de cotações de moedas (exchangeratesapi.io).

Material Theme Builder – Personalização do tema do app.

Outras bibliotecas: Utilização de pacotes para SplashScreen e outros componentes UI.

## Funcionalidades

✔️ SplashScreen animado: Tela de abertura que oferece uma experiência visual agradável.

✔️ Interface de conversão: Permite a entrada de um valor a ser convertido e a seleção das moedas de origem e destino através de dropdowns customizados com bandeiras.

✔️ Cotações em tempo real: Dados atualizados de moedas como USD, EUR, GBP, CAD, AUD, JPY, CHF, CNY, INR, BRL, HKD e SGD.

✔️ Histórico de conversões: Armazenamento local utilizando SQFlite para consulta futura.

✔️ Tema Personalizado: Interface customizada utilizando Material Theme Builder e imagens de fundo.

## 🔧 Configuração do Ambiente

Antes de rodar o projeto, você precisa configurar as variáveis de ambiente.

1. **Crie um arquivo `.env` na raiz do projeto.**
2. **Copie o conteúdo do `.env.example` para o `.env`.**
3. **Adicione sua chave de API no lugar de `your_api_key_here`.**
Exemplo: API_ACCESS_KEY=seu_token_aqui
4. **Agora, carregue o `.env` no seu app rodando:**

## 🚀 Como Executar o Projeto

### Pré-requisitos
- Flutter SDK
- Um dispositivo ou emulador configurado para execução do app

## Instruções
1. Clone o repositório:
```sh
git clone https://github.com/vanessacoin/flutter-exchange-app.git
cd flutter-exchange-app
```

2. Instale as dependências:
```sh
flutter pub get
```

3. Execute o aplicativo:
```sh
flutter run
```

## Estrutura do Projeto

- lib/screens: Contém as telas principais (HomeScreen, ExchangeScreen, HistoricalScreen e SplashScreen).
- lib/providers: Gerenciamento de estado usando o Provider.
- lib/data: Módulos para consumo da API e acesso ao banco de dados SQFlite.
- assets: Imagens e outros recursos estáticos utilizados no app.
