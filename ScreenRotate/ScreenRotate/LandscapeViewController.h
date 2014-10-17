//
//  LandscapeViewController.h
//  ScreenRotate
//
//  Created by xtrong on 14-10-15.
//  Copyright (c) 2014年 SingleVP. All rights reserved.
//
#import <UIKit/UIKit.h>

#ifndef ScreenRotate_LandscapeViewController_h
#define ScreenRotate_LandscapeViewController_h

@interface LandscapeViewController : UIViewController
<UIPickerViewDelegate, UIPickerViewDataSource>

@property (weak, nonatomic) IBOutlet UIButton *b1;
@property (weak, nonatomic) IBOutlet UIButton *b2;
@property (weak, nonatomic) IBOutlet UIButton *b3;
@property (weak, nonatomic) IBOutlet UIButton *b4;

@property (weak, nonatomic) IBOutlet UIPickerView *pickerView;
@property (weak, nonatomic) IBOutlet UILabel *label;

@property (nonatomic,strong) NSDictionary *pickerData;
@property (nonatomic,strong) NSArray *provincesData;
@property (nonatomic,strong) NSArray *citiesData;
- (IBAction)onClick:(id)sender;


@end

#endif
