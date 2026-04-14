// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'network.gen.dart';

// **************************************************************************
// Generator: NetworkBuilder
// **************************************************************************

class SimpleBizApi extends BaseMethod implements SimpleBiz {
  SimpleBizApi({required super.client});

  @override
  Future<RespData<HelloResponse?>> sayHello(HelloRequest data) => getData(
    data: data,

    url: SimpleBiz.sayHelloUrl,
    buffer:
        bufferMap[SimpleBiz.sayHelloUrl] as ClassBuffer<int, HelloResponse>?,

    encodeDataFunction: (RespData resp) {
      resp.obj = HelloResponse.fromJson(resp.res);
    },
  );
}

var simpleBizApi = SimpleBizApi(client: client);
