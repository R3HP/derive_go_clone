import 'dart:convert';

class Balance {
  final double balance;
  final String currency;

  Balance({
    required this.balance,
    required this.currency,
  });


  Balance copyWith({
    double? balance,
    String? currency,
  }) {
    return Balance(
      balance: balance ?? this.balance,
      currency: currency ?? this.currency,
    );
  }


  String get balanceAsString{
    final x = balance * 1000;
    final string = x.toStringAsFixed(0);
    return string.replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (match) => '${match[1]},');
  }

  Map<String, dynamic> toMap() {
    return {
      'balance': balance,
      'currency': currency,
    };
  }

  factory Balance.fromMap(Map<String, dynamic> map) {
    return Balance(
      balance: map['balance']['balance']?.toDouble() ?? 0.0,
      currency: map['balance']['currency'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Balance.fromJson(String source) => Balance.fromMap(json.decode(source));

  @override
  String toString() => 'Balance(balance: $balance, currency: $currency)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is Balance &&
      other.balance == balance &&
      other.currency == currency;
  }

  @override
  int get hashCode => balance.hashCode ^ currency.hashCode;
}
