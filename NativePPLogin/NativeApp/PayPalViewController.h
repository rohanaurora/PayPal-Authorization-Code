//
//  PayPalViewController.h
//  NativeApp
//
//  Created by Rohan Aurora on 9/13/14.
//  Copyright (c) 2014 Rohan Aurora. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PayPalMobile.h"

@interface PayPalViewController : UIViewController <PayPalProfileSharingDelegate>

@property(nonatomic, strong, readwrite) NSString *environment;
@property(nonatomic, strong, readwrite) NSString *resultText;
@property(nonatomic, strong, readwrite) NSString *authCodeString;
@property(nonatomic, strong, readwrite) NSString *code;

- (void)getUserAuthorizationForProfileSharing;


@end
