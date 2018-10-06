//
//  fblayoutViewController.m
//  shuiku
//
//  Created by 韩明静 on 2018/10/5.
//  Copyright © 2018年 韩明静. All rights reserved.
//

#import "fblayoutViewController.h"

@interface fblayoutViewController ()

@property(nonatomic,strong)NSArray *labelsArr;

@end

@implementation fblayoutViewController

-(NSArray *)labelsArr{
    
    if (_labelsArr==nil) {
        
        NSMutableArray *tmp=[NSMutableArray array];
        
        for (int i=0; i<33; i++) {
            
            UILabel *label=[UILabel new];
            label.text=@"123";
            label.textColor=[UIColor whiteColor];
            label.font=[UIFont systemFontOfSize:12];
            
            [tmp addObject:label];
        }
        _labelsArr=[NSArray arrayWithArray:tmp];
    }
    return _labelsArr;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor=[UIColor whiteColor];
    
    UIImageView *imageview=[[UIImageView alloc]init];
    imageview.image=[UIImage imageNamed:@"布局图-1"];
    [self.view addSubview:imageview];
    [imageview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
    
    [self preparesubviews];
}

-(void)preparesubviews{
    
    __weak typeof(self) weakself=self;
    
    for (int i=0; i<33; i++) {
        
        UILabel *label=self.labelsArr[i];
        
        [self.view addSubview:label];
        [label mas_makeConstraints:^(MASConstraintMaker *make) {
            
            if (i==0) {
                make.leading.equalTo(weakself.view).offset(screenWidth*0.18355);
                make.top.equalTo(weakself.view).offset(screenHeight*0.20064);
            }else if (i==1){
                make.leading.equalTo(weakself.view).offset(screenWidth*0.18355);
                make.top.equalTo(weakself.view).offset(screenHeight*0.24045);
            }else if (i==2){
                make.leading.equalTo(weakself.view).offset(screenWidth*0.18355);
                make.top.equalTo(weakself.view).offset(screenHeight*0.28185);
            }else if (i==3){
                make.leading.equalTo(weakself.view).offset(screenWidth*0.22761);
                make.top.equalTo(weakself.view).offset(screenHeight*0.48248);
            }else if (i==4){
                make.leading.equalTo(weakself.view).offset(screenWidth*0.22761);
                make.top.equalTo(weakself.view).offset(screenHeight*0.60191);
            }else if (i==5){
                make.leading.equalTo(weakself.view).offset(screenWidth*0.22761);
                make.top.equalTo(weakself.view).offset(screenHeight*0.64331);
            }else if (i==6){
                make.leading.equalTo(weakself.view).offset(screenWidth*0.22761);
                make.top.equalTo(weakself.view).offset(screenHeight*0.68631);
            }else if (i==7){
                make.leading.equalTo(weakself.view).offset(screenWidth*0.22761);
                make.top.equalTo(weakself.view).offset(screenHeight*0.75478);
            }else if (i==8){
                make.leading.equalTo(weakself.view).offset(screenWidth*0.32673);
                make.top.equalTo(weakself.view).offset(screenHeight*0.20382);
            }else if (i==9){
                make.leading.equalTo(weakself.view).offset(screenWidth*0.32305);
                make.top.equalTo(weakself.view).offset(screenHeight*0.48248);
            }else if (i==10){
                make.leading.equalTo(weakself.view).offset(screenWidth*0.32305);
                make.top.equalTo(weakself.view).offset(screenHeight*0.60191);
            }else if (i==11){
                make.leading.equalTo(weakself.view).offset(screenWidth*0.32305);
                make.top.equalTo(weakself.view).offset(screenHeight*0.64331);
            }else if (i==12){
                make.leading.equalTo(weakself.view).offset(screenWidth*0.32305);
                make.top.equalTo(weakself.view).offset(screenHeight*0.68631);
            }else if (i==13){
                make.leading.equalTo(weakself.view).offset(screenWidth*0.32305);
                make.top.equalTo(weakself.view).offset(screenHeight*0.75478);
            }else if (i==14){
                make.leading.equalTo(weakself.view).offset(screenWidth*0.42291);
                make.top.equalTo(weakself.view).offset(screenHeight*0.48248);
            }else if (i==15){
                make.leading.equalTo(weakself.view).offset(screenWidth*0.42291);
                make.top.equalTo(weakself.view).offset(screenHeight*0.60191);
            }else if (i==16){
                make.leading.equalTo(weakself.view).offset(screenWidth*0.42291);
                make.top.equalTo(weakself.view).offset(screenHeight*0.64331);
            }else if (i==17){
                make.leading.equalTo(weakself.view).offset(screenWidth*0.42291);
                make.top.equalTo(weakself.view).offset(screenHeight*0.68631);
            }else if (i==18){
                make.leading.equalTo(weakself.view).offset(screenWidth*0.42291);
                make.top.equalTo(weakself.view).offset(screenHeight*0.75478);
            }else if (i==19){
                make.leading.equalTo(weakself.view).offset(screenWidth*0.51909);
                make.top.equalTo(weakself.view).offset(screenHeight*0.18790);
            }else if (i==20){
                make.leading.equalTo(weakself.view).offset(screenWidth*0.56975);
                make.top.equalTo(weakself.view).offset(screenHeight*0.08599);
            }else if (i==21){
                make.leading.equalTo(weakself.view).offset(screenWidth*0.56094);
                make.top.equalTo(weakself.view).offset(screenHeight*0.48248);
            }else if (i==22){
                make.leading.equalTo(weakself.view).offset(screenWidth*0.56094);
                make.top.equalTo(weakself.view).offset(screenHeight*0.60191);
            }else if (i==23){
                make.leading.equalTo(weakself.view).offset(screenWidth*0.56094);
                make.top.equalTo(weakself.view).offset(screenHeight*0.64331);
            }else if (i==24){
                make.leading.equalTo(weakself.view).offset(screenWidth*0.56094);
                make.top.equalTo(weakself.view).offset(screenHeight*0.68631);
            }else if (i==25){
                make.leading.equalTo(weakself.view).offset(screenWidth*0.56094);
                make.top.equalTo(weakself.view).offset(screenHeight*0.75478);
            }else if (i==26){
                make.leading.equalTo(weakself.view).offset(screenWidth*0.67988);
                make.top.equalTo(weakself.view).offset(screenHeight*0.18790);
            }else if (i==27){
                make.leading.equalTo(weakself.view).offset(screenWidth*0.72687);
                make.top.equalTo(weakself.view).offset(screenHeight*0.08599);
            }else if (i==28){
                make.leading.equalTo(weakself.view).offset(screenWidth*0.71953);
                make.top.equalTo(weakself.view).offset(screenHeight*0.48248);
            }else if (i==29){
                make.leading.equalTo(weakself.view).offset(screenWidth*0.71953);
                make.top.equalTo(weakself.view).offset(screenHeight*0.60191);
            }else if (i==30){
                make.leading.equalTo(weakself.view).offset(screenWidth*0.71953);
                make.top.equalTo(weakself.view).offset(screenHeight*0.64331);
            }else if (i==31){
                make.leading.equalTo(weakself.view).offset(screenWidth*0.71953);
                make.top.equalTo(weakself.view).offset(screenHeight*0.68631);
            }else if (i==32){
                make.leading.equalTo(weakself.view).offset(screenWidth*0.71953);
                make.top.equalTo(weakself.view).offset(screenHeight*0.75478);
            }
        }];
    }
}

-(void)viewWillAppear:(BOOL)animated{
    
    [super viewWillAppear:animated];
    
    self.navigationController.navigationBar.hidden=YES;
}

@end
