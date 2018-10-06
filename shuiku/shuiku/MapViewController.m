//
//  MapViewController.m
//  shuiku
//
//  Created by 韩明静 on 2018/9/27.
//  Copyright © 2018年 韩明静. All rights reserved.
//

#import "MapViewController.h"
#import <BMKLocationKit/BMKLocationComponent.h>
#import "fengbangViewController.h"

@interface MapViewController ()<BMKMapViewDelegate,BMKLocationManagerDelegate,UITableViewDelegate,UITableViewDataSource>

@property(nonatomic,strong)BMKMapView *mapview;

@property(nonatomic,strong)BMKLocationManager *locationManager;

@property(nonatomic,strong)BMKUserLocation *userlocation;

@property(nonatomic,strong)UIView *bgview;

@property(nonatomic,strong)UIImageView *searchimageview;

@property(nonatomic,strong)UIButton *searchbutton;

@property(nonatomic,strong)UITableView *tableview;

@property(nonatomic,strong)NSArray *titlesArr;

@property(nonatomic,strong)UILabel *tiplabel;

@end

@implementation MapViewController

-(UILabel *)tiplabel{
    
    if (_tiplabel==nil) {
        _tiplabel=[UILabel new];
        _tiplabel.textColor=[UIColor blueColor];
        _tiplabel.text=@"注：点击图标进入商品";
        _tiplabel.font=[UIFont systemFontOfSize:15];
    }
    return _tiplabel;
}

-(NSArray *)titlesArr{
    
    if (_titlesArr==nil) {
        _titlesArr=@[@"封浜水厂",@"凯波电缆",@"任强机械",@"黄渡水厂",@"新艺纺织",@"行政管理学院",@"华庄村村民之家",@"嘉定轨道交通",@"欣帕陶瓷厂",@"嘉定客运站一期"];
    }
    return _titlesArr;
}

-(UITableView *)tableview{
    
    if (_tableview==nil) {
        _tableview=[UITableView new];
        _tableview.delegate=self;
        _tableview.dataSource=self;
        _tableview.separatorStyle=UITableViewCellSeparatorStyleNone;
    }
    return _tableview;
}

-(UIView *)bgview{
    
    if (_bgview==nil) {
        _bgview=[UIView new];
        _bgview.backgroundColor=[UIColor colorWithRed:234/255.0 green:234/255.0 blue:234/255.0 alpha:1];
        _bgview.layer.cornerRadius=24;
        _bgview.layer.masksToBounds=YES;
        
        self.searchimageview=[[UIImageView alloc]init];
        self.searchimageview.image=[UIImage imageNamed:@"sou"];
        self.searchimageview.contentMode=UIViewContentModeScaleAspectFit;
        [_bgview addSubview:self.searchimageview];
        [self.searchimageview mas_makeConstraints:^(MASConstraintMaker *make) {
            make.leading.equalTo(_bgview).offset(15);
            make.centerY.equalTo(_bgview);
            make.width.height.equalTo(@30);
        }];
        
        self.searchbutton=[UIButton buttonWithType:UIButtonTypeCustom];
        [self.searchbutton setTitle:@"选择企业" forState:UIControlStateNormal];
        [self.searchbutton setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        [self.searchbutton addTarget:self action:@selector(searchbuttonaction) forControlEvents:UIControlEventTouchUpInside];
        [_bgview addSubview:self.searchbutton];
        [self.searchbutton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(self.bgview);
            make.centerX.equalTo(self.bgview);
            make.leading.equalTo(self.searchimageview);
        }];
    }
    return _bgview;
}

-(void)searchbuttonaction{
    
    
}

-(void)viewWillAppear:(BOOL)animated{
    
    [super viewWillAppear:animated];
    
    self.navigationController.navigationBar.hidden=YES;
    
    [self.mapview viewWillAppear];
    self.mapview.delegate=self;
}

-(void)viewWillDisappear:(BOOL)animated{
    
    [super viewWillDisappear:animated];
    
    [self.mapview viewWillDisappear];
    self.mapview.delegate=nil;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor=[UIColor whiteColor];
    
    __weak typeof(self) weakself=self;
    [self.view addSubview:self.bgview];
    [self.bgview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(weakself.view);
        make.height.equalTo(@48);
        make.top.equalTo(weakself.view).offset(5);
        make.width.equalTo(@(screenWidth/3.0));
    }];
    
    self.mapview=[[BMKMapView alloc]initWithFrame:CGRectMake(0, 58, screenWidth, screenHeight-58)];
    self.mapview.showsUserLocation=YES;
    self.mapview.zoomLevel=15;
    [self.view addSubview:self.mapview];
    
    [self.view addSubview:self.tableview];
    [self.tableview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakself.bgview.mas_bottom).offset(5);
        make.centerX.equalTo(weakself.view);
        make.leading.equalTo(weakself.bgview).offset(38);
        CGFloat tabheight=(screenHeight-58)>300?300:(screenHeight-58);
        make.height.equalTo(@(tabheight));
    }];
    
    [self.view addSubview:self.tiplabel];
    [self.tiplabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.trailing.equalTo(weakself.view).offset(-50);
        make.bottom.equalTo(weakself.view).offset(-30);
    }];
    
    self.locationManager=[[BMKLocationManager alloc]init];
    self.locationManager.delegate=self;
    self.locationManager.coordinateType=BMKLocationCoordinateTypeBMK09LL;
    self.locationManager.desiredAccuracy=kCLLocationAccuracyHundredMeters;
    [self.locationManager requestLocationWithReGeocode:YES withNetworkState:YES completionBlock:^(BMKLocation * _Nullable location, BMKLocationNetworkState state, NSError * _Nullable error) {
        
        if (error) {
            return ;
        }
        
        if (!location) {
            return;
        }
        
        if (!self.userlocation) {
            self.userlocation=[[BMKUserLocation alloc]init];
        }
        self.userlocation.location=location.location;
        [self.mapview updateLocationData:self.userlocation];
        
        [self.mapview setCenterCoordinate:location.location.coordinate animated:YES];
    }];

}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 10;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *cellid=@"cell";
    
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:cellid];
    
    if (cell==nil) {
        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellid];
        cell.contentView.layer.borderColor=[UIColor colorWithRed:234/255.0 green:234/255.0 blue:234/255.0 alpha:1].CGColor;
        cell.contentView.layer.borderWidth=2;
        cell.selectionStyle=UITableViewCellSelectionStyleNone;
    }
    cell.textLabel.text=self.titlesArr[indexPath.row];
    
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 30;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.row==0) {
        
        [self.navigationController pushViewController:[fengbangViewController new] animated:YES];
    }
}


@end
