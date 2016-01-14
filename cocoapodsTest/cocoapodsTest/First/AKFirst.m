//
//  AKFirst.m
//  cocoapodsTest
//
//  Created by mac on 16/1/13.
//  Copyright © 2016年 王永军. All rights reserved.
//

#import "AKFirst.h"
#import "AKSecond.h"

@interface AKFirst ()

@property (nonatomic , assign ) int selectNum;
@property (nonatomic , strong) UIButton * click;
@property (nonatomic , strong) UIActivityIndicatorView * hub;

@end

@implementation AKFirst
@synthesize click = _click;

- (void)viewDidLoad {
    
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
     self.selectNum = 0;
    
     [self buildUI];
     [self layoutUI];
    [self showJuHua];
    
}


#pragma mark---------UI
-(void)buildUI
{
    self.view.backgroundColor = [UIColor whiteColor];

    self.title = NSLocalizedString(self.titleNC, nil);
    
    self.backGround.image = [UIImage imageNamed:@"backGround_first"];
    
    self.view = self.backGround;
    
    self.toastStr = self.titleNC;
    
    [self.backGround addSubview:self.click];
    
    

}

-(void)layoutUI
{
    WS(weakSelf)
    
    [weakSelf.click mas_makeConstraints:^(MASConstraintMaker *make) {
       
        
        make.center.mas_equalTo(weakSelf.backGround);
        
        make.size.mas_equalTo(CGSizeMake(100, 40));
    }];
}


-(UIButton *)click
{

    if (!_click) {
        
        _click = [UIButton buttonWithType:UIButtonTypeCustom];
        
        [_click setTitle:@"点击" forState:UIControlStateNormal];
        
        [_click setImageForState:UIControlStateNormal withURL:[NSURL URLWithString:@"http://pic.baike.soso.com/p/20131216/20131216162955-1139983593.jpg"] placeholderImage:[UIImage imageNamed:@""]];
        
        [_click addTarget:self action:@selector(parseUrl:) forControlEvents:UIControlEventTouchUpInside];
        
        [_click setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        
        _click.backgroundColor = [UIColor redColor];
    }
    
    return _click;
}

-(void)parseUrl:(UIButton *)sender
{

    WS(weakSelf)
    
//    NSURLRequest * request = [NSURLRequest requestWithURL:[NSURL URLWithString:@"http://qzxy.tyut.edu.cn/bbs/data/attachment/forum/201203/24/223727bzx66z40099v7mvx.png"] cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:10.0];
//    
//    [self.backGround setImageWithURLRequest:request placeholderImage:[UIImage imageNamed:@"backGround_second"] success:^(NSURLRequest * _Nonnull request, NSHTTPURLResponse * _Nullable response, UIImage * _Nonnull image) {
    
        [weakSelf.backGround setImageWithURL:[NSURL URLWithString:@"http://img.51ztzj.com/upload/image/20150226/sj201502151025_279x419.jpg"]];
        
        
//    } failure:^(NSURLRequest * _Nonnull request, NSHTTPURLResponse * _Nullable response, NSError * _Nonnull error) {
//        
//        
//        
//    }];
    
    if([self.hub isAnimating]){
        
        [self.hub stopAnimating];
        
    }
    
    else
        
        [self.hub startAnimating];



}

-(void)jumpSecondViewController
{
    self.selectNum=0;
    
    AKSecond * second = [[AKSecond alloc]init];
    
    second.bgImageView = [self getBackgroundImageView];
    
     second.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    
    [self presentViewController:second animated:YES completion:^{
        
    }];

}



-(void)showJuHua
{
     self.hub = [[UIActivityIndicatorView alloc]initWithFrame:CGRectMake(40, 40, 40, 40)];
    
    [self.hub setCenter:CGPointMake(160, 120)];//指定进度轮中心点
    
    [self.hub setTintColor:[UIColor redColor]];//无效
    
    //[self.hub setBackgroundColor:[UIColor redColor]];//无效
    
   // self.hub.color = [UIColor redColor];//无效
    
    [self.hub setActivityIndicatorViewStyle:UIActivityIndicatorViewStyleWhiteLarge];//设置进度轮显示类型
    
    [self.hub startAnimating];

    
    [self.view addSubview:self.hub];

}

#pragma mark--------立即预约弹出框
- (UIImageView*)getBackgroundImageView{
    
    UIGraphicsBeginImageContext([UIScreen mainScreen].bounds.size);
    
    [self.navigationController.view.layer renderInContext:
     UIGraphicsGetCurrentContext()];
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    return [[UIImageView alloc] initWithImage:image];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    self.selectNum ++;
    
    MYLog(@" seleNum =======   %d", self.selectNum);
    
    if (self.selectNum>1) {
        
        return;
    }
    
    if (self.selectNum==1) {
        
        //   MYLog(@" seleNum =======   %d", self.selectNum);
        
        [self performSelector:@selector(jumpSecondViewController) withObject:nil ];
        
    }
    
    
}


@end
