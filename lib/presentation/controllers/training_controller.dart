import 'dart:ffi';

import '../../model/data/trainingModel.dart';
import '../../model/repositories/api_repository.dart';
import '../../model/repositories/errors/api_exception.dart';

class TrainingController{
  // trabalhando com async devemos implementar esses 3 tipos de estados
  // loading - carregando
  // state - finalizado e atualiza a tela
  // error - após carregar não carrega os dados ou da erro

  final ApiRepositoryTraining apiRepositoryTraining;

  TrainingController(this.apiRepositoryTraining);

  //mostrar erro ao usuário
  String? _errorLoadingTraining;

  //recuperar error
  String? get getErrorLoadingTraining => _errorLoadingTraining;

  //progress
  bool isLoading = false;

  //Employee que vamos carregar
  TrainingModel? _loadedTraining;

  TrainingModel? get getLoadedTraining => _loadedTraining;

  Future<void> ondLoadTraining (int trainingId) async{
    isLoading = true;
    _errorLoadingTraining = null;

    try {
      final training = await apiRepositoryTraining.getTraining(trainingId);
      _loadedTraining = training;
    } on ApiException catch(apiExecption){
      _errorLoadingTraining = apiExecption.menssagem;
    } catch(error, stacktrace){

      //ja temos o log dentro do apiRepositoryTraining.
      _errorLoadingTraining = "Erro ao carregar o TRAINING";
    }
    //terminou de carregar
    isLoading = false;

  }

  Future<void> onPostTraining(String nome, String descricao, String inicio, String fim, String classificacao) async{
    isLoading = true;
    _errorLoadingTraining = null;

    try{
      final postTraining = await apiRepositoryTraining.postTraining(nome, descricao, inicio, fim, classificacao);
      _loadedTraining = postTraining;

    } on ApiException catch (apiException) {
      _errorLoadingTraining = apiException.menssagem;
      throw apiException;
    } catch (error, stacktrace) {
      _errorLoadingTraining = "Erro na solicitação POST Training";
      throw ApiException(menssagem: error.toString());
    }
    isLoading = false;
  }

  Future<List<TrainingModel>?> onGetAllTraining() async{
    isLoading = true;
    _errorLoadingTraining = null;
    List<TrainingModel>? getAllTraining = null;
    try{
      getAllTraining = await apiRepositoryTraining.getAllTraining();
      return getAllTraining;

    } on ApiException catch(apiExecption){
      _errorLoadingTraining = apiExecption.menssagem;
    } catch(error, stacktrace){

      _errorLoadingTraining = "Erro na solicitação POST";
    }
    return getAllTraining;
  }


}