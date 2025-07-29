import 'package:blshop/core/base_response.dart';
import 'package:get/get.dart';
import '../../../services/http_provider.dart';

class CategoryProvider extends GetConnect {


  final HttpProvider http;

  CategoryProvider({required this.http});

  Future<BaseResponse?> loadProductFromCategoryId(int id,{int page=1,String search =''}) async {
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
    final variables= search=='' ?
    {
      "filter": {
        "category_id": {
          "eq": id
        }
      },
      "pageSize": 10,
      "currentPage": page
    }
    :
    {
      "filter": {
      },
      "search": search,
      "pageSize": 10,
      "currentPage": page
    };
    return await http.doPostWithGraphSQL(query,variables: variables).then((response) {
      return BaseResponse(
          statusCode: response.statusCode,
          responseStatus: response.statusMessage,
          status: response.data['status'].toString(),
          data: response.data['data']['products']['items']?? {},
          totalPage: response.data['data']['products']['page_info']['total_pages']?? {},
          message:
          response.data['message'] ?? "");
    }).catchError((onError) {
      return BaseResponse(responseStatus: onError.toString(), statusCode: 400);
    });
  }
}
