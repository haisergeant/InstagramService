//
//  PathUtils.m
//  QuoteADay
//
//  Created by Le Thanh Hai on 6/30/15.
//  Copyright (c) 2015 socialux. All rights reserved.
//

#import "PathUtils.h"

@implementation PathUtils

+ (NSString *)retrieveDocumentPathFromPath:(NSString *)subPath {
    NSString *documentStr = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    return [documentStr stringByAppendingPathComponent:subPath];
}

+ (NSString*)createDocumentFolderIfNeed:(NSString *)folderPath {
    NSString *folder = [PathUtils retrieveDocumentPathFromPath:folderPath];
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSError *error = nil;
    if (![fileManager fileExistsAtPath:folder]) {
        [fileManager createDirectoryAtPath:folder withIntermediateDirectories:YES attributes:nil error:&error];
    }
    if (error) {
        NSLog(@"create folder error: %@", error.localizedDescription);
        return @"";
    } else {
        return folder;
    }
}

+ (BOOL)checkFileExist:(NSString *)file {
    NSString *filePath = [PathUtils retrieveDocumentPathFromPath:file];
    if ([[NSFileManager defaultManager] fileExistsAtPath:filePath]) {
        return TRUE;
    } else {
        return FALSE;
    }
}

@end
