sealed class A12ApiState<T> {
  const A12ApiState();

  factory A12ApiState.initial() = Initial<T>;
  factory A12ApiState.loading() = Loading<T>;
  factory A12ApiState.success(T data, {String message}) = Success<T>;
  factory A12ApiState.failure(String message, {T oldData}) = Failure<T>;
}

class Initial<T> extends A12ApiState<T> {
  const Initial();
}

class Loading<T> extends A12ApiState<T> {
  const Loading();
}

class Success<T> extends A12ApiState<T> {
  const Success(this.data, {this.message});
  final T data;
  final String? message;
}

class Failure<T> extends A12ApiState<T> {
  const Failure(this.message, {this.oldData});
  final String message;
  final T? oldData;
}
