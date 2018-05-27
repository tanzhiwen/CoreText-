//
//  DisPlayView.m
//  CoreText
//
//  Created by 檀志文 on 2018/5/27.
//  Copyright © 2018年 檀志文. All rights reserved.
//

#import "DisPlayView.h"
#import <CoreText/CoreText.h>

@implementation DisPlayView

/*
 这里注释一些重要的属性
 
 const CFStringRef kCTCharacterShapeAttributeName;
 //字体形状属性  必须是CFNumberRef对象默认为0，非0则对应相应的字符形状定义，如1表示传统字符形状
 
 const CFStringRef kCTFontAttributeName;
 //字体属性   必须是CTFont对象
 
 const CFStringRef kCTKernAttributeName;
 //字符间隔属性 必须是CFNumberRef对象
 
 const CFStringRef kCTLigatureAttributeName;
 //设置是否使用连字属性，设置为0，表示不使用连字属性。标准的英文连字有FI,FL.默认值为1，既是使用标准连字。也就是当搜索到f时候，会把fl当成一个文字。必须是CFNumberRef 默认为1,可取0,1,2
 
 const CFStringRef kCTForegroundColorAttributeName;
 //字体颜色属性  必须是CGColor对象，默认为black
 
 const CFStringRef kCTForegroundColorFromContextAttributeName;
 //上下文的字体颜色属性 必须为CFBooleanRef 默认为False
 
 const CFStringRef kCTParagraphStyleAttributeName;
 //段落样式属性 必须是CTParagraphStyle对象 默认为NIL
 
 const CFStringRef kCTStrokeWidthAttributeName;
 //笔画线条宽度 必须是CFNumberRef对象，默为0.0f，标准为3.0f
 const CFStringRef kCTStrokeColorAttributeName;
 //笔画的颜色属性 必须是CGColorRef 对象，默认为前景色
 
 const CFStringRef kCTSuperscriptAttributeName;
 //设置字体的上下标属性 必须是CFNumberRef对象 默认为0,可为-1为下标,1为上标，需要字体支持才行。如排列组合的样式Cn1
 
 const CFStringRef kCTUnderlineColorAttributeName;
 //字体下划线颜色属性 必须是CGColorRef对象，默认为前景色
 
 const CFStringRef kCTUnderlineStyleAttributeName;
 //字体下划线样式属性 必须是CFNumberRef对象,默为kCTUnderlineStyleNone 可以通过CTUnderlineStypleModifiers 进行修改下划线风格
 
 const CFStringRef kCTVerticalFormsAttributeName;
 //文字的字形方向属性 必须是CFBooleanRef 默认为false，false表示水平方向，true表示竖直方向
 
 const CFStringRef kCTGlyphInfoAttributeName;
 //字体信息属性 必须是CTGlyphInfo对象
 
 const CFStringRef kCTRunDelegateAttributeName
 //CTRun 委托属性 必须是CTRunDelegate对象
 */
- (void)drawRect:(CGRect)rect{
    [self addAttributes];
}

-(void)addAttributes{
    
    NSMutableAttributedString *mulStr = [[NSMutableAttributedString alloc]initWithString:@"thaihsa ashdiasssj sjd sajdhedu xuifds 哈吉可视电话 是#*8  8349**………………"];
    [mulStr beginEditing];
    
    // 对同一段字体进行多属性设置
    NSMutableDictionary *attributes = [NSMutableDictionary dictionaryWithObject:(id)[UIColor redColor].CGColor forKey:(id)kCTForegroundColorAttributeName];
    // 斜体
    CTFontRef font = CTFontCreateWithName((CFStringRef)[UIFont italicSystemFontOfSize:20].fontName, 40, NULL);
    [attributes setObject:(__bridge id)font forKey:(id)kCTFontAttributeName];
    
    // 下划线
    [attributes setObject:(id)[NSNumber numberWithInt:kCTUnderlineStyleSingle] forKey:(id)kCTUnderlineStyleAttributeName];
    
    [mulStr addAttributes:attributes range:NSMakeRange(0, mulStr.length)];
    
    NSRange kk = NSMakeRange(0, 4);
    NSDictionary *dc = [mulStr attributesAtIndex:0 effectiveRange:&kk];
    
    [mulStr endEditing];
    
    NSLog(@"value= %@",dc);
    
    
    CTFramesetterRef framesetter = CTFramesetterCreateWithAttributedString((CFAttributedStringRef)mulStr);
    
    CGMutablePathRef Path = CGPathCreateMutable();
    
    CGPathAddRect(Path, NULL ,CGRectMake(10 , 0 ,self.bounds.size.width-10 , self.bounds.size.height-10));
    CTFrameRef frame = CTFramesetterCreateFrame(framesetter, CFRangeMake(0, 0), Path, NULL);
    //获取当前(View)上下文以便于之后的绘画，这个是一个离屏。
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetTextMatrix(context , CGAffineTransformIdentity);
    //压栈，压入图形状态栈中.每个图形上下文维护一个图形状态栈，并不是所有的当前绘画环境的图形状态的元素都被保存。图形状态中不考虑当前路径，所以不保存
    //保存现在得上下文图形状态。不管后续对context上绘制什么都不会影响真正得屏幕。
    CGContextSaveGState(context);
    //x，y轴方向移动
    CGContextTranslateCTM(context , 0 ,self.bounds.size.height);
    
    //缩放x，y轴方向缩放，－1.0为反向1.0倍,坐标系转换,沿x轴翻转180度
    CGContextScaleCTM(context, 1.0 ,-1.0);
    
    CTFrameDraw(frame,context);
    
    CGPathRelease(Path);
    CFRelease(framesetter);
    

}

@end
