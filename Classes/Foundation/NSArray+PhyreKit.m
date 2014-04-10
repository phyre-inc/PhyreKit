//
//  NSArray+Extensions.m
//  Rally
//
//  Created by Matt Ricketson on 2/23/14.
//  Copyright (c) 2014 Phyre. All rights reserved.
//

#import "NSArray+PhyreKit.h"

@implementation NSArray (PhyreKit)

- (NSArray *)phy_objectsOfClass:(Class)objClass
{
	NSMutableArray *array = [NSMutableArray array];
	
	for (id obj in self) {
		if ([obj isKindOfClass:objClass]) {
			[array addObject:obj];
		}
	}
	
	return [array copy];
}

- (NSArray *)phy_map:(id (^)(id object))mapBlock
{
	NSMutableArray *mappedArray = [NSMutableArray array];
	
	for (id object in self) {
		id result = mapBlock(object);
		if (result) {
			[mappedArray addObject:result];
		}
	}
	
	return [mappedArray copy];
}

@end
