//
//  ANGifMaker.m
//  GifPro
//
//  Created by WangMike on 15/6/13.
//
//

#import "ANGifMaker.h"
#import "ANGifEncoder.h"
#import "ANCGImageGifPixelSource.h"
#import "ANGifNetscapeAppExtension.h"

@interface ANGifMaker ()
@property (nonatomic,strong) ANGifEncoder * encoder;
@end

@implementation ANGifMaker
-(instancetype) initWithURL:(NSURL*) URL size:(CGSize) size loopCount:(NSUInteger) count{
    self = [super init];
    if (self) {
        [[NSData data] writeToURL:URL atomically:YES];
        NSFileHandle * handel = [NSFileHandle fileHandleForWritingToURL:URL error:nil];
        NSAssert(handel, @"create fail");
        _encoder = [[ANGifEncoder alloc] initWithFileHandle:handel size:size globalColorTable:nil];
        [_encoder addApplicationExtension:[[ANGifNetscapeAppExtension alloc] initWithRepeatCount:0xffff]];
    }
    return self;
}
-(void) addImage:(CGImageRef) image delayTime:(NSTimeInterval) delayTime{
    [_encoder addImageFrame:[[ANGifImageFrame alloc] initWithPixelSource:[[ANCGImageGifPixelSource alloc] initWithImage:image] delayTime:delayTime]];
}
-(void) save{
    [_encoder finishDataStream];
    [_encoder closeFile];
}
@end
