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
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0) , ^{
        UIImage *image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:url]]];
        dispatch_async(dispatch_get_main_queue(), ^{
            completionBlock(image);
        });
    });
}

@end
