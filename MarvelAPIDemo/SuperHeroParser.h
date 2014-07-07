//
//  JSONParser.h
//  MarvelAPIDemo
//
//  Created by Miguel Martin Nieto on 07/07/14.
//  Copyright (c) 2014 Diego Freniche Brito. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SuperHero.h"

@interface SuperHeroParser : NSObject

+ (SuperHero*)superHeroWithData:(NSData *)data;

@end
