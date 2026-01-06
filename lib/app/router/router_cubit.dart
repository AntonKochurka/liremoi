import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'router_state.dart';

class RouterCubit extends Cubit<RouterState> {
  RouterCubit() : super(const SplashRoute()) {
    splash();
  }

  Future<void> splash() async {
    await Future.delayed(const Duration(seconds: 3));

    // TODO: Implement checking here

    emit(const LibraryRoute());
  }

  void toLibrary() => emit(const LibraryRoute());

  void toReader(String documentId) => emit(ReaderRoute(documentId));

  void toPreview(String documentId) => emit(PreviewRoute(documentId));
}
