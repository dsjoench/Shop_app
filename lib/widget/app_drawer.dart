import 'package:flutter/material.dart';
import 'package:shop_app/screen/orders_screen.dart';
class AppDrawer extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(children: <Widget>[
        AppBar(title: Text('Hello Friend!'),
    automaticallyImplyLeading: false,),
        Divider(thickness: 5,),
        ListTile(
          leading: Icon(Icons.shop),
          title: Text('Shop'),
          onTap: (){
            Navigator.of(context).pushReplacementNamed('/');
          },
        ),
        ListTile(
          leading: Icon(Icons.payment),
          title: Text('Order'),
          onTap: (){
            Navigator.of(context).pushReplacementNamed(OrdersScreen.routeName);
          },
        )
        ],),
    );
  }
}
