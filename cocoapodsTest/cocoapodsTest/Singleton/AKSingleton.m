//
//  AKSingleton.m
//  cocoapodsTest
//
//  Created by mac on 16/1/21.
//  Copyright © 2016年 王永军. All rights reserved.
//

#import "AKSingleton.h"

@implementation AKSingleton

+ (AKSingleton *)sharedManager {
    static AKSingleton * sharedAccountManagerInstance = nil;
    
    static dispatch_once_t predicate; dispatch_once(&predicate, ^{
        sharedAccountManagerInstance = [[self alloc] init];
    });
    
    return sharedAccountManagerInstance;
    
}

#pragma mark--------背景截图
- (UIImageView*)getBackgroundImageView:(UINavigationController *)NC{
    
    UIGraphicsBeginImageContext([UIScreen mainScreen].bounds.size);
    
    [NC.view.layer renderInContext:
     UIGraphicsGetCurrentContext()];
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    return [[UIImageView alloc] initWithImage:image];
}

@end
