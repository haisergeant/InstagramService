//
//  InstagramAuthenticateViewController.m
//  LetsShuga
//
//  Created by Le Thanh Hai on 10/7/15.
//  Copyright © 2015 goappable. All rights reserved.
//

#import "InstagramAuthenticateViewController.h"
#import "InstagramService.h"
#import "AppDelegate.h"




@interface InstagramAuthenticateViewController ()
@property (weak, nonatomic) IBOutlet UIWebView *myWebView;
- (IBAction)closeBtnTapped:(id)sender;

@end

@implementation InstagramAuthenticateViewController
@synthesize myWebView;
@synthesize delegate;
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.    
    //clear cookies
    NSHTTPCookieStorage *storage = [NSHTTPCookieStorage sharedHTTPCookieStorage];
    for (NSHTTPCookie *cookie in [storage cookies]) {
        [storage deleteCookie:cookie];
    }
    [[NSUserDefaults standardUserDefaults] synchronize];
    
    [[AppDelegate sharedInstance] showLoading];
    NSString *urlStr = [NSString stringWithFormat:@"https://api.instagram.com/oauth/authorize/?client_id=%@&redirect_uri=%@&response_type=code", CLIENT_ID, REDIRECT_URL];
    NSURL *url = [NSURL URLWithString:urlStr];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    myWebView.delegate = self;
    [myWebView loadRequest:request];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma mark - UIWebViewDelegate
- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType {
    NSURL *url = request.URL;
    NSString *temp = url.absoluteString;
    if ([temp rangeOfString:@"?code="].length != 0) {
        NSRange range = [temp rangeOfString:@"?code="];
        
        NSString *code = [temp substringFromIndex:range.location + range.length];
        [InstagramService queryAccessTokenWithCode:code
                                    withCompletion:^(id response) {
                                        NSLog(@"access token response: %@", response);
                                        [self handleAccessTokenResponse:response];
                                    } failure:^(NSString *error) {
                                        [self handleError:error];
                                    }];
    }
    return YES;
}

- (void)webViewDidStartLoad:(UIWebView *)webView {

}

- (void)webViewDidFinishLoad:(UIWebView *)webView {
    [[AppDelegate sharedInstance] hideLoading];
}

- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error {
    [[AppDelegate sharedInstance] hideLoading];
}

- (void) handleSuccess: (id) response {
    [[AppDelegate sharedInstance] hideLoading];
    if (delegate && [delegate respondsToSelector:@selector(didRequestUserInformationSuccess:withResponse:)]) {
        [delegate didRequestUserInformationSuccess:self withResponse:response];
    }
}

- (void) handleError: (NSString*) error {
    [[AppDelegate sharedInstance] hideLoading];
    if (delegate && [delegate respondsToSelector:@selector(didRequestUserInformationFail:withError:)]) {
        [delegate didRequestUserInformationFail:self withError:error];
    }
}

- (void) handleAccessTokenResponse: (id) response {
    NSDictionary *dict = (NSDictionary*) response;
    NSString *token = [dict objectForKey:@"access_token"];
    NSDictionary *userDict = [dict objectForKey:@"user"];
    NSString *userId = [userDict objectForKey:@"id"];
    [InstagramService queryUserByID:userId withAccessToken:token withCompletion:^(id response) {
        [self handleSuccess:response];
    } failure:^(NSString *error) {
        [self handleError:error];
    }];
}

#pragma mark - IBAction on view

- (IBAction)closeBtnTapped:(id)sender {
    [self.presentingViewController dismissViewControllerAnimated:YES completion:^{
        
    }];
}
@end
