//
//  viewsViewController.m
//  shuiku
//
//  Created by 韩明静 on 2018/10/6.
//  Copyright © 2018年 韩明静. All rights reserved.
//

#import "viewsViewController.h"
#import "twofiveoneView.h"

@interface viewsViewController ()

@property(nonatomic,strong)twofiveoneView *view1;

@end

@implementation viewsViewController

-(twofiveoneView *)view1{
    
    if (_view1==nil) {
        
        NSArray *array=[[NSBundle mainBundle]loadNibNamed:@"twofiveoneView" owner:nil options:nil];
        _view1=[array firstObject];
    }
    return _view1;
     
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor=[UIColor whiteColor];
    
    [self.view addSubview:self.view1];
    [self.view1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.equalTo(self.view).offset(10);
        make.bottom.equalTo(self.view).offset(-10);
        make.width.equalTo(@(screenWidth/3.0));
        make.top.equalTo(self.view).offset(statusBarHeight+self.navigationController.navigationBar.frame.size.height+10);
    }];
}



@end
