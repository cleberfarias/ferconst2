

class Routers {
  //rotas da api spring
  final String rotaFuncionario = "http://localhost:8080/funcionario";
  final String rotaTreinamento = "http://localhost:8080/treinamento";
  final String rotaFuncionarioTreinamento = "http://localhost:8080/funcionariotreinamento";

  //rotas para pesquisa do ultimo id inserido no postgres
  final String rotaFuncionarioLastId = "http://localhost:8080/funcionario?idGreaterThan=";

  final String rotaTreinamentoLastId = "http://localhost:8080/treinamento?idGreaterThan=";


}