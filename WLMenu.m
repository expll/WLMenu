//
//  WLMenu.m
//  WLMenu
//
//  Created by dachuiwang on 2018/4/11.
//  Copyright © 2018年 dachuiwang. All rights reserved.
//

#import "WLMenu.h"
#import "UIImage+RTTint.h"

@implementation WLMenu


- (void)layoutSubviews {
    [super layoutSubviews];
    
    UIView *bg = self.fontFan.superview;
    bg.frame = self.darkBackground.frame;

    for (UIView *view in [bg subviews]) {
        [self reSetFrame:view];
    }
    
}

- (void)reSetFrame:(UIView *)view {
    CGFloat delta = [UIScreen mainScreen].bounds.size.width/375.0;
    
    CGRect frame = view.frame;
    CGRect newFrame = CGRectMake(frame.origin.x*delta, frame.origin.y*delta, frame.size.width * delta, frame.size.height * delta);
    view.frame = newFrame;
    
    if (view.tag >= 200) {
        view.layer.cornerRadius = 22*delta;
    }
}

- (IBAction)setting:(id)sender {
    self.darkBackground.hidden = !self.darkBackground.hidden;
    [[self viewWithTag:100] setHidden:![[self viewWithTag:100] isHidden]];
}
- (IBAction)setting2:(id)sender {
    [self setting:sender];
}

// 设置配置
- (void)setData:(NSDictionary *)dic1 {
    
    NSDictionary *dic = dic1;
    if (dic == nil) {
        dic = @{@"brightness":@(0.67),
                @"lineSpacing":@(2),
                @"eye":@(1),
                @"color":@(2)};
    }
    
    CGFloat brightness = [dic[@"brightness"] floatValue];
    NSInteger lineSpacing = [dic[@"lineSpacing"] integerValue];
    NSInteger eye = [dic[@"eye"] integerValue];
    NSInteger color = [dic[@"color"] integerValue];
    
    
    self.slider.value = brightness;

    
    [self.fontSpaceSmall setImage:[UIImage imageNamed:@"setting_space_small"] forState:UIControlStateNormal];
    [self.fontSpaceNormal setImage:[UIImage imageNamed:@"setting_space_normal"] forState:UIControlStateNormal];
    [self.fontSpaceBig setImage:[UIImage imageNamed:@"setting_space_big"] forState:UIControlStateNormal];
    
    if (lineSpacing == 0) {
        [self.fontSpaceSmall setImage:[UIImage imageNamed:@"setting_space_small_selected"] forState:UIControlStateNormal];
    } else if (lineSpacing == 1) {
        [self.fontSpaceNormal setImage:[UIImage imageNamed:@"setting_space_normal_selected"] forState:UIControlStateNormal];
    } else if (lineSpacing == 2) {
        [self.fontSpaceBig setImage:[UIImage imageNamed:@"setting_space_big_selected"] forState:UIControlStateNormal];
    }
    
    if (eye == 0) {
        UIImage *image = [UIImage imageNamed:@"setting_eye"];
        UIImage *tinted = image;
        [self.fontEye setImage:tinted forState:UIControlStateNormal];
    } else {
        UIImage *image = [UIImage imageNamed:@"setting_eye"];
        UIImage *tinted = [image rt_tintedImageWithColor:Red];
        [self.fontEye setImage:tinted forState:UIControlStateNormal];
    }
    
    
    self.colorWhiteCheck.hidden = YES;
    self.colorGrayCheck.hidden = YES;
    self.colorGreenCheck.hidden = YES;
    self.colorYellowCheck.hidden = YES;
    self.colorPinkCheck.hidden = YES;
    
    if (color == 0) {
        self.colorWhiteCheck.hidden = NO;
    } else if (color == 1) {
        self.colorGrayCheck.hidden = NO;
    } else if (color == 2) {
        self.colorGreenCheck.hidden = NO;
    } else if (color == 3) {
        self.colorYellowCheck.hidden = NO;
    } else if (color == 4) {
        self.colorPinkCheck.hidden = NO;
    }
    
}

- (IBAction)clickBackground:(id)sender {
    NSLog(@"menu!");
    
    // dsfasdf
    
    if (self.header.center.y == 32) {
        // 影藏
        [UIView animateWithDuration:0.3 animations:^{
            self.header.center = CGPointMake(self.header.center.x, self.header.center.y-64);
            self.footer.center = CGPointMake(self.footer.center.x, self.footer.center.y+55);
            self.floatBtn.center = CGPointMake(self.floatBtn.center.x, self.floatBtn.center.y+130);
            [[self viewWithTag:100] setHidden:YES];
            self.darkBackground.hidden = YES;
            [[UIApplication sharedApplication] setStatusBarHidden:YES animated:YES];
            
        } completion:^(BOOL finished) {
            self.hidden = YES;
            
        }];
    } else {
        // 显示
        [UIView animateWithDuration:0.3 animations:^{
            self.header.center = CGPointMake(self.header.center.x, self.header.center.y+64);
            self.footer.center = CGPointMake(self.footer.center.x, self.footer.center.y-55);
            self.floatBtn.center = CGPointMake(self.floatBtn.center.x, self.floatBtn.center.y-130);
            [[self viewWithTag:100] setHidden:YES];
            self.darkBackground.hidden = YES;
            [[UIApplication sharedApplication] setStatusBarHidden:NO animated:YES];
            [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
            
        } completion:^(BOOL finished) {
            
        }];
        
        
    }
}


- (IBAction)clickAlertBackground:(id)sender {
    UIView *bg = (UIView *)sender;
    bg.hidden = YES;
    UIView *v102 = [self viewWithTag:102]; // 书籍报错
    UIView *v103 = [self viewWithTag:103];
    v102.hidden = YES;
    v103.hidden = YES;
    
}

- (IBAction)feedback:(id)sender {
    [self callback_advise:nil];
    
}
- (IBAction)feedback2:(id)sender {
    [self feedback:sender];
}


- (IBAction)bookerror:(id)sender {
    UIView *v103 = [self viewWithTag:103];
    v103.hidden = NO;
}


- (IBAction)callback_advise:(id)sender {
    if (self.delegate && [self.delegate respondsToSelector:@selector(WLMenu_advise)]) {
        [self.delegate WLMenu_advise];
    }
}




- (IBAction)download:(id)sender {
    if (self.delegate && [self.delegate respondsToSelector:@selector(WLMenu_download)]) {
        [self.delegate WLMenu_download];
    }
    
//    UIAlertController *alert = [UIAlertController alertControllerWithTitle:nil message:@"缓存多少章节？" preferredStyle:UIAlertControllerStyleActionSheet];
//    UIAlertAction *action = [UIAlertAction actionWithTitle:@"缓存50章" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
//        if (self.delegate && [self.delegate respondsToSelector:@selector(WLMenu_download50)]) {
//            [self.delegate WLMenu_download50];
//        }
//    }];
//    
//    UIAlertAction *action2 = [UIAlertAction actionWithTitle:@"缓存100章" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
//        if (self.delegate && [self.delegate respondsToSelector:@selector(WLMenu_download100)]) {
//            [self.delegate WLMenu_download100];
//        }
//    }];
//    
//    UIAlertAction *action3 = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
//        
//    }];
//    
//    [alert addAction:action];
//    [alert addAction:action2];
//    [alert addAction:action3];
//    
//    [[[[UIApplication sharedApplication] delegate] window].rootViewController presentViewController:alert animated:YES completion:nil];
    
                                
}

- (IBAction)download2:(id)sender {
    [self download:sender];
}

- (IBAction)night:(id)sender {
    if (self.delegate && [self.delegate respondsToSelector:@selector(WLMenu_night)]) {
        [self.delegate WLMenu_night];
    }
}

- (IBAction)chapters:(id)sender {
    if (self.delegate && [self.delegate respondsToSelector:@selector(WLMenu_chapters)]) {
        [self.delegate WLMenu_chapters];
    }


- (IBAction)callback_sliderChanged:(id)sender {
    UISlider *slider = (UISlider *)sender;
    CGFloat value = slider.value;
    if (self.delegate && [self.delegate respondsToSelector:@selector(WLMenu_setting_lightWithValue:)]) {
        [self.delegate WLMenu_setting_lightWithValue:value];
    }
}

- (IBAction)callback_fontDec {
    if (self.delegate && [self.delegate respondsToSelector:@selector(WLMenu_setting_fontDec)]) {
        [self.delegate WLMenu_setting_fontDec];
    }
}

- (IBAction)callback_fontAdd{
    if (self.delegate && [self.delegate respondsToSelector:@selector(WLMenu_setting_fontAdd)]) {
        [self.delegate WLMenu_setting_fontAdd];
    }
}

- (IBAction)callback_jian {
    if (self.delegate && [self.delegate respondsToSelector:@selector(WLMenu_setting_fan)]) {
        [self.delegate WLMenu_setting_fan];
    }
}

- (IBAction)callback_T {
    if (self.delegate && [self.delegate respondsToSelector:@selector(WLMenu_setting_T)]) {
        [self.delegate WLMenu_setting_T];
    }
}

- (IBAction)callback_space_small {
    if (self.delegate && [self.delegate respondsToSelector:@selector(WLMenu_setting_spaceWithValue:)]) {
        [self.delegate WLMenu_setting_spaceWithValue:0];
    }
}

- (IBAction)callback_space_normal {
    if (self.delegate && [self.delegate respondsToSelector:@selector(WLMenu_setting_spaceWithValue:)]) {
        [self.delegate WLMenu_setting_spaceWithValue:1];
    }
}

- (IBAction)callback_space_big {
    if (self.delegate && [self.delegate respondsToSelector:@selector(WLMenu_setting_spaceWithValue:)]) {
        [self.delegate WLMenu_setting_spaceWithValue:2];
    }
}

- (IBAction)callback_eye {
    if (self.delegate && [self.delegate respondsToSelector:@selector(WLMenu_setting_eye)]) {
        [self.delegate WLMenu_setting_eye];
    }
}

- (IBAction)callback_color:(id)sender {
    UIView *view = (UIView *)sender;
    NSInteger tag = view.tag;
    
    if (self.delegate && [self.delegate respondsToSelector:@selector(WLMenu_setting_colorWithValue:)]) {
        [self.delegate WLMenu_setting_colorWithValue:tag-200];
    }
}

- (IBAction)callback_more {
    if (self.delegate && [self.delegate respondsToSelector:@selector(WLMenu_setting_more)]) {
        [self.delegate WLMenu_setting_more];
    }
}


- (IBAction)callback_refresh {
    if (self.delegate && [self.delegate respondsToSelector:@selector(WLMenu_header_refresh)]) {
        [self.delegate WLMenu_header_refresh];
    }
}


- (IBAction)callback_detail {
    if (self.delegate && [self.delegate respondsToSelector:@selector(WLMenu_header_detail)]) {
        [self.delegate WLMenu_header_detail];
    }
}


- (IBAction)callback_share {
    if (self.delegate && [self.delegate respondsToSelector:@selector(WLMenu_header_share)]) {
        [self.delegate WLMenu_header_share];
    }
}



@end
