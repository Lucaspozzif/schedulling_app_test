import 'package:flutter/material.dart';
import 'main.dart';
import 'funcoes.dart';
import 'agenda.dart';

class Receita extends StatefulWidget {
  const Receita({Key? key}) : super(key: key);

  @override
  _ReceitaState createState() => _ReceitaState();
}

class _ReceitaState extends State<Receita> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.purple.shade100,
          onPressed: () {
            appbar = !appbar;
            thisPage = Agenda();
            Navigator.pushReplacement(
              context,
              PageRouteBuilder(
                pageBuilder: (c, a1, a2) => const Agenda(),
                transitionsBuilder: (c, anim, a2, child) =>
                    FadeTransition(opacity: anim, child: child),
                transitionDuration: const Duration(milliseconds: 100),
              ),
            );
          },
          child: Icon(
            Icons.schedule,
            color: Colors.black54,
          )),
      bottomNavigationBar: MenuAbrir(),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: ScrollPhysics(),
          child: Container(
            color: Colors.purple.shade100,
            child: Column(
              children: [Menu(), noShop()],
            ),
          ),
        ),
      ),
    );
  }
}

class noShop extends StatefulWidget {
  const noShop({Key? key}) : super(key: key);

  @override
  State<noShop> createState() => _noShopState();
}

class _noShopState extends State<noShop> {
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Container(
          padding: EdgeInsets.fromLTRB(0, 20, 0, 20),
          child: Icon(
            Icons.credit_card,
            size: 150,
            color: Colors.black54,
          )),
      SizedBox(
        height: 60,
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            style: ElevatedButton.styleFrom(
                primary: Colors.white54,
                fixedSize: Size(280, 40),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40))),
            onPressed: () {
            },
            child: Text(
              "Sem pagamentos pendentes",
              style: TextStyle(
                  color: Colors.black87,
                  fontSize: 16,
                  fontWeight: FontWeight.w600),
            ),
          ),
        ],
      ),
      SizedBox(
        height: 600,
      ),
    ]);
  }
}

class Shop extends StatefulWidget {
  const Shop({Key? key}) : super(key: key);

  @override
  _ShopState createState() => _ShopState();
}

class _ShopState extends State<Shop> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      child: ListView(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        children: [
          GridView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10.0,
                mainAxisSpacing: 10.0,
              ),
              itemCount: products["shampoo"].length,
              itemBuilder: (context, index) {
                return Center(
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                        primary: Colors.white70,
                        fixedSize: Size(150, 100),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5))),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          "assets/products/${products["shampoo"][index]["perfil"]}",
                          width: 50,
                        ),
                        Text(
                          
                          products["shampoo"][index]["name"],
                          style: TextStyle(fontSize: 15, color: Colors.black87, ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                );
              }),
          GridView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10.0,
                mainAxisSpacing: 10.0,
              ),
              itemCount: products["condicionador"].length,
              itemBuilder: (context, index) {
                return Center(
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                        primary: Colors.white70,
                        fixedSize: Size(150, 100),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5))),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          "assets/products/${products["condicionador"][index]["perfil"]}",
                          width: 50,
                        ),
                        Text(
                          
                          products["condicionador"][index]["name"],
                          style: TextStyle(fontSize: 15, color: Colors.black87, ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                );
              }),
          GridView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10.0,
                mainAxisSpacing: 10.0,
              ),
              itemCount: products["mascara"].length,
              itemBuilder: (context, index) {
                return Center(
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                        primary: Colors.white70,
                        fixedSize: Size(150, 100),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5))),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          "assets/products/${products["mascara"][index]["perfil"]}",
                          width: 50,
                        ),
                        Text(
                          
                          products["mascara"][index]["name"],
                          style: TextStyle(fontSize: 15, color: Colors.black87, ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                );
              }),
        ],
      ),
    );

    Padding(
      padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
      child: 
      Column(
        children: [
          SizedBox(
            height: 30,
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width >= 425 ? 430 : 310,
            child: GridView(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount:
                    MediaQuery.of(context).size.width >= 425 ? 4 : 3,
                crossAxisSpacing: 10.0,
                mainAxisSpacing: 10.0,
              ),
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              children: [
                Center(
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                        primary: Colors.white70,
                        fixedSize: Size(100, 100),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5))),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/products/shampoo (5).png',
                          width: 60,
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          "Shampoo",
                          style: TextStyle(fontSize: 8, color: Colors.black54),
                        )
                      ],
                    ),
                  ),
                ),
                Center(
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                        primary: Colors.white70,
                        fixedSize: Size(100, 100),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5))),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/products/shampoo (6).png',
                          width: 60,
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          "Condicionador",
                          style: TextStyle(fontSize: 8, color: Colors.black54),
                        )
                      ],
                    ),
                  ),
                ),
                Center(
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                        primary: Colors.white70,
                        fixedSize: Size(100, 100),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5))),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/products/shampoo.png',
                          width: 60,
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          "Máscara",
                          style: TextStyle(fontSize: 8, color: Colors.black54),
                        )
                      ],
                    ),
                  ),
                ),
                Center(
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                        primary: Colors.white70,
                        fixedSize: Size(100, 100),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5))),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/products/shampoo (4).png',
                          width: 60,
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          "Spray",
                          style: TextStyle(fontSize: 8, color: Colors.black54),
                        )
                      ],
                    ),
                  ),
                ),
                Center(
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                        primary: Colors.white70,
                        fixedSize: Size(100, 100),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5))),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/products/shampoo (3).png',
                          width: 60,
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          "Esmalte",
                          style: TextStyle(fontSize: 8, color: Colors.black54),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          /*GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
              ),
              itemCount: 2,
              itemBuilder: (BuildContext context, int index) => Container()),
          ListView.builder(
            physics: NeverScrollableScrollPhysics(),
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            itemCount: scheduled.length,
            itemBuilder: (_, index) => Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                      primary: Colors.white70,
                      fixedSize: Size(280, 80),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(40))),
                  child: Row(
                    children: [
                      SizedBox(
                        width: 20,
                      ),
                      Column(
                        children: [
                          Text(
                            scheduled[index]["name"],
                            style: TextStyle(fontSize: 8, color: Colors.black54),
                          ),
                          Image.asset(
                            'assets/perfil/${scheduled[index]["perfil"]}',
                            width: 60,
                            height: 60,
                          ),
                        ],
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          scheduled[index]["rate"] > 0
                              ? Icon(
                                  Icons.star,
                                  size: 15,
                                  color: Colors.yellow,
                                )
                              : Container(),
                          scheduled[index]["rate"] > 1
                              ? Icon(
                                  Icons.star,
                                  size: 15,
                                  color: Colors.yellow,
                                )
                              : Container(),
                          scheduled[index]["rate"] > 2
                              ? Icon(
                                  Icons.star,
                                  size: 15,
                                  color: Colors.yellow,
                                )
                              : Container(),
                          scheduled[index]["rate"] > 3
                              ? Icon(
                                  Icons.star,
                                  size: 15,
                                  color: Colors.yellow,
                                )
                              : Container(),
                          scheduled[index]["rate"] > 4
                              ? Icon(
                                  Icons.star,
                                  size: 15,
                                  color: Colors.yellow,
                                )
                              : Container(),
                        ],
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Expanded(
                          child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            timer[scheduled[index]["timeIndex"]],
                            style: TextStyle(color: Colors.black, fontSize: 25),
                          ),
                          Text(scheduled[index]["service"],
                              style:
                                  TextStyle(color: Colors.black54, fontSize: 15))
                        ],
                      ))
                    ],
                  ),
                ),
                SizedBox(
                  width: 5,
                ),
                ElevatedButton(
                  onPressed: () {
                    if (scheduled[index]["rate"] > 4)
                      scheduled[index]["rate"] = 0;
                    scheduled[index]["rate"]++;
                    setState(() {});
                  },
                  child:
                      Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                    Icon(
                      Icons.star,
                      size: 24,
                      color: Colors.yellow,
                    )
                  ]),
                  style: ElevatedButton.styleFrom(
                      primary: Colors.white70,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25)),
                      fixedSize: Size(40, 80)),
                ),
              ],
            ),
          ),*/
          SizedBox(height: 500)
        ],
      ),
    );
  }
}
