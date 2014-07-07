//
//  MarvelAPIHelperTests.m
//  MarvelAPIDemo
//
//  Created by Diego Freniche Brito on 02/07/14.
//  Copyright (c) 2014 Diego Freniche Brito. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "MarvelAPIHelper.h"

@interface MarvelAPIHelperTests : XCTestCase

@end

@implementation MarvelAPIHelperTests



- (void)testGetComics {
    NSString *publicKey = @"bb8de9899e25561096de861a230919bf";
    NSString *privateKey = @"80a1f8e47a66bbbd98b3b6f147e1f76d7daf5ded";

    MarvelAPIHelper *mah = [[MarvelAPIHelper alloc] initWithPublicKey:publicKey andPrivateKey:privateKey];
    
    [mah allComics];
    [mah dataForSuperHeroNamed:@"hulk"];
    
}

@end
