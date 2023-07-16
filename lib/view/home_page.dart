import 'package:app_finc/controller/home_controller.dart';
import 'package:app_finc/helper/helper.dart';
import 'package:app_finc/routes/page_routes.dart';
import 'package:app_finc/view/widgets/custom_drawer.dart';
import 'package:app_finc/view/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:infinite_carousel/infinite_carousel.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Get.toNamed(PagesRoute.despFormPage);
        },
      ),
      appBar: AppBar(
        titleSpacing: width * 0.5,
        actions: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                textAlign: TextAlign.center,
                'Finc',
                style: GoogleFonts.lato(
                  fontSize: 24,
                ),
              ),
            ],
          ),
          const SizedBox(width: 20),
        ],
      ),
      drawer: const Drawer(
        child: CustomDrawer(),
      ),
      body: Column(
        children: [
          GetBuilder<HomeController>(
            builder: (_) {
              return SizedBox(
                height: height * 0.278,
                child: InfiniteCarousel.builder(
                  itemCount: _.cartaoList.length,
                  itemExtent: width * 0.87,
                  anchor: 1,
                  loop: false,
                  velocityFactor: 0.2,
                  itemBuilder: (context, itemIndex, realIndex) {
                    if (itemIndex == 0) {
                      return _.cardAdd(context, _.cartaoList);
                    }
                    return GestureDetector(
                      onTap: () {
                        print('teste: ${_.cartaoList[itemIndex].name}');
                      },
                      child: CardWidget(
                        cartao: _.cartaoList[itemIndex],
                      ),
                    );
                  },
                ),
              );
            },
          ),
          GetBuilder<HomeController>(
            builder: (_) {
              return SizedBox(
                height: height * 0.56,
                child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  itemCount: _.despesaList.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      leading: const Icon(Icons.add_card_rounded),
                      trailing: const Icon(Icons.arrow_forward_ios),
                      onTap: () {
                        Get.toNamed(PagesRoute.despPage,
                            arguments: _.despesaList[index]);
                      },
                      title: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(_.despesaList[index].titulo!),
                          Text(
                              'R\$ ${Helper.dotToComma(_.despesaList[index].preco!)}'),
                        ],
                      ),
                    );
                  },
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

customTextFormField({
  TextEditingController? controller,
  String? label,
}) {
  return TextFormField(
    controller: controller,
    style: const TextStyle(color: Colors.black),
    decoration: InputDecoration(
      label: Text(label ?? 'qualquer coisa'),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20),
        borderSide: const BorderSide(
          color: Colors.blueGrey,
          width: 1,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20),
        borderSide: const BorderSide(
          color: Colors.blueGrey,
          width: 1,
        ),
      ),
    ),
  );
}
