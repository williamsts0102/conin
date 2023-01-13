import 'package:badges/badges.dart';
import 'package:conin/providers/provider_cart.dart';
import 'package:conin/services/service_producto.dart';
import 'package:conin/services/service_venta.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CarritoPageConin extends StatelessWidget {
  const CarritoPageConin({super.key});

  @override
  Widget build(BuildContext context) {
    final ventaConinService = Provider.of<VentaConinService>(context);
    final productoService = Provider.of<ProductoService>(context);
    final cart = Provider.of<CartProvider>(context);
    print('Guardados => ${cart.cart}');

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('CARRITO'),
        actions: [
          Badge(
            badgeContent: Consumer<CartProvider>(
              builder: (context, value, child) {
                return Text(
                  value.getCounter().toString(),
                  style: const TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                );
              },
            ),
            position: const BadgePosition(start: 30, bottom: 30),
            child: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.shopping_cart),
            ),
          ),
          const SizedBox(
            width: 20.0,
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              shrinkWrap: true,
              physics: const ScrollPhysics(),
              itemCount: cart.cart.length,
              itemBuilder: (context, index) {
                final carts = cart.cart[index];
                return Card(
                  color: Colors.blueGrey.shade200,
                  elevation: 5.0,
                  child: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        const Image(
                          image: NetworkImage(
                              'https://img.freepik.com/psd-gratis/caja-carton-aislada_125540-1169.jpg'),
                          height: 80,
                          width: 80,
                        ),
                        SizedBox(
                          width: 130,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(
                                height: 5.0,
                              ),
                              RichText(
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                                text: TextSpan(
                                    text: 'Name: ',
                                    style: TextStyle(
                                        color: Colors.blueGrey.shade800,
                                        fontSize: 16.0),
                                    children: [
                                      TextSpan(
                                          text: '${carts['nomproducto']}\n',
                                          style: const TextStyle(
                                              fontWeight: FontWeight.bold))
                                    ]),
                              ),
                              RichText(
                                maxLines: 1,
                                text: TextSpan(
                                    text: 'Descripcion: ',
                                    style: TextStyle(
                                        color: Colors.blueGrey.shade800,
                                        fontSize: 16.0),
                                    children: [
                                      TextSpan(
                                          text: '${carts['desproducto']}\n',
                                          style: const TextStyle(
                                              fontWeight: FontWeight.bold)),
                                    ]),
                              ),
                              RichText(
                                maxLines: 1,
                                text: TextSpan(
                                    text: 'Price: ' r"S/.",
                                    style: TextStyle(
                                        color: Colors.blueGrey.shade800,
                                        fontSize: 16.0),
                                    children: [
                                      TextSpan(
                                          text: '${carts['preventa']}\n',
                                          style: const TextStyle(
                                              fontWeight: FontWeight.bold))
                                    ]),
                              )
                            ],
                          ),
                        ),
                        // ValueListenableBuilder<int>(
                        //   valueListenable: carts,
                        //   builder: (context, value, child) {
                        //     return PlusMinusButtons(addQuantity: carts, deleteQuantity: deleteQuantity, text: text)
                        //   },
                        // ),
                        SizedBox(
                          width: 80,
                          child: Row(
                            children: [
                              Text('${carts['contador']}'),
                              IconButton(
                                onPressed: () {
                                  cart.addQuantity(carts['codproducto']);
                                },
                                icon: const Icon(Icons.add),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: 20,
                          child: IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.delete,
                                color: Colors.red.shade800,
                              )),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          Column(
            children: [
              SizedBox(
                height: 60,
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Consumer<CartProvider>(
                      builder: (BuildContext context, value, Widget? child) {
                    double totalprecio = 0;
                    for (var element in value.cart) {
                      totalprecio += element['preventa'] * element['contador'];
                    }
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('SubTotal:',
                            style: TextStyle(
                                fontSize: 17.0, fontWeight: FontWeight.bold)),
                        Text('S/.$totalprecio',
                            style: const TextStyle(
                                fontSize: 17.0, fontWeight: FontWeight.bold)),
                      ],
                    );
                  }),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  height: 50,
                  width: 120,
                  child: FloatingActionButton(
                    onPressed: () {
                      ventaConinService.registerVenta();
                      for (var item in cart.cart) {
                        ventaConinService.registerDetalleVenta(
                            item['codproducto'],
                            item['contador'],
                            item['preventa']);
                        productoService.actualizarCantidadProducto(
                            item['codproducto'],
                            item['canproducto'],
                            item['contador']);
                      }

                      cart.cart.clear();
                      cart.resetCounter();
                      Navigator.pushNamed(context, '/venta');
                    },
                    child: const Text(
                      'Vender',
                      style: TextStyle(
                          fontSize: 17.0, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class PlusMinusButtons extends StatelessWidget {
  final VoidCallback deleteQuantity;
  final VoidCallback addQuantity;
  final String text;
  const PlusMinusButtons(
      {Key? key,
      required this.addQuantity,
      required this.deleteQuantity,
      required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(onPressed: deleteQuantity, icon: const Icon(Icons.remove)),
        Text(text),
        IconButton(onPressed: addQuantity, icon: const Icon(Icons.add)),
      ],
    );
  }
}
