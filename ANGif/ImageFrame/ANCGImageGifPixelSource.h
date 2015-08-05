//
//  ANCGImageGifPixelSource.h
//  GifPro
//
//  Created by WangMike on 15/6/12.
//
//

#import <Foundation/Foundation.h>
#import <CoreGraphics/CoreGraphics.h>
#import "ANGifImageFrame.h"

@interface ANCGImageGifPixelSource : NSObject<ANGifImageFramePixelSource>
- (id)initWithImage:(CGImageRef)anImage;
@end
