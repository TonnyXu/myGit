//
//  LandscapeViewController.m
//  ScreenRotate
//
//  Created by xtrong on 14-10-15.
//  Copyright (c) 2014年 SingleVP. All rights reserved.
//

#import "LandscapeViewController.h"


@implementation LandscapeViewController

/*
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
 */


///*
- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    self.pickerView.dataSource = self;
    self.pickerView.delegate = self;
    NSBundle *bundle = [NSBundle mainBundle];
    NSString *plistPath = [bundle pathForResource:@"provinces_cities"
                                           ofType:@"plist"];
    
    NSDictionary *dict = [[NSDictionary alloc] initWithContentsOfFile:plistPath];
    self.pickerData = dict;
    
    self.provincesData = [self.pickerData allKeys];
    
    NSString *selectedProvince = [self.provincesData objectAtIndex:0];
    self.citiesData = [self.pickerData objectForKey:selectedProvince];
}

#pragma mark
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 2;
}
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    if (component == 0){
        return [self.provincesData count];
    } else{
        return [self.citiesData count];
    }
    
}

#pragma mark
- (NSString*) pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    if (component == 0) {
        return [self.provincesData objectAtIndex:row];
    } else{
        return [self.citiesData objectAtIndex:row];
    }
}
- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    if (component == 0) {
        NSString *selectedProvince = [self.provincesData objectAtIndex:row];
        NSArray *array = [self.pickerData objectForKey:selectedProvince];
        self.citiesData = array;
        [self.pickerView reloadComponent:1];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (IBAction)onClick:(id)sender {
    NSInteger row1 = [self.pickerView selectedRowInComponent:0];
    NSInteger row2 = [self.pickerView selectedRowInComponent:1];
    NSString *selected1 = [self.provincesData objectAtIndex:row1];
    NSString *selected2 = [self.citiesData objectAtIndex:row2];
    NSString *title = [[NSString alloc] initWithFormat:@"%@,%@市",selected1,selected2];
    self.label.text = title;
}
//*/

@end
