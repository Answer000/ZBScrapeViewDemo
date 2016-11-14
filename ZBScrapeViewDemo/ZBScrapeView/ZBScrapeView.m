//
//  ClearView.m
//  擦除效果
//
//  Created by 澳蜗科技 on 16/11/3.
//  Copyright © 2016年 澳蜗科技. All rights reserved.
//

#import "ZBScrapeView.h"

@interface ZBScrapeView()
//上面的imageView
@property (nonatomic,strong) UIImageView *topImgView;
//底下的imageView
@property (nonatomic,strong) UIImageView *bottomImgView;
//擦除手势
@property (nonatomic,strong) UIPanGestureRecognizer *pan;
@end

@implementation ZBScrapeView

#pragma mark-  懒加载
-(UIImageView *)topImgView{
    if (!_topImgView) {
        _topImgView = [[UIImageView alloc] init];
        _topImgView.userInteractionEnabled = YES;
    }
    return _topImgView;
}

-(UIImageView *)bottomImgView{
    if (!_bottomImgView) {
        _bottomImgView = [[UIImageView alloc] init];
    }
    return _bottomImgView;
}

- (UIPanGestureRecognizer *)pan{
    if (!_pan) {
        _pan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(panClick:)];
    }
    return _pan;
}

#pragma mark-  代码创建
-(instancetype)initWithFrame:(CGRect)frame{
    if (self == [super initWithFrame: frame]) {
        [self setupUI];
    }
    return self;
}

#pragma mark-  Xib创建
-(void)awakeFromNib{
    [super awakeFromNib];
    
    [self setupUI];
}

- (void)setupUI {
    //设置擦除区域默认半径
    self.clearRadius = self.clearRadius == 0 ? 15 : self.clearRadius;
    
    [self addSubview:self.bottomImgView];
    [self addSubview:self.topImgView];
    [self.topImgView addGestureRecognizer:self.pan];
}

-(void)layoutSubviews {
    //设置frame
    self.topImgView.frame = self.bounds;
    self.bottomImgView.frame = self.bounds;
    //填充图片
    self.topImgView.image = self.topImage;
    self.bottomImgView.image = self.bottomImage;
}

- (void)panClick:(UIPanGestureRecognizer *)pan{
    //获取触摸的点
    CGPoint touchPoint = [pan locationInView:self.bottomImgView];
    //设置擦除区域
    CGFloat clearX = touchPoint.x - self.clearRadius;
    CGFloat clearY = touchPoint.y - self.clearRadius;
    CGFloat clearW = 2 * self.clearRadius;
    CGFloat clearH = 2 * self.clearRadius;
    CGRect clearRect = CGRectMake(clearX, clearY, clearW, clearH);
    
    //设置上下文的size(和topImageView的size一样大)
    CGSize ctxSize = self.topImgView.bounds.size;
    //开启上下文且设置不透明度为透明
    UIGraphicsBeginImageContextWithOptions(ctxSize, NO, 0);
    //获取当前的上下文
    CGContextRef currentCtx = UIGraphicsGetCurrentContext();
    //将topImageView的内容渲染到上下文中
    [self.topImgView.layer renderInContext:currentCtx];
    //清除指定上下文的指定区域
    CGContextClearRect(currentCtx, clearRect);
    //从当前的上下文中获取新的图片
    UIImage *newImg = UIGraphicsGetImageFromCurrentImageContext();
    //关闭上下文
    UIGraphicsEndImageContext();
    //给topImageView重新设置image
    self.topImgView.image = newImg;
}

@end
