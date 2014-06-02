// CLLocation+PhyreKit.m
//
// Copyright (c) 2014 Phyre Inc.
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.

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
