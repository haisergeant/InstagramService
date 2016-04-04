//
//  InstagramService.h
//  LetsShuga
//
//  Created by Le Thanh Hai on 10/7/15.
//  Copyright © 2015 goappable. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface InstagramService : NSObject

+ (void) queryAccessTokenWithCode: (NSString*) code withCompletion: (void(^)(id response)) completion failure: (void(^)(NSString* error)) fail;
+ (void) queryUserByID: (NSString*) userId withAccessToken: (NSString*) token withCompletion: (void(^)(id response)) completion failure: (void(^)(NSString* error)) fail;


@end
