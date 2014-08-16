//
//  ALUtilities.h
//  ALUtilities
//
//  Created by ALLENMAC on 2014/6/23.
//  Copyright (c) 2014年 AllenLee. All rights reserved.
//

#define SafeStr(x) ((x==nil)?@"":[NSString stringWithFormat:@"%@" , x])

#define GetRandomFromTo(min,max) (arc4random()%(max-min) +min)
#define GetRandomColor [UIColor colorWithRed:(double)arc4random()/0x100000000 green:(double)arc4random()/0x100000000 blue:(double)arc4random()/0x100000000 alpha:1]
#define GetRandomColorWithAlpha(x) ([UIColor colorWithRed:(double)arc4random()/0x100000000 green:(double)arc4random()/0x100000000 blue:(double)arc4random()/0x100000000 alpha:x])

#define AppSupportDir	[NSSearchPathForDirectoriesInDomains(NSApplicationSupportDirectory, NSUserDomainMask, YES) objectAtIndex:0]
#define DocDir			[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0]


// 判斷是否iPad 或 iPhone
#define isIPadUI (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
#define isIPadDevice ([[[UIDevice currentDevice] model] isEqualToString:@"iPad"])
#define isIPhoneUI (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)
#define isIPhoneDevice ([[[UIDevice currentDevice] model] isEqualToString:@"iPhone"])
// 判斷是否模擬器
#define isSimulator (NSNotFound != [[[UIDevice currentDevice] model] rangeOfString:@"Simulator"].location )

#define degreesToRadians(x) ((x) * (M_PI / 180.0))
#define IsLandscape UIInterfaceOrientationIsLandscape([[UIApplication sharedApplication] statusBarOrientation])

#define fequal(a,b) (fabs((a) - (b)) < FLT_EPSILON)
#define fequalzero(a) (fabs(a) < FLT_EPSILON)

UIKIT_EXTERN NSString *NSStringFromInt(NSInteger num);
UIKIT_EXTERN NSString *NSStringFromFloat(CGFloat num);

//A better version of NSLog	//http://onevcat.com/2014/01/black-magic-in-macro/
#define NSLog(format, ...) do {                                                                             \
								fprintf(stderr, "<%s : %d> %s\n",                                           \
								[[[NSString stringWithUTF8String:__FILE__] lastPathComponent] UTF8String],  \
								__LINE__, __func__);                                                        \
								fprintf(stderr, "%s\n" ,[[NSString stringWithFormat:(format), ##__VA_ARGS__] UTF8String]);                                           \
								fprintf(stderr, "-------\n");                                               \
								} while (0)

//---------------------------
#define  MainQueue				dispatch_get_main_queue()
#define  DefaultGlobalQueue		dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0)
typedef void(^RepeatBlock)(size_t i);
void dispatchBG(dispatch_block_t block);
void dispatchMain(dispatch_block_t block);
void dispatchAfter(double delayInSeconds, dispatch_block_t block);
void repeat(size_t iterations, RepeatBlock block);
void repeatWithCompletion(size_t iterations, RepeatBlock block, void(^completion)() );
void repeatConcurrently(size_t iterations, RepeatBlock block);
void repeatConcurrentlyWithCompletion(size_t iterations, RepeatBlock block, void(^completion)() );
//---------------------------

#import <Foundation/Foundation.h>

@interface NSString (URLEncoding)
-(NSString *)urlEncodeUsingEncoding:(NSStringEncoding)encoding;
@end