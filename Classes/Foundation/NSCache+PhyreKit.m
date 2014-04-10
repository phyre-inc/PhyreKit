//
//  NSCache+Subscripting.m
//  Rally
//
//  Created by Matt Ricketson on 11/13/13.
//  Copyright (c) 2013 Phyre. All rights reserved.
//

#import "NSCache+PhyreKit.h"

@implementation NSCache (PhyreKit)

- (id)objectForKeyedSubscript:(id<NSCopying>)key
{
	return (key ? [self objectForKey:key] : nil);
}

- (void)setObject:(id)obj forKeyedSubscript:(id<NSCopying>)key
{
	if (!key) return;
	
	if (obj) {
		[self setObject:obj forKey:key];
	} else {
		[self removeObjectForKey:key];
	}
}

@end
