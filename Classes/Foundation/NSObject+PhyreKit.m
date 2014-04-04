//
//  NSObject+PhyreKit.m
//  
//
//  Created by Matt Ricketson on 4/3/14.
//
//

#import "NSObject+PhyreKit.h"

BOOL PHYIsEmpty(id obj)
{
	if (!obj || obj == [NSNull null]) {
		return YES;
	}
	
	if ([obj respondsToSelector:@selector(count)]) {
		return [obj count] == 0;
	}
	
	if ([obj respondsToSelector:@selector(length)]) {
		return [obj length] == 0;
	}
	
	return NO;
}



#pragma mark - NSObject (PhyreKit)

@implementation NSObject (PhyreKit)

@end
