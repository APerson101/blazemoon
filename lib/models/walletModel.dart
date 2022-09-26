import 'dart:convert';

import 'package:flutter/foundation.dart';

class WalletModel {
  String balance;
  String name;
  String address;
  String chain;
  WalletModel({
    required this.balance,
    required this.name,
    required this.address,
    required this.chain,
  });

  WalletModel copyWith({
    String? balance,
    String? name,
    String? address,
    String? chain,
  }) {
    return WalletModel(
      balance: balance ?? this.balance,
      name: name ?? this.name,
      address: address ?? this.address,
      chain: chain ?? this.chain,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'balance': balance,
      'name': name,
      'address': address,
      'chain': chain,
    };
  }

  factory WalletModel.fromMap(Map<String, dynamic> map) {
    return WalletModel(
      balance: map['balance'] ?? '',
      name: map['name'] ?? '',
      address: map['address'] ?? '',
      chain: map['chain'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory WalletModel.fromJson(String source) =>
      WalletModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'WalletModel(balance: $balance, name: $name, address: $address, chain: $chain)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is WalletModel &&
        other.balance == balance &&
        other.name == name &&
        other.address == address &&
        other.chain == chain;
  }

  @override
  int get hashCode {
    return balance.hashCode ^ name.hashCode ^ address.hashCode ^ chain.hashCode;
  }
}

class ChainModel {
  String name;
  List<WalletModel> wallets;
  ChainModel({
    required this.name,
    required this.wallets,
  });

  ChainModel copyWith({
    String? name,
    List<WalletModel>? wallets,
  }) {
    return ChainModel(
      name: name ?? this.name,
      wallets: wallets ?? this.wallets,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'wallets': wallets.map((x) => x.toMap()).toList(),
    };
  }

  factory ChainModel.fromMap(Map<String, dynamic> map) {
    return ChainModel(
      name: map['name'] ?? '',
      wallets: List<WalletModel>.from(
          map['wallets']?.map((x) => WalletModel.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory ChainModel.fromJson(String source) =>
      ChainModel.fromMap(json.decode(source));

  @override
  String toString() => 'ChainModel(name: $name, wallets: $wallets)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ChainModel &&
        other.name == name &&
        listEquals(other.wallets, wallets);
  }

  @override
  int get hashCode => name.hashCode ^ wallets.hashCode;
}
