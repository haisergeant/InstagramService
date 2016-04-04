//
//  QueryService.h
//  QuoteADay
//
//  Created by Le Thanh Hai on 5/15/15.
//  Copyright (c) 2015 socialux. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AFNetworking/AFNetworking.h>

@interface QueryService : NSObject

+ (void) queryURLStr: (NSString*) urlStr
          parameters: (NSDictionary*) parameters
      withCompletion: (void(^) (id response)) completion
             andFail: (void (^)(NSString* error)) fail;
+ (void) queryPOSTURLStr: (NSString*) urlStr
          parameters: (NSDictionary*) parameters
      withCompletion: (void(^) (id response)) completion
             andFail: (void (^)(NSString* error)) fail;
+ (void) queryJSONFromURLStr: (NSString*) urlStr
              withCompletion: (void(^) (id object)) completion
                     andFail: (void (^)(NSString* error)) fail;
+ (void) queryXMLFromURLStr: (NSString*) urlStr
             withCompletion: (void(^) (id object)) completion
                    andFail: (void (^)(NSString* error)) fail;
@end
