//
//  NSString_PhyreKitTestsSpec.m
//  PhyreKit
//
//  Created by Matt Ricketson on 6/2/14.
//  Copyright 2014 Phyre Inc. All rights reserved.
//

#import <Kiwi/Kiwi.h>
#import <PhyreKit/Foundation+PhyreKit.h>


SPEC_BEGIN(NSString_PhyreKitTestsSpec)

describe(@"NSString_PhyreKitTests", ^{
    
    it(@"detects empty strings", ^{
        [[theValue(PHYStringIsEmpty(nil)) should] beYes];
        [[theValue(PHYStringIsEmpty(@"")) should] beYes];
        [[theValue(PHYStringIsEmpty(@" ")) should] beNo];
        [[theValue(PHYStringIsEmpty(@"foo")) should] beNo];
    });
    
    it(@"detects equal strings", ^{
        [[theValue(PHYEqualStrings(nil, nil)) should] beYes];
        [[theValue(PHYEqualStrings(@"foo", nil)) should] beNo];
        [[theValue(PHYEqualStrings(nil, @"bar")) should] beNo];
        [[theValue(PHYEqualStrings(@"foo", @"bar")) should] beNo];
        [[theValue(PHYEqualStrings(@"foo", @"foo")) should] beYes];
    });
    
    it(@"converts BOOLs to strings", ^{
        [[PHYStringFromBOOL(YES) should] equal:@"YES"];
        [[PHYStringFromBOOL(NO) should] equal:@"NO"];
    });
    
});

SPEC_END
