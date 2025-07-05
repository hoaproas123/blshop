
import 'dart:io';

import 'package:blshop/constant/app_string.dart';
import 'package:blshop/core/alert.dart';
import 'package:blshop/core/base_response.dart';
import 'package:blshop/data/rank.dart';
import 'package:blshop/models/arguments_model.dart';
import 'package:blshop/models/banner_model.dart';
import 'package:blshop/models/category_model.dart';
import 'package:blshop/models/customer_model.dart';
import 'package:blshop/models/product_model.dart';
import 'package:blshop/models/store_address_model.dart';
import 'package:blshop/models/voucher_model.dart';
import 'package:blshop/modules/home/model/home_model.dart';
import 'package:blshop/modules/home/model/orders_model.dart';
import 'package:blshop/modules/home/repository/home_repository.dart';
import 'package:blshop/models/rank_model.dart';
import 'package:blshop/modules/home/view/home_page.dart';
import 'package:blshop/modules/home/view/home_page/user_page.dart';
import 'package:blshop/modules/home/view/store_map_page.dart';
import 'package:blshop/routes/app_pages.dart';
import 'package:blshop/services/domain_service.dart';
import 'package:blshop/services/utils.dart';
import 'package:carousel_slider_plus/carousel_controller.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:url_launcher/url_launcher.dart';


class HomeController extends GetxController with GetSingleTickerProviderStateMixin{
  final HomeRepository homeRepository;
  HomeModel? homeModel;
  HomeController({required this.homeRepository});

  String id='';
  String contactNumber=Get.arguments;
  RxList<OrderModel> listOrderModel=<OrderModel>[].obs;
  double totalPayment=0;
  Rx<CustomerModel> customerModel=CustomerModel().obs;
  RxList<VoucherModel> listVoucherModel=<VoucherModel>[].obs;
  RxList<CategoryModel> listCategoryModel=<CategoryModel>[].obs;
  RxList<ListProductModel> listProductModel=<ListProductModel>[].obs;
  Rx<RankModel> rank=listRank.first.obs;
  RxBool isHideDigit=true.obs;
  RxBool isLoading=true.obs;
  late TabController tabController;
  RxInt selectedPageIndex = 0.obs;
  final List<Widget> pages = [
    HomePage(),
    StoreMapPage(),
    UserPage(),
  ];

  final DraggableScrollableController sheetController = DraggableScrollableController();
  late GoogleMapController mapController;
  Rx<LatLng> pointPosition = LatLng(10.762622, 106.660172).obs; // Ví dụ: ĐH Bách Khoa TP.HCM
  RxList<StoreAddressModel> listStoreAddressModel=<StoreAddressModel>[].obs;
  RxBool isLoadingMap=true.obs;
  RxInt selectStore_index=0.obs;

  RxList<BannerModel> listBannerModel=<BannerModel>[].obs;
  CarouselControllerPlus carouselController=CarouselControllerPlus();
  RxInt currentBanner_index=0.obs;
  @override
  void onInit() async {
    super.onInit();
    tabController=TabController(length: 4, vsync: this);
    await getCategory();
    // await getIdFromContactNumber();
    // getUserDataFromId(null);
    // await getOrdersDataFromId().then((value) {
    //   rank.value=getRankByPoint((customerModel.value.totalPoint??0)*1.0);
    // },);
    await getBanner();
    Future.delayed(Duration(milliseconds: 800),() => isLoading.value=false,);
    getProduct();
    getVoucherFromRank('slugRank');
  }
  ///***************************
  Future<void> getOrdersDataFromId() async {
    final BaseResponse? response;
    response = await homeRepository.loadOrders(HomeModel(
      url: DomainProvider.orders+'?lastModifiedFrom=2025-01-01T00:00:00&orderBy=modifiedDate&orderDirection=Desc&customerIds=$id',
    ));
    if (response?.statusCode == HttpStatus.ok) {
      response?.data.forEach((item){
        listOrderModel.add(OrderModel.fromJson(item));
        totalPayment+=OrderModel.fromJson(item).totalPayment!;
      });
    } else {
      Alert.showError(
          title: CommonString.ERROR,
          message: CommonString.ERROR_URL_MESSAGE,
          buttonText:  CommonString.CANCEL);
    }
  }
  ///***************************
  Future<void> getVoucherFromRank(String slugRank) async {
    final BaseResponse? response;
    response = await homeRepository.loadVouchers();
    if (response?.statusCode == HttpStatus.ok) {
      response?.data.forEach((item){
        listVoucherModel.addIf(true,VoucherModel.fromJson(item));//item['description']==rank.value.slug

      });
    } else {
      Alert.showError(
          title: CommonString.ERROR,
          message: CommonString.ERROR_URL_MESSAGE,
          buttonText:  CommonString.CANCEL);
    }
  }

  ///***************************
  Future<void> getStoreAddress() async {
    final BaseResponse? response;
    response = await homeRepository.loadStoreAdress();
    if (response?.statusCode == HttpStatus.ok) {
      response?.data.forEach((item) async {
        listStoreAddressModel.addIf(true,StoreAddressModel.fromJson(item));

      });
    } else {
      Alert.showError(
          title: CommonString.ERROR,
          message: CommonString.ERROR_URL_MESSAGE,
          buttonText:  CommonString.CANCEL);
    }
  }

  ///***************************
  Future<void> getBanner() async {
    final BaseResponse? response;
    response = await homeRepository.loadBanner();
    if (response?.statusCode == HttpStatus.ok) {
      response?.data.forEach((item){
        listBannerModel.addIf(true,BannerModel.fromJson(item));
      });
    } else {
      Alert.showError(
          title: CommonString.ERROR,
          message: CommonString.ERROR_URL_MESSAGE,
          buttonText:  CommonString.CANCEL);
    }
  }

  ///***************************
  Future<void> getIdFromContactNumber() async {
    final BaseResponse? response;
    response = await homeRepository.loadIdCustomers(HomeModel(
      url: DomainProvider.customers+'?contactNumber=$contactNumber',
    ));
    if (response?.statusCode == HttpStatus.ok) {
      id=response!.data.toString();
    } else {
      Alert.showError(
          title: CommonString.ERROR,
          message: CommonString.ERROR_URL_MESSAGE,
          buttonText:  CommonString.CANCEL);
    }
  }
  ///***************************
  Future<void> getUserDataFromId(HomeModel? data) async {
    final BaseResponse? response;
    response = await homeRepository.loadCustomers(HomeModel(
      url: DomainProvider.customers+'/$id',
    ));
    if (response?.statusCode == HttpStatus.ok) {
      customerModel.value=CustomerModel.fromJson(response?.data);
    } else {
      Alert.showError(
          title: CommonString.ERROR,
          message: CommonString.ERROR_URL_MESSAGE,
          buttonText:  CommonString.CANCEL);
    }
    // Alert.closeLoadingIndicator();
  }
  RankModel getRankByPoint(double point) {
    // Mặc định là rank thấp nhất
    RankModel currentRank = listRank.first;
    point=point/1000;
    for (var rank in listRank) {
      if (point >= rank.leastPoints!) {
        currentRank = rank;
      } else {
        break; // vì danh sách đã sắp xếp tăng dần, nên có thể thoát sớm
      }
    }

    return currentRank;
  }

  ///***************************
  Future<void> getCategory() async {
    final BaseResponse? response;
    response = await homeRepository.loadCategory();
    if (response?.statusCode == HttpStatus.ok) {
      response?.data.forEach((item){
        listCategoryModel.addIf(true,CategoryModel.fromJson(item));
      });
    } else {
      Alert.showError(
          title: CommonString.ERROR,
          message: CommonString.ERROR_URL_MESSAGE,
          buttonText:  CommonString.CANCEL);
    }
  }

  ///***************************
  Future<List<ProductModel>> getProductFromId(int id) async {
    final BaseResponse? response;
    response = await homeRepository.loadProductFromCategoryId(id);
    if (response?.statusCode == HttpStatus.ok ) {
      List<ProductModel> listProduct=[];
      response?.data.forEach((item){
        listProduct.addIf(true,ProductModel.fromJson(item));
      });
      update();
      return listProduct;
    } else {
      Alert.showError(
          title: CommonString.ERROR,
          message: CommonString.ERROR_URL_MESSAGE,
          buttonText:  CommonString.CANCEL);
      return [];
    }
  }
  ///***************************
  Future<void> getProduct() async {
    for(int i=0;i<listCategoryModel[0].children!.length;i++){
      final name =  listCategoryModel[0].children?[i].name;
      if(listCategoryModel[0].children![i].children!.isNotEmpty){
        final item = listCategoryModel[0].children?[i].children?[0];
        final productFromId= await getProductFromId(item!.id!);
        listProductModel.add(ListProductModel(name!, productFromId));
      }
      else{
        listProductModel.add(ListProductModel(name!, []));
      }
    }
  }
  onToOrderPage(){
    Get.toNamed(Routes.DETAIL_ORDER,arguments: ArgumentsModel(customerModel: customerModel.value,rank: rank.value));
  }
  // Cập nhật index khi nhấn vào icon
  onChangePage(int index) {
    selectedPageIndex.value = index;
  }

  Future<void> onMapCreated(GoogleMapController controller) async {
    mapController = controller;
    // Theo dõi thay đổi vị trí và animate camera
    ever(pointPosition, (LatLng pos) {
      mapController.animateCamera(
        CameraUpdate.newLatLngZoom(pos, 100.0),
        duration: Duration(milliseconds: 1200)
      );
    });
    await getStoreAddress();
    pointPosition.value=Utils.parseLatLng(listStoreAddressModel[0].description!);
    isLoadingMap.value=false;
  }

  void onSelectStoreAddress(int index){
    sheetController.animateTo(
      0.2,
      duration: Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
    selectStore_index.value=index;
    pointPosition.value=Utils.parseLatLng(listStoreAddressModel[selectStore_index.value].description!);
  }
  Future<void> onButtonDirectionPress(int index) async{
    LatLng _latLngPosition=Utils.parseLatLng(listStoreAddressModel[index].description!);
    double destLat=_latLngPosition.latitude;
    double destLng=_latLngPosition.longitude;
    try {
      // Kiểm tra và yêu cầu quyền vị trí
      LocationPermission permission = await  Geolocator.checkPermission();
      if (permission == LocationPermission.denied || permission == LocationPermission.deniedForever) {
        permission = await Geolocator.requestPermission();
        if (permission != LocationPermission.whileInUse && permission != LocationPermission.always) {
          throw 'Quyền vị trí bị từ chối';
        }
      }

      // Lấy vị trí hiện tại
      Position currentPosition = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
      double originLat = currentPosition.latitude;
      double originLng = currentPosition.longitude;

      // Tạo URL để mở Google Maps app
      final Uri googleMapsAppUrl = Uri.parse(
        'comgooglemaps://?saddr=$originLat,$originLng&daddr=$destLat,$destLng&directionsmode=driving',
      );

      if (await canLaunchUrl(googleMapsAppUrl)) {
        await launchUrl(googleMapsAppUrl, mode: LaunchMode.externalApplication);
      } else {
        // Nếu app Google Maps không cài, mở bản web
        final fallbackWebUrl = Uri.parse(
          'https://www.google.com/maps/dir/?api=1&origin=$originLat,$originLng&destination=$destLat,$destLng&travelmode=driving',
        );
        if (await canLaunchUrl(fallbackWebUrl)) {
          await launchUrl(fallbackWebUrl, mode: LaunchMode.externalApplication);
        } else {
          Get.snackbar('Thông báo','Không thể mở Google Maps.');
        }
      }
    } catch (e) {
      print('Lỗi điều hướng: $e');
    }
  }
  void onButtonCallPress(int index) async {
    String? phoneNumber=listStoreAddressModel[index].telephone1;
    final Uri launchUri = Uri(
      scheme: 'tel',
      path: phoneNumber,
    );
    await launchUrl(launchUri);
  }

  Future<void> onBannerPress(int index,int banner_index) async {
    final Uri uri = Uri.parse(listBannerModel[banner_index].banner![index].link!);
    await launchUrl(
      uri,
      mode: LaunchMode.externalApplication, // 👈 Mở bằng trình duyệt ngoài
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }
}
