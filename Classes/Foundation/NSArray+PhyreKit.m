// NSArray+PhyreKit.m
//
// Copyright (c) 2014 Phyre Inc.
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.

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
