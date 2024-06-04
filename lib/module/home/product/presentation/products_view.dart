import 'package:dokan_app/module/home/product/presentation/cubit/products_cubit.dart';
import 'package:dokan_app/module/home/product/presentation/widgets/product_filter.dart';
import 'package:dokan_app/module/home/product/presentation/widgets/product_grid_widget.dart';
import 'package:dokan_app/module/home/product/presentation/widgets/product_list_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductsView extends HookWidget {
  const ProductsView({super.key});

  @override
  Widget build(BuildContext context) {
    final isGridView = useState(true);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xffF8F8F8),
        centerTitle: true,
        title: Text(
          'Product List',
          style: TextStyle(
              fontSize: 22.sp,
              fontWeight: FontWeight.bold,
              color: const Color(0xff222455)),
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.search,
              ))
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          children: [
            // filter card
            Container(
              padding: EdgeInsets.all(20.r),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10.r),
                  boxShadow: [
                    BoxShadow(
                      color: const Color(0xff395AB8).withOpacity(0.10),
                      spreadRadius: 0,
                      blurRadius: 4,
                      offset: const Offset(0, 3),
                    ),
                  ]),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      const Icon(
                        Icons.filter_list,
                        color: Color(0xffB6BED4),
                      ),
                      10.horizontalSpace,
                      Text(
                        'Filter',
                        style: TextStyle(
                            fontSize: 15.sp,
                            fontWeight: FontWeight.w400,
                            color: const Color(0xff818995)),
                      ),
                    ],
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () {
                          showModalBottomSheet<void>(
                              context: context,
                              builder: (BuildContext context) {
                                return Container(
                                  width: double.infinity,
                                  padding: const EdgeInsets.all(20),
                                  decoration: const BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(20),
                                      topRight: Radius.circular(20),
                                    ),
                                  ),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      ProductFiler(
                                          onConfirm: (selectedFilters) {
                                        context
                                            .read<ProductsCubit>()
                                            .filterProducts(selectedFilters);
                                      })
                                    ],
                                  ),
                                );
                              });
                        },
                        child: Wrap(
                          children: [
                            Text(
                              'Sort by',
                              style: TextStyle(
                                  fontSize: 15.sp,
                                  fontWeight: FontWeight.w400,
                                  color: const Color(0xff818995)),
                            ),
                            const Icon(
                              Icons.keyboard_arrow_down,
                              color: Color(0xffB6BED4),
                            ),
                          ],
                        ),
                      ),
                      10.horizontalSpace,
                      GestureDetector(
                        onTap: () => isGridView.value = !isGridView.value,
                        child: Icon(
                          isGridView.value ? Icons.list : Icons.grid_view,
                          color: const Color(0xff222455),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
            20.verticalSpace,
            BlocBuilder<ProductsCubit, ProductsState>(
              builder: (context, state) {
                if (state is ProductsLoading || state is ProductsInitial) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                if (state is ProductsError) {
                  return Center(
                    child: Text(state.message),
                  );
                }

                if (state is ProductsLoaded) {
                  return Expanded(
                    child: isGridView.value
                        ? GridView.builder(
                            padding: const EdgeInsets.only(bottom: 20.0),
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    mainAxisSpacing: 10,
                                    crossAxisSpacing: 10,
                                    childAspectRatio: 0.6),
                            itemBuilder: (_, index) => ProductGridWidget(
                              productEntity: state.products[index],
                            ),
                            itemCount: state.products.length,
                          )
                        : ListView.builder(
                            padding: const EdgeInsets.only(bottom: 10.0),
                            itemCount: state.products.length,
                            itemBuilder: (_, index) => Padding(
                              padding: const EdgeInsets.only(bottom: 10.0),
                              child: ProductListWidget(
                                productEntity: state.products[index],
                              ),
                            ),
                          ),
                  );
                }

                return const SizedBox();
              },
            ),
          ],
        ),
      ),
    );
  }
}
