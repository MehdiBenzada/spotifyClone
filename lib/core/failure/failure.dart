// ignore_for_file: public_member_api_docs, sort_constructors_first
class appFailure {
  final String message;

  appFailure([this.message = "sorry an error occurred "]);

  @override
  String toString() => 'appFailure(message: $message)';
}
