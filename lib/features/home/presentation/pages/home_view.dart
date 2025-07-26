import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_login_test/core/helper/extensions_route.dart';
import 'package:firebase_login_test/core/recourses/color_manager/color_manager.dart';
import 'package:firebase_login_test/core/recourses/styles_manger/styles_manager.dart';
import 'package:firebase_login_test/core/utils/const.dart';
import 'package:firebase_login_test/features/cart/data/models/cart_item.dart';
import 'package:firebase_login_test/features/cart/presentation/cubit/cart_cubit.dart';
import 'package:firebase_login_test/features/home/data/repositories_impl/menu_repo_impl.dart';
import 'package:firebase_login_test/features/home/presentation/cubit/product_cubit.dart';
import 'package:firebase_login_test/features/home/presentation/widgets/product_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final List<String> categories = ['food', 'drinks', 'fruits', 'vegetables'];
  String selectedCategory = 'food';

  late final MenuCubit menuCubit;

  @override
  void initState() {
    super.initState();
    menuCubit = MenuCubit(MenuRepoImpl(FirebaseFirestore.instance));
    menuCubit.fetchProducts(selectedCategory);
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => menuCubit,
      child: Scaffold(
        body: Column(
          children: [
            verticalSpace(50),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  // علشان تفضل كلمة Menu في النص، هنستخدم Expanded وحيلة بسيطة
                  Expanded(
                    child: Center(
                      child: Text(
                        'Menu',
                        style: getSemiBoldStyle(
                          color: MyColors.black,
                          fontSize: 24.sp,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(8.w),
                    decoration: BoxDecoration(
                      color: Colors.red.shade100,
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                    child: InkWell(
                      onTap: () {
                        context.pushNamed(cartView);
                      },
                      child: const Icon(
                        Icons.shopping_cart_outlined,
                        color: Colors.red,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            verticalSpace(
              10,
            ), // بدل SizedBox(height: 60) استخدم spacing قبل الـ ListView
            SizedBox(
              height: 60,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: categories.map((cat) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ChoiceChip(
                      label: Text(cat.toUpperCase()),
                      selected: selectedCategory == cat,
                      onSelected: (_) {
                        setState(() {
                          selectedCategory = cat;
                          menuCubit.fetchProducts(cat);
                        });
                      },
                    ),
                  );
                }).toList(),
              ),
            ),
            verticalSpace(10),
            const Divider(),
            Expanded(
              child: BlocBuilder<MenuCubit, MenuState>(
                builder: (context, state) {
                  if (state is MenuLoading) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (state is MenuLoaded) {
                    final products = state.products;
                    return GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            childAspectRatio: 0.83,
                          ),
                      padding: const EdgeInsets.all(10),
                      itemCount: products.length,
                      itemBuilder: (_, index) {
                        final p = products[index];
                        return ProductCard(
                          name: p.name,
                          price: p.price,
                          icon: Icons.shopping_bag,
                          onAdd: () {
                            final cartItem = CartItem(
                              name: p.name,
                              price: p.price,
                            );
                            context.read<CartCubit>().addToCart(cartItem);
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text("Added to cart")),
                            );
                          },
                        );
                      },
                    );
                  } else if (state is MenuError) {
                    return Center(child: Text("Error: ${state.message}"));
                  }
                  return const Center(child: Text("Select a category"));
                },
              ),
            ),
            verticalSpace(10),

            verticalSpace(20),
          ],
        ),
      ),
    );
  }
}
