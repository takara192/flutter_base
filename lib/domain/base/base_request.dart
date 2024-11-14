abstract class BaseRequest {}

class NoParamRequest extends BaseRequest {}

class IntParamRequest extends BaseRequest {
  final int value;
  IntParamRequest(this.value);
}

class DoubleParamRequest extends BaseRequest {
  final double value;
  DoubleParamRequest(this.value);
}

class StringParamRequest extends BaseRequest {
  final String value;
  StringParamRequest(this.value);
}

class BoolParamRequest extends BaseRequest {
  final bool value;
  BoolParamRequest(this.value);
}