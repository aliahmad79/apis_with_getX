class AppException implements Exception {
  final String? _message;
  final String? _prefix;

  AppException([this._message, this._prefix]);

  @override
  String toString() {
    return '$_prefix $_message';
  }
}

class FetchDataException extends AppException {
  FetchDataException([String? message]) : super(message, "Unable to Process");
}

class ApiNotRespondingException extends AppException {
  ApiNotRespondingException([String? message])
      : super(message, "Api not responding");
}

class BadRequestException extends AppException {
  BadRequestException([String? message])
      : super(
          message,
        );
}

class UnauthorizedException extends AppException {
  UnauthorizedException([String? message]) : super(message, "Excption");
}

class InvalidInputException extends AppException {
  InvalidInputException([String? message]) : super(message, "Invalid Input");
}

class NotFoundException extends AppException {
  NotFoundException([String? message]) : super(message, "Not Found");
}

class ForbiddenException extends AppException {
  ForbiddenException([String? message])
      : super(message, "Credentials do not match");
}

class LoginException implements Exception {
  final String message;

  LoginException(this.message);
}
