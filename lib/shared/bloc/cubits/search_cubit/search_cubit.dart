import 'dart:developer';

import 'package:ecommmerce_app/models/search_model.dart';
import 'package:ecommmerce_app/shared/helpers/dio_helper.dart';

import 'package:bloc/bloc.dart';
import 'package:ecommmerce_app/shared/bloc/cubits/search_cubit/search_states.dart';
import 'package:ecommmerce_app/shared/network/end_points.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchCubit extends Cubit<SearchStates> {
  SearchCubit() : super(SearchInitialState());

  static SearchCubit get(context) => BlocProvider.of(context);

  SearchModel? searchModel;

  postAndGetSearchData(String text){
    emit(SearchLoadingState());
    DioHelper.postData(pathUrl: SEARCH, data: {
      'text' : text,
    } ).then((value) {
      searchModel = SearchModel.fromJson(value.data);
      log(searchModel!.data!.productsData![0].id.toString());
      emit(SearchSuccessState());
    }).catchError((error){
      log(error.toString());
      emit(SearchErrorState());
    });
  }

  refreshState(){
    emit(SearchSuccessState());
  }

}