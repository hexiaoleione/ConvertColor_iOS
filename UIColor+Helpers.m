#import "UIColor+Helpers.h"

@implementation UIColor (Helpers)

// [UIColor UIColorFromRGBAColorWithRed:10 green:20 blue:30 alpha:0.8]
+ (UIColor *)UIColorFromRGBAColorWithRed: (CGFloat)r green:(CGFloat)g blue:(CGFloat)b alpha:(CGFloat)a {
    return [UIColor colorWithRed: r/255.0 green: g/255.0 blue: b/255.0 alpha:a];
}

// [UIColor UIColorFromRGBColorWithRed:10 green:20 blue:30]
+ (UIColor *)UIColorFromRGBColorWithRed:(CGFloat)r green:(CGFloat)g blue:(CGFloat)b {
    return [UIColor colorWithRed: r/255.0 green: g/255.0 blue: b/255.0 alpha: 0.5];
}

// [UIColor UIColorFromHex:0xc5c5c5 alpha:0.8];
+ (UIColor *)UIColorFromHex:(NSUInteger)rgb alpha:(CGFloat)alpha {
    return [UIColor colorWithRed:((float)((rgb & 0xFF0000) >> 16))/255.0
                          green:((float)((rgb & 0xFF00) >> 8))/255.0
                           blue:((float)(rgb & 0xFF))/255.0
                          alpha:alpha];
}

// [UIColor UIColorFromHex:0xc5c5c5];
+ (UIColor *)UIColorFromHex:(NSUInteger)rgb {
    return [UIColor UIColorFromHex:rgb alpha:1.0];
}

+ (UIColor *) colorWithHexString: (NSString *) hexString {
    NSString *colorString = [[hexString stringByReplacingOccurrencesOfString: @"#" withString: @""] uppercaseString];
    CGFloat alpha, red, blue, green;
    switch ([colorString length]) {
        case 3: // #RGB
            alpha = 1.0f;
            red   = [self colorComponentFrom: colorString start: 0 length: 1];
            green = [self colorComponentFrom: colorString start: 1 length: 1];
            blue  = [self colorComponentFrom: colorString start: 2 length: 1];
            break;
        case 4: // #ARGB
            alpha = [self colorComponentFrom: colorString start: 0 length: 1];
            red   = [self colorComponentFrom: colorString start: 1 length: 1];
            green = [self colorComponentFrom: colorString start: 2 length: 1];
            blue  = [self colorComponentFrom: colorString start: 3 length: 1];
            break;
        case 6: // #RRGGBB
            alpha = 1.0f;
            red   = [self colorComponentFrom: colorString start: 0 length: 2];
            green = [self colorComponentFrom: colorString start: 2 length: 2];
            blue  = [self colorComponentFrom: colorString start: 4 length: 2];
            break;
        case 8: // #AARRGGBB
            alpha = [self colorComponentFrom: colorString start: 0 length: 2];
            red   = [self colorComponentFrom: colorString start: 2 length: 2];
            green = [self colorComponentFrom: colorString start: 4 length: 2];
            blue  = [self colorComponentFrom: colorString start: 6 length: 2];
            break;
        default:
            [NSException raise:@"Invalid color value" format: @"Color value %@ is invalid.  It should be a hex value of the form #RBG, #ARGB, #RRGGBB, or #AARRGGBB", hexString];
            break;
    }
    return [UIColor colorWithRed: red green: green blue: blue alpha: alpha];
}

+ (CGFloat) colorComponentFrom: (NSString *) string start: (NSUInteger) start length: (NSUInteger) length {
    NSString *substring = [string substringWithRange: NSMakeRange(start, length)];
    NSString *fullHex = length == 2 ? substring : [NSString stringWithFormat: @"%@%@", substring, substring];
    unsigned hexComponent;
    [[NSScanner scannerWithString: fullHex] scanHexInt: &hexComponent];
    return hexComponent / 255.0;
}

+ (UIColor *)UIColorFromRadom {
    CGFloat hue = (arc4random() % 256 / 256.0); //0.0 to 1.0
    CGFloat saturation = (arc4random() % 128 / 256.0) + 0.5; // 0.5 to 1.0,away from white
    CGFloat brightness = (arc4random() % 128 / 256.0 ) + 0.5; //0.5 to 1.0,away from black
    return [UIColor colorWithHue:hue saturation:saturation brightness:brightness alpha:1];
}

+ (UIColor *)colorFromColor:(UIColor *)fromColor toColor:(UIColor *)toColor percent:(float)percent {
  CGFloat fromColorComponents[4];
  [fromColor getRed:&fromColorComponents[0]
              green:&fromColorComponents[1]
               blue:&fromColorComponents[2]
              alpha:&fromColorComponents[3]];
  
  CGFloat toColorComponents[4];
  [toColor getRed:&toColorComponents[0]
            green:&toColorComponents[1]
             blue:&toColorComponents[2]
            alpha:&toColorComponents[3]];
  
  CGFloat newRed   = (1.0 - percent) * fromColorComponents[0] + percent * toColorComponents[0];
  CGFloat newGreen = (1.0 - percent) * fromColorComponents[1] + percent * toColorComponents[1];
  CGFloat newBlue  = (1.0 - percent) * fromColorComponents[2]  + percent * toColorComponents[2];
  return [UIColor colorWithRed:newRed green:newGreen blue:newBlue alpha:1.0];
}

@end

@implementation UIColor(Themes)

+ (UIColor *)seperatorLineColor {
  return [UIColor colorWithHexString:@"e5e5e5"];
}

+ (UIColor *)activateColor {
  return [UIColor colorWithHexString:@"f59c1c"];
}

+ (UIColor *)inactiveColor {
  return [UIColor colorWithHexString:@"999999"];
}

+ (UIColor *)themeColor {
  return [UIColor colorWithHexString:@"f59c1c"];
}

@end
