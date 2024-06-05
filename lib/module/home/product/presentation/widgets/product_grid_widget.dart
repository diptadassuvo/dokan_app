import 'package:dokan_app/module/home/product/domain/entities/product_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class ProductGridWidget extends StatelessWidget {
  const ProductGridWidget({
    super.key,
    required this.productEntity,
  });

  final ProductEntity productEntity;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.push('/product', extra: productEntity);
      },
      child: Container(
        width: 160.w,
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
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              height: 180.h,
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(10.r),
                  topLeft: Radius.circular(10.r),
                ),
                child: Hero(
                  tag:
                      productEntity.id ?? DateTime.now().millisecondsSinceEpoch,
                  child: Image.network(
                    productEntity.images?.first.src ??
                        'https://psediting.websites.co.in/obaju-turquoise/img/product-placeholder.png',
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return const Center(
                        child: Icon(Icons.error),
                      );
                    },
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  top: 20, bottom: 20, left: 20, right: 8),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    productEntity.name ?? 'unknown name',
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 14.sp,
                    ),
                  ),
                  6.verticalSpace,
                  Row(
                    children: [
                      if (productEntity.salePrice != null &&
                          productEntity.salePrice!.isNotEmpty)
                        Wrap(
                          children: [
                            Text(
                              '\$${productEntity.regularPrice ?? ''}',
                              style: TextStyle(
                                fontSize: 14.sp,
                                decoration: TextDecoration.lineThrough,
                                color: const Color(
                                  0xff989FA8,
                                ),
                              ),
                            ),
                            8.horizontalSpace,
                          ],
                        ),
                      Text('\$${productEntity.price ?? ''}',
                          style: TextStyle(
                            fontSize: 18.sp,
                            fontWeight: FontWeight.bold,
                          )),
                    ],
                  ),
                  6.verticalSpace,
                  Text(
                    '${productEntity.totalSales ?? '0'} Sold',
                    style: TextStyle(
                      fontSize: 10.sp,
                      color: const Color(
                        0xff989FA8,
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
