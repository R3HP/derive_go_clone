import 'dart:convert';

import 'package:deriv_go_clone/core/constants.dart';
import 'package:deriv_go_clone/features/main/data/model/balance.dart';
import 'package:deriv_go_clone/features/main/data/model/tick.dart';
import 'package:flutter/material.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

abstract class DerivDataSource {
  Stream<List<Tick>> getDataStreamForSelectedCurrency();
  Stream<Balance> getBalanceStream();
}

class DerivDataSourceImpl implements DerivDataSource {
  final webSocket = WebSocketChannel.connect(
      Uri.parse('wss://ws.binaryws.com/websockets/v3?app_id=1089'));
  final List<Tick> tickHistory = [];

  @override
  Stream<List<Tick>> getDataStreamForSelectedCurrency() {
    sendSelectedCurrencyRequest();
    final tickEventsStream = webSocket.stream.skipWhile((element) {
      return json.decode(element)['msg_type'] != 'tick';
    });
    final tickStream = tickEventsStream.map<Tick>((tickEvent) {
      final eventMap = json.decode(tickEvent) as Map<String, dynamic>;
      return Tick.fromMap(eventMap);
    });
    final tickListStream = tickStream.map((tick) => tickHistory..add(tick));
    return tickListStream;
  }

  @override
  Stream<Balance> getBalanceStream() {
    if (webSocket.closeCode != null) {
      debugPrint('websocket closed');
    }

    final multiSubStream = webSocket.stream.asBroadcastStream();

    webSocket.sink.add(json.encode({"authorize": deriveToken}));

    multiSubStream
        .firstWhere((element) => jsonDecode(element)['msg_type'] == 'authorize')
        .then((value) =>
            webSocket.sink.add(json.encode({"balance": 1, "subscribe": 1})));

    final balanceEventStream = multiSubStream.skipWhile((element) {
      return json.decode(element)['msg_type'] != 'balance';
    });
    final balanceStream = balanceEventStream.map((event) {
      final eventMap = json.decode(event);

      return Balance.fromMap(eventMap);
    });
    return balanceStream;
  }

  void sendGetBalance;

  void sendSelectedCurrencyRequest() {
    if (webSocket.closeCode != null) {
      debugPrint('websocket closed');
    }
    webSocket.sink.add(json.encode({"ticks": "1HZ100V", "subscribe": 1}));
  }
}
