//
//  GTool.m
//  DoBot
//
//  Created by Gino on 16/8/15.
//
//

#import "GTool.h"

@implementation GTool


+(float)distanceFromPoint:(CGPoint)first ToPoint:(CGPoint)second {
    CGFloat deltaX = second.x - first.x;
    CGFloat deltaY = second.y - first.y;
    return sqrt(deltaX*deltaX + deltaY*deltaY );
}



+(orientationType)orientationFromOrigin:(CGPoint)origin ByPoint:(CGPoint)point
{
    orientationType type;
    
    float xx = point.x - origin.x;
    float yy = point.y - origin.y;
    
    if (fabsf(xx) < 0.001 && fabsf(yy) < 0.001) {
        
        type = orientationTypeNone;
        
        return type;
    }
    
    float tan = fabsf(yy/xx);
    
    
    if (tan > 1 || fabsf(xx) < 0.001) {
        
        if (yy < 0) {
            
            //上
            type = orientationTypeUp;
        }
        else
        {
            //下
            type = orientationTypeDown;
        }
        
    }
    else
    {
        if (xx > 0) {
            
            //右
            
            type = orientationTypeRight;
            
        }
        else
        {
            //左
            
            type = orientationTypeLeft;
        }
    }

    
    
    return type;
    
}


+(CGFloat)angleBetweenLine1Star:(CGPoint)line1Start line1End:(CGPoint)line1End line2Start:(CGPoint)line2Start line2End:(CGPoint) line2End
{
    
    CGFloat a = line1End.x - line1Start.x;
    CGFloat b = line1End.y - line1Start.y;
    CGFloat c = line2End.x - line2Start.x;
    CGFloat d = line2End.y - line2Start.y;
    
    CGFloat rads = acos(((a*c) + (b*d)) / ((sqrt(a*a + b*b)) * (sqrt(c*c + d*d))));
    
    return radiansToDegrees(rads);
    
}

+(BOOL)isIpad
{
    BOOL ispad = NO;
    
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad) {
        
        ispad = YES;
    }
    
    return ispad;
}

+(UIViewController *)viewControllerWithName:(NSString *)viewcontroller
{
    UIViewController *vc;
    
    if ([GTool isIpad]) {
        
        
        NSString *ipadXib = [NSString stringWithFormat:@"%@~ipad",viewcontroller];
        
        vc = [[NSClassFromString(viewcontroller) alloc] initWithNibName:ipadXib bundle:nil];
        
    }
    else
    {
        vc = [[NSClassFromString(viewcontroller) alloc] initWithNibName:viewcontroller bundle:nil];
    }
    
    
    
    return vc;
}


+ (CGSize)sizeOfString:(NSString*)aString withFont:(UIFont*)font withMaxSize:(CGSize)sizeMax
{
    NSDictionary *attribute = @{NSFontAttributeName: font};
    CGRect rect = [aString boundingRectWithSize:sizeMax options:NSStringDrawingUsesLineFragmentOrigin attributes:attribute context:nil];
    
    return CGSizeMake(ceil(rect.size.width), ceil(rect.size.height));
}

+(CGPoint)centerFromCGRect:(CGRect)rect
{
    return CGPointMake(CGRectGetMidX(rect), CGRectGetMidY(rect));
}

+(CGPoint)moveVectorFromPoint:(CGPoint)p1 toEndPoint:(CGPoint)p2
{
    return CGPointMake(p2.x - p1.x, p2.y - p1.y);
}

+(BOOL)circlePath:(CGPathRef)pathRef containsRect:(CGRect)rect
{
    //左上点
    CGPoint TLPoint = CGPointMake(CGRectGetMinX(rect), CGRectGetMinY(rect));
    
    //右上点
    CGPoint TRPoint = CGPointMake(CGRectGetMaxX(rect), CGRectGetMinY(rect));
    
    //左下点
    CGPoint BLPoint = CGPointMake(CGRectGetMinX(rect), CGRectGetMaxY(rect));
    
    //右下点
    
    CGPoint BRPoint = CGPointMake(CGRectGetMaxX(rect), CGRectGetMaxY(rect));
    
    
    
    BOOL b1 = CGPathContainsPoint(pathRef, NULL, TLPoint, NO);
    
    BOOL b2 = CGPathContainsPoint(pathRef, NULL, TRPoint, NO);
    
    BOOL b3 = CGPathContainsPoint(pathRef, NULL, BLPoint, NO);
    
    BOOL b4 = CGPathContainsPoint(pathRef, NULL, BRPoint, NO);
    
    
    if (b1 && b2 && b3 && b4) {
        
        return YES;
    }
    
    return NO;
}

+(CGRect)frameWithCenter:(CGPoint)center bounds:(CGRect)bounds
{
    
    return CGRectMake(center.x - bounds.size.width/2, center.y - bounds.size.height/2, bounds.size.width, bounds.size.height);
}
@end
