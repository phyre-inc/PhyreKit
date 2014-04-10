//
//  NSCache+Subscripting.h
//  Rally
//
//  Created by Matt Ricketson on 11/13/13.
//  Copyright (c) 2013 Phyre. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSCache (PhyreKit)

- (id)objectForKeyedSubscript:(id<NSCopying>)key;
- (void)setObject:(id)obj forKeyedSubscript:(id<NSCopying>)key;

@end
