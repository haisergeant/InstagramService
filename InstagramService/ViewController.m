//
//  ViewController.m
//  InstagramService
//
//  Created by Le Thanh Hai on 4/4/16.
//  Copyright © 2016 goappable. All rights reserved.
//

#import "ViewController.h"
#import <UIImageView+WebCache.h>

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIView *userInfoView;
@property (weak, nonatomic) IBOutlet UIImageView *avatarImgView;
@property (weak, nonatomic) IBOutlet UILabel *instaIdLbl;
@property (weak, nonatomic) IBOutlet UILabel *fullNameLbl;
@property (weak, nonatomic) IBOutlet UILabel *aboutLbl;



- (IBAction)loginWithInstagramBtnTapped:(id)sender;

@end

@implementation ViewController
@synthesize userInfoView;
@synthesize avatarImgView;
@synthesize instaIdLbl;
@synthesize fullNameLbl;
@synthesize aboutLbl;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    userInfoView.hidden = YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqual:@"toInstagramAuthenticateScreen"]) {
        InstagramAuthenticateViewController *controller = segue.destinationViewController;
        controller.delegate = self;
    }
}

#pragma mark - IBAction on view
- (IBAction)loginWithInstagramBtnTapped:(id)sender {
    
}

#pragma mark - InstagramAuthenticateViewControllerDelegate
- (void)didRequestUserInformationSuccess:(InstagramAuthenticateViewController *)controller
                            withResponse:(NSString *)response {
    [self dismissViewControllerAnimated:YES completion:^{
        NSDictionary *dict = (NSDictionary*) response;
        NSDictionary *userData = [dict objectForKey:@"data"];
        
        NSString *name = [userData objectForKey:@"full_name"];
        NSString *instagramId = [userData objectForKey:@"id"];
        NSString *bio = [userData objectForKey:@"bio"];
        NSString *avatar = [userData objectForKey:@"profile_picture"];
        
        userInfoView.hidden = NO;
        [avatarImgView sd_setImageWithURL:[NSURL URLWithString:avatar]];
        instaIdLbl.text = instagramId;
        fullNameLbl.text = name;
        aboutLbl.text = bio;
    }];
}

- (void)didRequestUserInformationFail:(InstagramAuthenticateViewController *)controller
                            withError:(NSString *)error {
    [self dismissViewControllerAnimated:YES completion:^{
        
    }];
}


@end
