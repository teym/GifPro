//
//  ANGifMaker.h
//  GifPro
//
//  Created by WangMike on 15/6/13.
//
//

#import <Foundation/Foundation.h>
#import <CoreGraphics/CoreGraphics.h>

@interface ANGifMaker : NSObject
-(instancetype) initWithURL:(NSURL*) URL size:(CGSize) size loopCount:(NSUInteger) count;
-(void) addImage:(CGImageRef) image delayTime:(NSTimeInterval) delayTime;
-(void) save;
@end
