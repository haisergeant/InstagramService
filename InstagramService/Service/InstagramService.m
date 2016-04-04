//
//  InstagramService.m
//  LetsShuga
//
//  Created by Le Thanh Hai on 10/7/15.
//  Copyright © 2015 goappable. All rights reserved.
//

#import "InstagramService.h"
#import "QueryService.h"
#import "InstagramAuthenticateViewController.h"

@implementation InstagramService

+ (void)queryAccessTokenWithCode:(NSString *)code withCompletion:(void (^)(id))completion failure:(void (^)(NSString *))fail {
    NSString *urlStr  = [NSString stringWithFormat:@"https://api.instagram.com/oauth/access_token"];
    NSMutableDictionary *dict = [[NSMutableDictionary alloc] init];
    [dict setObject:CLIENT_ID forKey:@"client_id"];
    [dict setObject:CLIENT_SECRET forKey:@"client_secret"];
    [dict setObject:@"authorization_code" forKey:@"grant_type"];
    [dict setObject:REDIRECT_URL forKey:@"redirect_uri"];
    [dict setObject:code forKey:@"code"];
    
    [QueryService queryPOSTURLStr:urlStr parameters:dict withCompletion:^(id response) {
        completion(response);
    } andFail:^(NSString *error) {
        fail(error);
    }];
}

+ (void)queryUserByID:(NSString *)userId withAccessToken:(NSString *)token withCompletion:(void (^)(id))completion failure:(void (^)(NSString *))fail {
    NSString *urlStr  = [NSString stringWithFormat:@"https://api.instagram.com/v1/users/%@/?access_token=%@", userId, token];
    [QueryService queryURLStr:urlStr parameters:nil withCompletion:^(id response) {
        completion(response);
    } andFail:^(NSString *error) {
        fail(error);
    }];
}

@end
