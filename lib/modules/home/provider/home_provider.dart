import 'package:blshop/core/base_response.dart';
import 'package:blshop/modules/home/model/home_model.dart';
import 'package:get/get.dart';
import '../../../services/http_provider.dart';

class HomeProvider extends GetConnect {


  final HttpProvider http;

  HomeProvider({required this.http});

  Future<BaseResponse?> loadOrders(HomeModel homeModel) async {
    return await http.doGet(homeModel.url??"", null).then((response) {
      return BaseResponse(
          statusCode: response.statusCode,
          responseStatus: response.statusMessage,
          status: response.data['status'].toString(),
          data: response.data['data']??{},
          message:
              response.data['message'] ?? "");
    }).catchError((onError) {
      return BaseResponse(responseStatus: onError.toString(), statusCode: 400);
    });
  }

  Future<BaseResponse?> loadCustomers(HomeModel homeModel) async {
    return await http.doGet(homeModel.url??"", null).then((response) {
      return BaseResponse(
          statusCode: response.statusCode,
          responseStatus: response.statusMessage,
          status: response.data['status'].toString(),
          data: response.data ?? {},
          message:
          response.data['message'] ?? "");
    }).catchError((onError) {
      return BaseResponse(responseStatus: onError.toString(), statusCode: 400);
    });
  }
  Future<BaseResponse?> loadIdCustomers(HomeModel homeModel) async {
    return await http.doGet(homeModel.url??"", null).then((response) {
      return BaseResponse(
          statusCode: response.statusCode,
          responseStatus: response.statusMessage,
          status: response.data['status'].toString(),
          data: response.data['data'][0]['id'] ?? {},
          message:
          response.data['message'] ?? "");
    }).catchError((onError) {
      return BaseResponse(responseStatus: onError.toString(), statusCode: 400);
    });
  }
  Future<BaseResponse?> loadVouchers() async {
    final query='''
    query getListPromotion {
      cartPriceRule {
        items {
          url_key
          code
          coupon_type
          currency
          description
          discount_amount
          from_date
          is_active
          max_discount
          name
          rule_id
          simple_action
          to_date
          uses_per_customer
        }
        total_count
      }
    }
    ''';
    return await http.doPostWithGraphSQL(query).then((response) {
      return BaseResponse(
          statusCode: response.statusCode,
          responseStatus: response.statusMessage,
          status: response.data['status'].toString(),
          data: response.data['data']['cartPriceRule']['items'] ?? {},
          message:
          response.data['message'] ?? "");
    }).catchError((onError) {
      return BaseResponse(responseStatus: onError.toString(), statusCode: 400);
    });
  }
  Future<BaseResponse?> loadStoreAddress() async {
    final query='''
    query GetInformationStore {
      storeAddress {
        city
        city_id
        country_code
        description
        district
        district_id
        email
        fax
        maps
        name
        postcode
        slider_id
        sort_description
        sort_order
        street
        telephone_1
        telephone_2
        ward
        ward_id
      }
    }
    ''';
    return await http.doPostWithGraphSQL(query).then((response) {
      return BaseResponse(
          statusCode: response.statusCode,
          responseStatus: response.statusMessage,
          status: response.data['status'].toString(),
          data: response.data['data']['storeAddress']?? {},
          message:
          response.data['message'] ?? "");
    }).catchError((onError) {
      return BaseResponse(responseStatus: onError.toString(), statusCode: 400);
    });
  }

  Future<BaseResponse?> loadBanner() async {
    final query='''
    query getSlider(\$filter: SliderFilterInput) {
      Slider(filter: \$filter) {
        items {
          title
          identifier
          Banner {
            items {
              banner_id
              caption
              link
              media
              media_alt
              name
            }
          }
        }
      }
    } 
    ''';
    return await http.doPostWithGraphSQL(query).then((response) {
      return BaseResponse(
          statusCode: response.statusCode,
          responseStatus: response.statusMessage,
          status: response.data['status'].toString(),
          data: response.data['data']['Slider']['items']?? {},
          message:
          response.data['message'] ?? "");
    }).catchError((onError) {
      return BaseResponse(responseStatus: onError.toString(), statusCode: 400);
    });
  }

  Future<BaseResponse?> loadCategory() async {
    final query='''
    query getCategories(\$filters: CategoryFilterInput) {
      categories(filters: \$filters) {
        __typename
        items {
          icon_image
          name
          url_path
          children_count
          show
          children {
            ...CategoryTreeFields
            children {
              ...CategoryTreeFields
              children {
                ...CategoryTreeFields
                children {
                  ...CategoryTreeFields
                }
              }
            }
            image_banner
            icon_image
          }
        }
      }
  }
  fragment CategoryTreeFields on CategoryTree {
    is_show_category_slider
    icon_image
    show
    check_show_category_in_page
    content_hot
    id
    name
    image
    description
    meta_title
    display_mode
    url_key
    url_path
    path
    children_count
    position
  }
    ''';
    return await http.doPostWithGraphSQL(query).then((response) {
      return BaseResponse(
          statusCode: response.statusCode,
          responseStatus: response.statusMessage,
          status: response.data['status'].toString(),
          data: response.data['data']['categories']['items']?? {},
          message:
          response.data['message'] ?? "");
    }).catchError((onError) {
      return BaseResponse(responseStatus: onError.toString(), statusCode: 400);
    });
  }
  Future<BaseResponse?> loadProductFromCategoryId(int id) async {
    final query='''
    query getProducts(
      \$search: String
      \$filter: ProductAttributeFilterInput
      \$sort: ProductAttributeSortInput
      \$pageSize: Int
      \$currentPage: Int
    ) {
    products(
      search: \$search
      filter: \$filter
      sort: \$sort
      pageSize: \$pageSize
      currentPage: \$currentPage
    ) {
      items {
        ...ProductInterfaceField
      }
      aggregations {
        attribute_code
        count
        label
        options {
          count
          label
          value
          swatch_data {
            type
            value
          }
        }
        position
      }
      sort_fields {
        default
        options {
          label
          value
        }
      }
      total_count
      page_info {
        current_page
        page_size
        total_pages
      }  }
  }
  fragment ProductInterfaceField on ProductInterface {
   image_banner
    __typename
    sku
    uid
    name
    url_key
    url_suffix
    canonical_url
    stock_status
    categories {
      __typename
      name
      url_key
      url_path
      level
      uid
      position
      icon_image
      image
      path
      image_banner
      content_hot
    }
    id
    meta_description
    meta_keyword
    meta_title
    new_from_date
    new_to_date
    rating_summary
    review_count
    thumbnail {
      url
      position
    }
    image {
      url
    }
    price_range {
      ...PriceRangeField
    }
    ...CustomField
  }
  fragment CustomField on ProductInterface {
    color
    country_of_manufacture
    daily_sale {
      end_date
      entity_id
      sale_price
      sale_qty
      saleable_qty
      sold_qty
      start_date
      __typename
    }
    rating_summary_start {
      star_1
      star_2
      star_3
      star_4
      star_5
    }
  attribute_new{
    prepay_new
    percent_new
    price_original_new
    buyup_price_new
    renew_content_new
    brand_new
    category_for_product_new
    is_pre_order_new
    subsidy_new
    buyback_price_new
    config_renew_new
    }
  }
  fragment PriceRangeField on PriceRange {
    __typename
    maximum_price {
      ...ProductPriceField
    }
    minimum_price {
      ...ProductPriceField
    }
  }
  fragment ProductPriceField on ProductPrice {
    discount {
      amount_off
      percent_off
    }
    final_price {
      currency
      value
    }
    regular_price {
      currency
      value
    }
  }
    ''';
    final variables=
    {
      "filter": {
        "category_id": {
            "eq": id
            }
      }, 
      "pageSize": 10,
      "currentPage": 1
    };
    return await http.doPostWithGraphSQL(query,variables: variables).then((response) {
      return BaseResponse(
          statusCode: response.statusCode,
          responseStatus: response.statusMessage,
          status: response.data['status'].toString(),
          data: response.data['data']['products']['items']?? {},
          message:
          response.data['message'] ?? "");
    }).catchError((onError) {
      return BaseResponse(responseStatus: onError.toString(), statusCode: 400);
    });
  }
}
