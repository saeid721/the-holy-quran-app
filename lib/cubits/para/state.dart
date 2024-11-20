part of 'cubit.dart';

@immutable
class JuzState extends Equatable {
  final Para? data;
  final String? message;

  const JuzState({
    this.data,
    this.message,
  });

  @override
  List<Object?> get props => [
        data,
        message,
      ];
}

@immutable
class JuzDefault extends JuzState {}

@immutable
class ParaFetchLoading extends JuzState {
  const ParaFetchLoading() : super();
}

@immutable
class ParaFetchSuccess extends JuzState {
  const ParaFetchSuccess({Para? data}) : super(data: data);
}

@immutable
class JuzFetchFailed extends JuzState {
  const JuzFetchFailed({String? message}) : super(message: message);
}
