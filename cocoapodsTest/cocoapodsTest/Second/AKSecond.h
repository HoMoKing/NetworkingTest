//
//  AKSecond.h
//  cocoapodsTest
//
//  Created by mac on 16/1/13.
//  Copyright © 2016年 王永军. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^changeBackGroundBlock)(UIImage * backImage);//定义一个block返回值void参数为颜色值

@interface AKSecond : UIViewController

@property (nonatomic , strong) UIImageView * bgImageView;


#pragma mark---------切换背景block
@property (nonatomic , copy) changeBackGroundBlock changeBGBlock;



@end
