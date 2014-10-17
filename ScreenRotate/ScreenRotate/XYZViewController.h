//
//  XYZViewController.h
//  ScreenRotate
//
//  Created by xtrong on 14-10-14.
//  Copyright (c) 2014年 SingleVP. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface XYZViewController : UIViewController

@property (nonatomic,strong) UIView *mainPortraitView;
@property (nonatomic,strong) UIView *mainLandscapeView;
@property (weak, nonatomic) IBOutlet UIButton *b1;
@property (weak, nonatomic) IBOutlet UILabel *label;
@property (weak, nonatomic) IBOutlet UIDatePicker *data_picker;
- (IBAction)onClick:(id)sender;

@end
