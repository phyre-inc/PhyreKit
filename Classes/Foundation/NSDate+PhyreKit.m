//
//  NSDate+PhyreKit.m
//  Pods
//
//  Created by Matt Ricketson on 6/9/14.
//
//

#import "NSDate+PhyreKit.h"

@implementation NSDate (PhyreKit)

+ (NSString *)phy_localizedStringForDaySinceNowFromTimestamp:(NSDate *)timestamp
{
    return [self phy_localizedStringForDaySinceNowFromTimestamp:timestamp showsTimeOfDayForToday:NO];
}

+ (NSString *)phy_localizedStringForDaySinceNowFromTimestamp:(NSDate *)timestamp
                                      showsTimeOfDayForToday:(BOOL)showsTimeOfDayForToday
{
    NSParameterAssert(timestamp);
    
    static NSCalendar *__calendar = nil;
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        __calendar = [NSCalendar currentCalendar];
        NSTimeZone *timeZone = [NSTimeZone systemTimeZone];
        [__calendar setTimeZone:timeZone];
    });
    
	NSCalendarUnit dayComparisonUnits = NSCalendarUnitEra|NSCalendarUnitYear|NSCalendarUnitMonth|NSCalendarUnitDay;
	NSCalendarUnit weekComparisonUnits = NSCalendarUnitEra|NSCalendarUnitYear|NSCalendarUnitWeekOfYear;
	
	NSDateComponents *dayComponents = [__calendar components:dayComparisonUnits fromDate:[NSDate date]];
	NSDate *todayDay = [__calendar dateFromComponents:dayComponents];
	
	[dayComponents setDay:[dayComponents day]-1];
	NSDate *yesterdayDay = [__calendar dateFromComponents:dayComponents];
	
    NSDateComponents *todayWeekComponents = [__calendar components:weekComparisonUnits fromDate:[NSDate date]];
    NSInteger todayWeekOfYear = todayWeekComponents.weekOfYear;
    NSInteger todayYear = todayWeekComponents.year;
	
	NSDate *timestampDay = [__calendar dateFromComponents:[__calendar components:dayComparisonUnits fromDate:timestamp]];
	
    NSDateComponents *timestampWeekComponents = [__calendar components:weekComparisonUnits fromDate:timestamp];
    NSInteger timestampWeekOfYear = timestampWeekComponents.weekOfYear;
    NSInteger timestampYear = timestampWeekComponents.year;
	
	if ([todayDay isEqualToDate:timestampDay]) {
        if (showsTimeOfDayForToday) {
            NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
            [formatter setTimeStyle:NSDateFormatterShortStyle];
            return [formatter stringFromDate:timestamp];
        } else {
            return NSLocalizedString(@"Today", nil);
        }
	} else if ([yesterdayDay isEqualToDate:timestampDay]) {
		return NSLocalizedString(@"Yesterday", nil);
	} else if (todayYear == timestampYear && todayWeekOfYear == timestampWeekOfYear) {
		NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
		[formatter setDateFormat:@"EEEE"];
		return [formatter stringFromDate:timestamp];
	} else {
		NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
		[formatter setDateStyle:NSDateFormatterShortStyle];
		return [formatter stringFromDate:timestamp];
	}
}

@end
