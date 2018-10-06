//
//  LoginViewController.m
//  shuiku
//
//  Created by 韩明静 on 2018/9/28.
//  Copyright © 2018年 韩明静. All rights reserved.
//

#import "LoginViewController.h"
#import "MapViewController.h"

@interface LoginViewController ()
@property (weak, nonatomic) IBOutlet UITextField *usernameTF;
@property (weak, nonatomic) IBOutlet UITextField *pwdTF;

@end

@implementation LoginViewController
- (IBAction)managerLogin:(id)sender {
//    NSLog(@"123");
    MapViewController *vc=[MapViewController new];
    [self.navigationController pushViewController:vc animated:YES];
}
- (IBAction)userLogin:(id)sender {
    MapViewController *vc=[MapViewController new];
    [self.navigationController pushViewController:vc animated:YES];
//    NSLog(@"23");
}

- (void)viewDidLoad {
    [super viewDidLoad];
   
    
}

-(void)viewWillAppear:(BOOL)animated{
    
    [super viewWillAppear:animated];
    
    self.navigationController.navigationBar.hidden=YES;
    
}




@end
