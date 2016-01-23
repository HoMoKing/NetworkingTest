//
//  AKThird.h
//  cocoapodsTest
//
//  Created by mac on 16/1/21.
//  Copyright © 2016年 王永军. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^enterBlock)(BOOL off);

@interface AKThird : UIViewController

@property (nonatomic , strong) UIImageView * bgImageView;

@property (nonatomic , copy)  enterBlock enterBlock;

@end
