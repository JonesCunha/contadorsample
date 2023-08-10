import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int contador = 0;

  void Decrement() {
    if (contador > 0) {
      setState(() {
        contador--;
        print(contador);
      });
    } else (print('N foi possivel diminuir'));
  }

  void Increment() {
    if (contador < 20) {
      setState(() {
        contador++;
        print(contador);
      });
    } else (print('N foi possivel aumentar'));
  }

  bool get  isEmpty => contador == 0;
  bool get isFull => contador == 20;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.amber,
        body: Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/fundo.jpg'),
                fit: BoxFit.cover,
              )),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(20),
                child: Text(
                  isEmpty ? 'Vazio' : isFull ? 'Lotado ' :'Pode Entrar',
                  style: TextStyle(
                    fontSize: 25,
                    color: isFull ? Colors.red : Colors.white,
                    fontWeight: FontWeight.w200,
                  ),
                ),
              ),
              Padding(
                  padding: const EdgeInsets.all(30),
                  child: Text(
                    contador.toString(),
                    style: TextStyle(
                      color: isFull ? Colors.red : Colors.white,
                      fontWeight: FontWeight.w400,
                      fontSize: 90,
                    ),
                  )),
              SizedBox(
                height: max(10, 80),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                    onPressed: isEmpty ? null : Decrement,
                    style: TextButton.styleFrom(
                      backgroundColor: isEmpty ? Colors.white.withOpacity(0.1) : Colors.white,
                      fixedSize: const Size(150, 60),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18),
                      ),
                    ),
                    child: const Text(
                      'Remover 1',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 25,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 30,
                  ),
                  TextButton(
                    onPressed: Increment,
                    style: TextButton.styleFrom(
                      backgroundColor: isFull ? Colors.white.withOpacity(0.1) : Colors.white,
                      fixedSize: const Size(150, 60),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18),
                      ),
                    ),
                    child: const Text(
                      'Adicionar 1',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 25,
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ));
  }
}



