//
//  InstagramAuthenticateViewController.h
//  LetsShuga
//
//  Created by Le Thanh Hai on 10/7/15.
//  Copyright © 2015 goappable. All rights reserved.
//

#import <UIKit/UIKit.h>

#define CLIENT_ID @"061009861f7748c699d9e479bd271015"
#define CLIENT_SECRET @"73c537645abb47a19c6ece22d2a3a424"
#define REDIRECT_URL @"http://www.hai-le.com"

@class InstagramAuthenticateViewController;
@protocol InstagramAuthenticateViewControllerDelegate <NSObject>

- (void) didRequestUserInformationSuccess: (InstagramAuthenticateViewController*) controller withResponse: (id) response;
- (void) didRequestUserInformationFail:(InstagramAuthenticateViewController *)controller withError:(NSString *)error;

@end

@interface InstagramAuthenticateViewController : UIViewController<UIWebViewDelegate>

@property (nonatomic, assign) id<InstagramAuthenticateViewControllerDelegate> delegate;

@end
