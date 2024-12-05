import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '../../model/collection_model.dart';
import '../../model/photos_model.dart';
import '../provider/providerapiservice.dart';

part 'galleriobloc_event.dart';
part 'galleriobloc_state.dart';

class GallerioBloc extends Bloc<GallerioblocEvent, GallerioblocState> {
  final ProviderApiService apiService;
  BuildContext context;

  GallerioBloc(this.apiService,this.context) : super(GallerioblocInitial()) {
    on<LoadHomePageData>(_loadHomePageData);
    on<LoadCollectionPhotos>(_loadCollectionPhotos);
    on<SelectCollection>(_selectCollection);
  }
Collection? selectedCollection;
List<Collection> collections = [];
List<Photos> photos =[];
  Future<void> _loadHomePageData(
      LoadHomePageData event, Emitter<GallerioblocState> emit) async {
    emit(HomePageLoading());
     collections = await apiService.getcollection(context);
    if (collections.isNotEmpty) {
      selectedCollection = collections.first;
       photos = await apiService.getcollectionphotos(context,selectedCollection?.id, event.page);
      emit(HomePageLoaded(collections, photos, selectedCollection));
    } else {
      emit(HomePageLoaded([], [], null));
    }
  }

  Future<void> _loadCollectionPhotos(
      LoadCollectionPhotos event, Emitter<GallerioblocState> emit) async {
    // if (state is HomePageLoaded) {
      final currentState = state as HomePageLoaded;
       List<Photos> photo = await apiService.getcollectionphotos(context,
          currentState.selectedCollection?.id, event.page);
           emit(PhotosLoaded( [...currentState.photos,...photo]));
      emit(HomePageLoaded(currentState.collections, [...currentState.photos,...photo],currentState.selectedCollection));
     
    // }
  }

  Future<void> _selectCollection(
      SelectCollection event, Emitter<GallerioblocState> emit) async {
    if (state is HomePageLoaded) {
      final currentState = state as HomePageLoaded;
      final selectedCollection = currentState.collections
          .firstWhere((collection) => collection.id == event.collectionId);
          emit(PhotosLoaded([]));
      emit(HomePageLoaded(collections,[],selectedCollection));
       photos = await apiService.getcollectionphotos(context,
          currentState.selectedCollection?.id, 0);
      emit(PhotosLoaded([...currentState.photos, ...photos]));
      emit(HomePageLoaded(collections,photos,selectedCollection));
    }
  } }