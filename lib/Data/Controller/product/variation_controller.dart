import 'package:app_project/Data/Controller/product/Images_controller.dart';
import 'package:app_project/Data/Models/Product_Model.dart';
import 'package:app_project/Data/Models/product_variation_model.dart';
import 'package:get/get.dart';

class VariationController extends GetxController {
  static VariationController get instance => Get.find();

  //   variables
  RxMap selectedAttributes = {}.obs;
  RxString variationStockStatus = ''.obs;
  Rx<ProductVariationModel> selectedVariation = ProductVariationModel.empty().obs;

  // Select attribute and variation
  void onAttributeSelected(ProductModel product, attributeName, attributeValue) {

    final selectedAttributes = Map<String, dynamic>.from(this.selectedAttributes);
    selectedAttributes[attributeName] = attributeValue;
    this.selectedAttributes[attributeName] = attributeValue;

    final selecteddVariation = product.productVariation!.firstWhere((variation) =>
        _isSameAttributeValues(variation.attributeValues, selectedAttributes),
        orElse: () => ProductVariationModel.empty());

    if (selecteddVariation.image.isNotEmpty) {
      ImageController.instance.selectedProductImage.value = selecteddVariation.image;
    }

    this.selectedVariation.value = selecteddVariation;

    getProductVariationStockStatus();
  }

  // -- Check if selected attribute matches any variation attributes
  bool _isSameAttributeValues(Map<String, dynamic> variationAttributes, Map<String, dynamic> selectedAttributes) {
    if(variationAttributes.length != selectedAttributes.length) return false;

    for (final key in variationAttributes.keys) {
      if (variationAttributes[key] != selectedAttributes[key]) return false;
    }
    return true;
  }

  // -- Check attribute availability / stock in variation
  Set<String?> getAttributesAvailabilityInVariation(List<ProductVariationModel> variations, String attributeName) {
    final availableVariationAttributeValues = variations
        .where((variation) =>
        variation.attributeValues[attributeName] != null
            && variation.attributeValues[attributeName]!.isNotEmpty
            && variation.stock > 0)
        .map((variation) => variation.attributeValues[attributeName])
        .toSet();

    return availableVariationAttributeValues;
  }

  String getVariationPrice() {
    return (selectedVariation.value.salePrice > 0 ? selectedVariation.value.salePrice
        : selectedVariation.value.price).toString();
  }



  // -- Check product variation stock status
  void getProductVariationStockStatus() {
    variationStockStatus.value = selectedVariation.value.stock > 0 ? 'In Stock' : 'Out of Stock';
  }

  // -- Reset Selected Attributes when switching products
  void resetSelectedAttributes() {
    selectedAttributes.clear();
    variationStockStatus.value = '';
    selectedVariation.value = ProductVariationModel.empty();
  }




}