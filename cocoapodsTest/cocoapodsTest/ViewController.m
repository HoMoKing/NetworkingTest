//
//  ViewController.m
//  cocoapodsTest
//
//  Created by mac on 16/1/8.
//  Copyright © 2016年 王永军. All rights reserved.
//

#import "ViewController.h"
#import "AKFirst.h"


#define BACKGROUNDIMAGE @"backGround"
#define kDKTableViewDefaultContentInset 300.0f

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource,UIGestureRecognizerDelegate>

@end

@implementation ViewController

@synthesize backGround = _backGround;
@synthesize tableView = _tableView;
@synthesize items = _items;

-(instancetype)init
{

    if (self = [super init]) {
        
         // Custom initialization
    }
    
    return self;
}


-(void)loadView
{
    
    [super loadView];
    
    // self.view = self.backGround;
    
}

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    [self buildUI];
    
}

#pragma mark---------UI
-(void)buildUI
{
    
    self.title = NSLocalizedString(@"Blur", nil);
    
    self.tableView.backgroundView = self.backGround;
    
    [self.view addSubview:self.tableView];
}

#pragma mark---------区数
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;

}

#pragma mark---------行数
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{

    return self.items.count;
    
}

#pragma mark---------绘制cell
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{

    static NSString * dentifier = @"mycell";
    
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:dentifier];
    
    if (!cell) {
        
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:dentifier];
        
        cell.textLabel.textColor = [UIColor whiteColor];
        
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        
        cell.backgroundColor = [UIColor clearColor];
        
    }
    
    
    cell.textLabel.text = self.items[indexPath.row];
    
    return cell;

}

#pragma mark---------点击cell
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
  //  [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    [UIView beginAnimations:@"animationID" context:nil];
    
    [UIView setAnimationDelay:0.5];
    
    [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
    
    [UIView setAnimationRepeatAutoreverses:NO];
    
    [UIView setAnimationTransition:UIViewAnimationTransitionCurlUp forView:[tableView cellForRowAtIndexPath:indexPath] cache:YES];
    
    [UIView commitAnimations];
    
    AKFirst * first = [[AKFirst alloc]init];
    
    first.titleNC = self.items[indexPath.row];
    
    [self.navigationController pushViewController:first animated:YES];

}


#pragma mark---------懒加载tableView
-(UITableView *)tableView
{

    if (!_tableView) {
        
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight) style:UITableViewStylePlain];
        
        _tableView.delegate = self;
        
        _tableView.dataSource = self;
        
        _tableView.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
        
        self.tableView.contentInset = UIEdgeInsetsMake(kDKTableViewDefaultContentInset, 0, 0, 0);

        
        _tableView.separatorColor = [UIColor clearColor];
        
        _tableView.backgroundColor = [UIColor clearColor];
    }
    
    
    return _tableView;
    
}

#pragma mark---------数据源
- (NSMutableArray *)items {
    if (_items == nil) {
        _items = [NSMutableArray new];
        
        NSArray *countryCodes = [NSLocale ISOCountryCodes];
        
        for (NSString *countryCode in countryCodes)
        {
            NSString *identifier = [NSLocale localeIdentifierFromComponents: [NSDictionary dictionaryWithObject: countryCode forKey: NSLocaleCountryCode]];
            
            NSString *country = [[NSLocale currentLocale] displayNameForKey: NSLocaleIdentifier value: identifier];
            
            [_items addObject: country];
        
           // MYLog(@" items =======   %@",_items);

        }
    }
    return _items;
}

#pragma mark---------背景图片
-(UIImageView *)backGround
{
    if (!_backGround) {
        
        _backGround = [[UIImageView alloc]init];
        
        _backGround.image = [UIImage imageNamed:BACKGROUNDIMAGE];
        
        _backGround.userInteractionEnabled = YES;
        
        //单指单击
        UITapGestureRecognizer * singleFingerOne = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(handleSingleFingerEvent:)];
        
        singleFingerOne.numberOfTouchesRequired = 1; //手指数
        
        singleFingerOne.numberOfTapsRequired = 1; //tap次数
        
        singleFingerOne.delegate = self;
        
        [_backGround addGestureRecognizer:singleFingerOne];
        
    }

    return _backGround;
}

#pragma mark---------图片手势点击
- (void)handleSingleFingerEvent:(UITapGestureRecognizer *)sender

 {
    
  if (sender.numberOfTapsRequired == 1) {
        
       //单指单击
        
       MYLog(@"单指单击");
      

          [self showToastViewWithTitle:self.toastStr];
      
      
      
       }else if(sender.numberOfTapsRequired == 2){
            
         //单指双击
            
         MYLog(@"单指双击");
    }
    
}


#pragma mark---------弹出框
-(void)showToastViewWithTitle:(NSString *)str
{

    if (str.length==0) {
        
        [self.view makeToast:@"单指单机" duration:1.0 position:@"center" title:@"xxoo" image:[UIImage imageNamed:@"icon_smile"]];
    }else
        
        [self.view makeToast:str duration:1.0 position:@"center" title:@"xxoo" image:[UIImage imageNamed:@"icon_smile"]];
    
}

 //处理双指事件

 - (void)handleDoubleFingerEvent:(UITapGestureRecognizer *)sender

 {
    
 if (sender.numberOfTapsRequired == 1) {
        
     //双指单击
        
       MYLog(@"双指单击");
        
       }else if(sender.numberOfTapsRequired == 2){
            
          //双指双击
            
       MYLog(@"双指双击");
            
    }
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
