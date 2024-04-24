### Music App Flutter - Arquitetura Limpa com BLoC 🚀 🔄 🌐

Codificação de Aplicação em Flutter com Dart para Music App é uma aplicação Flutter robusta e escalável que adere aos princípios da Arquitetura Limpa (Clean Architecture). Utilizando o padrão BLoC (Business Logic Component) para gerenciamento de estado, o aplicativo garante que a lógica de negócios seja separada da camada de apresentação, resultando em uma base de código altamente sustentável e testável.

### Tecnologias Utilizadas 🛠️
![Flutter](https://img.shields.io/badge/-Flutter-02569B?style=for-the-badge&logo=flutter&logoColor=white)
![Dart](https://img.shields.io/badge/-Dart-0175C2?style=for-the-badge&logo=dart&logoColor=white)
![BLoC](https://img.shields.io/badge/-BLoC-00B4AB?style=for-the-badge&logo=bloc&logoColor=white)
![Java](https://img.shields.io/badge/-Java-F89820?style=for-the-badge&logo=java&logoColor=white)
![Kotlin](https://img.shields.io/badge/-Kotlin-7F52FF?style=for-the-badge&logo=kotlin&logoColor=white)


### Arquitetura
O projeto é estruturado seguindo as diretrizes da Arquitetura Limpa com as seguintes camadas:

- Dados (Data): Responsável pela recuperação e manipulação de dados. Contém as fontes de dados e modelos necessários para manipular os dados musicais.

- datasources: Definições abstratas e implementações concretas das fontes de dados.

- models: Modelos de dados que representam a estrutura dos dados musicais.

- Domínio (Domain): A camada interna que contém a lógica de negócios central e as entidades.

- entities: Entidades de domínio que são os objetos de negócio da aplicação.

- repositories: Abstrações dos repositórios que expõem funções para os casos de uso.

-Casos de Uso (Use Cases): Contêm as regras de negócio da aplicação. Eles orquestram o fluxo de dados da camada de Dados até a camada de Apresentação e vice-versa.

- get_all_musics.dart: Caso de uso para recuperar todos os itens musicais.

- Apresentação (Presentation): A camada com a qual o usuário interage. Inclui telas, widgets e os componentes BLoC.

- bloc: Contém os componentes BLoC que gerenciam o gerenciamento de estado para a UI.

- pages: Telas da aplicação, como a página de música, perfil e setlists.

- widgets: Componentes de UI reutilizáveis.

- main.dart: O ponto de entrada da aplicação Flutter.

### Gerenciamento de Estado

A aplicação utiliza o padrão BLoC para gerenciamento de estado:
BLoC: Cada página tem um BLoC correspondente que gerencia seu estado. O BLoC escuta eventos, processa a lógica de negócios e emite estados que a UI pode reagir.
Eventos: Acionam ações no BLoC, como buscar dados dos repositórios.
Estados: Representam o estado da UI em um determinado momento.

### Melhores Práticas
Separação de Preocupações: Cada camada tem uma responsabilidade bem definida, reduzindo as dependências em todo o sistema.
Testabilidade: Devido à natureza modular, cada componente pode ser testado independentemente.
Reusabilidade: Componentes, especialmente dentro da camada de Apresentação, são projetados para serem reutilizados.
Sustentabilidade: Práticas de código limpo e uma estrutura de projeto clara facilitam atualizações e adições de funcionalidades.

### Configuração
Para executar o aplicativo, certifique-se de ter o Flutter instalado em seu sistema e, em seguida, siga estes passos:

### Clone o repositório para sua máquina local.
Navegue até o diretório do projeto em seu terminal.
Execute 
```
flutter pub get
```
para buscar as dependências necessárias.
Execute 
```
flutter run
```
para construir e executar o aplicativo em seu emulador ou dispositivo.

### Conclusão
O Music App exemplifica o uso da Arquitetura Limpa e BLoC para uma aplicação Flutter sustentável e testável. Ele fornece uma base sólida para construir aplicativos complexos, mantendo uma separação clara entre a interface do usuário e a lógica de negócios.

### Desenvolvido por:
Emerson Amorim [@emerson-amorim-dev](https://www.linkedin.com/in/emerson-amorim-dev/)
