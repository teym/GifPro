//
//  ANNSImageGifPixelSource.m
//  GifPro
//
//  Created by Alex Nichol on 11/2/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "ANNSImageGifPixelSource.h"

@implementation ANNSImageGifPixelSource

- (id)initWithImage:(NSImage *)anImage {
	if ((self = [super init])) {
		bitmapRep = [[NSBitmapImageRep alloc] initWithData:[anImage TIFFRepresentation]];
	}
	return self;
}

- (NSUInteger)pixelsWide {
	return [bitmapRep pixelsWide];
}

- (NSUInteger)pixelsHigh {
	return [bitmapRep pixelsHigh];
}

- (void)getPixel:(NSUInteger *)pixel atX:(NSInteger)x y:(NSInteger)y {
	[bitmapRep getPixel:pixel atX:x y:y];
}

- (BOOL)hasTransparency {
	return [bitmapRep hasAlpha];
}

@end
