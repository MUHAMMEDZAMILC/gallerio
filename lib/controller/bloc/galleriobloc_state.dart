part of 'galleriobloc_bloc.dart';


abstract class GallerioblocState extends Equatable {
  @override
  List<Object?> get props => [];
}

class GallerioblocInitial extends GallerioblocState {}

class HomePageLoading extends GallerioblocState {}

class HomePageLoaded extends GallerioblocState {
   List<Collection> collections;
   List<Photos> photos;
   Collection? selectedCollection;

  HomePageLoaded(this.collections, this.photos, this.selectedCollection);

  @override
  List<Object?> get props => [collections, photos, selectedCollection];
}

class PhotosLoading extends GallerioblocState {}

class PhotosLoaded extends GallerioblocState {
  final List<Photos> photos;

  PhotosLoaded(this.photos);

  @override
  List<Object?> get props => [photos];
}