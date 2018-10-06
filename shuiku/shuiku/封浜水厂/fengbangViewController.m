//
//  fengbangViewController.m
//  shuiku
//
//  Created by 韩明静 on 2018/10/5.
//  Copyright © 2018年 韩明静. All rights reserved.
//

#import "fengbangViewController.h"
#import "customButton.h"
#import "fblayoutViewController.h"

@interface fengbangViewController ()

@property(nonatomic,strong)customButton *leftButton;

@property(nonatomic,strong)customButton *rightButton;

@end

@implementation fengbangViewController

-(customButton *)leftButton{
    
    if (_leftButton==nil) {
        _leftButton=[customButton buttonWithType:UIButtonTypeCustom];
        [_leftButton setImage:[UIImage imageNamed:@"布局图"] forState:UIControlStateNormal];
        _leftButton.imageView.contentMode=UIViewContentModeScaleAspectFit;
        [_leftButton setTitle:@"水厂布局图" forState:UIControlStateNormal];
        _leftButton.titleLabel.textAlignment=NSTextAlignmentCenter;
        [_leftButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        _leftButton.titleLabel.font=[UIFont systemFontOfSize:17];
        [_leftButton addTarget:self action:@selector(ButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _leftButton;
}

-(UIButton *)rightButton{
    
    if (_rightButton==nil) {
        _rightButton=[customButton buttonWithType:UIButtonTypeCustom];
        [_rightButton setTitle:@"报警显示" forState:UIControlStateNormal];
        [_rightButton setImage:[UIImage imageNamed:@"报警"] forState:UIControlStateNormal];
        _rightButton.imageView.contentMode=UIViewContentModeScaleAspectFit;
        _rightButton.titleLabel.textAlignment=NSTextAlignmentCenter;
        [_rightButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        _rightButton.titleLabel.font=[UIFont systemFontOfSize:17];
        [_rightButton addTarget:self action:@selector(ButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _rightButton;
}

-(void)ButtonAction:(UIButton *)button{
    
    self.leftButton.backgroundColor=[UIColor whiteColor];
    self.rightButton.backgroundColor=[UIColor whiteColor];
    
    button.backgroundColor=[UIColor colorWithRed:240/255.0 green:237/255.0 blue:236/255.0 alpha:1];
    
    if (button==self.leftButton) {
        [self.navigationController pushViewController:[fblayoutViewController new] animated:YES];
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
   
    self.view.backgroundColor=[UIColor whiteColor];
    
    [self.view addSubview:self.leftButton];
    [self.leftButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.view);
        make.width.equalTo(@(screenHeight/4.0+20));
        make.height.equalTo(@(screenHeight/4.0+20));
        make.trailing.equalTo(self.view.mas_centerX).offset(-screenWidth/8.0);
    }];
    
    [self.view addSubview:self.rightButton];
    [self.rightButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.height.centerY.equalTo(self.leftButton);
        make.leading.equalTo(self.view.mas_centerX).offset(screenWidth/8.0);
    }];
    
}

-(void)viewWillAppear:(BOOL)animated{
    
    [super viewWillAppear:animated];
    
    self.navigationController.navigationBar.hidden=NO;
}

@end
