//
//  AKFirst.m
//  cocoapodsTest
//
//  Created by mac on 16/1/13.
//  Copyright © 2016年 王永军. All rights reserved.
//

#import "AKFirst.h"

@interface AKFirst ()

@end

@implementation AKFirst

- (void)viewDidLoad {
    
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
     [self buildUI];
}


#pragma mark---------UI
-(void)buildUI
{
    self.view.backgroundColor = [UIColor whiteColor];

    self.title = NSLocalizedString(self.titleNC, nil);
    
    self.view = self.backGround;
    
    self.toastStr = self.titleNC;

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
