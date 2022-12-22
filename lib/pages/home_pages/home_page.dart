import 'package:flutter/material.dart';
import 'package:conin/widgets/index_widgets.dart';

class HomePageConin extends StatelessWidget {
  const HomePageConin({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Panel Principal'),
        centerTitle: true,
      ),
      drawer: const CustomDrawerWidget(),
      body: GridView.count(
        crossAxisCount: 2,
        children: [
          InkWell(
            child: Container(
              margin: const EdgeInsets.all(10),
              child: Card(
                elevation: 5,
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: const [
                      SizedBox(
                        width: 100,
                        child: Image(
                          image: NetworkImage(
                            'https://cdn-icons-png.flaticon.com/512/2825/2825867.png',
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                      Text(
                        'Inventario',
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            onTap: () {},
          ),
          InkWell(
            child: Container(
              margin: const EdgeInsets.all(10),
              child: Card(
                elevation: 5,
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: const [
                      SizedBox(
                        width: 100,
                        child: Image(
                          image: NetworkImage(
                            'https://cdn-icons-png.flaticon.com/512/994/994649.png',
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                      Text(
                        'Ventas',
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            onTap: () {},
          ),
          InkWell(
            child: Container(
              margin: const EdgeInsets.all(10),
              child: Card(
                elevation: 5,
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: const [
                      SizedBox(
                        width: 100,
                        child: Image(
                          image: NetworkImage(
                            'https://cdn-icons-png.flaticon.com/512/3317/3317738.png',
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                      Text(
                        'Equipo',
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            onTap: () {},
          ),
          InkWell(
            child: Container(
              margin: const EdgeInsets.all(10),
              child: Card(
                elevation: 5,
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: const [
                      SizedBox(
                        width: 100,
                        child: Image(
                          image: NetworkImage(
                            'https://cdn-icons-png.flaticon.com/512/2912/2912847.png',
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                      Text(
                        'Reportes',
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            onTap: () {},
          ),
        ],
      ),
      // body: Center(
      //     child: Column(
      //   children: [
      //     Row(
      //       children: [
      //         gru
      //         InkWell(
      //           child: Container(
      //             width: 50,
      //             color: Colors.amber,
      //             child: const Text(
      //               '1',
      //               style: TextStyle(
      //                 fontSize: 20,
      //               ),
      //             ),
      //           ),
      //         ),
      //         const SizedBox(
      //           width: 50,
      //         ),
      //         InkWell(
      //           child: Container(
      //             width: 50,
      //             color: Colors.amber,
      //             child: const Text(
      //               '1',
      //               style: TextStyle(
      //                 fontSize: 20,
      //               ),
      //             ),
      //           ),
      //         ),
      //       ],
      //     ),
      //     Row(),
      //   ],
      // )),
    );
  }
}
