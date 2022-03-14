import 'package:flutter/material.dart';
import 'package:shop_app/widget/app_drawer.dart';
import '../provider/product.dart';
import '../widget/products_grid.dart';
import 'package:provider/provider.dart';
import '../provider/products.dart';
import 'package:shop_app/widget/badge.dart';
import 'package:shop_app/provider/cart.dart';
import 'package:shop_app/screen/cart_screen.dart';

enum FilterOptions {
  Favorites,
  All,
}

class ProductOverviewScreen extends StatefulWidget {
  @override
  State<ProductOverviewScreen> createState() => _ProductOverviewScreenState();
}

class _ProductOverviewScreenState extends State<ProductOverviewScreen> {
  var _showOnlyFavorite = false;

  @override
  Widget build(BuildContext context) {
    // final productsContainer = Provider.of<Products>(context, listen: false);
    return Scaffold(
        appBar: AppBar(
          title: Text('My Shop'),
          actions: <Widget>[
            PopupMenuButton(
                onSelected: (FilterOptions selectedValue) {
                  setState(() {
                    if (selectedValue == FilterOptions.Favorites) {
                      _showOnlyFavorite = true;
                      // productsContainer.showFavoritesOnly();
                    } else {
                      _showOnlyFavorite = false;
                      // productsContainer.showAll();
                    }
                  });
                },
                icon: Icon(Icons.more_vert),
                itemBuilder: (_) => [
                      PopupMenuItem(
                        child: Text('Only  Favorites'),
                        value: FilterOptions.Favorites,
                      ),
                      PopupMenuItem(
                        child: Text('Show All'),
                        value: FilterOptions.All,
                      )
                    ]),
            Consumer<Cart>(
              // ch doesnt rebuild when the cart changes
                builder: (_, cart, ch) => Badge(
                    child: ch,
                    color: Colors.red,
                    value: cart.itemCount.toString()),
            child: IconButton(
                onPressed: () {
                  Navigator.of(context).pushNamed(CartScreen.routeName);
                },
                icon: Icon(
                  Icons.shopping_cart,
                )))
          ],
        ),
        drawer: AppDrawer(),
        body: ProductGrid(_showOnlyFavorite));
  }
}
