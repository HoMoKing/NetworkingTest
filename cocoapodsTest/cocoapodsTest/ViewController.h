//
//  ViewController.h
//  cocoapodsTest
//
//  Created by mac on 16/1/8.
//  Copyright © 2016年 王永军. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (nonatomic , strong) UIImageView * backGround;
@property (nonatomic , strong) UITableView * tableView;
@property (nonatomic , strong) NSMutableArray * items;
@property (nonatomic , strong) NSString * toastStr;

@end

