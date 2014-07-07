//
//  NSString+MD5Tests.m
//  MarvelAPIDemo
//
//  Created by Diego Freniche Brito on 02/07/14.
//  Copyright (c) 2014 Diego Freniche Brito. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "NSString+MD5.h"

@interface NSString_MD5Tests : XCTestCase

@end

@implementation NSString_MD5Tests


- (void)testMD5 {
    
    NSString *theString = @"bb8de9899e25561096de861a230919bf";
    
    NSString *md5 = [theString MD5];
    
    XCTAssertEqualObjects(md5, @"a9c6401e8d8a077c332c3b8c8effac1f", @"");
}

- (void)testMD5PrivateKey {
    
    NSString *theString = @"80a1f8e47a66bbbd98b3b6f147e1f76d7daf5ded";
    
    NSString *md5 = [theString MD5];
    
    XCTAssertEqualObjects(md5, @"8caa62abe12306df7aa32766230a70b6", @"");
}

- (void)testMD5Fails {
    
    NSString *theString = @"bb8de9899e255610861a230919bf";
    
    NSString *md5 = [theString MD5];
    
    XCTAssertNotEqualObjects(md5, @"a9c6401e8d8a077c332c3b8c8effac1f", @"");
}

@end
