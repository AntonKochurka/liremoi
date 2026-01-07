import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'router_state.dart';

int getIndex(RouterState state) {
  return switch (state) {
    SplashRoute() => 0,
    LibraryRoute() => 1,
    ReaderRoute() => 2,
    PreviewRoute() => 3,
    // ignore: unreachable_switch_case
    _ => 0,
  };
}

class RouterCubit extends Cubit<RouterState> {
  String? _lastDocumentId;

  RouterCubit() : super(const SplashRoute()) {
    splash();
  }

  Future<void> splash() async {
    await Future.delayed(const Duration(seconds: 3));

    // TODO: Implement checking here

    emit(const LibraryRoute());
  }

  void toSplash() => splash();

  void toLibrary() => emit(const LibraryRoute());

  void toReader(String? documentId) {
    final id = documentId ?? _lastDocumentId;

    if (id == null) {
      // emit(const LibraryRoute());
      emit(ReaderRoute("documentId"));
      return;
    }

    _lastDocumentId = id;
    emit(ReaderRoute(id));
  }

  void toPreview(String? documentId) {
    final id = documentId ?? _lastDocumentId;

    if (id == null) {
      emit(const LibraryRoute());
      return;
    }

    _lastDocumentId = id;
    emit(PreviewRoute(id));
  }

  void toIndex(int index) {
    switch (index) {
      case 0:
        toSplash();
        break;
      case 1:
        toLibrary();
        break;
      case 2:
        toReader(null);
        break;
      case 3:
        toPreview(null);
        break;
      default:
        toLibrary();
        break;
    }
  }
}
