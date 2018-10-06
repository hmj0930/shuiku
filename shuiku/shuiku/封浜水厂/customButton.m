//
//  customButton.m
//  shuiku
//
//  Created by 韩明静 on 2018/10/5.
//  Copyright © 2018年 韩明静. All rights reserved.
//

#import "customButton.h"

@implementation customButton

-(CGRect)imageRectForContentRect:(CGRect)contentRect{
    
    return CGRectMake(10, 0, contentRect.size.width-20, contentRect.size.width-20);
}

-(CGRect)titleRectForContentRect:(CGRect)contentRect{
    
    return CGRectMake(0, contentRect.size.width-25, contentRect.size.width, 25);
}

@end
