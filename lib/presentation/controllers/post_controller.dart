import 'dart:ffi';

import 'package:ferconst/Model/data/EmployeeModel.dart';
import 'package:ferconst/Model/repositories/api_repository.dart';
import 'package:ferconst/Model/repositories/errors/api_exception.dart';

class PostController{

  final ApiRepository apiRepository;

  PostController(this.apiRepository);

  //mostrar erro ao usuário
  String? _errorLoadingPost;

  //recuperar error
  String? get getErrorLoadingPost => _errorLoadingPost;

  //progress
  bool isLoading = true;

  //POST que vamos carregar
  EmployeeModel? _loadedPost;

  EmployeeModel? get getLoadedPost => _loadedPost;

  Future<void> ondLoadPost (int postId) async{
    isLoading = true;
    _errorLoadingPost = null;

    try {
      final post = await apiRepository.getPost(postId as Long);
      _loadedPost = post;
    } on ApiException catch(apiExecption){
      _errorLoadingPost = apiExecption.menssagem;
    } catch(error, stacktracer){

      //ja temos o log dentro do apiRepository.
      _errorLoadingPost = "Erro ao carregar o post";
    }
    //terminou de carregar
    isLoading = false;

  }
}