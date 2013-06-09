//
//  AppDelegate.m
//  KanXuePasswordTest
//
//  Created by Bill Cheng on 13-6-9.
//  Copyright (c) 2013年 R3 Studio. All rights reserved.
//

#import "AppDelegate.h"
#import <CommonCrypto/CommonDigest.h>

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    
    [self testFunction];
    
    return YES;
}

//测试方法
- (void)testFunction
{
    NSString *password = @"KanXueLunTanKaolaSo";
    
    NSLog(@"%@", password);
    NSLog(@"%@", [self encodePassword:password]);
}

- (NSString*)encodePassword:(NSString*)password
{
    //这叫做丧心病狂
    return [self md5:[self stringEncode:[self stringByTrimming:password]]];
}

//转换代码
- (NSString*)stringEncode:(NSString*)text
{
    NSString *result = @"";
    for(int index = 0; index < [text length]; index++){
        //获得每个字符的Unicode
        int ucode = [[NSString stringWithFormat:@"%04x", [text characterAtIndex:index]] intValue];
        NSString *tmp = @"";
        
        if (ucode > 255){
            while (ucode > 1) {
                tmp = [NSString stringWithFormat:@"%C%@", [@"0123456789" characterAtIndex:(ucode%10)], tmp];
                ucode /= 10;
            }
        
            if ([tmp isEqualToString:@""]){
                tmp = @"0";
            }
            
            tmp = [NSString stringWithFormat:@"&#%@;", tmp];
            result = [NSString stringWithFormat:@"%@%@", result, tmp];
        } else {
            result = [NSString stringWithFormat:@"%@%C", result, [text characterAtIndex:index]];
        }
    }
    
    return result;
}

//给NSString执行Trim指令
- (NSString*)stringByTrimming:(NSString*)text
{
    NSMutableString *mStr = [text mutableCopy];
    CFStringTrimWhitespace((CFMutableStringRef)mStr);
    
    NSString *result = [mStr copy];

    return result;
}

//将NSString值转换成MD5
- (NSString*)md5:(NSString *)input
{
    const char *cStr = [input UTF8String];
    unsigned char digest[16];
    CC_MD5( cStr, strlen(cStr), digest ); // This is the md5 call
    
    NSMutableString *output = [NSMutableString stringWithCapacity:CC_MD5_DIGEST_LENGTH * 2];
    
    for(int i = 0; i < CC_MD5_DIGEST_LENGTH; i++)
        [output appendFormat:@"%02x", digest[i]];
    
    return  output;
    
}

@end
