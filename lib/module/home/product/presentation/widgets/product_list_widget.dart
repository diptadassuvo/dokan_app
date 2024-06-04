import 'package:dokan_app/module/home/product/domain/entities/product_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductListWidget extends StatelessWidget {
  const ProductListWidget({
    super.key,
    required this.productEntity,
  });

  final ProductEntity productEntity;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100.w,
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
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            width: 100.w,
            height: double.infinity,
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10.r),
                  bottomLeft: Radius.circular(10.r)),
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
          Padding(
            padding:
                const EdgeInsets.only(top: 10, bottom: 10, left: 20, right: 20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: 200.w,
                  child: Text(
                    productEntity.name ?? 'unknown name',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 14.sp,
                    ),
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
    );
  }
}
