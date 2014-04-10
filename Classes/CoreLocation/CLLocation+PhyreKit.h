//
//  CLLocation+Extensions.h
//  Rally
//
//  Created by Matt Ricketson on 12/6/13.
//  Copyright (c) 2013 Phyre. All rights reserved.
//

#import <CoreLocation/CoreLocation.h>
#import <MapKit/MapKit.h>

@interface CLLocation (PhyreKit)

+ (NSArray *)phy_locationsForAnnotations:(NSArray *)annotations;

+ (instancetype)phy_locationWithCoordinate:(CLLocationCoordinate2D)coordinate;

@end


/**
 Calculates and returns an `MKMapRect` that comfortably encloses all `locations`.
 
 @param coordinates An array of `CLLocation` objects.
 
 @return An `MKMapRect` that holds all indicated location coordinates, with insets for comfortable viewing.
 */
extern MKMapRect PHYVisibleMapRectForLocations(NSArray *locations);
extern MKMapRect PHYVisibleMapRectForLocationsWithSizeFactor(NSArray *locations, CGSize sizeFactor);
