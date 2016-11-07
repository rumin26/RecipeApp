//
//  HomeViewController.m
//  Food Truth
//
//  Created by admin on 1/9/15.
//  Copyright (c) 2015 TaxSmart Technologies Pvt. Ltd. All rights reserved.
//

#import "HomeViewController.h"

@interface HomeViewController ()

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    CGRect screenRect = [[UIScreen mainScreen]bounds];
    
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
    {
        self.springbtn.frame = CGRectMake(94, 315, 240, 240);
        self.summerbtn.frame = CGRectMake(430, 315, 240, 240);
        self.fallbtn.frame = CGRectMake(94, 625, 240, 240);
        self.winterbtn.frame = CGRectMake(430, 625, 240, 240);
        
        self.springlbl.frame = CGRectMake(110, 565, 200,35);
        self.summerlbl.frame = CGRectMake(454, 565, 200, 35);
        self.winterlbl.frame = CGRectMake(454, 880, 200, 35);
        self.falllbl.frame = CGRectMake(114, 880, 200, 35);
        
        self.springlbl.font = [UIFont fontWithName:@"Verdana" size:28.0];
        self.summerlbl.font = [UIFont fontWithName:@"Verdana" size:28.0];
        self.winterlbl.font = [UIFont fontWithName:@"Verdana" size:28.0];
        self.falllbl.font = [UIFont fontWithName:@"Verdana" size:28.0];

    }
    
    else if (screenRect.size.height == 480)
    {
        self.springbtn.frame = CGRectMake(24, 145, 120,120);
        self.summerbtn.frame = CGRectMake(177, 145, 120, 120);
        self.fallbtn.frame = CGRectMake(24, 305, 120, 120);
        self.winterbtn.frame = CGRectMake(177, 305, 120, 120);
        
        self.springlbl.frame = CGRectMake(34, 260, 100,29);
        self.summerlbl.frame = CGRectMake(189, 260, 100, 29);
        self.falllbl.frame = CGRectMake(34, 423, 100, 29);
        self.winterlbl.frame = CGRectMake(189, 423, 100, 29);
        
        

    }
    
    else if (screenRect.size.width == 375)
    {
        self.springbtn.frame = CGRectMake(44, 205, 120,120);
        self.summerbtn.frame = CGRectMake(207, 205, 120, 120);
        self.fallbtn.frame = CGRectMake(44, 375, 120, 120);
        self.winterbtn.frame = CGRectMake(207, 375, 120, 120);
        
        self.springlbl.frame = CGRectMake(54, 320, 100,29);
        self.summerlbl.frame = CGRectMake(219, 320, 100, 29);
        self.falllbl.frame = CGRectMake(54, 493, 100, 29);
        self.winterlbl.frame = CGRectMake(219, 493, 100, 29);

    }
    
    else if (screenRect.size.width == 414)
    {
        self.springbtn.frame = CGRectMake(48, 225, 120,120);
        self.summerbtn.frame = CGRectMake(247, 225, 120, 120);
        self.fallbtn.frame = CGRectMake(48, 405, 120, 120);
        self.winterbtn.frame = CGRectMake(247, 405, 120, 120);
        
        self.springlbl.frame = CGRectMake(56, 345, 100,29);
        self.summerlbl.frame = CGRectMake(259, 345, 100, 29);
        self.falllbl.frame = CGRectMake(56, 525, 100, 29);
        self.winterlbl.frame = CGRectMake(259, 525, 100, 29);

    }
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES];
    
        NSString *open = [[NSUserDefaults standardUserDefaults]valueForKey:@"fromview"];
    
    if ([open isEqualToString:@"openrecipe"]) {
        
        [self.imageView setBackgroundColor:[UIColor blackColor]];
        [self.imageView setImage:nil];
        
        
        [self performSegueWithIdentifier:@"openrecipe" sender:nil];
        self.springbtn.alpha = 0;
        self.summerbtn.alpha = 0;
        self.winterbtn.alpha = 0;
        self.fallbtn.alpha = 0;

        self.springlbl.alpha = 0;
        self.summerlbl.alpha = 0;
        self.winterlbl.alpha = 0;
        self.falllbl.alpha = 0;
    }
    
    else
    {
        
        if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
        {
            [self.imageView setImage:[UIImage imageNamed:@"Homepage_ipad.jpg"]];

        }
        
        else
        {
            
            [self.imageView setImage:[UIImage imageNamed:@"HomePage.jpg"]];
        
        }
        
        self.springbtn.alpha = 0;
        self.summerbtn.alpha = 0;
        self.winterbtn.alpha = 0;
        self.fallbtn.alpha = 0;
        
        self.springlbl.alpha = 1;
        self.summerlbl.alpha = 1;
        self.winterlbl.alpha = 1;
        self.falllbl.alpha = 1;

        
        [UIView animateWithDuration:0.6 animations:^{
            [self.springbtn setImage:[UIImage imageNamed:@"springHome.png"] forState:UIControlStateNormal];
            
            self.springbtn.alpha = 1;
        }];
        [UIView animateWithDuration:0.8 animations:^{
            [self.summerbtn setImage:[UIImage imageNamed:@"summerHome.png"] forState:UIControlStateNormal];
            
            self.summerbtn.alpha = 1;
        }];
        
        [UIView animateWithDuration:1.0 animations:^{
            [self.winterbtn setImage:[UIImage imageNamed:@"winterHome.png"] forState:UIControlStateNormal];
            
            self.winterbtn.alpha = 1;
        }];
        
        [UIView animateWithDuration:1.2 animations:^{
            [self.fallbtn setImage:[UIImage imageNamed:@"fallHome.png"] forState:UIControlStateNormal];
            
            self.fallbtn.alpha = 1;
        }];

    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(IBAction)springBtnpressed:(id)sender
{
    [[NSUserDefaults standardUserDefaults]setValue:@"spring" forKey:@"recipe"];
    [self performSegueWithIdentifier:@"openrecipe" sender:nil];
    
    
}
-(IBAction)fallBtnpressed:(id)sender
{
    [[NSUserDefaults standardUserDefaults]setValue:@"fall" forKey:@"recipe"];
    [self performSegueWithIdentifier:@"openrecipe" sender:nil];

}
-(IBAction)winterBtnpressed:(id)sender
{
    [[NSUserDefaults standardUserDefaults]setValue:@"winter" forKey:@"recipe"];
    [self performSegueWithIdentifier:@"openrecipe" sender:nil];

}
-(IBAction)summerBtnpressed:(id)sender
{
    [[NSUserDefaults standardUserDefaults]setValue:@"summer" forKey:@"recipe"];
    [self performSegueWithIdentifier:@"openrecipe" sender:nil];

}

-(void)springSeason
{
    [self performSegueWithIdentifier:@"openrecipe" sender:nil];

}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
