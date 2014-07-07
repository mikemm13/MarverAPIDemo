//
//  ImageDownloader.m
//  MarvelAPIDemo
//
//  Created by Miguel Martin Nieto on 07/07/14.
//  Copyright (c) 2014 Diego Freniche Brito. All rights reserved.
//

#import "ImageDownloader.h"

@implementation ImageDownloader

+ (void)downloadImageUsingUrl:(NSString *)url completion:(void (^)(UIImage *))completionBlock{
    
    NSURLSession *session = [NSURLSession sharedSession];
    [[session dataTaskWithURL:[NSURL URLWithString:url] completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        UIImage *image = [UIImage imageWithData:data];
        dispatch_async(dispatch_get_main_queue(), ^{
            completionBlock(image);
        });
        
    }] resume];

}

@end
