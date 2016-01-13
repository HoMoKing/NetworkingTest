//
//  AKNavController.m
//  cocoapodsTest
//
//  Created by mac on 16/1/13.
//  Copyright © 2016年 王永军. All rights reserved.
//

#import "AKNavController.h"

@interface AKNavController ()<UIGestureRecognizerDelegate>

@end

@implementation AKNavController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self buildUI];
}

-(void)buildUI
{
    
    
    [self.navigationBar setBarTintColor:MYColor(47, 168, 222)];
    
    [self.navigationBar setTranslucent:YES];
    
    __weak typeof (self) weakSelf = self;
    
    if ([self respondsToSelector:@selector
         (interactivePopGestureRecognizer)]) {
        
        self.interactivePopGestureRecognizer.delegate = weakSelf;
    }
    
    if ([self.navigationController respondsToSelector:@selector(interactivePopGestureRecognizer)]) {
        self.navigationController.interactivePopGestureRecognizer.enabled = NO;
    }
    
    
    // 3.设置导航栏文字的主题
    UIFont * font = [UIFont fontWithName:@"Arial-ItalicMT" size:TITLEFONT];
    
    NSDictionary * textAttributes = @{NSFontAttributeName:font,
                                      NSForegroundColorAttributeName:[UIColor whiteColor]};
    
    [[UINavigationBar appearance]setTitleTextAttributes:textAttributes];
    
    
    // 4.修改所有UIBarButtonItem的外观
    UIBarButtonItem *barItem = [UIBarButtonItem appearance];
    
    NSShadow *shadow = [[NSShadow alloc]init];
    
    shadow.shadowColor = MYColor(159, 211, 79);
    
    [barItem setTintColor:[UIColor whiteColor]];
    
    // 修改item上面的文字样式
    //    NSDictionary *dict = [NSDictionary dictionaryWithObjectsAndKeys:MYColor(159, 211, 79),NSForegroundColorAttributeName,  [UIFont fontWithName:@"SnellRoundhand-Bold"size:TITLEFONT],NSFontAttributeName ,shadow,NSShadowAttributeName,nil];
    
    //    [barItem setTitleTextAttributes:dict forState:UIControlStateNormal];
    //
    //    [barItem setTitleTextAttributes:dict forState:UIControlStateHighlighted];
    //
    
    
    
}

-(void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    
    
    if (self.viewControllers.count>0) {
        
        viewController.hidesBottomBarWhenPushed = YES;
        
        viewController.navigationItem.leftBarButtonItem = [self creatBackButton];
        
    }
    
    [super pushViewController:viewController animated:animated];
}


- (void)setTabBarHidden:(BOOL)hidden

{
    
    UIView *tab = self.tabBarController.view;
    
    CGRect  tabRect=self.tabBarController.tabBar.frame;
    
    if ([tab.subviews count] < 2) {
        
        return;
        
    }
    
    
    
    UIView *view;
    
    if ([[tab.subviews objectAtIndex:0] isKindOfClass:[UITabBar class]]) {
        
        view = [tab.subviews objectAtIndex:1];
        
    } else {
        
        view = [tab.subviews objectAtIndex:0];
        
    }
    
    
    
    if (hidden) {
        
        view.frame = tab.bounds;
        
        tabRect.origin.y=[[UIScreen mainScreen] bounds].size.height+self.tabBarController.tabBar.frame.size.height;
        
    } else {
        
        view.frame = CGRectMake(tab.bounds.origin.x, tab.bounds.origin.y, tab.bounds.size.width, tab.bounds.size.height);
        
        tabRect.origin.y=[[UIScreen mainScreen] bounds].size.height-self.tabBarController.tabBar.frame.size.height;
        
    }
    
    
    
    [UIView animateWithDuration:0.5f animations:^{
        
        self.tabBarController.tabBar.frame=tabRect;
        
    }completion:^(BOOL finished) {
        
        
        
    }];
    
    
    
}


-(UIBarButtonItem *)creatBackButton
{
    UIBarButtonItem * barButtonItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"nav_back"]style:UIBarButtonItemStylePlain target:self action:@selector(popSelf)];
    
    return barButtonItem;
    
}


-(void)popSelf
{
    
    [self popViewControllerAnimated:YES];
    
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
