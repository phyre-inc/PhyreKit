//
//  CLLocation+Extensions.m
//  Rally
//
//  Created by Matt Ricketson on 12/6/13.
//  Copyright (c) 2013 Phyre. All rights reserved.
//

#import "CLLocation+PhyreKit.h"

@implementation CLLocation (PhyreKit)

+ (NSArray *)phy_locationsForAnnotations:(NSArray *)annotations
{
	NSMutableArray *locations = [NSMutableArray array];
	for (id<MKAnnotation> annotation in annotations) {
		[locations addObject:[self phy_locationWithCoordinate:annotation.coordinate]];
	}
	return locations;
}

+ (instancetype)phy_locationWithCoordinate:(CLLocationCoordinate2D)coordinate
{
	return [[CLLocation alloc] initWithLatitude:coordinate.latitude longitude:coordinate.longitude];
}

@end


MKMapRect PHYVisibleMapRectForLocations(NSArray *locations)
{
	return PHYVisibleMapRectForLocationsWithSizeFactor(locations, CGSizeMake(0.5, 0.5));
}

MKMapRect PHYVisibleMapRectForLocationsWithSizeFactor(NSArray *locations, CGSize sizeFactor)
{
	MKMapRect zoomRect = MKMapRectNull;
	for (CLLocation *location in locations) {
		if (CLLocationCoordinate2DIsValid(location.coordinate)) {
			MKMapPoint annotationPoint = MKMapPointForCoordinate(location.coordinate);
			MKMapRect pointRect = MKMapRectMake(annotationPoint.x, annotationPoint.y, 0.1, 0.1);
			zoomRect = MKMapRectUnion(zoomRect, pointRect);
		}
	}
	
	zoomRect = MKMapRectInset(zoomRect,
							  -sizeFactor.width * MKMapRectGetWidth(zoomRect),
							  -sizeFactor.height * MKMapRectGetHeight(zoomRect));
	return zoomRect;
}
