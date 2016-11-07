//
//  HomeViewController.h
//  Food Truth
//
//  Created by admin on 1/9/15.
//  Copyright (c) 2015 TaxSmart Technologies Pvt. Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HomeViewController : UIViewController

@property(strong,nonatomic)IBOutlet UIButton *springbtn;
@property(strong,nonatomic)IBOutlet UIButton *summerbtn;
@property(strong,nonatomic)IBOutlet UIButton *winterbtn;
@property(strong,nonatomic)IBOutlet UIButton *fallbtn;

@property(strong,nonatomic)IBOutlet UILabel *springlbl;
@property(strong,nonatomic)IBOutlet UILabel *summerlbl;
@property(strong,nonatomic)IBOutlet UILabel *winterlbl;
@property(strong,nonatomic)IBOutlet UILabel *falllbl;


@property(strong,nonatomic)IBOutlet UIImageView *imageView;

-(IBAction)springBtnpressed:(id)sender;
-(IBAction)fallBtnpressed:(id)sender;
-(IBAction)winterBtnpressed:(id)sender;
-(IBAction)summerBtnpressed:(id)sender;

-(void)springSeason;

@end
