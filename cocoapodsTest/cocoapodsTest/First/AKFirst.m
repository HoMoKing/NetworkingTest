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


@end

@implementation AKFirst

- (void)viewDidLoad {
    
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
     self.selectNum = 0;
    
     [self buildUI];
}


#pragma mark---------UI
-(void)buildUI
{
    self.view.backgroundColor = [UIColor whiteColor];

    self.title = NSLocalizedString(self.titleNC, nil);
    
    self.backGround.image = [UIImage imageNamed:@"backGround_first"];
    
    self.view = self.backGround;
    
    self.toastStr = self.titleNC;
    
  

}

-(void)jumpSecondViewController
{
    self.selectNum=0;
    
    AKSecond * second = [[AKSecond alloc]init];
    
    [self.navigationController pushViewController:second animated:YES];

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
        
    [self performSelector:@selector(jumpSecondViewController) withObject:nil afterDelay:1.0f];
        
    }
    

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
