import 'dart:convert';

class Tick {
  final String msgType;
  final String id;
  final double ask;
  final double bid;
  final double epoch;
  final String pipSize;
  final double quote;
  final String symbol;
  final DateTime createdAt;

  Tick({
    required this.msgType,
    required this.id,
    required this.ask,
    required this.bid,
    required this.epoch,
    required this.pipSize,
    required this.quote,
    required this.symbol,
    required this.createdAt
  });

  Tick copyWith({
    String? msgType,
    String? id,
    double? ask,
    double? bid,
    double? epoch,
    String? pipSize,
    double? quote,
    String? symbol,
    DateTime? createdAt
  }) {
    return Tick(
      msgType: msgType ?? this.msgType,
      id: id ?? this.id,
      ask: ask ?? this.ask,
      bid: bid ?? this.bid,
      epoch: epoch ?? this.epoch,
      pipSize: pipSize ?? this.pipSize,
      quote: quote ?? this.quote,
      symbol: symbol ?? this.symbol,
      createdAt: createdAt ?? this.createdAt
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'msgType': msgType,
      'id': id,
      'ask': ask,
      'bid': bid,
      'epoch': epoch,
      'pipSize': pipSize,
      'quote': quote,
      'symbol': symbol,
      'createdAt' : createdAt
    };
  }

  factory Tick.fromMap(Map<String, dynamic> map) {
    return Tick(
      msgType: map['msgType'] ?? '',
      id: map['tick']['id'] ?? '',
      ask: map['tick']['ask']?.toDouble() ?? 0.0,
      bid: map['tick']['bid']?.toDouble() ?? 0.0,
      epoch: map['tick']['epoch']?.toDouble() ?? 0.0,
      pipSize: map['tick']['pipSize'] ?? '',
      quote: map['tick']['quote']?.toDouble() ?? 0.0,
      symbol: map['tick']['symbol'] ?? '',
      createdAt: DateTime.now()
    );
  }

  String toJson() => json.encode(toMap());

  factory Tick.fromJson(String source) => Tick.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Tick(msgType: $msgType, id: $id, ask: $ask, bid: $bid, epoch: $epoch, pipSize: $pipSize, quote: $quote, symbol: $symbol)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is Tick &&
      other.msgType == msgType &&
      other.id == id &&
      other.ask == ask &&
      other.bid == bid &&
      other.epoch == epoch &&
      other.pipSize == pipSize &&
      other.quote == quote &&
      other.symbol == symbol &&
      other.createdAt == createdAt;
  }

  @override
  int get hashCode {
    return msgType.hashCode ^
      id.hashCode ^
      ask.hashCode ^
      bid.hashCode ^
      epoch.hashCode ^
      pipSize.hashCode ^
      quote.hashCode ^
      createdAt.hashCode ^
      symbol.hashCode;
  }
}
