//
//  NSError+PhyreKit.m
//  Pods
//
//  Created by Matt Ricketson on 5/29/14.
//
//

#import "NSError+PhyreKit.h"

void PHYGetTitleAndMessageFromError(NSError *error, NSString * __autoreleasing *title, NSString * __autoreleasing *message)
{
    if (!error) {
        *title = NSLocalizedString(@"Error", nil);
        *message = NSLocalizedString(@"An unknown error occurred.", nil);
    } else if (error.localizedDescription && (error.localizedRecoverySuggestion || error.localizedFailureReason)) {
        *title = error.localizedDescription;
		
        if (error.localizedRecoverySuggestion) {
            *message = error.localizedRecoverySuggestion;
        } else {
            *message = error.localizedFailureReason;
        }
    } else if (error.localizedDescription) {
        *title = NSLocalizedString(@"Error", nil);
        *message = error.localizedDescription;
    } else {
        *title = NSLocalizedString(@"Error", nil);
        *message = [NSString stringWithFormat:NSLocalizedString(@"%@ Error: %d", nil), error.domain, error.code];
    }
}

@implementation NSError (PhyreKit)

@end
