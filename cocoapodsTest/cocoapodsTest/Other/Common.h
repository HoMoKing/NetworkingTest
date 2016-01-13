//
//  Common.h
//  cocoapodsTest
//
//  Created by mac on 16/1/8.
//  Copyright © 2016年 王永军. All rights reserved.
//

// 2.日志输出宏定义
#ifdef DEBUG
// 调试状态
#define MYLog(...) NSLog(__VA_ARGS__)

#else
// 发布状态
#define MYLog(...)

#endif


#if  defined  (DEBUG)  &&  DEBUG  ==  1

#else

#define  NSLog(...)  {};

#endif




#define MYColor(r, g, b) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1]

#define TITLEFONT 19


#define kScreenHeight   [UIScreen mainScreen].bounds.size.height

#define kScreenWidth    [UIScreen mainScreen].bounds.size.width


