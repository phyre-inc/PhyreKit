//
//  NSString+PhyreKit.m
//  
//
//  Created by Matt Ricketson on 4/3/14.
//
//

#import "NSString+PhyreKit.h"

BOOL PHYStringIsEmpty(NSString *str)
{
	if (!str || (id)str == [NSNull null]) {
		return YES;
	}
	
	return ([str length] == 0);
}

BOOL PHYEqualStrings(NSString *str1, NSString *str2)
{
	return ((!str1 && !str2) || [str1 isEqualToString:str2]);
}



#pragma mark - NSString (PhyreKit)

@implementation NSString (PhyreKit)

@end
