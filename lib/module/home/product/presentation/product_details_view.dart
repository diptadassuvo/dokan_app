import 'package:dokan_app/module/home/product/domain/entities/product_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:intl/intl.dart';

class ProductDetailsView extends StatelessWidget {
  const ProductDetailsView({super.key, required this.productEntity});

  final ProductEntity productEntity;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product Details'),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(
          vertical: 16.h,
          horizontal: 20.w,
        ),
        children: [
          ClipRRect(
            borderRadius: BorderRadius.all(
              Radius.circular(10.r),
            ),
            child: Hero(
              tag: productEntity.id ?? 0,
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
          6.verticalSpace,
          Text(
            'Product Name: ${productEntity.name ?? 'unknown name'}',
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontSize: 24.sp,
            ),
          ),
          6.verticalSpace,
          Row(
            children: [
              const Text('Product Price: '),
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
            'Total Sold: ${productEntity.totalSales ?? 'n/a'}',
            style: TextStyle(
              fontSize: 14.sp,
              color: const Color(
                0xff000000,
              ),
            ),
          ),
          if (productEntity.createdDate != null)
            Text(
              'Created at: ${DateFormat('dd MMM yyyy, hh:mm a ').format(productEntity.createdDate!)}',
            ),
          6.verticalSpace,
          Text(
            'Description:',
            style: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
          HtmlWidget(productEntity.description ?? 'no description'),
        ],
      ),
    );
  }
}
