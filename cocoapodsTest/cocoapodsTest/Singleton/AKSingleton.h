//
//  AKSingleton.h
//  cocoapodsTest
//
//  Created by mac on 16/1/21.
//  Copyright © 2016年 王永军. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AKSingleton : NSObject
+ (AKSingleton *)sharedManager;
- (UIImageView*)getBackgroundImageView:(UINavigationController *)NC;
@end
