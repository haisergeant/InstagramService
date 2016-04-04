//
//  QueryService.m
//  QuoteADay
//
//  Created by Le Thanh Hai on 5/15/15.
//  Copyright (c) 2015 socialux. All rights reserved.
//

#import "QueryService.h"
#import "PathUtils.h"

@implementation QueryService

+ (void)queryURLStr:(NSString *) urlStr
         parameters:(NSDictionary*) parameters
     withCompletion:(void (^)(id response))completion
            andFail:(void (^)(NSString * error))fail {
    [AFHTTPSessionManager manager].responseSerializer = [AFHTTPResponseSerializer serializer];
    [[AFHTTPSessionManager manager] GET:urlStr parameters:parameters progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        completion(responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        fail(error.localizedDescription);
    }];
}

+ (void) queryPOSTURLStr: (NSString*) urlStr
          parameters: (NSDictionary*) parameters
      withCompletion: (void(^) (id response)) completion
             andFail: (void (^)(NSString* error)) fail {
    [AFHTTPSessionManager manager].responseSerializer = [AFHTTPResponseSerializer serializer];
    [[AFHTTPSessionManager manager] POST:urlStr parameters:parameters progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        completion(responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        fail(error.localizedDescription);
    }];
}

+ (void)queryJSONFromURLStr:(NSString *)urlStr
             withCompletion:(void (^)(id))completion
                    andFail:(void (^)(NSString *))fail {
    [AFHTTPSessionManager manager].responseSerializer = [AFJSONResponseSerializer serializer];
    [[AFHTTPSessionManager manager] GET:urlStr parameters:nil progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        completion(responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        fail(error.localizedDescription);
    }];
}

+ (void)queryXMLFromURLStr:(NSString *)urlStr
            withCompletion:(void (^)(id))completion
                   andFail:(void (^)(NSString *))fail {
    [AFHTTPSessionManager manager].responseSerializer = [AFXMLParserResponseSerializer serializer];
    [[AFHTTPSessionManager manager] GET:urlStr parameters:nil progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        completion(responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        fail(error.localizedDescription);
    }];
}
@end
