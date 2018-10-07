//
//  twofiveoneView.m
//  shuiku
//
//  Created by 韩明静 on 2018/10/6.
//  Copyright © 2018年 韩明静. All rights reserved.
//

#import "twofiveoneView.h"

@implementation twofiveoneView

-(instancetype)initWithCoder:(NSCoder *)aDecoder{
    
    self=[super initWithCoder:aDecoder];
    
    if (self) {
        self.layer.masksToBounds=YES;
        self.layer.cornerRadius=10;
    }
    return self;
}


@end
