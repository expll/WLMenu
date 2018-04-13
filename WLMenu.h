//
//  WLMenu.h
//  WLMenu
//
//  Created by dachuiwang on 2018/4/11.
//  Copyright © 2018年 dachuiwang. All rights reserved.
//

#import <UIKit/UIKit.h>
#define Gray [UIColor colorWithRed:154/256.0 green:154/256.0 blue:154/256.0 alpha:1] //

@interface WLMenu : UIView

@property (nonatomic, strong)IBOutlet UIView *header;
@property (nonatomic, strong)IBOutlet UIView *footer;
@property (nonatomic, strong)IBOutlet UIButton *floatBtn;

- (IBAction)clickBackground:(id)sender;

@end
