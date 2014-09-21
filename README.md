#Login With PayPal Using iOS SDK

###Instructions -

1) Open `NativeApp.xcodeproj` in Xcode 5.1 or later. Click on the gray button.

2) Build the project Command (⌘) + R

3) Login with the following credentials:

* Username: ecn.test.sandbox.buyer1@gmail.com
* Password: ecnpass2580!

4) The PayPal iOS SDK provides an API to obtain user consent for profile sharing. The SDK is integrated into this sample app and is using it to authenticate the user and obtain the user's consent. The SDK handles authentication and authorization with the PayPal authentication server, and returns an OAuth2 authorization code as the output.

This authorization response is a NSDictionary object. Example:

    {
    client =     {
        environment = sandbox;
        "paypal_sdk_version" = "2.3.2";
        platform = iOS;
        "product_name" = "PayPal iOS SDK";
    };
    response =     {
        code = "EElZYzlR7X5l1ckxD75nzDC9_OyMEbb4jMDgSf8BA4uHElqnqg3xiMSpdD0ajgrsqdvkkR0VPw848WsNSN3mqEowdhPw0xgV2v9E83xfiRzAs3ELZ8pQP0XLEgwQCL_6jLpsMY-KnheWEoiT5zv3qEg";
    };
    "response_type" = "authorization_code";
    }
 
5) Authorization response is passed to the ECN servers to get a ```success``` or ```fail` response using a GET call in `sendAuthCode()` method.
