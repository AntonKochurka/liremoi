part of 'reader_bloc.dart';

sealed class ReaderState extends Equatable {
  const ReaderState();
  
  @override
  List<Object> get props => [];
}

final class ReaderInitial extends ReaderState {}
