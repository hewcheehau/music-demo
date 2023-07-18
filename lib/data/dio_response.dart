import 'dart:convert';
import 'package:flutter/material.dart';

/// Custom http response model
abstract class DioResponse {
  DioResponse({
    required this.response,
    this.url,
  });

  final dynamic response;
  final String? url;

  get statusCode {
    return response.data["status"]["code"];
  }

  get data {
    return response.data;
  }

  get statusMessage {
    return response.data["status"]["message"];
  }

  get printSingle {
    var encoder = const JsonEncoder.withIndent("  ");
    var jsonObjJmap = response.data as Map;
    var jsonStr = encoder.convert(jsonObjJmap);
    debugPrint("$url\n$jsonStr");
  }

}

class SuccessResponse extends DioResponse {
  SuccessResponse({required super.response, super.url});
}

class FailureResponse extends DioResponse {
  FailureResponse({required super.response});
}
