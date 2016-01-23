//
//  AKThird.m
//  cocoapodsTest
//
//  Created by mac on 16/1/21.
//  Copyright © 2016年 王永军. All rights reserved.
//

#import "AKThird.h"

@interface AKThird ()<UITextFieldDelegate>

@property (nonatomic , strong) UIView * toolTip;
@property (nonatomic , strong) UILabel * titleLB;
@property (nonatomic , strong) UITextField * inputTF;
@property (nonatomic , strong) UIButton * enterBT;
@property (nonatomic , strong) UIButton * cancelBT;

@property (nonatomic , strong) UIView * bgView;
@end

@implementation AKThird

@synthesize toolTip = _toolTip;
@synthesize titleLB = _titleLB;
@synthesize inputTF =  _inputTF;
@synthesize enterBT = _enterBT;
@synthesize cancelBT = _cancelBT;
@synthesize bgView = _bgView;
@synthesize bgImageView = _bgImageView;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self buildUI];
    [self layoutUI];
    self.view.backgroundColor = [UIColor whiteColor];
}

-(void)buildUI
{
    [self.view addSubview:self.bgImageView];
    [self.view addSubview:self.bgView];
    [self.view addSubview:self.toolTip];
    [self.view addSubview:self.titleLB];
    [self.view addSubview:self.inputTF];
    [self.view addSubview:self.cancelBT];
    [self.view addSubview:self.enterBT];
}

-(void)layoutUI
{
    WS(weakSelf)
    
    [weakSelf.toolTip mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.center.mas_equalTo(weakSelf.view);
        make.size.mas_equalTo(CGSizeMake(kScreenWidth-40, kScreenWidth-120));
        
    }];
    
    [weakSelf.titleLB mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.top.equalTo(weakSelf.toolTip).with.mas_offset(10);
        make.left.equalTo(weakSelf.toolTip).with.mas_offset(10);
        make.right.equalTo(weakSelf.toolTip).with.mas_offset(-10);
        make.height.mas_equalTo(40);
        
    }];
    
    [weakSelf.inputTF mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(weakSelf.titleLB.mas_bottom).with.mas_offset(10);
        make.left.equalTo(weakSelf.titleLB).with.mas_offset(10);
        make.right.equalTo(weakSelf.titleLB).with.mas_offset(-10);
        make.height.mas_equalTo(40);
        
    }];
    
    int padding = 30;
    
    [weakSelf.cancelBT mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(weakSelf.toolTip.mas_left).with.offset(padding);
        make.right.equalTo(weakSelf.enterBT.mas_left).with.offset(-padding);
        
        make.top.equalTo(weakSelf.inputTF.mas_bottom).with.mas_offset(padding);
        make.bottom.equalTo(weakSelf.toolTip.mas_bottom).with.mas_offset(-padding);
        
        make.width.equalTo(weakSelf.enterBT);
        make.height.equalTo(weakSelf.enterBT);
        
        }];

    
    [weakSelf.enterBT mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(weakSelf.cancelBT.mas_right).with.offset(padding);
        make.right.equalTo(weakSelf.toolTip.mas_right).with.offset(-padding);
        make.top.equalTo(weakSelf.cancelBT);
        make.bottom.equalTo(weakSelf.cancelBT);
        make.width.equalTo(weakSelf.cancelBT);
        make.height.equalTo(weakSelf.cancelBT);

    }];
    
    
    
}

-(void)enterAction
{

    //self.enterBlock(YES);
    
    [self dismissViewControllerAnimated:YES completion:^{
        
    }];


}

-(void)cancelAction
{

[self dismissViewControllerAnimated:YES completion:^{
    
}];


}

-(NSString *)title
{
    return NSLocalizedString(@"设置密码", nil);

}

-(UIView *)toolTip
{

    if (!_toolTip) {
        
        _toolTip = [[UIView alloc]init];
        _toolTip.backgroundColor = MYColor(255, 250, 224);
        UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(recoverAction)];
        
        [_toolTip addGestureRecognizer:tap];
        
    }
    return  _toolTip;
}

-(UILabel *)titleLB
{
    if (!_titleLB) {
        
        _titleLB = [[UILabel alloc]init];
        _titleLB.text = @"请输入密码";
        _titleLB.font = [UIFont systemFontOfSize:18.0];
        _titleLB.textAlignment = NSTextAlignmentCenter;
        _titleLB.numberOfLines = 0;

    }
    
    return _titleLB;
}

-(UITextField *)inputTF
{
    if (!_inputTF) {
        
        _inputTF = [[UITextField alloc]init];
        
      //  [_inputTF becomeFirstResponder];
        _inputTF.borderStyle = UITextBorderStyleRoundedRect;
        _inputTF.secureTextEntry = YES;
        _inputTF.clearButtonMode = UITextFieldViewModeAlways;
        _inputTF.keyboardType = UIKeyboardTypeNumberPad;
        _inputTF.placeholder = @"请输入密码";
        _inputTF.tintColor = [UIColor grayColor];
        _inputTF.delegate = self;

    }
    
    return  _inputTF;
}

-(UIButton *)enterBT
{
    if (!_enterBT) {
        
        _enterBT = [UIButton buttonWithType:UIButtonTypeCustom];
        _enterBT.backgroundColor = MYColor(115, 53, 41);
        _enterBT.layer.cornerRadius = 2;
        [_enterBT setTitle:@"确定" forState:UIControlStateNormal];
        [_enterBT addTarget:self action:@selector(enterAction) forControlEvents:UIControlEventTouchUpInside];
    }
    
    return _enterBT;

}

-(UIButton *)cancelBT
{
    if (!_cancelBT) {
        
        _cancelBT = [UIButton buttonWithType:UIButtonTypeCustom];
        _cancelBT.backgroundColor = MYColor(115, 53, 41);
        _cancelBT.layer.cornerRadius = 2;
        [_cancelBT setTitle:@"取消" forState:UIControlStateNormal];
        [_cancelBT addTarget:self action:@selector(cancelAction) forControlEvents:UIControlEventTouchUpInside];
    }

    return _cancelBT;
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


-(void)recoverAction
{
    [self.view endEditing:YES];

}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
     [self.view endEditing:YES];

}


int prewTag1 ;  //编辑上一个UITextField的TAG,需要在XIB文件中定义或者程序中添加，不能让两个控件的TAG相同
float prewMoveY1; //编辑的时候移动的高度

-(void)textFieldDidBeginEditing:(UITextField *)textField
{
    CGRect textFrame = textField.frame;
    
    CGFloat textY = textFrame.origin.y+textFrame.size.height;
    
    CGFloat bottomY = self.view.height-textY;
    
    if (bottomY>=216) { //判断当前的高度是否已经有216，如果超过了就不需要再移动主界面的View高度
        prewTag1 = -1;
        return;
        
    }
    
    prewTag1 = textField.tag;
    float moveY = 216-bottomY;
    prewMoveY1 = moveY;
    
    NSTimeInterval animationDuration = 0.30f;
    CGRect frame = self.view.frame;
    frame.origin.y -=moveY;//view的Y轴上移
    [UIView beginAnimations:@"ResizeView" context:nil];
    [UIView setAnimationDuration:animationDuration];
    self.view.frame = frame;
    [UIView commitAnimations];//设置调整界面的动画效果
    
}


-(void)textFieldDidEndEditing:(UITextField *)textField
{
    
    if(prewTag1 == -1) //当编辑的View不是需要移动的View
    {
        return;
    }
    float moveY ;
    NSTimeInterval animationDuration = 0.30f;
    CGRect frame = self.view.frame;
    if(prewTag1 == textField.tag) //当结束编辑的View的TAG是上次的就移动
    {   //还原界面
        moveY =  prewMoveY1;
        frame.origin.y +=moveY;
    }
    //self.view移回原位置
    [UIView beginAnimations:@"ResizeView" context:nil];
    [UIView setAnimationDuration:animationDuration];
    self.view.frame = frame;
    [UIView commitAnimations];
    [textField resignFirstResponder];
    
    
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
