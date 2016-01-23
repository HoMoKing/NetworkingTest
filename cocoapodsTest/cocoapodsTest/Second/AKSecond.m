//
//  AKSecond.m
//  cocoapodsTest
//
//  Created by mac on 16/1/13.
//  Copyright © 2016年 王永军. All rights reserved.
//

#import "AKSecond.h"


@interface AKSecond ()
{
        NSInteger _countDownTome;
        NSTimer *_timer;
}



@property (nonatomic , strong) UIView * toolTip;
@property (nonatomic , strong) UILabel * titleLB;
@property (nonatomic , strong) UIImageView * img;
@property (nonatomic , strong) UILabel * countdownLB;

@property (nonatomic , strong) UIView * bgView;

@end

@implementation AKSecond

@synthesize toolTip = _toolTip;
@synthesize titleLB = _titleLB;
@synthesize img = _img;
@synthesize countdownLB = _countdownLB;

- (void)viewDidLoad {
    
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    [self buildUI];
    [self layoutUI];
   
}

#pragma mark---------绘建UI

-(void)buildUI
{
    
    CABasicAnimation *pulse = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    pulse.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut];
    pulse.duration = 0.5 + (rand() % 10) * 0.05;
    pulse.repeatCount = 1;
    pulse.autoreverses = YES;
    pulse.fromValue = [NSNumber numberWithFloat:.8];
    pulse.toValue = [NSNumber numberWithFloat:1.2];
    [self.toolTip.layer addAnimation:pulse forKey:nil];
    
    [self.view addSubview:self.bgImageView];
    [self.view addSubview:self.bgView];
    self.title = NSLocalizedString(@"nono", nil);
    self.view.backgroundColor =[UIColor whiteColor];
    [self.view addSubview:self.toolTip];
    [self.view addSubview:self.titleLB];
    [self.view addSubview:self.img];
    [self.view addSubview:self.countdownLB];
    

}


-(void)layoutUI
{
    WS(weakSelf)
    
    [weakSelf.toolTip mas_makeConstraints:^(MASConstraintMaker *make) {
     
        make.center.equalTo(weakSelf.view);
        
        
        make.size.mas_equalTo(CGSizeMake(kScreenWidth-40, kScreenWidth-40));
        
    }];
    
    [weakSelf.titleLB mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.top.equalTo(weakSelf.toolTip).with.offset(10);
        make.left.equalTo(weakSelf.toolTip).with.offset(10);
        make.right.equalTo(weakSelf.toolTip).with.offset(-10);
        make.height.mas_equalTo(@(40));
    }];
    
    [weakSelf.img mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.top.equalTo(weakSelf.titleLB.mas_bottom).with.offset(10);
        make.centerX.mas_equalTo(weakSelf.titleLB.mas_centerX);
        make.width.mas_equalTo(@(112));
        make.bottom.equalTo(weakSelf.toolTip).with.offset(-60);
        
    }];
    
    [weakSelf.countdownLB mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.top.mas_equalTo(weakSelf.img.mas_bottom).with.offset(10);
        make.left.equalTo(weakSelf.titleLB).with.offset(20);
        make.right.equalTo(weakSelf.titleLB).with.offset(-20);
        make.bottom.equalTo(weakSelf.toolTip).with.offset(-10);

        
    }];
    
}


-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    UIImage * image = [UIImage imageNamed:@"backGround"];
    self.changeBGBlock(image);

}


#pragma mark---------懒加载
-(UIView *)toolTip
{
    if (!_toolTip) {
        
        _toolTip = [UIView new];
        
        _toolTip.backgroundColor = MYColor(255, 250, 224);
    }

    return _toolTip;
}


-(UILabel *)titleLB
{
    if (!_titleLB) {
        
        _titleLB = [UILabel new];
        
        _titleLB.text = @"预约成功";
        
        _titleLB.textColor = MYColor(205,150,127);
        
        _titleLB.textAlignment = NSTextAlignmentCenter;
        
        _titleLB.font = [UIFont systemFontOfSize:20.0f];
        
         }
    
    return _titleLB;

}


-(UIImageView *)img
{

    if (!_img) {
       
        _img = [UIImageView new];
        
        _img.image = [UIImage imageNamed:@"order_success"];
    }
    
    return _img;
}


-(UILabel *)countdownLB
{
    if (!_countdownLB) {
        
        _countdownLB = [UILabel new];
        
        _countdownLB.textAlignment = NSTextAlignmentCenter;
        
        _countdownLB.font = [UIFont systemFontOfSize:18.0f];
        
        _countdownLB.textColor =  MYColor(205,150,127);
        
         [self startTime];

    }
    
    return _countdownLB;
}


-(void)startTime
{
    _countDownTome = 3;
    
    _countdownLB.text = [NSString stringWithFormat:@"%lu秒钟后自动返回!",(long)_countDownTome];
    
    _timer = [NSTimer scheduledTimerWithTimeInterval:1.5 target:self selector:@selector(changTime) userInfo:nil repeats:YES];
 
}
-(void)changTime
{
    _countDownTome--;
    
    _countdownLB.text = [NSString stringWithFormat:@"%lu秒钟后自动返回!",(long)_countDownTome];
    
    if (_countDownTome <=0) {
        
        _countdownLB.text = @"";
        
        [_timer invalidate];
        
        //防止time释放后还继续访问
        _timer = nil;
        
        MYLog(@" NSTimer =======   %@", _timer);
        
        [self dismissViewControllerAnimated:YES completion:^{
            
        }];
    }
}


-(UIImageView *)bgImageView{
    if (!_bgImageView) {
        _bgImageView = [[UIImageView alloc] initWithFrame:self.view.frame];
    }
    return  _bgImageView;
}
-(UIView *)bgView{
    if (!_bgView) {
        _bgView = [[UIView alloc] initWithFrame:self.view.frame];
        _bgView.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.5];
    }
    return _bgView;
}
//页面将要进入前台，开启定时器
-(void)viewWillAppear:(BOOL)animated
{
    //开启定时器
    [_timer setFireDate:[NSDate distantPast]];
}

//页面消失，进入后台不显示该页面，关闭定时器
-(void)viewDidDisappear:(BOOL)animated
{
    //关闭定时器
    [_timer setFireDate:[NSDate distantFuture]];
}





- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
