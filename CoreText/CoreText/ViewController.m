//
//  ViewController.m
//  CoreText
//
//  Created by 檀志文 on 2018/5/27.
//  Copyright © 2018年 檀志文. All rights reserved.
//

#import "ViewController.h"
#import <CoreText/CoreText.h>
#import "DisPlayView.h"

@interface ViewController ()

@property(nonatomic,strong) UIView *vDisPlay;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view addSubview:self.vDisPlay];
    self.view.backgroundColor = [UIColor grayColor];
    self.vDisPlay.backgroundColor= [UIColor whiteColor];
    
}

#pragma mark 简单的demo实例诠释一下

-(void)demoOneForShowCoreText{

    /*
     部分简单修改字体的属性
     */
    
    /*
    long number = 1.0;
    CFNumberRef num = CFNumberCreate(kCFAllocatorDefault, kCFNumberSInt8Type, &number);
    [mulStr addAttribute:(id)kCTCharacterShapeAttributeName value:(__bridge id)num range:NSMakeRange(0, 4)];
    */
    
    // 设置字体的属性
   
    /*
     
     CTFontRef font = CTFontCreateWithName(CFSTR("Georgia"), 40, NULL);
     [mulStr addAttribute:(id)kCTFontAttributeName value:(__bridge id)font range:NSMakeRange(0, 4)];
     
     // 设置字体的间隔
     long number = 10;
     CFNumberRef num = CFNumberCreate(kCFAllocatorDefault, kCFNumberSInt8Type, &number);
     [mulStr addAttribute:(id)kCTKernAttributeName value:(__bridge id)num range:NSMakeRange(10, 4)];
     
     // 设置是否连字
     [mulStr addAttribute:(id)kCTLigatureAttributeName value:(__bridge id)num range:NSMakeRange(0, mulStr.length)];
     
     //设置字体的颜色
     [mulStr addAttribute:(id)kCTForegroundColorAttributeName value:(__bridge id)[UIColor redColor].CGColor range:NSMakeRange(0, 9)];
     
     //设置空心字
     [mulStr addAttribute:(id)kCTStrokeWidthAttributeName value:(__bridge id)num range:NSMakeRange(0, mulStr.length)];
     
     //设置空心字的颜色
     [mulStr addAttribute:(id)kCTStrokeColorAttributeName value:(__bridge id)[UIColor greenColor].CGColor range:NSMakeRange(0, mulStr.length)];
     
     */
    
    /*******************************************************************************************/
    
        
}


- (UIView *)vDisPlay{
    if (!_vDisPlay) {
        _vDisPlay = [[DisPlayView alloc]initWithFrame:self.view.bounds];
    }
    return _vDisPlay;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
