import 'package:blshop/core/base_response.dart';
import 'package:get/get.dart';
import '../../../services/http_provider.dart';

class DetailProvider extends GetConnect {


  final HttpProvider http;

  DetailProvider({required this.http});

  Future<BaseResponse?> loadDetailProductFromUrl(String url) async {
    final query='''
    query router(\$url: String!) {
      route(url: \$url) {
        __typename
        ... on ConfigurableProduct {
          ...ConfigurableProductField
          options {
            ...CustomizableOption
          }
        }
            ... on SimpleProduct {
          options {
            ...CustomizableOption
          }
        }
        ...ProductFields
        ...ProductAttribute
      }
    }
    
    fragment ConfigurableProductField on ConfigurableProduct {
      configurable_options {
        label
        attribute_code
        uid
        attribute_uid
        values {
          default_label
          label
          uid
          swatch_data {
            __typename
            value
          }
        }
      }
      configurable_product_options_selection {
        __typename
        configurable_options {
          attribute_code
          label
          uid
          values {
            __typename
            uid
            label
            is_use_default
            is_available
          }
        }
      }
      variants {
        attributes {
          code
          label
          uid
          value_index
        }
        product {
          __typename
          sku
          name
          daily_sale {
            sale_price
          }
          image {
            url
          }
          price_range {
            maximum_price {
              __typename
              discount {
                __typename
                amount_off
                percent_off
              }
              final_price {
                __typename
                currency
                value
              }
            }
            minimum_price {
              discount {
                __typename
                amount_off
                percent_off
              }
              final_price {
                __typename
                currency
                value
              }
              regular_price {
                __typename
                currency
                value
              }
            }
          }
          small_image {
            __typename
            disabled
            label
            position
            url
          }
          url_key
        }
      }
    }
    fragment CustomizableOption on CustomizableOptionInterface {
      ... on CustomizableDropDownOption {
        option_id
        required
        sort_order
        title
        uid
        value {
          option_type_id
          price
          price_type
          title
          sort_order
          uid
        }
      }
    }
    fragment ProductFields on ProductInterface {
       accessories_bought_together {
         ...AttributeNewField
      id
      name
      rating_summary
      review_count
      sku
      uid
      url_key
      image {
        disabled
        label
        position
        url
      }
      price_range {
        minimum_price {
          __typename
          discount {
            __typename
            amount_off
            percent_off
          }
          final_price {
            __typename
            currency
            value
          }
          regular_price {
            __typename
            currency
            value
          }
        }
      }
      review_count
      image_banner
      image_banner_renew
      }
      old_products {
        ...AttributeNewField
      id
      name
      rating_summary
      review_count
      sku
      uid
      url_key
      image {
        disabled
        label
        position
        url
      }
      price_range {
        minimum_price {
          __typename
          discount {
            __typename
            amount_off
            percent_off
          }
          final_price {
            __typename
            currency
            value
          }
          regular_price {
            __typename
            currency
            value
          }
        }
      }
      review_count
      image_banner
      image_banner_renew
      }
      upsell_products {
        ...AttributeNewField
         id
      name
      rating_summary
      review_count
      sku
      uid
      url_key
      image {
        disabled
        label
        position
        url
      }
      price_range {
        minimum_price {
          __typename
          discount {
            __typename
            amount_off
            percent_off
          }
          final_price {
            __typename
            currency
            value
          }
          regular_price {
            __typename
            currency
            value
          }
        }
      }
      review_count
      image_banner
      image_banner_renew
      }
      related_products {
        ...AttributeNewField
      id
      name
      rating_summary
      review_count
      sku
      uid
      url_key
      image {
        disabled
        label
        position
        url
      }
      price_range {
        minimum_price {
          __typename
          discount {
            __typename
            amount_off
            percent_off
          }
          final_price {
            __typename
            currency
            value
          }
          regular_price {
            __typename
            currency
            value
          }
        }
      }
      review_count
      image_banner
      image_banner_renew  
      }
      crosssell_products {
        ...AttributeNewField
      id
      name
      rating_summary
      review_count
      sku
      uid
      url_key
      image {
        disabled
        label
        position
        url
      }
      price_range {
        minimum_price {
          __typename
          discount {
            __typename
            amount_off
            percent_off
          }
          final_price {
            __typename
            currency
            value
          }
          regular_price {
            __typename
            currency
            value
          }
        }
      }
      review_count
      image_banner
      image_banner_renew
      }
        Installment_products
      attribute_set_id
      canonical_url
      color
      id
      manufacturer
      meta_description
      meta_keyword
      meta_title
      name
      options_container
      percent
      rating_summary
      review_count
      sku
      stock_status
      swatch_image
      type_id
      uid
      updated_at
      url_key
      url_path
       media_gallery {
            __typename
            url
            label
            disabled
            position
            ... on ProductVideo {
              video_content {
                video_provider
                video_url
                video_title
                media_type
                video_metadata
              }
            }
          }
      image {
        disabled
        label
        position
        url
      }
      price_range {
        minimum_price {
          __typename
          discount {
            __typename
            amount_off
            percent_off
          }
          final_price {
            __typename
            currency
            value
          }
          regular_price {
            __typename
            currency
            value
          }
        }
      }
      review_count
      short_description {
        html
      }
      description {
        html
      }
      small_image {
        disabled
        label
        position
        url
      }
      thumbnail {
        disabled
        label
        position
        url
      }
      image_banner
      image_banner_renew
      categories {
        __typename
        name
        id
        uid
        level
        url_path
        parent_id
        image_banner
        content_hot
      }
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
    
      }fragment ProductAttribute on ProductInterface{
      attributes {
        attribute_code
        label
        value
      }
      }
    fragment AttributeNewField on ProductInterface {
     attribute_new{
          brand_new
          buyback_price_new
          buyup_price_new
          category_for_product_new
          config_renew_new
          is_pre_order_new
          percent_new
          prepay_new
          price_original_new
          renew_content_new
          subsidy_new
          version_new
        }
    }
    ''';
    final variables= {
      "url":  url
    };
    return await http.doPostWithGraphSQL(query,variables: variables).then((response) {
      return BaseResponse(
          statusCode: response.statusCode,
          responseStatus: response.statusMessage,
          status: response.data['status'].toString(),
          data: response.data['data']['route'] ?? {},
          message:
          response.data['message'] ?? "");
    }).catchError((onError) {
      return BaseResponse(responseStatus: onError.toString(), statusCode: 400);
    });
  }
}
