import 'package:flutter/material.dart';
import 'screen/product_overview_screen.dart';
import 'screen/product_details.dart';
import 'provider/products.dart';
import 'package:provider/provider.dart';
import 'provider/cart.dart';
import 'screen/cart_screen.dart';
import 'package:shop_app/provider/orders.dart';
import 'screen/orders_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create:(ctx) => Products(),
        ),
        ChangeNotifierProvider(
          create:(ctx) => Cart(),
        ),
        ChangeNotifierProvider(
          create:(ctx) => Orders(),
        )
      ],
      child: MaterialApp(
        title: 'My Shop',
        theme: ThemeData(
            primarySwatch: Colors.purple,
            accentColor: Colors.deepOrange,
            fontFamily: 'Lato'),
        home: ProductOverviewScreen(),
        routes: {ProductDetailScreen.routeName: (ctx) => ProductDetailScreen(),
        CartScreen.routeName :(ctx) => CartScreen(),
        OrdersScreen.routeName : (ctx)=> OrdersScreen()},

      ),
    );
  }
}
