///
//  Generated code. Do not modify.
//  source: mock.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:async' as $async;

import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'mock.pb.dart' as $0;
export 'mock.pb.dart';

class MockServiceClient extends $grpc.Client {
  static final _$startMock = $grpc.ClientMethod<$0.MockRequest, $0.MockReply>(
      '/MockService/startMock',
      ($0.MockRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.MockReply.fromBuffer(value));
  static final _$stopMock = $grpc.ClientMethod<$0.MockRequest, $0.MockReply>(
      '/MockService/stopMock',
      ($0.MockRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.MockReply.fromBuffer(value));

  MockServiceClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options, interceptors: interceptors);

  $grpc.ResponseFuture<$0.MockReply> startMock($0.MockRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$startMock, request, options: options);
  }

  $grpc.ResponseFuture<$0.MockReply> stopMock($0.MockRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$stopMock, request, options: options);
  }
}

abstract class MockServiceBase extends $grpc.Service {
  $core.String get $name => 'MockService';

  MockServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.MockRequest, $0.MockReply>(
        'startMock',
        startMock_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.MockRequest.fromBuffer(value),
        ($0.MockReply value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.MockRequest, $0.MockReply>(
        'stopMock',
        stopMock_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.MockRequest.fromBuffer(value),
        ($0.MockReply value) => value.writeToBuffer()));
  }

  $async.Future<$0.MockReply> startMock_Pre(
      $grpc.ServiceCall call, $async.Future<$0.MockRequest> request) async {
    return startMock(call, await request);
  }

  $async.Future<$0.MockReply> stopMock_Pre(
      $grpc.ServiceCall call, $async.Future<$0.MockRequest> request) async {
    return stopMock(call, await request);
  }

  $async.Future<$0.MockReply> startMock(
      $grpc.ServiceCall call, $0.MockRequest request);
  $async.Future<$0.MockReply> stopMock(
      $grpc.ServiceCall call, $0.MockRequest request);
}
