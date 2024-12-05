part of 'galleriobloc_bloc.dart';



abstract class GallerioblocEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class LoadHomePageData extends GallerioblocEvent {
  final int page;

  LoadHomePageData(this.page);

  @override
  List<Object?> get props => [page];
}

class LoadCollectionPhotos extends GallerioblocEvent {
  final int page;

  LoadCollectionPhotos(this.page);

  @override
  List<Object?> get props => [page];
}

class SelectCollection extends GallerioblocEvent {
  final String? collectionId;

  SelectCollection(this.collectionId);

  @override
  List<Object?> get props => [collectionId];
}

