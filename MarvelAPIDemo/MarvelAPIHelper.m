//
//  MarveAPIHelper.m
//  MarvelAPIDemo
//
//  Created by Diego Freniche Brito on 02/07/14.
//  Copyright (c) 2014 Diego Freniche Brito. All rights reserved.
//

#import "MarvelAPIHelper.h"
#import "NSString+MD5.h"

#define MARVEL_BASE_URL @"http://gateway.marvel.com/v1/public/"

@interface MarvelAPIHelper ()
@property (copy, nonatomic) NSString *publicKey;
@property (copy, nonatomic) NSString *privateKey;


@end

@implementation MarvelAPIHelper

- (instancetype)init
{
    self = [super init];
    if (self) {
        self = [self initWithPublicKey:@"public" andPrivateKey:@"private"];
    }
    return self;
}

- (instancetype)initWithPublicKey:(NSString *)publicKey andPrivateKey:(NSString *)privateKey
{
    self = [super init];
    if (self) {
        _publicKey = publicKey;
        _privateKey = privateKey;
    }
    return self;
}

- (NSString *)authorizationStringWithTimeStamp:(NSString *)ts {
    
    NSString *preHash = [NSString stringWithFormat:@"%@%@%@", ts, self.privateKey, self.publicKey];
    
    return [preHash MD5];
}

- (NSArray *)allComics {
    NSString *ts = [self newTimestamp];
    NSString *authString = [self authorizationStringWithTimeStamp:ts];
    NSString *get = [NSString stringWithFormat:@"%@%@?ts=%@&apikey=%@&hash=%@", MARVEL_BASE_URL, @"comics", ts, self.publicKey, authString];
    
    NSArray *comics;
    
    NSURL *url = [NSURL URLWithString:get];
    
    NSData *data = [NSData dataWithContentsOfURL:url];
    
    return comics;
}

- (NSData *)dataForSuperHeroNamed:(NSString *)name{
    NSString *ts = [self newTimestamp];
    NSString *authString = [self authorizationStringWithTimeStamp:ts];
    NSString *get = [NSString stringWithFormat:@"%@%@?name=%@&ts=%@&apikey=%@&hash=%@", MARVEL_BASE_URL, @"characters", name, ts, self.publicKey, authString];
    
    NSURL *url = [NSURL URLWithString:get];
    
    NSData *data = [NSData dataWithContentsOfURL:url];
    
    return data;

}

- (NSString *)newTimestamp{
    NSTimeInterval timeInterval = [[NSDate date] timeIntervalSince1970];
    NSNumber *timeStampObj = [NSNumber numberWithDouble:timeInterval];
    NSString *timeStampStr = [timeStampObj stringValue];
    return timeStampStr;
}

@end