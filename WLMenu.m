//
//  WLMenu.m
//  WLMenu
//
//  Created by dachuiwang on 2018/4/11.
//  Copyright © 2018年 dachuiwang. All rights reserved.
//

#import "WLMenu.h"

@implementation WLMenu

- (IBAction)clickBackground:(id)sender {
    NSLog(@"menu!");
    
    
    
    if (self.header.center.y == 32) {
        // 影藏
        [UIView animateWithDuration:0.3 animations:^{
            self.header.center = CGPointMake(self.header.center.x, self.header.center.y-64);
            self.footer.center = CGPointMake(self.footer.center.x, self.footer.center.y+55);
            self.floatBtn.center = CGPointMake(self.floatBtn.center.x, self.floatBtn.center.y+164);
        }];
    } else {
        // 影藏
        [UIView animateWithDuration:0.3 animations:^{
            self.header.center = CGPointMake(self.header.center.x, self.header.center.y+64);
            self.footer.center = CGPointMake(self.footer.center.x, self.footer.center.y-55);
            self.floatBtn.center = CGPointMake(self.floatBtn.center.x, self.floatBtn.center.y-164);
        }];
    }
}

@end
