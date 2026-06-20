# AtlasShop Checkout Architecture

The Web App receives shopper requests and calls the Auth Service before checkout.
The Auth Service reads the User Database. During checkout, the Web App sends the
cart to the Checkout API. Checkout API calls the Inventory Service to reserve
stock and calls the Payment Gateway to authorize payment. After payment is
authorized, Checkout API publishes an order_created event to the Order Queue.
The Fulfillment Worker consumes Order Queue messages and writes shipment records
to the Shipment Database. The Recommendation Service reads the User Database
and Product Catalog but is not part of the checkout path.
