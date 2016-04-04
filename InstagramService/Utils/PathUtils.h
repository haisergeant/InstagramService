//
//  PathUtils.h
//  QuoteADay
//
//  Created by Le Thanh Hai on 6/30/15.
//  Copyright (c) 2015 socialux. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PathUtils : NSObject

+ (NSString*) retrieveDocumentPathFromPath: (NSString*) subPath;
+ (NSString*) createDocumentFolderIfNeed: (NSString*) folderPath;
+ (BOOL) checkFileExist: (NSString*) file;

@end
