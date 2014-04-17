//
//  NSArray+Extensions.h
//  Rally
//
//  Created by Matt Ricketson on 2/23/14.
//  Copyright (c) 2014 Phyre. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, PHYMergeComparisonResult) {
	PHYMergeUpdate = NSOrderedSame,
	PHYMergeInsert = NSOrderedDescending,
	PHYMergeDelete = NSOrderedAscending,
};

@interface NSArray (PhyreKit)

- (NSArray *)phy_map:(id (^)(id object))mapBlock;
- (NSArray *)phy_objectsOfClass:(Class)objClass;

/// Both arrays MUST be sorted.
- (NSArray *)phy_arrayByMergingChangesWithArray:(NSArray *)objects
										compare:(PHYMergeComparisonResult (^)(id existingObject, id object))compareBlock
										 update:(id (^)(id existingObject, id object))updateBlock
										 insert:(id (^)(id object))insertBlock
										 delete:(BOOL (^)(id existingObject))deleteBlock
										  added:(void (^)(id addedObject))addedBlock;

@end
