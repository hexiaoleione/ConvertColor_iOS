#import <UIKit/UIKit.h>

@interface UIColor (Helpers)

// [UIColor UIColorFromRGBAColorWithRed:10 green:20 blue:30 alpha:0.8]
+ (UIColor *)UIColorFromRGBColorWithRed:(CGFloat)r green:(CGFloat)g blue:(CGFloat)b;
+ (UIColor *)UIColorFromRGBAColorWithRed: (CGFloat)r green:(CGFloat)g blue:(CGFloat)b alpha:(CGFloat)a;

// [UIColor UIColorFromHex:0xc5c5c5 alpha:0.8];
+ (UIColor *)UIColorFromHex:(NSUInteger)rgb alpha:(CGFloat)alpha;
+ (UIColor *)UIColorFromHex:(NSUInteger)rgb;

+ (UIColor *)colorWithHexString:(NSString *)hexString;

+ (UIColor *)UIColorFromRadom;

+ (UIColor *)colorFromColor:(UIColor *)fromColor toColor:(UIColor *)toColor percent:(float)percent;

@end

@interface UIColor(Themes)

+ (UIColor *)seperatorLineColor;
+ (UIColor *)activateColor;
+ (UIColor *)inactiveColor;
+ (UIColor *)themeColor;

@end
