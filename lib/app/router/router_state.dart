part of 'router_cubit.dart';

sealed class RouterState extends Equatable {
  const RouterState();

  @override
  List<Object?> get props => [];
}

final class SplashRoute extends RouterState {
  const SplashRoute();
}

final class LibraryRoute extends RouterState {
  const LibraryRoute();
}

final class ReaderRoute extends RouterState {
  final String documentId;

  const ReaderRoute(this.documentId);

  @override
  List<Object?> get props => [documentId];
}

final class PreviewRoute extends RouterState {
  final String documentId;

  const PreviewRoute(this.documentId);

  @override
  List<Object?> get props => [documentId];
}
