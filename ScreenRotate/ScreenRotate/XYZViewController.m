//
//  XYZViewController.m
//  ScreenRotate
//
//  Created by xtrong on 14-10-14.
//  Copyright (c) 2014年 SingleVP. All rights reserved.
//

#import "XYZViewController.h"
#import "LandscapeViewController.h"
#define deg2rad (M_PI/180.0)

@interface XYZViewController ()

@property (nonatomic) LandscapeViewController *landscapeViewCon;


@property (nonatomic) BOOL isShowingLandscapeView;

@end

@implementation XYZViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.landscapeViewCon = [self.storyboard instantiateViewControllerWithIdentifier:@"LandscapeViewController"];
//    self.landscapeViewCon = [[UIStoryboard
//                                          storyboardWithName:@"LandscapeStoryboard"
//                                          bundle:NULL]
//                                          instantiateViewControllerWithIdentifier:@"LandscapeViewController"];
//    self.mainLandscapeView = self.landscapeViewCon.view;
//    self.mainPortraitView = self.view;


    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(handleRotationNotification:)
                                                 name:UIDeviceOrientationDidChangeNotification
                                               object:nil];



}

- (void)handleRotationNotification:(NSNotification *)notification
{
    NSLog(@"notification: %@", notification);

    UIDeviceOrientation currentDeviceOrientation = [UIDevice currentDevice].orientation;

    if (UIInterfaceOrientationIsLandscape(currentDeviceOrientation) && !self.isShowingLandscapeView) {
        //[self performSegueWithIdentifier:@"" sender:self];
        [self presentViewController:self.landscapeViewCon animated:YES completion:nil];
        self.isShowingLandscapeView = YES;
    } else if (UIInterfaceOrientationIsPortrait(currentDeviceOrientation) && self.isShowingLandscapeView){
        [self dismissViewControllerAnimated:YES completion:nil];
        self.isShowingLandscapeView = NO;
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(BOOL)shouldAutorotate{
    return YES;
}

-(NSUInteger)supportedInterfaceOrientations{
    return UIInterfaceOrientationMaskAllButUpsideDown;
}

//-(void)willAnimateRotationToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration{
//
//    if (toInterfaceOrientation == UIInterfaceOrientationLandscapeRight) {
//        self.view = self.mainLandscapeView;
//        self.view.transform=CGAffineTransformMakeRotation(deg2rad*(90));
//        self.view.bounds=CGRectMake(0.0, 0.0, 480.0, 320.0);
//    } else if ( toInterfaceOrientation == UIInterfaceOrientationLandscapeLeft ){
//        self.view = self.mainLandscapeView;
//        self.view.transform=CGAffineTransformMakeRotation(deg2rad*(-90));
//        self.view.bounds=CGRectMake(0.0, 0.0, 480.0, 320.0);
//    } else {
//        self.view = self.mainPortraitView;
//        self.view.transform=CGAffineTransformMakeRotation(deg2rad*(0));
//        self.view.bounds=CGRectMake(0.0, 0.0, 320.0, 480.0);
//
//    }
//    [super willRotateToInterfaceOrientation:toInterfaceOrientation duration:duration];
//}

- (IBAction)onClick:(id)sender {
    NSDate *theDate = self.data_picker.date;
    NSLog(@"the date picker is: %@",
          [theDate descriptionWithLocale:[NSLocale currentLocale]]);
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"YYYY-MM-dd HH:mm:ss"];
    NSLog(@"the date formate is: %@",[dateFormatter stringFromDate:theDate]);
    self.label.text = [dateFormatter stringFromDate:theDate];
}
@end
