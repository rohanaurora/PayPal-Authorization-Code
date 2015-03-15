#Auth Code using PayPal iOS SDK

###Project Goal 

A simple project addressing strange behaviour while generating authorization code using PayPal iOS SDK 2.3.2 in Xcode 5.1.1 and Xcode 6.0.1. 

###Status  
This project is discontinued since, the issues were resolved successfully.

###Issues Raised 

The following issues have been raised [here](https://github.com/paypal/PayPal-iOS-SDK/issues/192)

* The authorization code generated by PayPal-iOS-SDK for Profile Sharing use case is constant -

`EJhi9jOPswug9TDOv93qg4Y28xIlqPDpAoqd7biDLpeGCPvORHjP1Fh4CbFPgKMGCHejdDwe9w1uDWnjPCp1lkaFBjVmjvjpFtnr6z1YeBbmfZYqa9faQT_71dmgZhMIFVkbi4yO7hk0LBHXt_wtdsw`

* The `kPayPalOAuth2ScopeEmail` scope seems to fail. You cannot see this specific scope in the user consent. Please give some advise.

* Running the same project [`commit 38b7e4f`](https://github.com/rohanaurora/PayPal-Authorization-Code/commit/38b7e4f8225022dcafd52f4814baf0d86569ce64) in [Xcode 6.0.1 (6A317)](https://itunes.apple.com/us/app/xcode/id497799835?ls=1&mt=12) works perfectly fine, generating unique authorization code everytime.


###Instructions 

1) Open `NativeApp.xcodeproj` in the latest [Xcode](https://developer.apple.com/downloads/index.action#). 

2) Build the project Command (⌘) + R

3) Login with your [PayPal Sandbox credentials](https://developer.paypal.com/docs/classic/lifecycle/sb_create-accounts/).

4) The PayPal iOS SDK provides an API to obtain user consent for profile sharing. The SDK is integrated into this sample app and is using it to authenticate the user and obtain the user's consent. The SDK handles authentication and authorization with the PayPal authentication server, and returns an OAuth2 authorization code as the output.


###Response

This authorization response is a NSDictionary object which can be seen in a debug window. Example:

    {
    client =     {
        environment = sandbox;
        "paypal_sdk_version" = "2.3.2";
        platform = iOS;
        "product_name" = "PayPal iOS SDK";
    };
    response =     {
        code = "EJhi9jOPswug9TDOv93qg4Y28xIlqPDpAoqd7biDLpeGCPvORHjP1Fh4CbFPgKMGCHejdDwe9w1uDWnjPCp1lkaFBjVmjvjpFtnr6z1YeBbmfZYqa9faQT_71dmgZhMIFVkbi4yO7hk0LBHXt_wtdsw";
    };
    "response_type" = "authorization_code";
    }


    

