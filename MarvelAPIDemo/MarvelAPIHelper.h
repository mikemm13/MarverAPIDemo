//
//  MarveAPIHelper.h
//  MarvelAPIDemo
//
//  Created by Diego Freniche Brito on 02/07/14.
//  Copyright (c) 2014 Diego Freniche Brito. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MarvelAPIHelper : NSObject

- (instancetype)initWithPublicKey:(NSString *)publicKey andPrivateKey:(NSString *)privateKey;

- (NSString *)authorizationStringWithTimeStamp:(NSString *)ts;

- (NSArray *)allComics;

- (NSData *)dataForSuperHeroNamed:(NSString *)name;

@end
