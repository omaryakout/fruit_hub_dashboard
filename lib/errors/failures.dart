abstract class Failures {
  String message;
  Failures(this.message);
}

class ServerFailure extends Failures {
  ServerFailure(super.message);
}
