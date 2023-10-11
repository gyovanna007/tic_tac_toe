import 'package:flutter/material.dart';

void main() {
  runApp(const MeuAppJogoDaVelha());
}

class MeuAppJogoDaVelha extends StatefulWidget {
  const MeuAppJogoDaVelha({
    super.key,
  });

  @override
  State<MeuAppJogoDaVelha> createState() => _MeuAppJogoDaVelhaState();
}

class _MeuAppJogoDaVelhaState extends State<MeuAppJogoDaVelha> {
  List<Map<String, dynamic>> listaDeItensMarcados = [
    {
      "estaMarcado": false,
      "simbolo": const SizedBox(),
    },
    {
      "estaMarcado": false,
      "simbolo": const SizedBox(),
    },
    {
      "estaMarcado": false,
      "simbolo": const SizedBox(),
    },
    {
      "estaMarcado": false,
      "simbolo": const SizedBox(),
    },
    {
      "estaMarcado": false,
      "simbolo": const SizedBox(),
    },
    {
      "estaMarcado": false,
      "simbolo": const SizedBox(),
    },
    {
      "estaMarcado": false,
      "simbolo": const SizedBox(),
    },
    {
      "estaMarcado": false,
      "simbolo": const SizedBox(),
    },
    {
      "estaMarcado": false,
      "simbolo": const SizedBox(),
    },
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        primarySwatch: Colors.pink,
      ),
      home: Scaffold(
        backgroundColor: Colors.pink[50],
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.pink[100],
          title: const Text(
            'Jogo da velha da Gyo',
            style: TextStyle(color: Colors.black),
          ),
          centerTitle: true,
          actions: [
            IconButton(
              onPressed: () {
                setState(() {
                  listaDeItensMarcados = [
                    {
                      "estaMarcado": false,
                      "simbolo": const SizedBox(),
                    },
                    {
                      "estaMarcado": false,
                      "simbolo": const SizedBox(),
                    },
                    {
                      "estaMarcado": false,
                      "simbolo": const SizedBox(),
                    },
                    {
                      "estaMarcado": false,
                      "simbolo": const SizedBox(),
                    },
                    {
                      "estaMarcado": false,
                      "simbolo": const SizedBox(),
                    },
                    {
                      "estaMarcado": false,
                      "simbolo": const SizedBox(),
                    },
                    {
                      "estaMarcado": false,
                      "simbolo": const SizedBox(),
                    },
                    {
                      "estaMarcado": false,
                      "simbolo": const SizedBox(),
                    },
                    {
                      "estaMarcado": false,
                      "simbolo": const SizedBox(),
                    },
                  ];
                });
              },
              icon: const Icon(
                Icons.restore_rounded,
                size: 32,
              ),
            ),
            const SizedBox(width: 16),
          ],
        ),
        body: Center(
            child: CampoDaVelha(
          lista: listaDeItensMarcados,
        )),
      ),
    );
  }
}

class CampoDaVelha extends StatefulWidget {
  final List<Map<String, dynamic>> lista;
  const CampoDaVelha({
    super.key,
    required this.lista,
  });

  @override
  State<CampoDaVelha> createState() => _CampoDaVelhaState();
}

class _CampoDaVelhaState extends State<CampoDaVelha> {
  bool isPlayer1 = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.blueGrey,
      child: Stack(
        children: [
          Positioned(
            left: 97,
            child: Container(
              color: Colors.pink[100],
              height: 300,
              width: 6,
            ),
          ),
          Positioned(
            bottom: 97,
            child: Container(
              color: Colors.pink[200],
              height: 6,
              width: 300,
            ),
          ),
          Positioned(
            right: 97,
            child: Container(
              color: Colors.pink[100],
              height: 300,
              width: 6,
            ),
          ),
          Positioned(
            top: 97,
            child: Container(
              color: Colors.pink[200],
              height: 6,
              width: 300,
            ),
          ),
          SizedBox(
            height: 300,
            width: 300,
            child: GridView.count(
              crossAxisCount: 3,
              children: List.generate(9, (index) {
                return Center(
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        // widget.lista[index]["simbolo"] = isPlayer1
                        //     ? const Icon(
                        //         Icons.close_rounded,
                        //         color: Colors.black,
                        //         size: 100,
                        //       )
                        //     : const Icon(
                        //         Icons.favorite_border_rounded,
                        //         color: Colors.black,
                        //         size: 100,
                        //       );
    
                        if (isPlayer1) {
                          widget.lista[index]["simbolo"] = const Icon(
                            Icons.close_rounded,
                            color: Colors.black,
                            size: 100,
                          );
                        } else {
                          widget.lista[index]["simbolo"] = const Icon(
                            Icons.favorite_border_rounded,
                            color: Colors.black,
                            size: 100,
                          );
                        }
    
                        isPlayer1 = !isPlayer1;
    
                        widget.lista[index]["estaMarcado"] =
                            !widget.lista[index]["estaMarcado"];
                      });
                    },
                    child: SizedBox(
                      height: 100,
                      width: 100,
                      child: ItemSlotDaVelha(
                          estaMarcado: widget.lista[index]["estaMarcado"]!,
                          simbolo: widget.lista[index]["simbolo"]!),
                    ),
                  ),
                );
              }),
            ),
          ),
        ],
      ),
    );
  }
}

class ItemSlotDaVelha extends StatelessWidget {
  final bool estaMarcado;
  final Widget simbolo;

  const ItemSlotDaVelha({
    super.key,
    required this.estaMarcado,
    required this.simbolo,
  });

  @override
  Widget build(BuildContext context) {
    return estaMarcado ? simbolo : const SizedBox();
  }
}
