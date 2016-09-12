//
//  GTool.h
//  DoBot
//
//  Created by Gino on 16/8/15.
//
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>


#define degreesToRadian(angle) ((angle) / 180.0 * M_PI)
#define radiansToDegrees(radians) ((radians) * (180.0 / M_PI))



typedef NS_ENUM(NSInteger, orientationType) {
    orientationTypeUp = 0,
    orientationTypeDown,
    orientationTypeLeft,
    orientationTypeRight,
    orientationTypeNone,
};

@interface GTool : NSObject

+(float)distanceFromPoint:(CGPoint)first ToPoint:(CGPoint)second;
+(orientationType)orientationFromOrigin:(CGPoint)origin ByPoint:(CGPoint)point;


+(CGFloat)angleBetweenLine1Star:(CGPoint)line1Start line1End:(CGPoint)line1End line2Start:(CGPoint)line2Start line2End:(CGPoint) line2End;


+(BOOL)isIpad;

+(UIViewController *)viewControllerWithName:(NSString *)viewcontroller;


//  获取字符串的大小
+ (CGSize)sizeOfString:(NSString*)aString withFont:(UIFont*)nameFont withMaxSize:(CGSize)sizeMax;


+(CGPoint)centerFromCGRect:(CGRect)rect;

+(CGPoint)moveVectorFromPoint:(CGPoint)startPoint toEndPoint:(CGPoint)endPoint;

//查看一个rect是否完全包含在圆形／椭圆的path里
//要保证在同一个坐标系内
+(BOOL)circlePath:(CGPathRef)pathRef containsRect:(CGRect)rect;


+(CGRect)frameWithCenter:(CGPoint)center bounds:(CGRect)bounds;



@end
