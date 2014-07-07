//
//  JSONParser.m
//  MarvelAPIDemo
//
//  Created by Miguel Martin Nieto on 07/07/14.
//  Copyright (c) 2014 Diego Freniche Brito. All rights reserved.
//

#import "SuperHeroParser.h"

@implementation SuperHeroParser

+ (SuperHero *)superHeroWithData:(NSData *)data{
    NSDictionary *parsedObject = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
    NSDictionary *dataDict = [parsedObject objectForKey:@"data"];
    NSArray *resultsArray = [dataDict objectForKey:@"results"];
    NSDictionary *results = resultsArray[0];
    NSString *name = [results objectForKey:@"name"];
    NSString *description = [results objectForKey:@"description"];
    NSDictionary *thumbnailDict = [results objectForKey:@"thumbnail"];
    NSString *thumbnail = [NSString stringWithFormat:@"%@.%@", [thumbnailDict objectForKey:@"path"], [thumbnailDict objectForKey:@"extension"]];
    
    SuperHero *superHero = [[SuperHero alloc] init];
    [superHero setName:name];
    [superHero setCharacterDescription:description];
    [superHero setThumbnail:thumbnail];
    return superHero;
}

+ (NSArray *)superHeroesWithData:(NSData *)data{
    NSDictionary *parsedObject = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
    NSDictionary *dataDict = [parsedObject objectForKey:@"data"];
    NSArray *resultsArray = [dataDict objectForKey:@"results"];
    NSMutableArray *superHeroes = [NSMutableArray array];
    for (NSDictionary *result in resultsArray) {
        NSString *name = [result objectForKey:@"name"];
        NSString *description = [result objectForKey:@"description"];
        NSDictionary *thumbnailDict = [result objectForKey:@"thumbnail"];
        NSString *thumbnail = @"";
        if ([thumbnailDict isKindOfClass:[NSDictionary class]]) {
            thumbnail = [NSString stringWithFormat:@"%@.%@", [thumbnailDict objectForKey:@"path"], [thumbnailDict objectForKey:@"extension"]];
        } else {
            thumbnail = @"";
        }
        
        SuperHero *superHero = [[SuperHero alloc] init];
        [superHero setName:name];
        [superHero setCharacterDescription:description];
        [superHero setThumbnail:thumbnail];
        [superHeroes addObject:superHero];
    }
    return superHeroes.copy;
}

@end
