//
//  ViewController.m
//  ALUtilities
//
//  Created by ALLENMAC on 2014/6/23.
//  Copyright (c) 2014年 AllenLee. All rights reserved.
//

#import "ViewController.h"
#import "ALUtilities.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextView *textView;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
	
	repeat(5, ^(size_t i) {
		NSLog(@"LOG:  i: %li",i);
	});

	NSLog(@"//---------------------------");
	
	dispatchAfter(1, ^{
		NSMutableDictionary *dic = [@{} mutableCopy];
		repeat(1000, ^(size_t i) {
			int r = GetRandomBetween(0, 9);
			NSLog(@"LOG:  r: %i",r);
			if (dic[@(r)]) {
				NSInteger count = [dic[@(r)] integerValue] +1;
				dic[@(r)] = @(count);
			}else {
				dic[@(r)] = @(1);
			}
		});
		
		NSMutableString *str = [@"GetRandomBetween(0, 9):\n {\n" mutableCopy];
		for (id key in [dic sortedKeys]) {
			id value = dic[key];
			[str appendFormat:@"  %@: %@\n", key, value];
		}
		[str appendFormat:@"  }\n"];
		
		NSLog(@"LOG:  %@",str);
		self.textView.text = str;
	});
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
