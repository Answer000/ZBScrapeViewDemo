//
//  ClearView.h
//  擦除效果
//
//  Created by 澳蜗科技 on 16/11/3.
//  Copyright © 2016年 澳蜗科技. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZBScrapeView : UIView
//上面展示的image
@property (nonatomic,strong) UIImage *topImage;
//下面展示的image
@property (nonatomic,strong) UIImage *bottomImage;
//擦除区域半径
@property (nonatomic,assign) CGFloat clearRadius;

@end
