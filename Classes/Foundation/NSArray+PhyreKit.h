//
//  NSArray+Extensions.h
//  Rally
//
//  Created by Matt Ricketson on 2/23/14.
//  Copyright (c) 2014 Phyre. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSArray (PhyreKit)

- (NSArray *)phy_map:(id (^)(id object))mapBlock;
- (NSArray *)phy_objectsOfClass:(Class)objClass;

@end
