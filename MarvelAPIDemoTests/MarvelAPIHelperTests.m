//
//  MarvelAPIHelperTests.m
//  MarvelAPIDemo
//
//  Created by Diego Freniche Brito on 02/07/14.
//  Copyright (c) 2014 Diego Freniche Brito. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "MarvelAPIHelper.h"
#import "SuperHero.h"
#import "SuperHeroParser.h"

NSString *const publicKey = @"bb8de9899e25561096de861a230919bf";
NSString *const privateKey = @"80a1f8e47a66bbbd98b3b6f147e1f76d7daf5ded";

@interface MarvelAPIHelperTests : XCTestCase

@end

@implementation MarvelAPIHelperTests



- (void)testGetComics {

    MarvelAPIHelper *mah = [[MarvelAPIHelper alloc] initWithPublicKey:publicKey andPrivateKey:privateKey];
    
    [mah allComics];
    [mah dataForSuperHeroNamed:@"hulk"];
    
}

- (void)testCanCreateSuperHero{
    SuperHero *superHero = [[SuperHero alloc] init];
    superHero.name = @"hulk";
    XCTAssertEqual(@"hulk", superHero.name, @"");
}

- (void)testCanObtainSuperHeroFromData {
    MarvelAPIHelper *mah = [[MarvelAPIHelper alloc] initWithPublicKey:publicKey andPrivateKey:privateKey];
    NSData *data = [mah dataForSuperHeroNamed:@"hulk"];
    SuperHero *superHero = [SuperHeroParser superHeroWithData:data];
    XCTAssertEqualObjects(@"Hulk", superHero.name, @"");
    
}

- (void)testBlock {
    MarvelAPIHelper *mah = [[MarvelAPIHelper alloc] initWithPublicKey:publicKey andPrivateKey:privateKey];
    [mah dataForSuperHeroNamed:@"Hulk" completion:^(NSData *resultData) {
       
    }];
}

@end
