import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:page_transition/page_transition.dart';
import 'package:store_api_flutter_course/consts/global_colors.dart';
import 'package:store_api_flutter_course/models/products_model.dart';
import 'package:store_api_flutter_course/screens/categories_screen.dart';
import 'package:store_api_flutter_course/screens/feeds_screen.dart';
import 'package:store_api_flutter_course/screens/users_screen.dart';
import 'package:store_api_flutter_course/services/api_handler.dart';
import 'package:store_api_flutter_course/widgets/appbar_icons.dart';
import 'package:store_api_flutter_course/widgets/feeds_grid.dart';
import 'package:store_api_flutter_course/widgets/sale_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late TextEditingController _searchController;
  List<ProductsModel> productsList = [];

  @override
  void initState() {
    _searchController = TextEditingController();
    getProducts();
    super.initState();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    APIHandler.getAllProducts();
    super.didChangeDependencies();
  }

  Future<void> getProducts() async {
    productsList = await APIHandler.getAllProducts();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          elevation: 2,
          title: const Text("Home"),
          leading: AppBarIcons(
            function: () {
              Navigator.push(
                context,
                PageTransition(
                  child: const CategoriesScreen(),
                  type: PageTransitionType.fade,
                ),
              );
            },
            icon: IconlyBold.category,
          ),
          actions: [
            AppBarIcons(
              function: () {
                Navigator.push(
                  context,
                  PageTransition(
                    child: const UsersScreen(),
                    type: PageTransitionType.fade,
                  ),
                );
              },
              icon: IconlyBold.user3,
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              const SizedBox(height: 18),
              Expanded(
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    children: [
                      TextField(
                        controller: _searchController,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          hintText: "Search...",
                          filled: true,
                          fillColor: Theme.of(context).cardColor,
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: BorderSide(
                              width: 1,
                              color: Theme.of(context).cardColor,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: BorderSide(
                              width: 1,
                              color: Theme.of(context).colorScheme.secondary,
                            ),
                          ),
                          suffixIcon: Icon(
                            IconlyLight.search,
                            color: lightIconsColor,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: size.height * 0.2,
                        child: Swiper(
                          autoplay: true,
                          itemCount: 3,
                          itemBuilder: (ctx, index) {
                            return const Padding(
                              padding: EdgeInsets.all(10.0),
                              child: SaleWidget(),
                            );
                          },
                          pagination: const SwiperPagination(
                            alignment: Alignment.bottomCenter,
                            builder: DotSwiperPaginationBuilder(
                              color: Colors.white,
                              activeColor: Colors.orange,
                            ),
                          ),
                          //  control: SwiperControl(),
                        ),
                      ),
                      SizedBox(
                        width: double.infinity,
                        height: size.height * 0.10,
                        child: Row(
                          children: [
                            const Text(
                              "Latest Product",
                              style: TextStyle(
                                fontWeight: FontWeight.w800,
                                fontSize: 16,
                              ),
                            ),
                            const Spacer(),
                            AppBarIcons(
                              function: () {
                                Navigator.push(
                                  context,
                                  PageTransition(
                                    child: const FeedsScreen(),
                                    type: PageTransitionType.fade,
                                  ),
                                );
                              },
                              icon: IconlyBold.arrowRight2,
                            ),
                          ],
                        ),
                      ),
                      productsList.isEmpty
                          ? Container()
                          : FeedsGridWidget(productsList: productsList),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
