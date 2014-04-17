//
//  NSArray+Extensions.m
//  Rally
//
//  Created by Matt Ricketson on 2/23/14.
//  Copyright (c) 2014 Phyre. All rights reserved.
//

#import "NSArray+PhyreKit.h"

@implementation NSArray (PhyreKit)

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

- (NSArray *)phy_objectsOfClass:(Class)objClass
{
	return [self phy_map:^id(id object) {
		return ([object isKindOfClass:objClass] ? object : nil);
	}];
}


- (NSArray *)phy_arrayByMergingChangesWithArray:(NSArray *)objects
										compare:(PHYMergeComparisonResult (^)(id existingObject, id object))compareBlock
										 update:(id (^)(id existingObject, id object))updateBlock
										 insert:(id (^)(id object))insertBlock
										 delete:(BOOL (^)(id existingObject))deleteBlock
										  added:(void (^)(id addedObject))addedBlock
{
	NSMutableArray *result = [NSMutableArray array];
	
	NSEnumerator *objectsEnumerator = [objects objectEnumerator];
	NSEnumerator *enumerator = [self objectEnumerator];
	
	id object = [objectsEnumerator nextObject];
	id existingObject = [enumerator nextObject];
	
	while (existingObject || object) {
		id objectToAdd = nil;
		PHYMergeComparisonResult compareResult;
		
		if (!existingObject) {
			compareResult = PHYMergeInsert;
		} else if (!object) {
			compareResult = PHYMergeDelete;
		} else {
			compareResult = compareBlock(existingObject, object);
		}
		
		if (compareResult == PHYMergeUpdate) {
			if (updateBlock) {
				objectToAdd = updateBlock(existingObject, object);
			} else {
				objectToAdd = existingObject;
			}
			
			object = [objectsEnumerator nextObject];
			existingObject = [enumerator nextObject];
		} else if (compareResult == PHYMergeInsert) {
			if (insertBlock) {
				objectToAdd = insertBlock(object);
			}
			
			object = [objectsEnumerator nextObject];
		} else if (compareResult == PHYMergeDelete) {
			BOOL shouldDelete = NO;
			
			if (deleteBlock) {
				shouldDelete = deleteBlock(existingObject);
			}
			
			if (!shouldDelete) {
				objectToAdd = existingObject;
			}
			
			existingObject = [enumerator nextObject];
		}
		
		if (objectToAdd) {
			[result addObject:objectToAdd];
			
			if (addedBlock) {
				addedBlock(objectToAdd);
			}
		}
	}
	
	return [result copy];
}

@end
