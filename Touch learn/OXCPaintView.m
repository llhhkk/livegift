//
//  OXCPaintView.m
//  Touch learn
//
//  Created by LinHK on 2017/12/18.
//
#import "OXCPaintView.h"

@interface OXCPaintView ()
{
    CGFloat currentX;
    CGFloat currentY;
}
@property (nonatomic,strong) NSMutableArray * totalPathPoints;
//@property (nonatomic,strong) UIBezierPath  *bezierPath;
@property (nonatomic,strong)UIImageView *imgV;
@end

@implementation OXCPaintView

- (NSMutableArray *)totalPathPoints{
    if (nil == _totalPathPoints) {
        _totalPathPoints = [[NSMutableArray alloc] init];
    }
    return _totalPathPoints;
}
#pragma mark - Touches Event


- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    NSSet *allTouches = [event allTouches];    //返回与当前接收者有关的所有的触摸对象
    UITouch *touch = [allTouches anyObject];//视图中的所有对象
    CGPoint point = [touch locationInView:[touch view]]; //返回触摸点在视图中的当前坐标
    CGFloat x = point.x;
    CGFloat y = point.y;
    UIImageView *imgV = [UIImageView new];
    imgV.bounds = CGRectMake(0, 0, 30, 30);
    imgV.image=[UIImage imageNamed:@"collection"];
    imgV.center = CGPointMake(x, y);
    [self addSubview:imgV];
    [self.totalPathPoints addObject:imgV];
    currentX = x;
    currentY = y;
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
    UIImageView *imgV = [UIImageView new];
    imgV.bounds = CGRectMake(0, 0, 30, 30);
    imgV.image=[UIImage imageNamed:@"collection"];
    NSSet *allTouches = [event allTouches];    //返回与当前接收者有关的所有的触摸对象
    UITouch *touch = [allTouches anyObject];//视图中的所有对象
    CGPoint point = [touch locationInView:[touch view]]; //返回触摸点在视图中的当前坐标
    CGFloat x = point.x;
    CGFloat y = point.y;
    if (fabsf(x)-currentX>=20 || fabsf(y)-currentY>=20) {
        imgV.center = CGPointMake(x, y);
        [self addSubview:imgV];
        [self.totalPathPoints addObject:imgV];
        currentX = x;
        currentY = y;
        
    }

}

-(UIImage *)clear{
    //裁剪指定区域
    UIGraphicsBeginImageContext(self.frame.size);//创建一个基于位图的上下文，并设置当前上下文
    CGContextRef contex = UIGraphicsGetCurrentContext();//获取图形上下文
    UIRectClip(CGRectMake(0, 0, self.frame.size.width, 300));//裁剪区域
    [self.layer renderInContext:contex];
    UIImage * image = UIGraphicsGetImageFromCurrentImageContext();
    NSData* imageData =  UIImagePNGRepresentation(image);//生成 PNG 格式的图片（如果是其他格式，可以自行更改）
    UIImage* pngImage = [UIImage imageWithData:imageData];
    
    //开始写代码,实现清空所有涂鸦功能
    for (UIImageView *imageV in self.totalPathPoints) {

        [imageV removeFromSuperview];

    }
    [self.totalPathPoints removeAllObjects];
 
    return pngImage;
}

@end
