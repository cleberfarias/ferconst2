

class Routers {
  //rotas da api spring
  final String rotaUsuario = "http://localhost:8080/usuario";
  final String rotaTreinamento = "http://localhost:8080/treinamento";
  final String rotaUsuarioTreinamento = "http://localhost:8080/usuariotreinamento";

  //rotas para pesquisa do ultimo id inserido no postgres
  final String rotaUsuarioLastId = "http://localhost:8080/usuario?idGreaterThan=";

  final String rotaTreinamentoLastId = "http://localhost:8080/treinamento?idGreaterThan=";

}