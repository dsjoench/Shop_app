import 'package:flutter/material.dart';
import 'cart.dart';

class OrderItem{
  final String id;
  final double amount;
  final List<CartItem> products;
  final DateTime datetime;
  
  
  OrderItem({required this.id,required this.amount,required this.datetime,required this.products});
}

class Orders with ChangeNotifier{
  List<OrderItem> _orders = [];


  List<OrderItem> get orders {
    return [..._orders];
  }
  
  
  void addOrder(List<CartItem> cartPRoducts, double total){
    _orders.insert(0,OrderItem(id: DateTime.now().toString(), amount: total, datetime: DateTime.now(), products: cartPRoducts));
  }

  notifyListeners();
}


