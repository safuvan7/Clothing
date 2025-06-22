
import 'package:app_project/Data/Models/Category_model.dart';
import 'package:app_project/Routes/routes.dart';
import 'package:app_project/common/Images/sImages.dart';

import '../Data/Models/Brand_Model.dart';
import '../Data/Models/Product_Model.dart';
import '../Data/Models/banner_model.dart';


import '../Data/Models/product_attributes_model.dart';
import '../Data/Models/product_variation_model.dart';

class DummyData{

  // -- Banners
  static final List<BannerModel> banners = [
    BannerModel(imageUrl: sImages.banner1, targetScreen: sRoutes.cart, active: true),
    BannerModel(imageUrl: sImages.banner2, targetScreen: sRoutes.store, active: true),
    BannerModel(imageUrl: sImages.banner3, targetScreen: sRoutes.favourite, active: true),
  ];

  // -- List of all Categories
  static final List<CategoryModel> categories = [
    CategoryModel(id: '1', name: 'Men', isFeatured: true, image: sImages.Men),
    CategoryModel(id: '2', name: 'Women', isFeatured: true, image: sImages.Women),
    CategoryModel(id: '3', name: 'Kids', isFeatured: true, image: sImages.Kids)
  ];


  static final List<ProductModel> products = [
    ProductModel(
        id: '001',
        title: 'Light Blue Shirt',
        stock: 15,
        price: 1150,
        isFeatured: true,
        thumbnail: 'Assets/Images/ZARA3.png',
        description: 'Light Blue Shirt',
        brand: BrandModel(
            id: '1',
            image: 'Assets/Images/Zara_L.png',
            name: 'ZARA',
          productsCount: 265,
          isFeatured: true
        ),
        images: [
          'Assets/Images/ZARA3.png',
          'Assets/Images/ZARA1.png',
          'Assets/Images/ZARA2.png',
          'Assets/Images/ZARA_4.png'
        ],
        salePrice: 30,
        sku: 'ASD6543',
        categoryId: '1',
        productAttribute: [
          ProductAttributeModel(name: 'Color',values: ['Green','Black','Red']),
          ProductAttributeModel(name: 'Size', values: ['S','M','L','XL']),
        ],
        productVariation: [
          ProductVariationModel(
              id: '1',
              stock: 34,
              price: 134,
              salePrice: 122.6,
              image: 'Assets/Images/ZARA3.png',
              description: 'This is a light blue button-up shirt with long sleeves.',
              attributeValues: {'Color' : 'Green', 'Size' : 'M'}
          ),
          ProductVariationModel(
              id: '2',
              stock: 15,
              price: 132,
              image: 'Assets/Images/ZARA1.png',
              attributeValues: {'Color' : 'Black', 'Size' : 'L'}
          ),
          ProductVariationModel(
              id: '3',
              stock: 0,
              price: 234,
              image: 'Assets/Images/ZARA2.png',
              attributeValues: {'Color' : 'Green', 'Size' : 'S'}
          ),
          ProductVariationModel(
              id: '4',
              stock: 222,
              price: 232,
              image: 'Assets/Images/ZARA1.png',
              attributeValues: {'Color' : 'Black', 'Size' : 'XL'}
          ),
          ProductVariationModel(
              id: '5',
              stock: 0,
              price: 334,
              image: 'Assets/Images/ZARA2.png',
              attributeValues: {'Color' : 'Red', 'Size' : 'L'}
          ),
          ProductVariationModel(
              id: '6',
              stock: 11,
              price: 332,
              image: 'Assets/Images/ZARA_P4.png',
              attributeValues: {'Color' : 'Red', 'Size' : 'M'}
          ),
        ],
        productType: 'ProductType.variable',
    ),


    ProductModel(
      id: '001',
      title: 'Light Blue Shirt',
      stock: 15,
      price: 1150,
      isFeatured: true,
      thumbnail: 'Assets/Images/ZARA3.png',
      description: 'Light Blue Shirt',
      brand: BrandModel(
          id: '1',
          image: 'Assets/Images/Zara_L.png',
          name: 'ZARA',
          productsCount: 265,
          isFeatured: true
      ),
      images: [
        'Assets/Images/ZARA3.png',
        'Assets/Images/ZARA1.png',
        'Assets/Images/ZARA2.png',
        'Assets/Images/ZARA_4.png'
      ],
      salePrice: 30,
      sku: 'ASD6543',
      categoryId: '1',
      productAttribute: [
        ProductAttributeModel(name: 'Color',values: ['Green','Black','Red']),
        ProductAttributeModel(name: 'Size', values: ['S','M','L','XL']),
      ],
      productVariation: [
        ProductVariationModel(
            id: '1',
            stock: 34,
            price: 134,
            salePrice: 122.6,
            image: 'Assets/Images/ZARA3.png',
            description: 'This is a light blue button-up shirt with long sleeves.',
            attributeValues: {'Color' : 'Green', 'Size' : 'M'}
        ),
        ProductVariationModel(
            id: '2',
            stock: 15,
            price: 132,
            image: 'Assets/Images/ZARA1.png',
            attributeValues: {'Color' : 'Black', 'Size' : 'L'}
        ),
        ProductVariationModel(
            id: '3',
            stock: 0,
            price: 234,
            image: 'Assets/Images/ZARA2.png',
            attributeValues: {'Color' : 'Green', 'Size' : 'S'}
        ),
        ProductVariationModel(
            id: '4',
            stock: 222,
            price: 232,
            image: 'Assets/Images/ZARA1.png',
            attributeValues: {'Color' : 'Black', 'Size' : 'XL'}
        ),
        ProductVariationModel(
            id: '5',
            stock: 0,
            price: 334,
            image: 'Assets/Images/ZARA2.png',
            attributeValues: {'Color' : 'Red', 'Size' : 'L'}
        ),
        ProductVariationModel(
            id: '6',
            stock: 11,
            price: 332,
            image: 'Assets/Images/ZARA_P4.png',
            attributeValues: {'Color' : 'Red', 'Size' : 'M'}
        ),
      ],
      productType: 'ProductType.variable',
    ),


    ProductModel(
      id: '001',
      title: 'Light Blue Shirt',
      stock: 15,
      price: 1150,
      isFeatured: true,
      thumbnail: 'Assets/Images/ZARA3.png',
      description: 'Light Blue Shirt',
      brand: BrandModel(
          id: '1',
          image: 'Assets/Images/Zara_L.png',
          name: 'ZARA',
          productsCount: 265,
          isFeatured: true
      ),
      images: [
        'Assets/Images/ZARA3.png',
        'Assets/Images/ZARA1.png',
        'Assets/Images/ZARA2.png',
        'Assets/Images/ZARA_4.png'
      ],
      salePrice: 30,
      sku: 'ASD6543',
      categoryId: '1',
      productAttribute: [
        ProductAttributeModel(name: 'Color',values: ['Green','Black','Red']),
        ProductAttributeModel(name: 'Size', values: ['S','M','L','XL']),
      ],
      productVariation: [
        ProductVariationModel(
            id: '1',
            stock: 34,
            price: 134,
            salePrice: 122.6,
            image: 'Assets/Images/ZARA3.png',
            description: 'This is a light blue button-up shirt with long sleeves.',
            attributeValues: {'Color' : 'Green', 'Size' : 'M'}
        ),
        ProductVariationModel(
            id: '2',
            stock: 15,
            price: 132,
            image: 'Assets/Images/ZARA1.png',
            attributeValues: {'Color' : 'Black', 'Size' : 'L'}
        ),
        ProductVariationModel(
            id: '3',
            stock: 0,
            price: 234,
            image: 'Assets/Images/ZARA2.png',
            attributeValues: {'Color' : 'Green', 'Size' : 'S'}
        ),
        ProductVariationModel(
            id: '4',
            stock: 222,
            price: 232,
            image: 'Assets/Images/ZARA1.png',
            attributeValues: {'Color' : 'Black', 'Size' : 'XL'}
        ),
        ProductVariationModel(
            id: '5',
            stock: 0,
            price: 334,
            image: 'Assets/Images/ZARA2.png',
            attributeValues: {'Color' : 'Red', 'Size' : 'L'}
        ),
        ProductVariationModel(
            id: '6',
            stock: 11,
            price: 332,
            image: 'Assets/Images/ZARA_P4.png',
            attributeValues: {'Color' : 'Red', 'Size' : 'M'}
        ),
      ],
      productType: 'ProductType.variable',
    ),

    ProductModel(
      id: '001',
      title: 'Light Blue Shirt',
      stock: 15,
      price: 1150,
      isFeatured: true,
      thumbnail: 'Assets/Images/ZARA3.png',
      description: 'Light Blue Shirt',
      brand: BrandModel(
          id: '1',
          image: 'Assets/Images/Zara_L.png',
          name: 'ZARA',
          productsCount: 265,
          isFeatured: true
      ),
      images: [
        'Assets/Images/ZARA3.png',
        'Assets/Images/ZARA1.png',
        'Assets/Images/ZARA2.png',
        'Assets/Images/ZARA_4.png'
      ],
      salePrice: 30,
      sku: 'ASD6543',
      categoryId: '1',
      productAttribute: [
        ProductAttributeModel(name: 'Color',values: ['Green','Black','Red']),
        ProductAttributeModel(name: 'Size', values: ['S','M','L','XL']),
      ],
      productVariation: [
        ProductVariationModel(
            id: '1',
            stock: 34,
            price: 134,
            salePrice: 122.6,
            image: 'Assets/Images/ZARA3.png',
            description: 'This is a light blue button-up shirt with long sleeves.',
            attributeValues: {'Color' : 'Green', 'Size' : 'M'}
        ),
        ProductVariationModel(
            id: '2',
            stock: 15,
            price: 132,
            image: 'Assets/Images/ZARA1.png',
            attributeValues: {'Color' : 'Black', 'Size' : 'L'}
        ),
        ProductVariationModel(
            id: '3',
            stock: 0,
            price: 234,
            image: 'Assets/Images/ZARA2.png',
            attributeValues: {'Color' : 'Green', 'Size' : 'S'}
        ),
        ProductVariationModel(
            id: '4',
            stock: 222,
            price: 232,
            image: 'Assets/Images/ZARA1.png',
            attributeValues: {'Color' : 'Black', 'Size' : 'XL'}
        ),
        ProductVariationModel(
            id: '5',
            stock: 0,
            price: 334,
            image: 'Assets/Images/ZARA2.png',
            attributeValues: {'Color' : 'Red', 'Size' : 'L'}
        ),
        ProductVariationModel(
            id: '6',
            stock: 11,
            price: 332,
            image: 'Assets/Images/ZARA_P4.png',
            attributeValues: {'Color' : 'Red', 'Size' : 'M'}
        ),
      ],
      productType: 'ProductType.variable',
    ),

    ProductModel(
      id: '001',
      title: 'Light Blue Shirt',
      stock: 15,
      price: 1150,
      isFeatured: true,
      thumbnail: 'Assets/Images/ZARA3.png',
      // description: 'Light Blue Shirt',
      brand: BrandModel(
          id: '1',
          image: 'Assets/Images/Zara_L.png',
          name: 'ZARA',
          productsCount: 265,
          isFeatured: true
      ),
      images: [
        'Assets/Images/ZARA3.png',
        'Assets/Images/ZARA1.png',
        'Assets/Images/ZARA2.png',
        'Assets/Images/ZARA_4.png'
      ],
      salePrice: 30,
      sku: 'ASD6543',
      categoryId: '1',
      productAttribute: [
        ProductAttributeModel(name: 'Color',values: ['Green','Black','Red']),
        ProductAttributeModel(name: 'Size', values: ['S','M','L','XL']),
      ],
      productVariation: [
        ProductVariationModel(
            id: '1',
            stock: 34,
            price: 134,
            salePrice: 122.6,
            image: 'Assets/Images/ZARA3.png',
            description: 'This is a light blue button-up shirt with long sleeves.',
            attributeValues: {'Color' : 'Green', 'Size' : 'M'}
        ),
        ProductVariationModel(
            id: '2',
            stock: 15,
            price: 132,
            image: 'Assets/Images/ZARA1.png',
            attributeValues: {'Color' : 'Black', 'Size' : 'L'}
        ),
        ProductVariationModel(
            id: '3',
            stock: 0,
            price: 234,
            image: 'Assets/Images/ZARA2.png',
            attributeValues: {'Color' : 'Green', 'Size' : 'S'}
        ),
        ProductVariationModel(
            id: '4',
            stock: 222,
            price: 232,
            image: 'Assets/Images/ZARA1.png',
            attributeValues: {'Color' : 'Black', 'Size' : 'XL'}
        ),
        ProductVariationModel(
            id: '5',
            stock: 0,
            price: 334,
            image: 'Assets/Images/ZARA2.png',
            attributeValues: {'Color' : 'Red', 'Size' : 'L'}
        ),
        ProductVariationModel(
            id: '6',
            stock: 11,
            price: 332,
            image: 'Assets/Images/ZARA_P4.png',
            attributeValues: {'Color' : 'Red', 'Size' : 'M'}
        ),
      ],
      productType: 'ProductType.variable',
    ),


    ProductModel(
      id: '001',
      title: 'Light Blue Shirt',
      stock: 15,
      price: 1150,
      isFeatured: true,
      thumbnail: 'Assets/Images/ZARA3.png',
      description: 'Light Blue Shirt',
      brand: BrandModel(
          id: '1',
          image: 'Assets/Images/Zara_L.png',
          name: 'ZARA',
          productsCount: 265,
          isFeatured: true
      ),
      images: [
        'Assets/Images/ZARA3.png',
        'Assets/Images/ZARA1.png',
        'Assets/Images/ZARA2.png',
        'Assets/Images/ZARA_4.png'
      ],
      salePrice: 30,
      sku: 'ASD6543',
      categoryId: '1',
      productAttribute: [
        ProductAttributeModel(name: 'Color',values: ['Green','Black','Red']),
        ProductAttributeModel(name: 'Size', values: ['S','M','L','XL']),
      ],
      productVariation: [
        ProductVariationModel(
            id: '1',
            stock: 34,
            price: 134,
            salePrice: 122.6,
            image: 'Assets/Images/ZARA3.png',
            description: 'This is a light blue button-up shirt with long sleeves.',
            attributeValues: {'Color' : 'Green', 'Size' : 'M'}
        ),
        ProductVariationModel(
            id: '2',
            stock: 15,
            price: 132,
            image: 'Assets/Images/ZARA1.png',
            attributeValues: {'Color' : 'Black', 'Size' : 'L'}
        ),
        ProductVariationModel(
            id: '3',
            stock: 0,
            price: 234,
            image: 'Assets/Images/ZARA2.png',
            attributeValues: {'Color' : 'Green', 'Size' : 'S'}
        ),
        ProductVariationModel(
            id: '4',
            stock: 222,
            price: 232,
            image: 'Assets/Images/ZARA1.png',
            attributeValues: {'Color' : 'Black', 'Size' : 'XL'}
        ),
        ProductVariationModel(
            id: '5',
            stock: 0,
            price: 334,
            image: 'Assets/Images/ZARA2.png',
            attributeValues: {'Color' : 'Red', 'Size' : 'L'}
        ),
        ProductVariationModel(
            id: '6',
            stock: 11,
            price: 332,
            image: 'Assets/Images/ZARA_P4.png',
            attributeValues: {'Color' : 'Red', 'Size' : 'M'}
        ),
      ],
      productType: 'ProductType.variable',
    )
  ];
}
