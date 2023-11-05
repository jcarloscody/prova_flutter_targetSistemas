# TESTE FLUTTER - 

## FINALIDADE DO REPO

Este repositório tem como finalidade demonstrar a resolução do teste do processo seletivo da [Target Sistemas](https://github.com/jcarloscody/prova_flutter_targetSistemas/blob/master/prova/prova_flutter-%20TargetSistemas.pdf).

> Você poderá acompanhar a evolução do teste no projeto criado.  [Prova Flutter - Target Sistemas](https://github.com/users/jcarloscody/projects/3/views/1)

## DEPENDÊNCIAS
-   mobx: ^2.2.1
-   flutter_mobx:
-   provider: ^6.0.5
-   shared_preferences:
-   google_fonts:
-   validatorless:
-   url_launcher: ^6.2.1
-   http:


## MOCKAPI
Para criar o mock da api, usei o pacote **[json_rest_server](https://pub.dev/packages/json_rest_server)**. Porém, a princípio os dados do login estão estáticos, assim não importa o que o usuário está preenchendo, o login será realizado. Caso apresente interesse em usar o server localmente, necessitará descomentar o método auth do repositório.

## ARQUITETURA
- Gerência de Estado: MOBX
- Gerência de Rotas: provider
- Gerência de Dependências: provider


## TELAS

<![Login](https://raw.githubusercontent.com/jcarloscody/prova_flutter_targetSistemas/master/prova/Screenshot_20231105-202131.png?token=GHSAT0AAAAAACJ3XSSFJPLTYXQVA76FHQ2IZKIFQ5Q)>
