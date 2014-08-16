//
//  ALUtilities.m
//  ALUtilities
//
//  Created by ALLENMAC on 2014/6/23.
//  Copyright (c) 2014年 AllenLee. All rights reserved.
//


#import "ALUtilities.h"

UIKIT_EXTERN NSString *NSStringFromInt(NSInteger num)	{
	NSString * strNum = [NSString stringWithFormat:@"%li",(long)num];
	return strNum;
}

UIKIT_EXTERN NSString *NSStringFromFloat(CGFloat num)	{
	NSString * strNum = [NSString stringWithFormat:@"%f",num];
	return strNum;
}

//---------------------------

void dispatchBG(dispatch_block_t block)	{
	dispatch_async(DefaultGlobalQueue, block);
};

void dispatchMain(dispatch_block_t block)	{
	dispatch_async(MainQueue, block);
};

void dispatchAfter(double delayInSeconds, dispatch_block_t block)	{
	dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delayInSeconds * NSEC_PER_SEC)),
				   dispatch_get_main_queue(),
				   block
				   );
};

void repeat(size_t iterations, RepeatBlock block)	{
	repeatWithCompletion(iterations, block, NULL);
};

void repeatWithCompletion(size_t iterations, RepeatBlock block, void(^completion)() )	{
	dispatch_queue_t  queue = dispatch_queue_create("org.Allen.RepeatSerially", DISPATCH_QUEUE_SERIAL);
	dispatch_apply(iterations, queue, block);
	if (completion) {
		completion();
	}
};

void repeatConcurrently(size_t iterations, RepeatBlock block)	{
	repeatConcurrentlyWithCompletion(iterations, block, NULL);
};

void repeatConcurrentlyWithCompletion(size_t iterations, RepeatBlock block, void(^completion)() )	{
	dispatch_queue_t  queue = dispatch_queue_create("org.Allen.RepeatConcurrently", DISPATCH_QUEUE_CONCURRENT);//DefaultGlobalQueue;
	dispatch_apply(iterations, queue, block);
	if (completion) {
		completion();
	};
}

//---------------------------

@implementation NSString (URLEncoding)
-(NSString *)urlEncodeUsingEncoding:(NSStringEncoding)encoding {
	return (NSString *)CFBridgingRelease(CFURLCreateStringByAddingPercentEscapes(NULL,
																				 (CFStringRef)self,
																				 NULL,
																				 (CFStringRef)@"!*'\"();@+$,#[]% ",//@"!*'\"();:@&=+$,/?%#[]% "
																				 CFStringConvertNSStringEncodingToEncoding(encoding)));
}
@end


