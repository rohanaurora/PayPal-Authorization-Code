//
//  PayPalViewController.m
//  NativeApp
//
//  Created by Rohan Aurora on 9/13/14.
//  Copyright (c) 2014 Rohan Aurora. All rights reserved.
//

#import "PayPalViewController.h"
#import <QuartzCore/QuartzCore.h>
#import "PayPalMobile.h"

#define kPayPalEnvironment PayPalEnvironmentSandbox

@interface PayPalViewController ()
@property(nonatomic, strong, readwrite) PayPalConfiguration *payPalConfig;
@end

@implementation PayPalViewController


- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    // Preconnect to PayPal early
    [PayPalMobile preconnectWithEnvironment:self.environment];
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"PayPal Native Login";
    
    // Set up payPalConfig
    self.payPalConfig = [[PayPalConfiguration alloc] init];
    self.payPalConfig.acceptCreditCards = YES;
    self.payPalConfig.languageOrLocale = @"en";
    self.payPalConfig.merchantName = @"Anonymous Merchant";
    self.payPalConfig.merchantPrivacyPolicyURL = [NSURL URLWithString:@"https://www.paypal.com/webapps/mpp/ua/privacy-full"];
    self.payPalConfig.merchantUserAgreementURL = [NSURL URLWithString:@"https://www.paypal.com/webapps/mpp/ua/useragreement-full"];
    self.payPalConfig.languageOrLocale = [NSLocale preferredLanguages][0];
    self.payPalConfig.payPalShippingAddressOption = PayPalShippingAddressOptionPayPal;
    self.environment = kPayPalEnvironment;
    
// Get authorization code using IBAction/UIButton
    
/*
    UIButton* testButn = [UIButton buttonWithType:UIButtonTypeCustom];
    [testButn setFrame:CGRectMake(130, 195, 70, 45)];
    [testButn setImage:[UIImage imageNamed:@"BuyButton"] forState:UIControlStateNormal];
    [testButn setImage:[UIImage imageNamed:@"BuyButton"]   forState:UIControlStateSelected];
    [testButn addTarget:self action:@selector(getUserAuthorizationForProfileSharing) forControlEvents:UIControlEventTouchDown];
    [self.view addSubview:testButn];

}


-(void)stayPressed:(UIButton *) sender {
    if (sender.selected == YES) {
        sender.selected = NO;
    } else{
        sender.selected = YES;
    }

*/
    
// Call programmtically
    [self getUserAuthorizationForProfileSharing];

}
    

#pragma mark - Authorize Profile Sharing

- (void)getUserAuthorizationForProfileSharing {
    
    NSSet *scopeValues = [NSSet setWithArray:@[kPayPalOAuth2ScopeEmail, kPayPalOAuth2ScopeAddress, kPayPalOAuth2ScopeOpenId, kPayPalOAuth2ScopePhone]];
    
    PayPalProfileSharingViewController *profileSharingPaymentViewController = [[PayPalProfileSharingViewController alloc] initWithScopeValues:scopeValues configuration:self.payPalConfig delegate:self];
    [self presentViewController:profileSharingPaymentViewController animated:YES completion:nil];
}

#pragma mark PayPalProfileSharingDelegate methods

- (void)payPalProfileSharingViewController:(PayPalProfileSharingViewController *)profileSharingViewController 
             userDidLogInWithAuthorization:(NSDictionary *)profileSharingAuthorization {
    
    NSLog(@"PayPal Profile Sharing Authorization Success!");
    self.resultText = [profileSharingAuthorization description];
    
    [self sendProfileSharingAuthorizationToServer:profileSharingAuthorization];
    [self dismissViewControllerAnimated:YES completion:nil];
}


- (void)userDidCancelPayPalProfileSharingViewController:(PayPalProfileSharingViewController *)profileSharingViewController {
    NSLog(@"PayPal Profile Sharing Authorization Canceled");
    [self dismissViewControllerAnimated:YES completion:nil];
}



- (void)sendProfileSharingAuthorizationToServer:(NSDictionary *)authorization {

    NSLog(@"Here is your authorization  %@:", authorization);
    NSDictionary *getAuthCodeDictionary = [authorization valueForKeyPath:@"response.code"];
    self.authCodeString = [NSString stringWithFormat:@"%@", getAuthCodeDictionary];
}


@end
