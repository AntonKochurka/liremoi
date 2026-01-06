import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'router_state.dart';

class RouterCubit extends Cubit<RouterState> {
  RouterCubit() : super(const SplashRoute());

  void toLibrary() => emit(const LibraryRoute());

  void toReader(String documentId) => emit(ReaderRoute(documentId));

  void toPreview(String documentId) => emit(PreviewRoute(documentId));
}
