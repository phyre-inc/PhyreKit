//
//  NSDictionary+PhyreAdditions.m
//  Rally
//
//  Created by Matt Ricketson on 9/24/13.
//  Copyright (c) 2013 Phyre. All rights reserved.
//

#import "NSDictionary+PhyreKit.h"

NSDictionary * PHYMergeDictionaries(NSDictionary *lhs, NSDictionary *rhs)
{
    NSMutableDictionary *ret = [lhs mutableCopy];
    [ret addEntriesFromDictionary:rhs];
    return ret;
}

@implementation NSDictionary (PhyreKit)

@end
