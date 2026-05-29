// Sealed result wrapper for clean error handling.
//
// Usage with Dart 3 pattern matching:
//   switch (result) {
//     case Success(:final value): // use value
//     case Failed(:final message): // show error
//     case Cancel(:final message): // handle cancellation
//   }

sealed class Result<T> {
  const Result();

  factory Result.success(T value) =
      Success;
  factory Result.failed(
    String message,
  ) = Failed;
  factory Result.cancel(
    String message,
  ) = Cancel;

  bool get isSuccess =>
      this is Success<T>;
  bool get isFailed =>
      this is Failed<T>;
  bool get isCancel =>
      this is Cancel<T>;

  T? get resultValue => isSuccess
      ? (this as Success<T>).value
      : null;
  String? get errorMessage => isFailed
      ? (this as Failed<T>).message
      : null;
  String? get cancelMessage => isCancel
      ? (this as Cancel<T>).message
      : null;
}

class Success<T> extends Result<T> {
  final T value;
  const Success(this.value);
}

class Failed<T> extends Result<T> {
  final String message;
  const Failed(this.message);
}

class Cancel<T> extends Result<T> {
  final String message;
  const Cancel(this.message);
}
