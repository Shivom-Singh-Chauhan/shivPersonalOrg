public class CustomCheckoutButtonController {
    @AuraEnabled
    public static String productCheckout(Id cartId){

        List<CartItem> cartItemList = [SELECT Id, TotalAmount FROM CartItem WHERE CartId = :cartId];

        List<Order> orderList = new List<Order>();
        return null;
    }
}