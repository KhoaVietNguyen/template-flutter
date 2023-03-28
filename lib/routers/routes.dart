import 'package:get/get.dart';
import 'package:template/route_middlewares/auth_middleware.dart';
import 'package:template/views/auth/pages/auth_page.dart';
import 'package:template/views/home/controllers/home_binding.dart';
import 'package:template/views/home/pages/home_page.dart';
import 'package:template/views/indev/in_dev_page.dart';
import 'package:template/views/store/product_detail/controllers/product_detail_binding.dart';
import 'package:template/views/store/product_detail/pages/product_detail_page.dart';
import 'package:template/views/store/product_list/controllers/product_list_binding.dart';
import 'package:template/views/store/product_list/pages/product_list_page.dart';
import 'package:template/views/store/shopping/controllers/shopping_binding.dart';
import 'package:template/views/store/shopping/pages/shopping_page.dart';

final appPages = [
  GetPage(
    name: AppRoute.root.path,
    page: () => const InDevPage(),
  ),
  GetPage(
    name: AppRoute.home.path,
    page: () => const HomePage(),
    binding: HomeBinding(),
  ),
  GetPage(
    name: AppRoute.auth.path,
    page: () => const AuthPage(),
  ),

  /// STORE
  GetPage(
    name: AppRoute.shopping.path,
    page: () => const ShoppingPage(),
    binding: ShoppingBinding(),
    middlewares: [AuthMiddleware()],
  ),
  GetPage(
    name: AppRoute.products.path,
    page: () => const ProductListPage(),
    binding: ProductListBinding(),
  ),
  GetPage(
    name: AppRoute.product.path,
    page: () => const ProductDetailPage(),
    binding: ProductDetailBinding(),
  ),

  /// others
  GetPage(
    name: AppRoute.term.path,
    page: () => const InDevPage(),
  ),
];

enum AppRoute {
  root('/'),
  home('/home'),
  auth('/auth'),
  term('/term'),

  shopping('/shopping'),
  products('/products'),
  product('/product'),
  ;

  const AppRoute(this.path);

  final String path;
}
