//
//  ANCGImageGifPixelSource.m
//  GifPro
//
//  Created by WangMike on 15/6/12.
//
//

#import "ANCGImageGifPixelSource.h"

@interface ANCGImageGifPixelSource ()
@property (nonatomic,assign) CGImageRef image;
@property (nonatomic,assign) unsigned char * bitmap;
@end

@implementation ANCGImageGifPixelSource
-(id) initWithImage:(CGImageRef)anImage{
    self = [super init];
    if (self) {
        self.image = CGImageRetain(anImage);
    }
    return self;
}
- (NSUInteger)pixelsWide{
    return CGImageGetWidth(_image);
}
- (NSUInteger)pixelsHigh{
    return CGImageGetHeight(_image);
}
- (void)getPixel:(NSUInteger *)pixel atX:(NSInteger)x y:(NSInteger)y{
    CGImageRef imageRef = _image;
    NSUInteger width = CGImageGetWidth(imageRef);
    NSUInteger height = CGImageGetHeight(imageRef);
    NSUInteger bytesPerPixel = 4;
    NSUInteger bytesPerRow = bytesPerPixel * width;
    NSUInteger bitsPerComponent = 8;
    unsigned char *rawData = _bitmap;
    if (rawData == NULL) {
        CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
        rawData = (unsigned char*) calloc(height * width * 4, sizeof(unsigned char));
        
        CGContextRef context = CGBitmapContextCreate(rawData, width, height,
                                                     bitsPerComponent, bytesPerRow, colorSpace,
                                                     kCGImageAlphaPremultipliedLast | kCGBitmapByteOrder32Big);
        CGColorSpaceRelease(colorSpace);
        
        CGContextDrawImage(context, CGRectMake(0, 0, width, height), imageRef);
        CGContextRelease(context);
        _bitmap = rawData;
    }
    
    NSUInteger byteIndex = (bytesPerRow * y) + x * bytesPerPixel;
    NSUInteger red   = rawData[byteIndex];
    NSUInteger green = rawData[byteIndex + 1];
    NSUInteger blue  = rawData[byteIndex + 2];
    NSUInteger alpha = rawData[byteIndex + 3];
    *pixel = red;
    pixel[1] = green;
    pixel[2] = blue;
    pixel[3] = alpha;
}
- (BOOL)hasTransparency{
    return YES;
}
-(void) dealloc{
    CGImageRelease(_image);
    free(_bitmap);
}
@end
