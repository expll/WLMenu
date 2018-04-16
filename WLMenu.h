//
//  WLMenu.h
//  WLMenu
//
//  Created by dachuiwang on 2018/4/11.
//  Copyright © 2018年 dachuiwang. All rights reserved.
//

#import <UIKit/UIKit.h>
#define Gray [UIColor colorWithRed:154/256.0 green:154/256.0 blue:154/256.0 alpha:1] //
#define Red [UIColor colorWithRed:171/256.0 green:36/256.0 blue:35/256.0 alpha:1] //


@protocol WLMenuDelegate <NSObject>


// 反馈
- (void)WLMenu_advise;// 咨询建议

// 缓存
- (void)WLMenu_download50;// 缓存50
- (void)WLMenu_download100;// 缓存100

// 设置
- (void)WLMenu_setting_lightWithValue:(CGFloat)value;// 亮度
- (void)WLMenu_setting_fontDec;// 字体减小
- (void)WLMenu_setting_fontAdd;// 字体增加
- (void)WLMenu_setting_fan;// 繁还是简
- (void)WLMenu_setting_T;// 字体
- (void)WLMenu_setting_spaceWithValue:(NSInteger)i;// space
- (void)WLMenu_setting_eye;// 护眼模式
- (void)WLMenu_setting_colorWithValue:(NSInteger)i;// 颜色设置
- (void)WLMenu_setting_more;// 更多设置


// 头部
- (void)WLMenu_header_refresh; //刷新
- (void)WLMenu_header_detail; //书籍详情
- (void)WLMenu_header_share; //分享


@end

@interface WLMenu : UIView

@property (nonatomic, assign)id delegate;

@property (nonatomic, strong)IBOutlet UIView *header;
@property (nonatomic, strong)IBOutlet UIView *footer;
@property (nonatomic, strong)IBOutlet UIButton *floatBtn;

///

@property (nonatomic, strong)IBOutlet UIView *darkBackground;

@property (nonatomic, strong)IBOutlet UISlider *slider;

@property (nonatomic, strong)IBOutlet UIButton *fontDec;
@property (nonatomic, strong)IBOutlet UIButton *fontAdd;
@property (nonatomic, strong)IBOutlet UIButton *fontFan;
@property (nonatomic, strong)IBOutlet UIButton *fontT;

@property (nonatomic, strong)IBOutlet UIButton *fontSpaceSmall;
@property (nonatomic, strong)IBOutlet UIButton *fontSpaceNormal;
@property (nonatomic, strong)IBOutlet UIButton *fontSpaceBig;
@property (nonatomic, strong)IBOutlet UIButton *fontEye;

@property (nonatomic, strong)IBOutlet UIButton *colorWhite;
@property (nonatomic, strong)IBOutlet UIButton *colorGray;
@property (nonatomic, strong)IBOutlet UIButton *colorGreen;
@property (nonatomic, strong)IBOutlet UIButton *colorYellow;
@property (nonatomic, strong)IBOutlet UIButton *colorPink;

@property (nonatomic, strong)IBOutlet UIImageView *colorWhiteCheck;
@property (nonatomic, strong)IBOutlet UIImageView *colorGrayCheck;
@property (nonatomic, strong)IBOutlet UIImageView *colorGreenCheck;
@property (nonatomic, strong)IBOutlet UIImageView *colorYellowCheck;
@property (nonatomic, strong)IBOutlet UIImageView *colorPinkCheck;

@property (nonatomic, strong)IBOutlet UIButton *more;



- (IBAction)clickBackground:(id)sender;

// 设置配置
- (void)setData:(NSDictionary *)dic;

@end
