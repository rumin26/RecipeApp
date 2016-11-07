//
//  PageContentViewController.m
//  Food Truth
//
//  Created by admin on 1/9/15.
//  Copyright (c) 2015 TaxSmart Technologies Pvt. Ltd. All rights reserved.
//

#import "PageContentViewController.h"
#import "RecipeViewController.h"


@interface PageContentViewController ()

@end

@implementation PageContentViewController

-(void)databaseOpen

{
    NSArray *paths=NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory=[paths objectAtIndex:0];
    NSString *myDBnew=[documentsDirectory stringByAppendingPathComponent:@"foodtruth_db.sqlite"];
    
    database =[[Sqlite alloc]init];
    [database open:myDBnew];
    NSLog(@"Database opened");
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.recipeImageView.backgroundColor = [UIColor blackColor];
    
    
    self.recipeImageView.image = [UIImage imageNamed:self.imageFile];
        UIScreen *screen = [UIScreen mainScreen];
    if(screen.bounds.size.height == 480)
    {
        self.Footerview.frame = CGRectMake(0, 260, screen.bounds.size.width, screen.bounds.size.height-68);
         NSLog(@"height:%f",self.Footerview.frame.size.height);
    }
    
    else if (screen.bounds.size.height ==568)
    {
        self.Footerview.frame = CGRectMake(0, 346, screen.bounds.size.width, screen.bounds.size.height-68);
         NSLog(@"height:%f",self.Footerview.frame.size.height);
    }
    else if (screen.bounds.size.width == 375)
    {
        self.Footerview.frame = CGRectMake(0, 450, screen.bounds.size.width, screen.bounds.size.height-68);
        NSLog(@"height:%f",self.Footerview.frame.size.height);
        
    }
    
    else if (screen.bounds.size.width ==414)
    {
        self.Footerview.frame = CGRectMake(0, 520, screen.bounds.size.width, screen.bounds.size.height-68);
       // NSLog(@"height:%f",self.Footerview.frame.size.height);

    }
    
   else if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
    {
        self.Footerview.frame = CGRectMake(0, 760, screen.bounds.size.width, screen.bounds.size.height-68);
        //self.cinchbtn.backgroundColor = [UIColor blueColor];
        self.lbl1.frame = CGRectMake(0, 30, screen.bounds.size.width, 45);
        self.lbl1.font = [UIFont fontWithName:@"Verdana-Bold" size:38.0f];
        
        self.lbl2.frame = CGRectMake(0, 72, screen.bounds.size.width, 42);
        self.lbl2.font = [UIFont fontWithName:@"Verdana-Bold" size:28.0f];
        
        self.cinchbtn.frame = CGRectMake(65, 30, 100, 100);
        self.simplebtn.frame = CGRectMake(320, 30, 100, 100);
        self.sensationalbtn.frame = CGRectMake(590, 30, 100, 100);

        self.keylineImageView1.frame = CGRectMake(230, 20, 1, 110);
        self.keylineImageView2.frame = CGRectMake(500, 20, 1, 110);

        //NSLog(@"height:%f",self.Footerview.frame.size.height);

    }
    
}

-(void)viewWillAppear:(BOOL)animated
{
    
    
    [super viewWillAppear:animated];
    
    UITapGestureRecognizer *inAppPurchaseViewTap =
    [[UITapGestureRecognizer alloc] initWithTarget:self
                                            action:@selector(handleSingleTap)];
    [self.view addGestureRecognizer:inAppPurchaseViewTap];
    
    
     UIScreen *screen = [UIScreen mainScreen];
    self.cinchbtn.alpha = 0;
    self.simplebtn.alpha = 0;
    self.sensationalbtn.alpha = 0;
    
    [UIView animateWithDuration:1.0 animations:^{
        [self.cinchbtn setImage:[UIImage imageNamed:@"cinch.png"] forState:UIControlStateNormal];
        
        self.cinchbtn.alpha = 1;
    }];
    [UIView animateWithDuration:1.4 animations:^{
        [self.simplebtn setImage:[UIImage imageNamed:@"simple.png"] forState:UIControlStateNormal];
        
        self.simplebtn.alpha = 1;
    }];
    
    [UIView animateWithDuration:1.8 animations:^{
        [self.sensationalbtn setImage:[UIImage imageNamed:@"sensational.png"] forState:UIControlStateNormal];
        
        self.sensationalbtn.alpha = 1;
    }];
    
    NSLog(@"%@",self.imageFile);
    NSLog(@"%d",self.pageIndex);
    
    NSString *season = [[NSUserDefaults standardUserDefaults]valueForKey:@"recipe"];
    NSString *inapp = [[NSUserDefaults standardUserDefaults]valueForKey:@"inApp"];
    //NSString *inapp1 = [[NSUserDefaults standardUserDefaults]valueForKey:@"inAppSummer"];
    
    if(![inapp isEqualToString:@"recipePurhcased"])
    {
        
        if([season isEqualToString:@"spring"])
        {
            if([self.imageFile isEqualToString: @"Asparagus.jpg"])
            {
                self.inappImageView.hidden = YES;
            
            }
            else if([self.imageFile isEqualToString: @"Broccoli.jpg"])
            {
                self.inappImageView.hidden = YES;
            }
        
            else if([self.imageFile isEqualToString: @"Crab.jpg"])
            {
                self.inappImageView.hidden = YES;
            }
            else  if([self.imageFile isEqualToString: @"Egg.jpg"])
            {
                self.inappImageView.hidden = YES;
            }
            else if([self.imageFile isEqualToString: @"Currant.jpg"])
            {
                self.inappImageView.hidden = YES;
            }
            else
            {
                
                self.cinchbtn.alpha = 0;
                self.simplebtn.alpha = 0;
                self.sensationalbtn.alpha = 0;
                self.footerImageview.hidden = YES;
                self.inappImageView.alpha = 0;
                self.keylineImageView1.hidden = YES;
                self.keylineImageView2.hidden = YES;
                
                
                [UIView animateWithDuration:1.8 animations:^{
                    self.inappImageView.alpha = 1;
                   

                    if (screen.bounds.size.width == 375)
                    {
                        self.inappImageView.hidden = NO;
                        
                        
                    }
                    else if (screen.bounds.size.width ==414)
                    {
                       self.inappImageView.hidden = NO;
                        
                    }
                    else if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
                    {
                        
                       self.inappImageView.hidden = NO;
                        
                    }
                    else
                    {
                       self.inappImageView.hidden = NO;
                    }
                }];

                
            }

        }
        
        else if ([season isEqualToString:@"summer"])
        {
            if([self.imageFile isEqualToString: @"Apricots.jpg"])
            {
                self.inappImageView.hidden = YES;
            }
            
            else if([self.imageFile isEqualToString: @"Arugula.jpg"])
            {
                self.inappImageView.hidden = YES;
                
            }
            
            else if([self.imageFile isEqualToString: @"Bell-Pepper.jpg"])
            {
                self.inappImageView.hidden = YES;
            }
            else  if([self.imageFile isEqualToString: @"Avocado.jpg"])
            {
                self.inappImageView.hidden = YES;
            }
            else if([self.imageFile isEqualToString: @"Almond.jpg"])
            {
                self.inappImageView.hidden = YES;
            }
            
            else
            {
                
                self.cinchbtn.alpha = 0;
                self.simplebtn.alpha = 0;
                self.sensationalbtn.alpha = 0;
                self.footerImageview.hidden = YES;
                self.inappImageView.alpha = 0;
                self.keylineImageView1.hidden = YES;
                self.keylineImageView2.hidden = YES;
                
                
                [UIView animateWithDuration:1.8 animations:^{
                    self.inappImageView.alpha = 1;
                    
                    if (screen.bounds.size.width == 375)
                    {
                        self.inappImageView.hidden = NO;
                        
                        
                    }
                    else if (screen.bounds.size.width ==414)
                    {
                        self.inappImageView.hidden = NO;
                        
                    }
                    else if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
                    {
                        
                        self.inappImageView.hidden = NO;
                        
                    }
                    else
                    {
                        self.inappImageView.hidden = NO;
                    }
                }];

                
            }

        }
        
        else if ([season isEqualToString:@"fall"])
            
        {
            if([self.imageFile isEqualToString: @"Apple.jpg"])
            {
                self.inappImageView.hidden = YES;
            }
            
            else if([self.imageFile isEqualToString: @"Beet.jpg"])
            {
                self.inappImageView.hidden = YES;
                
            }
            
            else if([self.imageFile isEqualToString: @"Brussels.jpg"])
            {
                self.inappImageView.hidden = YES;
            }
            else  if([self.imageFile isEqualToString: @"Cabbage.jpg"])
            {
                self.inappImageView.hidden = YES;
            }
            else if([self.imageFile isEqualToString: @"Carrot.jpg"])
            {
                self.inappImageView.hidden = YES;
            }
            else
            {
                
                self.cinchbtn.alpha = 0;
                self.simplebtn.alpha = 0;
                self.sensationalbtn.alpha = 0;
                self.footerImageview.hidden = YES;
                self.inappImageView.alpha = 0;
                self.keylineImageView1.hidden = YES;
                self.keylineImageView2.hidden = YES;
                
                
                [UIView animateWithDuration:1.8 animations:^{
                    self.inappImageView.alpha = 1;
                    
                    if (screen.bounds.size.width == 375)
                    {
                        self.inappImageView.hidden = NO;
                        
                        
                    }
                    else if (screen.bounds.size.width ==414)
                    {
                        self.inappImageView.hidden = NO;
                        
                    }
                    else if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
                    {
                        
                        self.inappImageView.hidden = NO;
                        
                    }
                    else
                    {
                        self.inappImageView.hidden = NO;
                    }
                }];

                
            }

        }
        
        else if ([season isEqualToString:@"winter"])
            
        {
            if([self.imageFile isEqualToString: @"Banana.jpg"])
            {
                self.inappImageView.hidden = YES;
            }
            
           else if([self.imageFile isEqualToString: @"Beef.jpg"])
            {
                self.inappImageView.hidden = YES;
                
            }
            
            else if([self.imageFile isEqualToString: @"Celeriac.jpg"])
            {
                self.inappImageView.hidden = YES;
            }
            else if([self.imageFile isEqualToString: @"Chocolate.jpg"])
            {
                self.inappImageView.hidden = YES;
            }
            else if([self.imageFile isEqualToString: @"Cinnamon.jpg"])
            {
                self.inappImageView.hidden = YES;
            }
            else
            {
                
                self.cinchbtn.alpha = 0;
                self.simplebtn.alpha = 0;
                self.sensationalbtn.alpha = 0;
                self.footerImageview.hidden = YES;
                self.inappImageView.alpha = 0;
                self.keylineImageView1.hidden = YES;
                self.keylineImageView2.hidden = YES;
                
                
                [UIView animateWithDuration:1.8 animations:^{
                    self.inappImageView.alpha = 1;
                    
                    if (screen.bounds.size.width == 375)
                    {
                        self.inappImageView.hidden = NO;
                        
                        
                    }
                    else if (screen.bounds.size.width ==414)
                    {
                        self.inappImageView.hidden = NO;
                        
                    }
                    else if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
                    {
                        
                        self.inappImageView.hidden = NO;
                        
                    }
                    else
                    {
                        self.inappImageView.hidden = NO;
                    }
                }];

                
            }

        }
        
    }
    else
    {
        
        
        self.inappImageView.hidden = YES;
        self.keylineImageView1.hidden = NO;
        self.keylineImageView2.hidden = NO;
        
    }

    

    
    recipeNamestr = nil;
    recipeMethodstr = nil;
    recipeIngredientsstr = nil;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark- Button Actions
-(IBAction)cinchbtnPressed:(id)sender
{
    NSString *season = [[NSUserDefaults standardUserDefaults]valueForKey:@"recipe"];
    
    NSLog(@"%@",season);
    if([season isEqualToString:@"spring"])
    {
        if([self.imageFile isEqualToString: @"Peas.jpg"])
        {
            [self databaseOpen];
            
            
            //For name
            
            NSString *queryname= [NSString stringWithFormat:@"Select recipe_subcategory,recipe_name,recipe_type from spring_tbl where recipe_name ='PEA' AND recipe_type ='Cinch' "];
            recipeNameArr =[[NSMutableArray alloc]init];
            recipeNameArr =[[database executeQuery:queryname]mutableCopy];
            
            NSMutableArray *arr_name = [recipeNameArr valueForKey:@"recipe_subcategory"];
            
            //self.recipe_namelbl.text = [arr_name objectAtIndex:0];
            recipeNamestr = [arr_name objectAtIndex:0];
            
            
            //For ingredients
            
            NSString *queryingredients=[ NSString stringWithFormat:@"Select recipe_ingredients from spring_tbl where recipe_name ='PEA' AND recipe_type ='Cinch' "];
            recipeIngredientsArr =[[NSMutableArray alloc]init];
            recipeIngredientsArr =[[database executeQuery:queryingredients]mutableCopy];
            
            
            NSMutableArray *arr_ingredients  = [recipeIngredientsArr valueForKey:@"recipe_ingredients"];
            NSLog(@"%@",arr_ingredients);
            
            //self.recipe_ingredientslbl.text = [arr_ingredients objectAtIndex:0];
            // [self.recipe_ingredientslbl sizeToFit];
            recipeIngredientsstr = [arr_ingredients objectAtIndex:0];
            //For method
            NSString *querymethod=[ NSString stringWithFormat:@"Select recipe_method from spring_tbl where recipe_name ='PEA' AND recipe_type ='Cinch' "];
            recipeMethodArr =[[NSMutableArray alloc]init];
            recipeMethodArr =[[database executeQuery:querymethod]mutableCopy];
            
            
            NSMutableArray *arr_method  = [recipeMethodArr valueForKey:@"recipe_method"];
            NSLog(@"%@",arr_ingredients);
            
            //self.recipe_methodlbl.text = [arr_method objectAtIndex:0];
            //[self.recipe_methodlbl sizeToFit];
            
            recipeMethodstr = [arr_method objectAtIndex:0];
            
            [database close];
            
        }
        if([self.imageFile isEqualToString: @"Spinach.jpg"])
        {
            [self databaseOpen];
            
            
            //For name
            
            NSString *queryname= [NSString stringWithFormat:@"Select recipe_subcategory,recipe_name,recipe_type from spring_tbl where recipe_name ='SPINACH' AND recipe_type ='Cinch' "];
            recipeNameArr =[[NSMutableArray alloc]init];
            recipeNameArr =[[database executeQuery:queryname]mutableCopy];
            
            NSMutableArray *arr_name = [recipeNameArr valueForKey:@"recipe_subcategory"];
            
            //self.recipe_namelbl.text = [arr_name objectAtIndex:0];
            recipeNamestr = [arr_name objectAtIndex:0];
            
            
            
            //For ingredients
            
            NSString *queryingredients=[ NSString stringWithFormat:@"Select recipe_ingredients from spring_tbl where recipe_name ='SPINACH' AND recipe_type ='Cinch' "];
            recipeIngredientsArr =[[NSMutableArray alloc]init];
            recipeIngredientsArr =[[database executeQuery:queryingredients]mutableCopy];
            
            
            NSMutableArray *arr_ingredients  = [recipeIngredientsArr valueForKey:@"recipe_ingredients"];
            NSLog(@"%@",arr_ingredients);
            
            //self.recipe_ingredientslbl.text = [arr_ingredients objectAtIndex:0];
            // [self.recipe_ingredientslbl sizeToFit];
            recipeIngredientsstr = [arr_ingredients objectAtIndex:0];
            //For method
            NSString *querymethod=[ NSString stringWithFormat:@"Select recipe_method from spring_tbl where recipe_name ='SPINACH' AND recipe_type ='Cinch' "];
            recipeMethodArr =[[NSMutableArray alloc]init];
            recipeMethodArr =[[database executeQuery:querymethod]mutableCopy];
            
            
            NSMutableArray *arr_method  = [recipeMethodArr valueForKey:@"recipe_method"];
            NSLog(@"%@",arr_ingredients);
            
            //self.recipe_methodlbl.text = [arr_method objectAtIndex:0];
            //[self.recipe_methodlbl sizeToFit];
            
            recipeMethodstr = [arr_method objectAtIndex:0];
            
            [database close];
            
        }

        if([self.imageFile isEqualToString: @"Asparagus.jpg"])
        {
            [self databaseOpen];
           
            
            //For name
            
            NSString *queryname= [NSString stringWithFormat:@"Select recipe_subcategory,recipe_name,recipe_type from spring_tbl where recipe_name ='ASPARAGUS' AND recipe_type ='Cinch' "];
            recipeNameArr =[[NSMutableArray alloc]init];
            recipeNameArr =[[database executeQuery:queryname]mutableCopy];
            
            NSMutableArray *arr_name = [recipeNameArr valueForKey:@"recipe_subcategory"];
            
            //self.recipe_namelbl.text = [arr_name objectAtIndex:0];
            
            recipeNamestr = [arr_name objectAtIndex:0];
            
            //For ingredients
            
            NSString *queryingredients=[ NSString stringWithFormat:@"Select recipe_ingredients from spring_tbl where recipe_name ='ASPARAGUS' AND recipe_type ='Cinch' "];
            recipeIngredientsArr =[[NSMutableArray alloc]init];
            recipeIngredientsArr =[[database executeQuery:queryingredients]mutableCopy];
            
            
            NSMutableArray *arr_ingredients  = [recipeIngredientsArr valueForKey:@"recipe_ingredients"];
            NSLog(@"%@",arr_ingredients);
            
            //self.recipe_ingredientslbl.text = [arr_ingredients objectAtIndex:0];
           // [self.recipe_ingredientslbl sizeToFit];
            
            recipeIngredientsstr = [arr_ingredients objectAtIndex:0];
            
            //For method
            NSString *querymethod=[ NSString stringWithFormat:@"Select recipe_method from spring_tbl where recipe_name ='ASPARAGUS' AND recipe_type ='Cinch' "];
            recipeMethodArr =[[NSMutableArray alloc]init];
            recipeMethodArr =[[database executeQuery:querymethod]mutableCopy];
            
            
            NSMutableArray *arr_method  = [recipeMethodArr valueForKey:@"recipe_method"];
            NSLog(@"%@",arr_method);
            
            //self.recipe_methodlbl.text = [arr_method objectAtIndex:0];
            //[self.recipe_methodlbl sizeToFit];
            recipeMethodstr = [arr_method objectAtIndex:0];
            
            
            
            [database close];
        }
        if([self.imageFile isEqualToString: @"Egg.jpg"])
        {
            [self databaseOpen];
            
            
            //For name
            
            NSString *queryname= [NSString stringWithFormat:@"Select recipe_subcategory,recipe_name,recipe_type from spring_tbl where recipe_name ='EGG' AND recipe_type ='Cinch' "];
            recipeNameArr =[[NSMutableArray alloc]init];
            recipeNameArr =[[database executeQuery:queryname]mutableCopy];
            
            NSMutableArray *arr_name = [recipeNameArr valueForKey:@"recipe_subcategory"];
            
            //self.recipe_namelbl.text = [arr_name objectAtIndex:0];
            recipeNamestr = [arr_name objectAtIndex:0];
            
            //For ingredients
            
            NSString *queryingredients=[ NSString stringWithFormat:@"Select recipe_ingredients from spring_tbl where recipe_name ='EGG' AND recipe_type ='Cinch' "];
            recipeIngredientsArr =[[NSMutableArray alloc]init];
            recipeIngredientsArr =[[database executeQuery:queryingredients]mutableCopy];
            
            
            NSMutableArray *arr_ingredients  = [recipeIngredientsArr valueForKey:@"recipe_ingredients"];
            NSLog(@"%@",arr_ingredients);
            
            //self.recipe_ingredientslbl.text = [arr_ingredients objectAtIndex:0];
            // [self.recipe_ingredientslbl sizeToFit];
            recipeIngredientsstr = [arr_ingredients objectAtIndex:0];
            
            //For method
            NSString *querymethod=[ NSString stringWithFormat:@"Select recipe_method from spring_tbl where recipe_name ='EGG' AND recipe_type ='Cinch' "];
            recipeMethodArr =[[NSMutableArray alloc]init];
            recipeMethodArr =[[database executeQuery:querymethod]mutableCopy];
            
            
            NSMutableArray *arr_method  = [recipeMethodArr valueForKey:@"recipe_method"];
            NSLog(@"%@",arr_ingredients);
            
            //self.recipe_methodlbl.text = [arr_method objectAtIndex:0];
            //[self.recipe_methodlbl sizeToFit];
            recipeMethodstr = [arr_method objectAtIndex:0];
            
            
            [database close];

        }
        if([self.imageFile isEqualToString: @"Quinoa.jpg"])
        {
            [self databaseOpen];
            
            
            //For name
            
            NSString *queryname= [NSString stringWithFormat:@"Select recipe_subcategory,recipe_name,recipe_type from spring_tbl where recipe_name ='QUINOA' AND recipe_type ='Cinch' "];
            recipeNameArr =[[NSMutableArray alloc]init];
            recipeNameArr =[[database executeQuery:queryname]mutableCopy];
            
            NSMutableArray *arr_name = [recipeNameArr valueForKey:@"recipe_subcategory"];
            
            //self.recipe_namelbl.text = [arr_name objectAtIndex:0];
            recipeNamestr = [arr_name objectAtIndex:0];
            
            //For ingredients
            
            NSString *queryingredients=[ NSString stringWithFormat:@"Select recipe_ingredients from spring_tbl where recipe_name ='QUINOA' AND recipe_type ='Cinch' "];
            recipeIngredientsArr =[[NSMutableArray alloc]init];
            recipeIngredientsArr =[[database executeQuery:queryingredients]mutableCopy];
            
            
            NSMutableArray *arr_ingredients  = [recipeIngredientsArr valueForKey:@"recipe_ingredients"];
            NSLog(@"%@",arr_ingredients);
            
            //self.recipe_ingredientslbl.text = [arr_ingredients objectAtIndex:0];
            // [self.recipe_ingredientslbl sizeToFit];
            recipeIngredientsstr = [arr_ingredients objectAtIndex:0];
            //For method
            NSString *querymethod=[ NSString stringWithFormat:@"Select recipe_method from spring_tbl where recipe_name ='QUINOA' AND recipe_type ='Cinch' "];
            recipeMethodArr =[[NSMutableArray alloc]init];
            recipeMethodArr =[[database executeQuery:querymethod]mutableCopy];
            
            
            NSMutableArray *arr_method  = [recipeMethodArr valueForKey:@"recipe_method"];
            NSLog(@"%@",arr_ingredients);
            
            //self.recipe_methodlbl.text = [arr_method objectAtIndex:0];
            //[self.recipe_methodlbl sizeToFit];
            
            recipeMethodstr = [arr_method objectAtIndex:0];
            
            [database close];

        }
        if([self.imageFile isEqualToString: @"Radish.jpg"])
        {
            [self databaseOpen];
            
            
            //For name
            
            NSString *queryname= [NSString stringWithFormat:@"Select recipe_subcategory,recipe_name,recipe_type from spring_tbl where recipe_name ='RADISH' AND recipe_type ='Cinch' "];
            recipeNameArr =[[NSMutableArray alloc]init];
            recipeNameArr =[[database executeQuery:queryname]mutableCopy];
            
            NSMutableArray *arr_name = [recipeNameArr valueForKey:@"recipe_subcategory"];
            
            //self.recipe_namelbl.text = [arr_name objectAtIndex:0];
            recipeNamestr = [arr_name objectAtIndex:0];
            
            //For ingredients
            
            NSString *queryingredients=[ NSString stringWithFormat:@"Select recipe_ingredients from spring_tbl where recipe_name ='RADISH' AND recipe_type ='Cinch' "];
            recipeIngredientsArr =[[NSMutableArray alloc]init];
            recipeIngredientsArr =[[database executeQuery:queryingredients]mutableCopy];
            
            
            NSMutableArray *arr_ingredients  = [recipeIngredientsArr valueForKey:@"recipe_ingredients"];
            NSLog(@"%@",arr_ingredients);
            
            //self.recipe_ingredientslbl.text = [arr_ingredients objectAtIndex:0];
            // [self.recipe_ingredientslbl sizeToFit];
            recipeIngredientsstr = [arr_ingredients objectAtIndex:0];
            //For method
            NSString *querymethod=[ NSString stringWithFormat:@"Select recipe_method from spring_tbl where recipe_name ='RADISH' AND recipe_type ='Cinch' "];
            recipeMethodArr =[[NSMutableArray alloc]init];
            recipeMethodArr =[[database executeQuery:querymethod]mutableCopy];
            
            
            NSMutableArray *arr_method  = [recipeMethodArr valueForKey:@"recipe_method"];
            NSLog(@"%@",arr_ingredients);
            
            //self.recipe_methodlbl.text = [arr_method objectAtIndex:0];
            //[self.recipe_methodlbl sizeToFit];
            
            recipeMethodstr = [arr_method objectAtIndex:0];
            
            [database close];

        }
        if([self.imageFile isEqualToString: @"Currant.jpg"])
        {
            [self databaseOpen];
            
            
            //For name
            
            NSString *queryname= [NSString stringWithFormat:@"Select recipe_subcategory,recipe_name,recipe_type from spring_tbl where recipe_name ='CURRANT' AND recipe_type ='Cinch' "];
            recipeNameArr =[[NSMutableArray alloc]init];
            recipeNameArr =[[database executeQuery:queryname]mutableCopy];
            
            NSMutableArray *arr_name = [recipeNameArr valueForKey:@"recipe_subcategory"];
            
            //self.recipe_namelbl.text = [arr_name objectAtIndex:0];
            recipeNamestr = [arr_name objectAtIndex:0];
            
            //For ingredients
            
            NSString *queryingredients=[ NSString stringWithFormat:@"Select recipe_ingredients from spring_tbl where recipe_name ='CURRANT' AND recipe_type ='Cinch' "];
            recipeIngredientsArr =[[NSMutableArray alloc]init];
            recipeIngredientsArr =[[database executeQuery:queryingredients]mutableCopy];
            
            
            NSMutableArray *arr_ingredients  = [recipeIngredientsArr valueForKey:@"recipe_ingredients"];
            NSLog(@"%@",arr_ingredients);
            
            //self.recipe_ingredientslbl.text = [arr_ingredients objectAtIndex:0];
            // [self.recipe_ingredientslbl sizeToFit];
            recipeIngredientsstr = [arr_ingredients objectAtIndex:0];
            //For method
            NSString *querymethod=[ NSString stringWithFormat:@"Select recipe_method from spring_tbl where recipe_name ='CURRANT' AND recipe_type ='Cinch' "];
            recipeMethodArr =[[NSMutableArray alloc]init];
            recipeMethodArr =[[database executeQuery:querymethod]mutableCopy];
            
            
            NSMutableArray *arr_method  = [recipeMethodArr valueForKey:@"recipe_method"];
            NSLog(@"%@",arr_ingredients);
            
            //self.recipe_methodlbl.text = [arr_method objectAtIndex:0];
            //[self.recipe_methodlbl sizeToFit];
            
            recipeMethodstr = [arr_method objectAtIndex:0];
            
            [database close];
            
        }

        if([self.imageFile isEqualToString: @"Rhubarb.jpg"])
        {
            [self databaseOpen];
            
            
            //For name
            
            NSString *queryname= [NSString stringWithFormat:@"Select recipe_subcategory,recipe_name,recipe_type from spring_tbl where recipe_name ='RHUBARB' AND recipe_type ='Cinch' "];
            recipeNameArr =[[NSMutableArray alloc]init];
            recipeNameArr =[[database executeQuery:queryname]mutableCopy];
            
            NSMutableArray *arr_name = [recipeNameArr valueForKey:@"recipe_subcategory"];
            
            //self.recipe_namelbl.text = [arr_name objectAtIndex:0];
            recipeNamestr = [arr_name objectAtIndex:0];
            NSMutableArray *arr_recipe = [recipeNameArr valueForKey:@"recipe_name"];
            recipestr = [arr_recipe objectAtIndex:0];
            //For ingredients
            
            NSString *queryingredients=[ NSString stringWithFormat:@"Select recipe_ingredients from spring_tbl where recipe_name ='RHUBARB' AND recipe_type ='Cinch' "];
            recipeIngredientsArr =[[NSMutableArray alloc]init];
            recipeIngredientsArr =[[database executeQuery:queryingredients]mutableCopy];
            
            
            NSMutableArray *arr_ingredients  = [recipeIngredientsArr valueForKey:@"recipe_ingredients"];
            NSLog(@"%@",arr_ingredients);
            
            //self.recipe_ingredientslbl.text = [arr_ingredients objectAtIndex:0];
            // [self.recipe_ingredientslbl sizeToFit];
            recipeIngredientsstr = [arr_ingredients objectAtIndex:0];
            //For method
            NSString *querymethod=[ NSString stringWithFormat:@"Select recipe_method from spring_tbl where recipe_name ='RHUBARB' AND recipe_type ='Cinch' "];
            recipeMethodArr =[[NSMutableArray alloc]init];
            recipeMethodArr =[[database executeQuery:querymethod]mutableCopy];
            
            
            NSMutableArray *arr_method  = [recipeMethodArr valueForKey:@"recipe_method"];
            NSLog(@"%@",arr_ingredients);
            
            //self.recipe_methodlbl.text = [arr_method objectAtIndex:0];
            //[self.recipe_methodlbl sizeToFit];
            
            recipeMethodstr = [arr_method objectAtIndex:0];
            
            [database close];

        }
        if([self.imageFile isEqualToString: @"Broccoli.jpg"])
        {
            [self databaseOpen];
            
            
            //For name
            
            NSString *queryname= [NSString stringWithFormat:@"Select recipe_subcategory,recipe_name,recipe_type from spring_tbl where recipe_name ='BROCCOLI' AND recipe_type ='Cinch' "];
            recipeNameArr =[[NSMutableArray alloc]init];
            recipeNameArr =[[database executeQuery:queryname]mutableCopy];
            
            NSMutableArray *arr_name = [recipeNameArr valueForKey:@"recipe_subcategory"];
            
            //self.recipe_namelbl.text = [arr_name objectAtIndex:0];
            recipeNamestr = [arr_name objectAtIndex:0];
            NSMutableArray *arr_recipe = [recipeNameArr valueForKey:@"recipe_name"];
            recipestr = [arr_recipe objectAtIndex:0];
            //For ingredients
            
            NSString *queryingredients=[ NSString stringWithFormat:@"Select recipe_ingredients from spring_tbl where recipe_name ='BROCCOLI' AND recipe_type ='Cinch' "];
            recipeIngredientsArr =[[NSMutableArray alloc]init];
            recipeIngredientsArr =[[database executeQuery:queryingredients]mutableCopy];
            
            
            NSMutableArray *arr_ingredients  = [recipeIngredientsArr valueForKey:@"recipe_ingredients"];
            NSLog(@"%@",arr_ingredients);
            
            //self.recipe_ingredientslbl.text = [arr_ingredients objectAtIndex:0];
            // [self.recipe_ingredientslbl sizeToFit];
            recipeIngredientsstr = [arr_ingredients objectAtIndex:0];
            //For method
            NSString *querymethod=[ NSString stringWithFormat:@"Select recipe_method from spring_tbl where recipe_name ='BROCCOLI' AND recipe_type ='Cinch' "];
            recipeMethodArr =[[NSMutableArray alloc]init];
            recipeMethodArr =[[database executeQuery:querymethod]mutableCopy];
            
            
            NSMutableArray *arr_method  = [recipeMethodArr valueForKey:@"recipe_method"];
            NSLog(@"%@",arr_ingredients);
            
            //self.recipe_methodlbl.text = [arr_method objectAtIndex:0];
            //[self.recipe_methodlbl sizeToFit];
            
            recipeMethodstr = [arr_method objectAtIndex:0];
            
            [database close];

        }
        if([self.imageFile isEqualToString: @"Crab.jpg"])
        {
            [self databaseOpen];
            
            
            //For name
            
            NSString *queryname= [NSString stringWithFormat:@"Select recipe_subcategory,recipe_name,recipe_type from spring_tbl where recipe_name ='CRAB' AND recipe_type ='Cinch' "];
            recipeNameArr =[[NSMutableArray alloc]init];
            recipeNameArr =[[database executeQuery:queryname]mutableCopy];
            
            NSMutableArray *arr_name = [recipeNameArr valueForKey:@"recipe_subcategory"];
            
            //self.recipe_namelbl.text = [arr_name objectAtIndex:0];
            recipeNamestr = [arr_name objectAtIndex:0];
            NSMutableArray *arr_recipe = [recipeNameArr valueForKey:@"recipe_name"];
            recipestr = [arr_recipe objectAtIndex:0];
            //For ingredients
            
            NSString *queryingredients=[ NSString stringWithFormat:@"Select recipe_ingredients from spring_tbl where recipe_name ='CRAB' AND recipe_type ='Cinch' "];
            recipeIngredientsArr =[[NSMutableArray alloc]init];
            recipeIngredientsArr =[[database executeQuery:queryingredients]mutableCopy];
            
            
            NSMutableArray *arr_ingredients  = [recipeIngredientsArr valueForKey:@"recipe_ingredients"];
            NSLog(@"%@",arr_ingredients);
            
            //self.recipe_ingredientslbl.text = [arr_ingredients objectAtIndex:0];
            // [self.recipe_ingredientslbl sizeToFit];
            recipeIngredientsstr = [arr_ingredients objectAtIndex:0];
            //For method
            NSString *querymethod=[ NSString stringWithFormat:@"Select recipe_method from spring_tbl where recipe_name ='CRAB' AND recipe_type ='Cinch' "];
            recipeMethodArr =[[NSMutableArray alloc]init];
            recipeMethodArr =[[database executeQuery:querymethod]mutableCopy];
            
            
            NSMutableArray *arr_method  = [recipeMethodArr valueForKey:@"recipe_method"];
            NSLog(@"%@",arr_ingredients);
            
            //self.recipe_methodlbl.text = [arr_method objectAtIndex:0];
            //[self.recipe_methodlbl sizeToFit];
            
            
            recipeMethodstr = [arr_method objectAtIndex:0];
            [database close];

        }
        if([self.imageFile isEqualToString: @"Escarole.jpg"])
        {
            [self databaseOpen];
            
            
            //For name
            
            NSString *queryname= [NSString stringWithFormat:@"Select recipe_subcategory,recipe_name,recipe_type from spring_tbl where recipe_name ='ESCAROLE' AND recipe_type ='Cinch' "];
            recipeNameArr =[[NSMutableArray alloc]init];
            recipeNameArr =[[database executeQuery:queryname]mutableCopy];
            
            NSMutableArray *arr_name = [recipeNameArr valueForKey:@"recipe_subcategory"];
            
            //self.recipe_namelbl.text = [arr_name objectAtIndex:0];
            recipeNamestr = [arr_name objectAtIndex:0];
            NSMutableArray *arr_recipe = [recipeNameArr valueForKey:@"recipe_name"];
            recipestr = [arr_recipe objectAtIndex:0];
            //For ingredients
            
            NSString *queryingredients=[ NSString stringWithFormat:@"Select recipe_ingredients from spring_tbl where recipe_name ='ESCAROLE' AND recipe_type ='Cinch' "];
            recipeIngredientsArr =[[NSMutableArray alloc]init];
            recipeIngredientsArr =[[database executeQuery:queryingredients]mutableCopy];
            
            
            NSMutableArray *arr_ingredients  = [recipeIngredientsArr valueForKey:@"recipe_ingredients"];
            NSLog(@"%@",arr_ingredients);
            
            //self.recipe_ingredientslbl.text = [arr_ingredients objectAtIndex:0];
            // [self.recipe_ingredientslbl sizeToFit];
            recipeIngredientsstr = [arr_ingredients objectAtIndex:0];
            //For method
            NSString *querymethod=[ NSString stringWithFormat:@"Select recipe_method from spring_tbl where recipe_name ='ESCAROLE' AND recipe_type ='Cinch' "];
            recipeMethodArr =[[NSMutableArray alloc]init];
            recipeMethodArr =[[database executeQuery:querymethod]mutableCopy];
            
            
            NSMutableArray *arr_method  = [recipeMethodArr valueForKey:@"recipe_method"];
            NSLog(@"%@",arr_ingredients);
            
            //self.recipe_methodlbl.text = [arr_method objectAtIndex:0];
            //[self.recipe_methodlbl sizeToFit];
            
            recipeMethodstr = [arr_method objectAtIndex:0];
            
            [database close];

        }
        if([self.imageFile isEqualToString: @"Fennel.jpg"])
        {
            [self databaseOpen];
            
            
            //For name
            
            NSString *queryname= [NSString stringWithFormat:@"Select recipe_subcategory,recipe_name,recipe_type from spring_tbl where recipe_name ='FENNEL' AND recipe_type ='Cinch' "];
            recipeNameArr =[[NSMutableArray alloc]init];
            recipeNameArr =[[database executeQuery:queryname]mutableCopy];
            
            NSMutableArray *arr_name = [recipeNameArr valueForKey:@"recipe_subcategory"];
            recipeNamestr = [arr_name objectAtIndex:0];
            //self.recipe_namelbl.text = [arr_name objectAtIndex:0];
            
            NSMutableArray *arr_recipe = [recipeNameArr valueForKey:@"recipe_name"];
            recipestr = [arr_recipe objectAtIndex:0];
            //For ingredients
            
            NSString *queryingredients=[ NSString stringWithFormat:@"Select recipe_ingredients from spring_tbl where recipe_name ='FENNEL' AND recipe_type ='Cinch' "];
            recipeIngredientsArr =[[NSMutableArray alloc]init];
            recipeIngredientsArr =[[database executeQuery:queryingredients]mutableCopy];
            
            
            NSMutableArray *arr_ingredients  = [recipeIngredientsArr valueForKey:@"recipe_ingredients"];
            NSLog(@"%@",arr_ingredients);
            
            //self.recipe_ingredientslbl.text = [arr_ingredients objectAtIndex:0];
            // [self.recipe_ingredientslbl sizeToFit];
            recipeIngredientsstr = [arr_ingredients objectAtIndex:0];
            //For method
            NSString *querymethod=[ NSString stringWithFormat:@"Select recipe_method from spring_tbl where recipe_name ='FENNEL' AND recipe_type ='Cinch' "];
            recipeMethodArr =[[NSMutableArray alloc]init];
            recipeMethodArr =[[database executeQuery:querymethod]mutableCopy];
            
            
            NSMutableArray *arr_method  = [recipeMethodArr valueForKey:@"recipe_method"];
            NSLog(@"%@",arr_ingredients);
            
            //self.recipe_methodlbl.text = [arr_method objectAtIndex:0];
            //[self.recipe_methodlbl sizeToFit];
            
            
            recipeMethodstr = [arr_method objectAtIndex:0];
            [database close];

        }
        if([self.imageFile isEqualToString: @"Fiddlehead-Ferns.jpg"])
        {
            [self databaseOpen];
            
            
            //For name
            
            NSString *queryname= [NSString stringWithFormat:@"Select recipe_subcategory,recipe_name,recipe_type from spring_tbl where recipe_name ='FIDDLEHEAD FERNS' AND recipe_type ='Cinch' "];
            recipeNameArr =[[NSMutableArray alloc]init];
            recipeNameArr =[[database executeQuery:queryname]mutableCopy];
            
            NSMutableArray *arr_name = [recipeNameArr valueForKey:@"recipe_subcategory"];
            recipeNamestr = [arr_name objectAtIndex:0];
            //self.recipe_namelbl.text = [arr_name objectAtIndex:0];
            NSMutableArray *arr_recipe = [recipeNameArr valueForKey:@"recipe_name"];
            recipestr = [arr_recipe objectAtIndex:0];
            
            //For ingredients
            
            NSString *queryingredients=[ NSString stringWithFormat:@"Select recipe_ingredients from spring_tbl where recipe_name ='FIDDLEHEAD FERNS' AND recipe_type ='Cinch' "];
            recipeIngredientsArr =[[NSMutableArray alloc]init];
            recipeIngredientsArr =[[database executeQuery:queryingredients]mutableCopy];
            
            
            NSMutableArray *arr_ingredients  = [recipeIngredientsArr valueForKey:@"recipe_ingredients"];
            NSLog(@"%@",arr_ingredients);
            
            //self.recipe_ingredientslbl.text = [arr_ingredients objectAtIndex:0];
            // [self.recipe_ingredientslbl sizeToFit];
            recipeIngredientsstr = [arr_ingredients objectAtIndex:0];
            //For method
            NSString *querymethod=[ NSString stringWithFormat:@"Select recipe_method from spring_tbl where recipe_name ='FIDDLEHEAD FERNS' AND recipe_type ='Cinch' "];
            recipeMethodArr =[[NSMutableArray alloc]init];
            recipeMethodArr =[[database executeQuery:querymethod]mutableCopy];
            
            
            NSMutableArray *arr_method  = [recipeMethodArr valueForKey:@"recipe_method"];
            NSLog(@"%@",arr_ingredients);
            
            //self.recipe_methodlbl.text = [arr_method objectAtIndex:0];
            //[self.recipe_methodlbl sizeToFit];
            
            
            recipeMethodstr = [arr_method objectAtIndex:0];
            [database close];

        }
        if([self.imageFile isEqualToString: @"Flounder.jpg"])
        {
            [self databaseOpen];
            
            
            //For name
            
            NSString *queryname= [NSString stringWithFormat:@"Select recipe_subcategory,recipe_name,recipe_type from spring_tbl where recipe_name ='FLOUNDER' AND recipe_type ='Cinch' "];
            recipeNameArr =[[NSMutableArray alloc]init];
            recipeNameArr =[[database executeQuery:queryname]mutableCopy];
            
            NSMutableArray *arr_name = [recipeNameArr valueForKey:@"recipe_subcategory"];
            recipeNamestr = [arr_name objectAtIndex:0];
            //self.recipe_namelbl.text = [arr_name objectAtIndex:0];
            
            NSMutableArray *arr_recipe = [recipeNameArr valueForKey:@"recipe_name"];
            recipestr = [arr_recipe objectAtIndex:0];
            //For ingredients
            
            NSString *queryingredients=[ NSString stringWithFormat:@"Select recipe_ingredients from spring_tbl where recipe_name ='FLOUNDER' AND recipe_type ='Cinch' "];
            recipeIngredientsArr =[[NSMutableArray alloc]init];
            recipeIngredientsArr =[[database executeQuery:queryingredients]mutableCopy];
            
            
            NSMutableArray *arr_ingredients  = [recipeIngredientsArr valueForKey:@"recipe_ingredients"];
            NSLog(@"%@",arr_ingredients);
            
            //self.recipe_ingredientslbl.text = [arr_ingredients objectAtIndex:0];
            // [self.recipe_ingredientslbl sizeToFit];
            recipeIngredientsstr = [arr_ingredients objectAtIndex:0];
            //For method
            NSString *querymethod=[ NSString stringWithFormat:@"Select recipe_method from spring_tbl where recipe_name ='FLOUNDER' AND recipe_type ='Cinch' "];
            recipeMethodArr =[[NSMutableArray alloc]init];
            recipeMethodArr =[[database executeQuery:querymethod]mutableCopy];
            
            
            NSMutableArray *arr_method  = [recipeMethodArr valueForKey:@"recipe_method"];
            NSLog(@"%@",arr_ingredients);
            
            //self.recipe_methodlbl.text = [arr_method objectAtIndex:0];
            //[self.recipe_methodlbl sizeToFit];
            
            
            recipeMethodstr = [arr_method objectAtIndex:0];
            [database close];

        }
        
        if([self.imageFile isEqualToString: @"Ginger.jpg"])
        {
            [self databaseOpen];
            
            
            //For name
            
            NSString *queryname= [NSString stringWithFormat:@"Select recipe_subcategory,recipe_name,recipe_type from spring_tbl where recipe_name ='GINGER' AND recipe_type ='Cinch' "];
            recipeNameArr =[[NSMutableArray alloc]init];
            recipeNameArr =[[database executeQuery:queryname]mutableCopy];
            
            NSMutableArray *arr_name = [recipeNameArr valueForKey:@"recipe_subcategory"];
            
            //self.recipe_namelbl.text = [arr_name objectAtIndex:0];
            recipeNamestr = [arr_name objectAtIndex:0];
            NSMutableArray *arr_recipe = [recipeNameArr valueForKey:@"recipe_name"];
            recipestr = [arr_recipe objectAtIndex:0];
            //For ingredients
            
            NSString *queryingredients=[ NSString stringWithFormat:@"Select recipe_ingredients from spring_tbl where recipe_name ='GINGER' AND recipe_type ='Cinch' "];
            recipeIngredientsArr =[[NSMutableArray alloc]init];
            recipeIngredientsArr =[[database executeQuery:queryingredients]mutableCopy];
            
            
            NSMutableArray *arr_ingredients  = [recipeIngredientsArr valueForKey:@"recipe_ingredients"];
            NSLog(@"%@",arr_ingredients);
            recipeIngredientsstr = [arr_ingredients objectAtIndex:0];
            //self.recipe_ingredientslbl.text = [arr_ingredients objectAtIndex:0];
            // [self.recipe_ingredientslbl sizeToFit];
            
            //For method
            NSString *querymethod=[ NSString stringWithFormat:@"Select recipe_method from spring_tbl where recipe_name ='GINGER' AND recipe_type ='Cinch' "];
            recipeMethodArr =[[NSMutableArray alloc]init];
            recipeMethodArr =[[database executeQuery:querymethod]mutableCopy];
            
            
            NSMutableArray *arr_method  = [recipeMethodArr valueForKey:@"recipe_method"];
            NSLog(@"%@",arr_ingredients);
            
            //self.recipe_methodlbl.text = [arr_method objectAtIndex:0];
            //[self.recipe_methodlbl sizeToFit];
            
            
            recipeMethodstr = [arr_method objectAtIndex:0];
            [database close];

        }
        if([self.imageFile isEqualToString: @"Grapefruit.jpg"])
        {
            [self databaseOpen];
            
            
            //For name
            
            NSString *queryname= [NSString stringWithFormat:@"Select recipe_subcategory,recipe_name,recipe_type from spring_tbl where recipe_name ='GRAPEFRUIT' AND recipe_type ='Cinch' "];
            recipeNameArr =[[NSMutableArray alloc]init];
            recipeNameArr =[[database executeQuery:queryname]mutableCopy];
            
            NSMutableArray *arr_name = [recipeNameArr valueForKey:@"recipe_subcategory"];
            
            //self.recipe_namelbl.text = [arr_name objectAtIndex:0];
            recipeNamestr = [arr_name objectAtIndex:0];
            NSMutableArray *arr_recipe = [recipeNameArr valueForKey:@"recipe_name"];
            recipestr = [arr_recipe objectAtIndex:0];
            //For ingredients
            
            NSString *queryingredients=[ NSString stringWithFormat:@"Select recipe_ingredients from spring_tbl where recipe_name ='GRAPEFRUIT' AND recipe_type ='Cinch' "];
            recipeIngredientsArr =[[NSMutableArray alloc]init];
            recipeIngredientsArr =[[database executeQuery:queryingredients]mutableCopy];
            
            
            NSMutableArray *arr_ingredients  = [recipeIngredientsArr valueForKey:@"recipe_ingredients"];
            NSLog(@"%@",arr_ingredients);
            recipeIngredientsstr = [arr_ingredients objectAtIndex:0];
            //self.recipe_ingredientslbl.text = [arr_ingredients objectAtIndex:0];
            // [self.recipe_ingredientslbl sizeToFit];
            
            //For method
            NSString *querymethod=[ NSString stringWithFormat:@"Select recipe_method from spring_tbl where recipe_name ='GRAPEFRUIT' AND recipe_type ='Cinch' "];
            recipeMethodArr =[[NSMutableArray alloc]init];
            recipeMethodArr =[[database executeQuery:querymethod]mutableCopy];
            
            
            NSMutableArray *arr_method  = [recipeMethodArr valueForKey:@"recipe_method"];
            NSLog(@"%@",arr_ingredients);
            
            //self.recipe_methodlbl.text = [arr_method objectAtIndex:0];
            //[self.recipe_methodlbl sizeToFit];
            
            
            recipeMethodstr = [arr_method objectAtIndex:0];
            [database close];

        }
        if([self.imageFile isEqualToString: @"Lamb.jpg"])
        {
            [self databaseOpen];
            
            
            //For name
            
            NSString *queryname= [NSString stringWithFormat:@"Select recipe_subcategory,recipe_name,recipe_type from spring_tbl where recipe_name ='LAMB' AND recipe_type ='Cinch' "];
            recipeNameArr =[[NSMutableArray alloc]init];
            recipeNameArr =[[database executeQuery:queryname]mutableCopy];
            
            NSMutableArray *arr_name = [recipeNameArr valueForKey:@"recipe_subcategory"];
            
            //self.recipe_namelbl.text = [arr_name objectAtIndex:0];
            recipeNamestr = [arr_name objectAtIndex:0];
            NSMutableArray *arr_recipe = [recipeNameArr valueForKey:@"recipe_name"];
            recipestr = [arr_recipe objectAtIndex:0];
            //For ingredients
            
            NSString *queryingredients=[ NSString stringWithFormat:@"Select recipe_ingredients from spring_tbl where recipe_name ='LAMB' AND recipe_type ='Cinch' "];
            recipeIngredientsArr =[[NSMutableArray alloc]init];
            recipeIngredientsArr =[[database executeQuery:queryingredients]mutableCopy];
            
            
            NSMutableArray *arr_ingredients  = [recipeIngredientsArr valueForKey:@"recipe_ingredients"];
            NSLog(@"%@",arr_ingredients);
            recipeIngredientsstr = [arr_ingredients objectAtIndex:0];
            //self.recipe_ingredientslbl.text = [arr_ingredients objectAtIndex:0];
            // [self.recipe_ingredientslbl sizeToFit];
            
            //For method
            NSString *querymethod=[ NSString stringWithFormat:@"Select recipe_method from spring_tbl where recipe_name ='LAMB' AND recipe_type ='Cinch' "];
            recipeMethodArr =[[NSMutableArray alloc]init];
            recipeMethodArr =[[database executeQuery:querymethod]mutableCopy];
            
            
            NSMutableArray *arr_method  = [recipeMethodArr valueForKey:@"recipe_method"];
            NSLog(@"%@",arr_ingredients);
            
            //self.recipe_methodlbl.text = [arr_method objectAtIndex:0];
            //[self.recipe_methodlbl sizeToFit];
            
            recipeMethodstr = [arr_method objectAtIndex:0];
            
            [database close];

        }
        if([self.imageFile isEqualToString: @"Leek.jpg"])
        {
            [self databaseOpen];
            
            
            //For name
            
            NSString *queryname= [NSString stringWithFormat:@"Select recipe_subcategory,recipe_name,recipe_type from spring_tbl where recipe_name ='LEEK' AND recipe_type ='Cinch' "];
            recipeNameArr =[[NSMutableArray alloc]init];
            recipeNameArr =[[database executeQuery:queryname]mutableCopy];
            
            NSMutableArray *arr_name = [recipeNameArr valueForKey:@"recipe_subcategory"];
            
            //self.recipe_namelbl.text = [arr_name objectAtIndex:0];
            recipeNamestr = [arr_name objectAtIndex:0];
            NSMutableArray *arr_recipe = [recipeNameArr valueForKey:@"recipe_name"];
            recipestr = [arr_recipe objectAtIndex:0];
            //For ingredients
            
            NSString *queryingredients=[ NSString stringWithFormat:@"Select recipe_ingredients from spring_tbl where recipe_name ='LEEK' AND recipe_type ='Cinch' "];
            recipeIngredientsArr =[[NSMutableArray alloc]init];
            recipeIngredientsArr =[[database executeQuery:queryingredients]mutableCopy];
            
            
            NSMutableArray *arr_ingredients  = [recipeIngredientsArr valueForKey:@"recipe_ingredients"];
            NSLog(@"%@",arr_ingredients);
            recipeIngredientsstr = [arr_ingredients objectAtIndex:0];
            //self.recipe_ingredientslbl.text = [arr_ingredients objectAtIndex:0];
            // [self.recipe_ingredientslbl sizeToFit];
            
            //For method
            NSString *querymethod=[ NSString stringWithFormat:@"Select recipe_method from spring_tbl where recipe_name ='LEEK' AND recipe_type ='Cinch' "];
            recipeMethodArr =[[NSMutableArray alloc]init];
            recipeMethodArr =[[database executeQuery:querymethod]mutableCopy];
            
            
            NSMutableArray *arr_method  = [recipeMethodArr valueForKey:@"recipe_method"];
            NSLog(@"%@",arr_ingredients);
            
            //self.recipe_methodlbl.text = [arr_method objectAtIndex:0];
            //[self.recipe_methodlbl sizeToFit];
            
            recipeMethodstr = [arr_method objectAtIndex:0];
            
            [database close];

        }
        if([self.imageFile isEqualToString: @"Lemon.jpg"])
        {
            [self databaseOpen];
            
            
            //For name
            
            NSString *queryname= [NSString stringWithFormat:@"Select recipe_subcategory,recipe_name,recipe_type from spring_tbl where recipe_name ='LEMON' AND recipe_type ='Cinch' "];
            recipeNameArr =[[NSMutableArray alloc]init];
            recipeNameArr =[[database executeQuery:queryname]mutableCopy];
            
            NSMutableArray *arr_name = [recipeNameArr valueForKey:@"recipe_subcategory"];
            recipeNamestr = [arr_name objectAtIndex:0];
            //self.recipe_namelbl.text = [arr_name objectAtIndex:0];
            
            
            //For ingredients
            
            NSString *queryingredients=[ NSString stringWithFormat:@"Select recipe_ingredients from spring_tbl where recipe_name ='LEMON' AND recipe_type ='Cinch' "];
            recipeIngredientsArr =[[NSMutableArray alloc]init];
            recipeIngredientsArr =[[database executeQuery:queryingredients]mutableCopy];
            
            
            NSMutableArray *arr_ingredients  = [recipeIngredientsArr valueForKey:@"recipe_ingredients"];
            NSLog(@"%@",arr_ingredients);
            recipeIngredientsstr = [arr_ingredients objectAtIndex:0];
            //self.recipe_ingredientslbl.text = [arr_ingredients objectAtIndex:0];
            // [self.recipe_ingredientslbl sizeToFit];
            
            //For method
            NSString *querymethod=[ NSString stringWithFormat:@"Select recipe_method from spring_tbl where recipe_name ='LEMON' AND recipe_type ='Cinch' "];
            recipeMethodArr =[[NSMutableArray alloc]init];
            recipeMethodArr =[[database executeQuery:querymethod]mutableCopy];
            
            
            NSMutableArray *arr_method  = [recipeMethodArr valueForKey:@"recipe_method"];
            NSLog(@"%@",arr_ingredients);
            
            //self.recipe_methodlbl.text = [arr_method objectAtIndex:0];
            //[self.recipe_methodlbl sizeToFit];
            
            
            recipeMethodstr = [arr_method objectAtIndex:0];
            [database close];

        }
        if([self.imageFile isEqualToString: @"Mint.jpg"])
        {
            [self databaseOpen];
            
            
            //For name
            
            NSString *queryname= [NSString stringWithFormat:@"Select recipe_subcategory,recipe_name,recipe_type from spring_tbl where recipe_name ='MINT' AND recipe_type ='Cinch' "];
            recipeNameArr =[[NSMutableArray alloc]init];
            recipeNameArr =[[database executeQuery:queryname]mutableCopy];
            
            NSMutableArray *arr_name = [recipeNameArr valueForKey:@"recipe_subcategory"];
            recipeNamestr = [arr_name objectAtIndex:0];
            //self.recipe_namelbl.text = [arr_name objectAtIndex:0];
            
            
            //For ingredients
            
            NSString *queryingredients=[ NSString stringWithFormat:@"Select recipe_ingredients from spring_tbl where recipe_name ='MINT' AND recipe_type ='Cinch' "];
            recipeIngredientsArr =[[NSMutableArray alloc]init];
            recipeIngredientsArr =[[database executeQuery:queryingredients]mutableCopy];
            
            
            NSMutableArray *arr_ingredients  = [recipeIngredientsArr valueForKey:@"recipe_ingredients"];
            NSLog(@"%@",arr_ingredients);
            recipeIngredientsstr = [arr_ingredients objectAtIndex:0];
            //self.recipe_ingredientslbl.text = [arr_ingredients objectAtIndex:0];
            // [self.recipe_ingredientslbl sizeToFit];
            
            //For method
            NSString *querymethod=[ NSString stringWithFormat:@"Select recipe_method from spring_tbl where recipe_name ='MINT' AND recipe_type ='Cinch' "];
            recipeMethodArr =[[NSMutableArray alloc]init];
            recipeMethodArr =[[database executeQuery:querymethod]mutableCopy];
            
            
            NSMutableArray *arr_method  = [recipeMethodArr valueForKey:@"recipe_method"];
            NSLog(@"%@",arr_ingredients);
            
            //self.recipe_methodlbl.text = [arr_method objectAtIndex:0];
            //[self.recipe_methodlbl sizeToFit];
            
            recipeMethodstr = [arr_method objectAtIndex:0];
            
            [database close];

        }
        if([self.imageFile isEqualToString: @"Olive.jpg"])
        {
            [self databaseOpen];
            
            
            //For name
            
            NSString *queryname= [NSString stringWithFormat:@"Select recipe_subcategory,recipe_name,recipe_type from spring_tbl where recipe_name ='OLIVE' AND recipe_type ='Cinch' "];
            recipeNameArr =[[NSMutableArray alloc]init];
            recipeNameArr =[[database executeQuery:queryname]mutableCopy];
            
            NSMutableArray *arr_name = [recipeNameArr valueForKey:@"recipe_subcategory"];
            recipeNamestr = [arr_name objectAtIndex:0];
            //self.recipe_namelbl.text = [arr_name objectAtIndex:0];
            
            
            //For ingredients
            
            NSString *queryingredients=[ NSString stringWithFormat:@"Select recipe_ingredients from spring_tbl where recipe_name ='OLIVE' AND recipe_type ='Cinch' "];
            recipeIngredientsArr =[[NSMutableArray alloc]init];
            recipeIngredientsArr =[[database executeQuery:queryingredients]mutableCopy];
            
            
            NSMutableArray *arr_ingredients  = [recipeIngredientsArr valueForKey:@"recipe_ingredients"];
            NSLog(@"%@",arr_ingredients);
            recipeIngredientsstr = [arr_ingredients objectAtIndex:0];
            //self.recipe_ingredientslbl.text = [arr_ingredients objectAtIndex:0];
            // [self.recipe_ingredientslbl sizeToFit];
            
            //For method
            NSString *querymethod=[ NSString stringWithFormat:@"Select recipe_method from spring_tbl where recipe_name ='OLIVE' AND recipe_type ='Cinch' "];
            recipeMethodArr =[[NSMutableArray alloc]init];
            recipeMethodArr =[[database executeQuery:querymethod]mutableCopy];
            
            
            NSMutableArray *arr_method  = [recipeMethodArr valueForKey:@"recipe_method"];
            NSLog(@"%@",arr_ingredients);
            
            //self.recipe_methodlbl.text = [arr_method objectAtIndex:0];
            //[self.recipe_methodlbl sizeToFit];
            
            recipeMethodstr = [arr_method objectAtIndex:0];
            
            [database close];

        }
        if([self.imageFile isEqualToString: @"Sea-Vegetables.jpg"])
        {
            [self databaseOpen];
            
            
            //For name
            
            NSString *queryname= [NSString stringWithFormat:@"Select recipe_subcategory,recipe_name,recipe_type from spring_tbl where recipe_name ='SEA VEGETABLES' AND recipe_type ='Cinch' "];
            recipeNameArr =[[NSMutableArray alloc]init];
            recipeNameArr =[[database executeQuery:queryname]mutableCopy];
            
            NSMutableArray *arr_name = [recipeNameArr valueForKey:@"recipe_subcategory"];
            recipeNamestr = [arr_name objectAtIndex:0];
            //self.recipe_namelbl.text = [arr_name objectAtIndex:0];
            
            
            //For ingredients
            
            NSString *queryingredients=[ NSString stringWithFormat:@"Select recipe_ingredients from spring_tbl where recipe_name ='SEA VEGETABLES' AND recipe_type ='Cinch' "];
            recipeIngredientsArr =[[NSMutableArray alloc]init];
            recipeIngredientsArr =[[database executeQuery:queryingredients]mutableCopy];
            
            
            NSMutableArray *arr_ingredients  = [recipeIngredientsArr valueForKey:@"recipe_ingredients"];
            NSLog(@"%@",arr_ingredients);
            recipeIngredientsstr = [arr_ingredients objectAtIndex:0];
            //self.recipe_ingredientslbl.text = [arr_ingredients objectAtIndex:0];
            // [self.recipe_ingredientslbl sizeToFit];
            
            //For method
            NSString *querymethod=[ NSString stringWithFormat:@"Select recipe_method from spring_tbl where recipe_name ='SEA VEGETABLES' AND recipe_type ='Cinch' "];
            recipeMethodArr =[[NSMutableArray alloc]init];
            recipeMethodArr =[[database executeQuery:querymethod]mutableCopy];
            
            
            NSMutableArray *arr_method  = [recipeMethodArr valueForKey:@"recipe_method"];
            NSLog(@"%@",arr_ingredients);
            
            //self.recipe_methodlbl.text = [arr_method objectAtIndex:0];
            //[self.recipe_methodlbl sizeToFit];
            
            
            recipeMethodstr = [arr_method objectAtIndex:0];
            [database close];

        }
        if([self.imageFile isEqualToString: @"Strawberry.jpg"])
        {
            [self databaseOpen];
            
            
            //For name
            
            NSString *queryname= [NSString stringWithFormat:@"Select recipe_subcategory,recipe_name,recipe_type from spring_tbl where recipe_name ='STRAWBERRY' AND recipe_type ='Cinch' "];
            recipeNameArr =[[NSMutableArray alloc]init];
            recipeNameArr =[[database executeQuery:queryname]mutableCopy];
            
            NSMutableArray *arr_name = [recipeNameArr valueForKey:@"recipe_subcategory"];
            recipeNamestr = [arr_name objectAtIndex:0];
            //self.recipe_namelbl.text = [arr_name objectAtIndex:0];
            
            
            //For ingredients
            
            NSString *queryingredients=[ NSString stringWithFormat:@"Select recipe_ingredients from spring_tbl where recipe_name ='STRAWBERRY' AND recipe_type ='Cinch' "];
            recipeIngredientsArr =[[NSMutableArray alloc]init];
            recipeIngredientsArr =[[database executeQuery:queryingredients]mutableCopy];
            
            
            NSMutableArray *arr_ingredients  = [recipeIngredientsArr valueForKey:@"recipe_ingredients"];
            NSLog(@"%@",arr_ingredients);
            recipeIngredientsstr = [arr_ingredients objectAtIndex:0];
            //self.recipe_ingredientslbl.text = [arr_ingredients objectAtIndex:0];
            // [self.recipe_ingredientslbl sizeToFit];
            
            //For method
            NSString *querymethod=[ NSString stringWithFormat:@"Select recipe_method from spring_tbl where recipe_name ='STRAWBERRY' AND recipe_type ='Cinch' "];
            recipeMethodArr =[[NSMutableArray alloc]init];
            recipeMethodArr =[[database executeQuery:querymethod]mutableCopy];
            
            
            NSMutableArray *arr_method  = [recipeMethodArr valueForKey:@"recipe_method"];
            NSLog(@"%@",arr_ingredients);
            
            //self.recipe_methodlbl.text = [arr_method objectAtIndex:0];
            //[self.recipe_methodlbl sizeToFit];
            
            recipeMethodstr = [arr_method objectAtIndex:0];
            
            [database close];

        }
        if([self.imageFile isEqualToString: @"Sunflower-Seeds.jpg"])
        {
            [self databaseOpen];
            
            
            //For name
            
            NSString *queryname= [NSString stringWithFormat:@"Select recipe_subcategory,recipe_name,recipe_type from spring_tbl where recipe_name ='SUNFLOWER SEEDS' AND recipe_type ='Cinch' "];
            recipeNameArr =[[NSMutableArray alloc]init];
            recipeNameArr =[[database executeQuery:queryname]mutableCopy];
            
            NSMutableArray *arr_name = [recipeNameArr valueForKey:@"recipe_subcategory"];
            recipeNamestr = [arr_name objectAtIndex:0];
            //self.recipe_namelbl.text = [arr_name objectAtIndex:0];
            
            
            //For ingredients
            
            NSString *queryingredients=[ NSString stringWithFormat:@"Select recipe_ingredients from spring_tbl where recipe_name ='SUNFLOWER SEEDS' AND recipe_type ='Cinch' "];
            recipeIngredientsArr =[[NSMutableArray alloc]init];
            recipeIngredientsArr =[[database executeQuery:queryingredients]mutableCopy];
            
            
            NSMutableArray *arr_ingredients  = [recipeIngredientsArr valueForKey:@"recipe_ingredients"];
            NSLog(@"%@",arr_ingredients);
            recipeIngredientsstr = [arr_ingredients objectAtIndex:0];
            //self.recipe_ingredientslbl.text = [arr_ingredients objectAtIndex:0];
            // [self.recipe_ingredientslbl sizeToFit];
            
            //For method
            NSString *querymethod=[ NSString stringWithFormat:@"Select recipe_method from spring_tbl where recipe_name ='SUNFLOWER SEEDS' AND recipe_type ='Cinch' "];
            recipeMethodArr =[[NSMutableArray alloc]init];
            recipeMethodArr =[[database executeQuery:querymethod]mutableCopy];
            
            
            NSMutableArray *arr_method  = [recipeMethodArr valueForKey:@"recipe_method"];
            NSLog(@"%@",arr_ingredients);
            
            //self.recipe_methodlbl.text = [arr_method objectAtIndex:0];
            //[self.recipe_methodlbl sizeToFit];
            
            recipeMethodstr = [arr_method objectAtIndex:0];
            
            [database close];

        }
        if([self.imageFile isEqualToString: @"Watercress.jpg"])
        {
            [self databaseOpen];
            
            
            //For name
            
            NSString *queryname= [NSString stringWithFormat:@"Select recipe_subcategory,recipe_name,recipe_type from spring_tbl where recipe_name ='WATERCRESS' AND recipe_type ='Cinch' "];
            recipeNameArr =[[NSMutableArray alloc]init];
            recipeNameArr =[[database executeQuery:queryname]mutableCopy];
            
            NSMutableArray *arr_name = [recipeNameArr valueForKey:@"recipe_subcategory"];
            recipeNamestr = [arr_name objectAtIndex:0];
            //self.recipe_namelbl.text = [arr_name objectAtIndex:0];
            
            
            //For ingredients
            
            NSString *queryingredients=[ NSString stringWithFormat:@"Select recipe_ingredients from spring_tbl where recipe_name ='WATERCRESS' AND recipe_type ='Cinch' "];
            recipeIngredientsArr =[[NSMutableArray alloc]init];
            recipeIngredientsArr =[[database executeQuery:queryingredients]mutableCopy];
            
            
            NSMutableArray *arr_ingredients  = [recipeIngredientsArr valueForKey:@"recipe_ingredients"];
            NSLog(@"%@",arr_ingredients);
            recipeIngredientsstr = [arr_ingredients objectAtIndex:0];
            //self.recipe_ingredientslbl.text = [arr_ingredients objectAtIndex:0];
            // [self.recipe_ingredientslbl sizeToFit];
            
            //For method
            NSString *querymethod=[ NSString stringWithFormat:@"Select recipe_method from spring_tbl where recipe_name ='WATERCRESS' AND recipe_type ='Cinch' "];
            recipeMethodArr =[[NSMutableArray alloc]init];
            recipeMethodArr =[[database executeQuery:querymethod]mutableCopy];
            
            
            NSMutableArray *arr_method  = [recipeMethodArr valueForKey:@"recipe_method"];
            NSLog(@"%@",arr_ingredients);
            
            //self.recipe_methodlbl.text = [arr_method objectAtIndex:0];
            //[self.recipe_methodlbl sizeToFit];
            
            
            recipeMethodstr = [arr_method objectAtIndex:0];
            [database close];

        }
       [self performSegueWithIdentifier:@"cinchsegue" sender:self];
    }
    
    else if ([season isEqualToString:@"winter"])
    {
        if([self.imageFile isEqualToString: @"Cod.jpg"])
        {
            [self databaseOpen];
            
            
            //For name
            
            NSString *queryname= [NSString stringWithFormat:@"Select recipe_subcategory,recipe_name,recipe_type from winter_tbl where recipe_name ='Cod' AND recipe_type ='Cinch' "];
            recipeNameArr =[[NSMutableArray alloc]init];
            recipeNameArr =[[database executeQuery:queryname]mutableCopy];
            
            NSMutableArray *arr_name = [recipeNameArr valueForKey:@"recipe_subcategory"];
            
            //self.recipe_namelbl.text = [arr_name objectAtIndex:0];
            
            recipeNamestr = [arr_name objectAtIndex:0];
            
            //For ingredients
            
            NSString *queryingredients=[ NSString stringWithFormat:@"Select recipe_ingredients from winter_tbl where recipe_name ='Cod' AND recipe_type ='Cinch' "];
            recipeIngredientsArr =[[NSMutableArray alloc]init];
            recipeIngredientsArr =[[database executeQuery:queryingredients]mutableCopy];
            
            
            NSMutableArray *arr_ingredients  = [recipeIngredientsArr valueForKey:@"recipe_ingredients"];
            NSLog(@"%@",arr_ingredients);
            
            //self.recipe_ingredientslbl.text = [arr_ingredients objectAtIndex:0];
            // [self.recipe_ingredientslbl sizeToFit];
            
            recipeIngredientsstr = [arr_ingredients objectAtIndex:0];
            
            //For method
            NSString *querymethod=[ NSString stringWithFormat:@"Select recipe_method from winter_tbl where recipe_name ='Cod' AND recipe_type ='Cinch' "];
            recipeMethodArr =[[NSMutableArray alloc]init];
            recipeMethodArr =[[database executeQuery:querymethod]mutableCopy];
            
            
            NSMutableArray *arr_method  = [recipeMethodArr valueForKey:@"recipe_method"];
            NSLog(@"%@",arr_method);
            
            //self.recipe_methodlbl.text = [arr_method objectAtIndex:0];
            //[self.recipe_methodlbl sizeToFit];
            recipeMethodstr = [arr_method objectAtIndex:0];
            
            
            
            [database close];
        }
        
        if([self.imageFile isEqualToString: @"Banana.jpg"])
        {
            [self databaseOpen];
            
            
            //For name
            
            NSString *queryname= [NSString stringWithFormat:@"Select recipe_subcategory,recipe_name,recipe_type from winter_tbl where recipe_name ='Banana' AND recipe_type ='Cinch' "];
            recipeNameArr =[[NSMutableArray alloc]init];
            recipeNameArr =[[database executeQuery:queryname]mutableCopy];
            
            NSMutableArray *arr_name = [recipeNameArr valueForKey:@"recipe_subcategory"];
            
            //self.recipe_namelbl.text = [arr_name objectAtIndex:0];
            
            recipeNamestr = [arr_name objectAtIndex:0];
            
            //For ingredients
            
            NSString *queryingredients=[ NSString stringWithFormat:@"Select recipe_ingredients from winter_tbl where recipe_name ='Banana' AND recipe_type ='Cinch' "];
            recipeIngredientsArr =[[NSMutableArray alloc]init];
            recipeIngredientsArr =[[database executeQuery:queryingredients]mutableCopy];
            
            
            NSMutableArray *arr_ingredients  = [recipeIngredientsArr valueForKey:@"recipe_ingredients"];
            NSLog(@"%@",arr_ingredients);
            
            //self.recipe_ingredientslbl.text = [arr_ingredients objectAtIndex:0];
            // [self.recipe_ingredientslbl sizeToFit];
            
            recipeIngredientsstr = [arr_ingredients objectAtIndex:0];
            
            //For method
            NSString *querymethod=[ NSString stringWithFormat:@"Select recipe_method from winter_tbl where recipe_name ='Banana' AND recipe_type ='Cinch' "];
            recipeMethodArr =[[NSMutableArray alloc]init];
            recipeMethodArr =[[database executeQuery:querymethod]mutableCopy];
            
            
            NSMutableArray *arr_method  = [recipeMethodArr valueForKey:@"recipe_method"];
            NSLog(@"%@",arr_method);
            
            //self.recipe_methodlbl.text = [arr_method objectAtIndex:0];
            //[self.recipe_methodlbl sizeToFit];
            recipeMethodstr = [arr_method objectAtIndex:0];
            
            
            
            [database close];
        }
        if([self.imageFile isEqualToString: @"Beef.jpg"])
        {
            [self databaseOpen];
            
            
            //For name
            
            NSString *queryname= [NSString stringWithFormat:@"Select recipe_subcategory,recipe_name,recipe_type from winter_tbl where recipe_name ='Beef' AND recipe_type ='Cinch' "];
            recipeNameArr =[[NSMutableArray alloc]init];
            recipeNameArr =[[database executeQuery:queryname]mutableCopy];
            
            NSMutableArray *arr_name = [recipeNameArr valueForKey:@"recipe_subcategory"];
            
            //self.recipe_namelbl.text = [arr_name objectAtIndex:0];
            
            recipeNamestr = [arr_name objectAtIndex:0];
            
            //For ingredients
            
            NSString *queryingredients=[ NSString stringWithFormat:@"Select recipe_ingredients from winter_tbl where recipe_name ='Beef' AND recipe_type ='Cinch' "];
            recipeIngredientsArr =[[NSMutableArray alloc]init];
            recipeIngredientsArr =[[database executeQuery:queryingredients]mutableCopy];
            
            
            NSMutableArray *arr_ingredients  = [recipeIngredientsArr valueForKey:@"recipe_ingredients"];
            NSLog(@"%@",arr_ingredients);
            
            //self.recipe_ingredientslbl.text = [arr_ingredients objectAtIndex:0];
            // [self.recipe_ingredientslbl sizeToFit];
            
            recipeIngredientsstr = [arr_ingredients objectAtIndex:0];
            
            //For method
            NSString *querymethod=[ NSString stringWithFormat:@"Select recipe_method from winter_tbl where recipe_name ='Beef' AND recipe_type ='Cinch' "];
            recipeMethodArr =[[NSMutableArray alloc]init];
            recipeMethodArr =[[database executeQuery:querymethod]mutableCopy];
            
            
            NSMutableArray *arr_method  = [recipeMethodArr valueForKey:@"recipe_method"];
            NSLog(@"%@",arr_method);
            
            //self.recipe_methodlbl.text = [arr_method objectAtIndex:0];
            //[self.recipe_methodlbl sizeToFit];
            recipeMethodstr = [arr_method objectAtIndex:0];
            
            
            
            [database close];
        }

        if([self.imageFile isEqualToString: @"Celeriac.jpg"])
        {
            [self databaseOpen];
            
            
            //For name
            
            NSString *queryname= [NSString stringWithFormat:@"Select recipe_subcategory,recipe_name,recipe_type from winter_tbl where recipe_name ='Celeriac' AND recipe_type ='Cinch' "];
            recipeNameArr =[[NSMutableArray alloc]init];
            recipeNameArr =[[database executeQuery:queryname]mutableCopy];
            
            NSMutableArray *arr_name = [recipeNameArr valueForKey:@"recipe_subcategory"];
            
            //self.recipe_namelbl.text = [arr_name objectAtIndex:0];
            
            recipeNamestr = [arr_name objectAtIndex:0];
            
            //For ingredients
            
            NSString *queryingredients=[ NSString stringWithFormat:@"Select recipe_ingredients from winter_tbl where recipe_name ='Celeriac' AND recipe_type ='Cinch' "];
            recipeIngredientsArr =[[NSMutableArray alloc]init];
            recipeIngredientsArr =[[database executeQuery:queryingredients]mutableCopy];
            
            
            NSMutableArray *arr_ingredients  = [recipeIngredientsArr valueForKey:@"recipe_ingredients"];
            NSLog(@"%@",arr_ingredients);
            
            //self.recipe_ingredientslbl.text = [arr_ingredients objectAtIndex:0];
            // [self.recipe_ingredientslbl sizeToFit];
            
            recipeIngredientsstr = [arr_ingredients objectAtIndex:0];
            
            //For method
            NSString *querymethod=[ NSString stringWithFormat:@"Select recipe_method from winter_tbl where recipe_name ='Celeriac' AND recipe_type ='Cinch' "];
            recipeMethodArr =[[NSMutableArray alloc]init];
            recipeMethodArr =[[database executeQuery:querymethod]mutableCopy];
            
            
            NSMutableArray *arr_method  = [recipeMethodArr valueForKey:@"recipe_method"];
            NSLog(@"%@",arr_method);
            
            //self.recipe_methodlbl.text = [arr_method objectAtIndex:0];
            //[self.recipe_methodlbl sizeToFit];
            recipeMethodstr = [arr_method objectAtIndex:0];
            
            
            
            [database close];
        }

        if([self.imageFile isEqualToString: @"Chocolate.jpg"])
        {
            [self databaseOpen];
            
            
            //For name
            
            NSString *queryname= [NSString stringWithFormat:@"Select recipe_subcategory,recipe_name,recipe_type from winter_tbl where recipe_name ='Chocolate' AND recipe_type ='Cinch' "];
            recipeNameArr =[[NSMutableArray alloc]init];
            recipeNameArr =[[database executeQuery:queryname]mutableCopy];
            
            NSMutableArray *arr_name = [recipeNameArr valueForKey:@"recipe_subcategory"];
            
            //self.recipe_namelbl.text = [arr_name objectAtIndex:0];
            
            recipeNamestr = [arr_name objectAtIndex:0];
            
            //For ingredients
            
            NSString *queryingredients=[ NSString stringWithFormat:@"Select recipe_ingredients from winter_tbl where recipe_name ='Chocolate' AND recipe_type ='Cinch' "];
            recipeIngredientsArr =[[NSMutableArray alloc]init];
            recipeIngredientsArr =[[database executeQuery:queryingredients]mutableCopy];
            
            
            NSMutableArray *arr_ingredients  = [recipeIngredientsArr valueForKey:@"recipe_ingredients"];
            NSLog(@"%@",arr_ingredients);
            
            //self.recipe_ingredientslbl.text = [arr_ingredients objectAtIndex:0];
            // [self.recipe_ingredientslbl sizeToFit];
            
            recipeIngredientsstr = [arr_ingredients objectAtIndex:0];
            
            //For method
            NSString *querymethod=[ NSString stringWithFormat:@"Select recipe_method from winter_tbl where recipe_name ='Chocolate' AND recipe_type ='Cinch' "];
            recipeMethodArr =[[NSMutableArray alloc]init];
            recipeMethodArr =[[database executeQuery:querymethod]mutableCopy];
            
            
            NSMutableArray *arr_method  = [recipeMethodArr valueForKey:@"recipe_method"];
            NSLog(@"%@",arr_method);
            
            //self.recipe_methodlbl.text = [arr_method objectAtIndex:0];
            //[self.recipe_methodlbl sizeToFit];
            recipeMethodstr = [arr_method objectAtIndex:0];
            
            
            
            [database close];
        }
        if([self.imageFile isEqualToString: @"Cinnamon.jpg"])
        {
            [self databaseOpen];
            
            
            //For name
            
            NSString *queryname= [NSString stringWithFormat:@"Select recipe_subcategory,recipe_name,recipe_type from winter_tbl where recipe_name ='Cinnamon' AND recipe_type ='Cinch' "];
            recipeNameArr =[[NSMutableArray alloc]init];
            recipeNameArr =[[database executeQuery:queryname]mutableCopy];
            
            NSMutableArray *arr_name = [recipeNameArr valueForKey:@"recipe_subcategory"];
            
            //self.recipe_namelbl.text = [arr_name objectAtIndex:0];
            
            recipeNamestr = [arr_name objectAtIndex:0];
            
            //For ingredients
            
            NSString *queryingredients=[ NSString stringWithFormat:@"Select recipe_ingredients from winter_tbl where recipe_name ='Cinnamon' AND recipe_type ='Cinch' "];
            recipeIngredientsArr =[[NSMutableArray alloc]init];
            recipeIngredientsArr =[[database executeQuery:queryingredients]mutableCopy];
            
            
            NSMutableArray *arr_ingredients  = [recipeIngredientsArr valueForKey:@"recipe_ingredients"];
            NSLog(@"%@",arr_ingredients);
            
            //self.recipe_ingredientslbl.text = [arr_ingredients objectAtIndex:0];
            // [self.recipe_ingredientslbl sizeToFit];
            
            recipeIngredientsstr = [arr_ingredients objectAtIndex:0];
            
            //For method
            NSString *querymethod=[ NSString stringWithFormat:@"Select recipe_method from winter_tbl where recipe_name ='Cinnamon' AND recipe_type ='Cinch' "];
            recipeMethodArr =[[NSMutableArray alloc]init];
            recipeMethodArr =[[database executeQuery:querymethod]mutableCopy];
            
            
            NSMutableArray *arr_method  = [recipeMethodArr valueForKey:@"recipe_method"];
            NSLog(@"%@",arr_method);
            
            //self.recipe_methodlbl.text = [arr_method objectAtIndex:0];
            //[self.recipe_methodlbl sizeToFit];
            recipeMethodstr = [arr_method objectAtIndex:0];
            
            
            
            [database close];
        }
        if([self.imageFile isEqualToString: @"Coconut.jpg"])
        {
            [self databaseOpen];
            
            
            //For name
            
            NSString *queryname= [NSString stringWithFormat:@"Select recipe_subcategory,recipe_name,recipe_type from winter_tbl where recipe_name ='Coconut' AND recipe_type ='Cinch' "];
            recipeNameArr =[[NSMutableArray alloc]init];
            recipeNameArr =[[database executeQuery:queryname]mutableCopy];
            
            NSMutableArray *arr_name = [recipeNameArr valueForKey:@"recipe_subcategory"];
            
            //self.recipe_namelbl.text = [arr_name objectAtIndex:0];
            
            recipeNamestr = [arr_name objectAtIndex:0];
            
            //For ingredients
            
            NSString *queryingredients=[ NSString stringWithFormat:@"Select recipe_ingredients from winter_tbl where recipe_name ='Coconut' AND recipe_type ='Cinch' "];
            recipeIngredientsArr =[[NSMutableArray alloc]init];
            recipeIngredientsArr =[[database executeQuery:queryingredients]mutableCopy];
            
            
            NSMutableArray *arr_ingredients  = [recipeIngredientsArr valueForKey:@"recipe_ingredients"];
            NSLog(@"%@",arr_ingredients);
            
            //self.recipe_ingredientslbl.text = [arr_ingredients objectAtIndex:0];
            // [self.recipe_ingredientslbl sizeToFit];
            
            recipeIngredientsstr = [arr_ingredients objectAtIndex:0];
            
            //For method
            NSString *querymethod=[ NSString stringWithFormat:@"Select recipe_method from winter_tbl where recipe_name ='Coconut' AND recipe_type ='Cinch' "];
            recipeMethodArr =[[NSMutableArray alloc]init];
            recipeMethodArr =[[database executeQuery:querymethod]mutableCopy];
            
            
            NSMutableArray *arr_method  = [recipeMethodArr valueForKey:@"recipe_method"];
            NSLog(@"%@",arr_method);
            
            //self.recipe_methodlbl.text = [arr_method objectAtIndex:0];
            //[self.recipe_methodlbl sizeToFit];
            recipeMethodstr = [arr_method objectAtIndex:0];
            
            
            
            [database close];
        }
        
        if([self.imageFile isEqualToString: @"Date.jpg"])
        {
            [self databaseOpen];
            
            
            //For name
            
            NSString *queryname= [NSString stringWithFormat:@"Select recipe_subcategory,recipe_name,recipe_type from winter_tbl where recipe_name ='Date' AND recipe_type ='Cinch' "];
            recipeNameArr =[[NSMutableArray alloc]init];
            recipeNameArr =[[database executeQuery:queryname]mutableCopy];
            
            NSMutableArray *arr_name = [recipeNameArr valueForKey:@"recipe_subcategory"];
            
            //self.recipe_namelbl.text = [arr_name objectAtIndex:0];
            
            recipeNamestr = [arr_name objectAtIndex:0];
            
            //For ingredients
            
            NSString *queryingredients=[ NSString stringWithFormat:@"Select recipe_ingredients from winter_tbl where recipe_name ='Date' AND recipe_type ='Cinch' "];
            recipeIngredientsArr =[[NSMutableArray alloc]init];
            recipeIngredientsArr =[[database executeQuery:queryingredients]mutableCopy];
            
            
            NSMutableArray *arr_ingredients  = [recipeIngredientsArr valueForKey:@"recipe_ingredients"];
            NSLog(@"%@",arr_ingredients);
            
            //self.recipe_ingredientslbl.text = [arr_ingredients objectAtIndex:0];
            // [self.recipe_ingredientslbl sizeToFit];
            
            recipeIngredientsstr = [arr_ingredients objectAtIndex:0];
            
            //For method
            NSString *querymethod=[ NSString stringWithFormat:@"Select recipe_method from winter_tbl where recipe_name ='Date' AND recipe_type ='Cinch' "];
            recipeMethodArr =[[NSMutableArray alloc]init];
            recipeMethodArr =[[database executeQuery:querymethod]mutableCopy];
            
            
            NSMutableArray *arr_method  = [recipeMethodArr valueForKey:@"recipe_method"];
            NSLog(@"%@",arr_method);
            
            //self.recipe_methodlbl.text = [arr_method objectAtIndex:0];
            //[self.recipe_methodlbl sizeToFit];
            recipeMethodstr = [arr_method objectAtIndex:0];
            
            
            
            [database close];
        }
        if([self.imageFile isEqualToString: @"Kale.jpg"])
        {
            [self databaseOpen];
            
            
            //For name
            
            NSString *queryname= [NSString stringWithFormat:@"Select recipe_subcategory,recipe_name,recipe_type from winter_tbl where recipe_name ='Kale' AND recipe_type ='Cinch' "];
            recipeNameArr =[[NSMutableArray alloc]init];
            recipeNameArr =[[database executeQuery:queryname]mutableCopy];
            
            NSMutableArray *arr_name = [recipeNameArr valueForKey:@"recipe_subcategory"];
            
            //self.recipe_namelbl.text = [arr_name objectAtIndex:0];
            
            recipeNamestr = [arr_name objectAtIndex:0];
            
            //For ingredients
            
            NSString *queryingredients=[ NSString stringWithFormat:@"Select recipe_ingredients from winter_tbl where recipe_name ='Kale' AND recipe_type ='Cinch' "];
            recipeIngredientsArr =[[NSMutableArray alloc]init];
            recipeIngredientsArr =[[database executeQuery:queryingredients]mutableCopy];
            
            
            NSMutableArray *arr_ingredients  = [recipeIngredientsArr valueForKey:@"recipe_ingredients"];
            NSLog(@"%@",arr_ingredients);
            
            //self.recipe_ingredientslbl.text = [arr_ingredients objectAtIndex:0];
            // [self.recipe_ingredientslbl sizeToFit];
            
            recipeIngredientsstr = [arr_ingredients objectAtIndex:0];
            
            //For method
            NSString *querymethod=[ NSString stringWithFormat:@"Select recipe_method from winter_tbl where recipe_name ='Kale' AND recipe_type ='Cinch' "];
            recipeMethodArr =[[NSMutableArray alloc]init];
            recipeMethodArr =[[database executeQuery:querymethod]mutableCopy];
            
            
            NSMutableArray *arr_method  = [recipeMethodArr valueForKey:@"recipe_method"];
            NSLog(@"%@",arr_method);
            
            //self.recipe_methodlbl.text = [arr_method objectAtIndex:0];
            //[self.recipe_methodlbl sizeToFit];
            recipeMethodstr = [arr_method objectAtIndex:0];
            
            
            
            [database close];
        }
        if([self.imageFile isEqualToString: @"Kiwi.jpg"])
        {
            [self databaseOpen];
            
            
            //For name
            
            NSString *queryname= [NSString stringWithFormat:@"Select recipe_subcategory,recipe_name,recipe_type from winter_tbl where recipe_name ='Kiwi' AND recipe_type ='Cinch' "];
            recipeNameArr =[[NSMutableArray alloc]init];
            recipeNameArr =[[database executeQuery:queryname]mutableCopy];
            
            NSMutableArray *arr_name = [recipeNameArr valueForKey:@"recipe_subcategory"];
            
            //self.recipe_namelbl.text = [arr_name objectAtIndex:0];
            
            recipeNamestr = [arr_name objectAtIndex:0];
            
            //For ingredients
            
            NSString *queryingredients=[ NSString stringWithFormat:@"Select recipe_ingredients from winter_tbl where recipe_name ='Kiwi' AND recipe_type ='Cinch' "];
            recipeIngredientsArr =[[NSMutableArray alloc]init];
            recipeIngredientsArr =[[database executeQuery:queryingredients]mutableCopy];
            
            
            NSMutableArray *arr_ingredients  = [recipeIngredientsArr valueForKey:@"recipe_ingredients"];
            NSLog(@"%@",arr_ingredients);
            
            //self.recipe_ingredientslbl.text = [arr_ingredients objectAtIndex:0];
            // [self.recipe_ingredientslbl sizeToFit];
            
            recipeIngredientsstr = [arr_ingredients objectAtIndex:0];
            
            //For method
            NSString *querymethod=[ NSString stringWithFormat:@"Select recipe_method from winter_tbl where recipe_name ='Kiwi' AND recipe_type ='Cinch' "];
            recipeMethodArr =[[NSMutableArray alloc]init];
            recipeMethodArr =[[database executeQuery:querymethod]mutableCopy];
            
            
            NSMutableArray *arr_method  = [recipeMethodArr valueForKey:@"recipe_method"];
            NSLog(@"%@",arr_method);
            
            //self.recipe_methodlbl.text = [arr_method objectAtIndex:0];
            //[self.recipe_methodlbl sizeToFit];
            recipeMethodstr = [arr_method objectAtIndex:0];
            
            
            
            [database close];
        }
        
        
        if([self.imageFile isEqualToString: @"Lentil.jpg"])
        {
            [self databaseOpen];
            
            
            //For name
            
            NSString *queryname= [NSString stringWithFormat:@"Select recipe_subcategory,recipe_name,recipe_type from winter_tbl where recipe_name ='Lentil' AND recipe_type ='Cinch' "];
            recipeNameArr =[[NSMutableArray alloc]init];
            recipeNameArr =[[database executeQuery:queryname]mutableCopy];
            
            NSMutableArray *arr_name = [recipeNameArr valueForKey:@"recipe_subcategory"];
            
            //self.recipe_namelbl.text = [arr_name objectAtIndex:0];
            
            recipeNamestr = [arr_name objectAtIndex:0];
            
            //For ingredients
            
            NSString *queryingredients=[ NSString stringWithFormat:@"Select recipe_ingredients from winter_tbl where recipe_name ='Lentil' AND recipe_type ='Cinch' "];
            recipeIngredientsArr =[[NSMutableArray alloc]init];
            recipeIngredientsArr =[[database executeQuery:queryingredients]mutableCopy];
            
            
            NSMutableArray *arr_ingredients  = [recipeIngredientsArr valueForKey:@"recipe_ingredients"];
            NSLog(@"%@",arr_ingredients);
            
            //self.recipe_ingredientslbl.text = [arr_ingredients objectAtIndex:0];
            // [self.recipe_ingredientslbl sizeToFit];
            
            recipeIngredientsstr = [arr_ingredients objectAtIndex:0];
            
            //For method
            NSString *querymethod=[ NSString stringWithFormat:@"Select recipe_method from winter_tbl where recipe_name ='Lentil' AND recipe_type ='Cinch' "];
            recipeMethodArr =[[NSMutableArray alloc]init];
            recipeMethodArr =[[database executeQuery:querymethod]mutableCopy];
            
            
            NSMutableArray *arr_method  = [recipeMethodArr valueForKey:@"recipe_method"];
            NSLog(@"%@",arr_method);
            
            //self.recipe_methodlbl.text = [arr_method objectAtIndex:0];
            //[self.recipe_methodlbl sizeToFit];
            recipeMethodstr = [arr_method objectAtIndex:0];
            
            
            
            [database close];
        }
        
        if([self.imageFile isEqualToString: @"Mango.jpg"])
        {
            [self databaseOpen];
            
            
            //For name
            
            NSString *queryname= [NSString stringWithFormat:@"Select recipe_subcategory,recipe_name,recipe_type from winter_tbl where recipe_name ='Mango' AND recipe_type ='Cinch' "];
            recipeNameArr =[[NSMutableArray alloc]init];
            recipeNameArr =[[database executeQuery:queryname]mutableCopy];
            
            NSMutableArray *arr_name = [recipeNameArr valueForKey:@"recipe_subcategory"];
            
            //self.recipe_namelbl.text = [arr_name objectAtIndex:0];
            
            recipeNamestr = [arr_name objectAtIndex:0];
            
            //For ingredients
            
            NSString *queryingredients=[ NSString stringWithFormat:@"Select recipe_ingredients from winter_tbl where recipe_name ='Mango' AND recipe_type ='Cinch' "];
            recipeIngredientsArr =[[NSMutableArray alloc]init];
            recipeIngredientsArr =[[database executeQuery:queryingredients]mutableCopy];
            
            
            NSMutableArray *arr_ingredients  = [recipeIngredientsArr valueForKey:@"recipe_ingredients"];
            NSLog(@"%@",arr_ingredients);
            
            //self.recipe_ingredientslbl.text = [arr_ingredients objectAtIndex:0];
            // [self.recipe_ingredientslbl sizeToFit];
            
            recipeIngredientsstr = [arr_ingredients objectAtIndex:0];
            
            //For method
            NSString *querymethod=[ NSString stringWithFormat:@"Select recipe_method from winter_tbl where recipe_name ='Mango' AND recipe_type ='Cinch' "];
            recipeMethodArr =[[NSMutableArray alloc]init];
            recipeMethodArr =[[database executeQuery:querymethod]mutableCopy];
            
            
            NSMutableArray *arr_method  = [recipeMethodArr valueForKey:@"recipe_method"];
            NSLog(@"%@",arr_method);
            
            //self.recipe_methodlbl.text = [arr_method objectAtIndex:0];
            //[self.recipe_methodlbl sizeToFit];
            recipeMethodstr = [arr_method objectAtIndex:0];
            
            
            
            [database close];
        }
        
        if([self.imageFile isEqualToString: @"Mushroom.jpg"])
        {
            [self databaseOpen];
            
            
            //For name
            
            NSString *queryname= [NSString stringWithFormat:@"Select recipe_subcategory,recipe_name,recipe_type from winter_tbl where recipe_name ='Mushroom' AND recipe_type ='Cinch' "];
            recipeNameArr =[[NSMutableArray alloc]init];
            recipeNameArr =[[database executeQuery:queryname]mutableCopy];
            
            NSMutableArray *arr_name = [recipeNameArr valueForKey:@"recipe_subcategory"];
            
            //self.recipe_namelbl.text = [arr_name objectAtIndex:0];
            
            recipeNamestr = [arr_name objectAtIndex:0];
            
            //For ingredients
            
            NSString *queryingredients=[ NSString stringWithFormat:@"Select recipe_ingredients from winter_tbl where recipe_name ='Mushroom' AND recipe_type ='Cinch' "];
            recipeIngredientsArr =[[NSMutableArray alloc]init];
            recipeIngredientsArr =[[database executeQuery:queryingredients]mutableCopy];
            
            
            NSMutableArray *arr_ingredients  = [recipeIngredientsArr valueForKey:@"recipe_ingredients"];
            NSLog(@"%@",arr_ingredients);
            
            //self.recipe_ingredientslbl.text = [arr_ingredients objectAtIndex:0];
            // [self.recipe_ingredientslbl sizeToFit];
            
            recipeIngredientsstr = [arr_ingredients objectAtIndex:0];
            
            //For method
            NSString *querymethod=[ NSString stringWithFormat:@"Select recipe_method from winter_tbl where recipe_name ='Mushroom' AND recipe_type ='Cinch' "];
            recipeMethodArr =[[NSMutableArray alloc]init];
            recipeMethodArr =[[database executeQuery:querymethod]mutableCopy];
            
            
            NSMutableArray *arr_method  = [recipeMethodArr valueForKey:@"recipe_method"];
            NSLog(@"%@",arr_method);
            
            //self.recipe_methodlbl.text = [arr_method objectAtIndex:0];
            //[self.recipe_methodlbl sizeToFit];
            recipeMethodstr = [arr_method objectAtIndex:0];
            
            
            
            [database close];
        }
        
        if([self.imageFile isEqualToString: @"Onion.jpg"])
        {
            [self databaseOpen];
            
            
            //For name
            
            NSString *queryname= [NSString stringWithFormat:@"Select recipe_subcategory,recipe_name,recipe_type from winter_tbl where recipe_name ='Onion' AND recipe_type ='Cinch' "];
            recipeNameArr =[[NSMutableArray alloc]init];
            recipeNameArr =[[database executeQuery:queryname]mutableCopy];
            
            NSMutableArray *arr_name = [recipeNameArr valueForKey:@"recipe_subcategory"];
            
            //self.recipe_namelbl.text = [arr_name objectAtIndex:0];
            
            recipeNamestr = [arr_name objectAtIndex:0];
            
            //For ingredients
            
            NSString *queryingredients=[ NSString stringWithFormat:@"Select recipe_ingredients from winter_tbl where recipe_name ='Onion' AND recipe_type ='Cinch' "];
            recipeIngredientsArr =[[NSMutableArray alloc]init];
            recipeIngredientsArr =[[database executeQuery:queryingredients]mutableCopy];
            
            
            NSMutableArray *arr_ingredients  = [recipeIngredientsArr valueForKey:@"recipe_ingredients"];
            NSLog(@"%@",arr_ingredients);
            
            //self.recipe_ingredientslbl.text = [arr_ingredients objectAtIndex:0];
            // [self.recipe_ingredientslbl sizeToFit];
            
            recipeIngredientsstr = [arr_ingredients objectAtIndex:0];
            
            //For method
            NSString *querymethod=[ NSString stringWithFormat:@"Select recipe_method from winter_tbl where recipe_name ='Onion' AND recipe_type ='Cinch' "];
            recipeMethodArr =[[NSMutableArray alloc]init];
            recipeMethodArr =[[database executeQuery:querymethod]mutableCopy];
            
            
            NSMutableArray *arr_method  = [recipeMethodArr valueForKey:@"recipe_method"];
            NSLog(@"%@",arr_method);
            
            //self.recipe_methodlbl.text = [arr_method objectAtIndex:0];
            //[self.recipe_methodlbl sizeToFit];
            recipeMethodstr = [arr_method objectAtIndex:0];
            
            
            
            [database close];
        }
        
        if([self.imageFile isEqualToString: @"Orange.jpg"])
        {
            [self databaseOpen];
            
            
            //For name
            
            NSString *queryname= [NSString stringWithFormat:@"Select recipe_subcategory,recipe_name,recipe_type from winter_tbl where recipe_name ='Orange' AND recipe_type ='Cinch' "];
            recipeNameArr =[[NSMutableArray alloc]init];
            recipeNameArr =[[database executeQuery:queryname]mutableCopy];
            
            NSMutableArray *arr_name = [recipeNameArr valueForKey:@"recipe_subcategory"];
            
            //self.recipe_namelbl.text = [arr_name objectAtIndex:0];
            
            recipeNamestr = [arr_name objectAtIndex:0];
            
            //For ingredients
            
            NSString *queryingredients=[ NSString stringWithFormat:@"Select recipe_ingredients from winter_tbl where recipe_name ='Orange' AND recipe_type ='Cinch' "];
            recipeIngredientsArr =[[NSMutableArray alloc]init];
            recipeIngredientsArr =[[database executeQuery:queryingredients]mutableCopy];
            
            
            NSMutableArray *arr_ingredients  = [recipeIngredientsArr valueForKey:@"recipe_ingredients"];
            NSLog(@"%@",arr_ingredients);
            
            //self.recipe_ingredientslbl.text = [arr_ingredients objectAtIndex:0];
            // [self.recipe_ingredientslbl sizeToFit];
            
            recipeIngredientsstr = [arr_ingredients objectAtIndex:0];
            
            //For method
            NSString *querymethod=[ NSString stringWithFormat:@"Select recipe_method from winter_tbl where recipe_name ='Orange' AND recipe_type ='Cinch' "];
            recipeMethodArr =[[NSMutableArray alloc]init];
            recipeMethodArr =[[database executeQuery:querymethod]mutableCopy];
            
            
            NSMutableArray *arr_method  = [recipeMethodArr valueForKey:@"recipe_method"];
            NSLog(@"%@",arr_method);
            
            //self.recipe_methodlbl.text = [arr_method objectAtIndex:0];
            //[self.recipe_methodlbl sizeToFit];
            recipeMethodstr = [arr_method objectAtIndex:0];
            
            
            
            [database close];
        }
        if([self.imageFile isEqualToString: @"Papaya.jpg"])
        {
            [self databaseOpen];
            
            
            //For name
            
            NSString *queryname= [NSString stringWithFormat:@"Select recipe_subcategory,recipe_name,recipe_type from winter_tbl where recipe_name ='Papaya' AND recipe_type ='Cinch' "];
            recipeNameArr =[[NSMutableArray alloc]init];
            recipeNameArr =[[database executeQuery:queryname]mutableCopy];
            
            NSMutableArray *arr_name = [recipeNameArr valueForKey:@"recipe_subcategory"];
            
            //self.recipe_namelbl.text = [arr_name objectAtIndex:0];
            
            recipeNamestr = [arr_name objectAtIndex:0];
            
            //For ingredients
            
            NSString *queryingredients=[ NSString stringWithFormat:@"Select recipe_ingredients from winter_tbl where recipe_name ='Papaya' AND recipe_type ='Cinch' "];
            recipeIngredientsArr =[[NSMutableArray alloc]init];
            recipeIngredientsArr =[[database executeQuery:queryingredients]mutableCopy];
            
            
            NSMutableArray *arr_ingredients  = [recipeIngredientsArr valueForKey:@"recipe_ingredients"];
            NSLog(@"%@",arr_ingredients);
            
            //self.recipe_ingredientslbl.text = [arr_ingredients objectAtIndex:0];
            // [self.recipe_ingredientslbl sizeToFit];
            
            recipeIngredientsstr = [arr_ingredients objectAtIndex:0];
            
            //For method
            NSString *querymethod=[ NSString stringWithFormat:@"Select recipe_method from winter_tbl where recipe_name ='Papaya' AND recipe_type ='Cinch' "];
            recipeMethodArr =[[NSMutableArray alloc]init];
            recipeMethodArr =[[database executeQuery:querymethod]mutableCopy];
            
            
            NSMutableArray *arr_method  = [recipeMethodArr valueForKey:@"recipe_method"];
            NSLog(@"%@",arr_method);
            
            //self.recipe_methodlbl.text = [arr_method objectAtIndex:0];
            //[self.recipe_methodlbl sizeToFit];
            recipeMethodstr = [arr_method objectAtIndex:0];
            
            
            
            [database close];
        }
        
        if([self.imageFile isEqualToString: @"Parsnip.jpg"])
        {
            [self databaseOpen];
            
            
            //For name
            
            NSString *queryname= [NSString stringWithFormat:@"Select recipe_subcategory,recipe_name,recipe_type from winter_tbl where recipe_name ='Parsnip' AND recipe_type ='Cinch' "];
            recipeNameArr =[[NSMutableArray alloc]init];
            recipeNameArr =[[database executeQuery:queryname]mutableCopy];
            
            NSMutableArray *arr_name = [recipeNameArr valueForKey:@"recipe_subcategory"];
            
            //self.recipe_namelbl.text = [arr_name objectAtIndex:0];
            
            recipeNamestr = [arr_name objectAtIndex:0];
            
            //For ingredients
            
            NSString *queryingredients=[ NSString stringWithFormat:@"Select recipe_ingredients from winter_tbl where recipe_name ='Parsnip' AND recipe_type ='Cinch' "];
            recipeIngredientsArr =[[NSMutableArray alloc]init];
            recipeIngredientsArr =[[database executeQuery:queryingredients]mutableCopy];
            
            
            NSMutableArray *arr_ingredients  = [recipeIngredientsArr valueForKey:@"recipe_ingredients"];
            NSLog(@"%@",arr_ingredients);
            
            //self.recipe_ingredientslbl.text = [arr_ingredients objectAtIndex:0];
            // [self.recipe_ingredientslbl sizeToFit];
            
            recipeIngredientsstr = [arr_ingredients objectAtIndex:0];
            
            //For method
            NSString *querymethod=[ NSString stringWithFormat:@"Select recipe_method from winter_tbl where recipe_name ='Parsnip' AND recipe_type ='Cinch' "];
            recipeMethodArr =[[NSMutableArray alloc]init];
            recipeMethodArr =[[database executeQuery:querymethod]mutableCopy];
            
            
            NSMutableArray *arr_method  = [recipeMethodArr valueForKey:@"recipe_method"];
            NSLog(@"%@",arr_method);
            
            //self.recipe_methodlbl.text = [arr_method objectAtIndex:0];
            //[self.recipe_methodlbl sizeToFit];
            recipeMethodstr = [arr_method objectAtIndex:0];
            
            
            
            [database close];
        }
        
        if([self.imageFile isEqualToString: @"Pear.jpg"])
        {
            [self databaseOpen];
            
            
            //For name
            
            NSString *queryname= [NSString stringWithFormat:@"Select recipe_subcategory,recipe_name,recipe_type from winter_tbl where recipe_name ='Pear' AND recipe_type ='Cinch' "];
            recipeNameArr =[[NSMutableArray alloc]init];
            recipeNameArr =[[database executeQuery:queryname]mutableCopy];
            
            NSMutableArray *arr_name = [recipeNameArr valueForKey:@"recipe_subcategory"];
            
            //self.recipe_namelbl.text = [arr_name objectAtIndex:0];
            
            recipeNamestr = [arr_name objectAtIndex:0];
            
            //For ingredients
            
            NSString *queryingredients=[ NSString stringWithFormat:@"Select recipe_ingredients from winter_tbl where recipe_name ='Pear' AND recipe_type ='Cinch' "];
            recipeIngredientsArr =[[NSMutableArray alloc]init];
            recipeIngredientsArr =[[database executeQuery:queryingredients]mutableCopy];
            
            
            NSMutableArray *arr_ingredients  = [recipeIngredientsArr valueForKey:@"recipe_ingredients"];
            NSLog(@"%@",arr_ingredients);
            
            //self.recipe_ingredientslbl.text = [arr_ingredients objectAtIndex:0];
            // [self.recipe_ingredientslbl sizeToFit];
            
            recipeIngredientsstr = [arr_ingredients objectAtIndex:0];
            
            //For method
            NSString *querymethod=[ NSString stringWithFormat:@"Select recipe_method from winter_tbl where recipe_name ='Pear' AND recipe_type ='Cinch' "];
            recipeMethodArr =[[NSMutableArray alloc]init];
            recipeMethodArr =[[database executeQuery:querymethod]mutableCopy];
            
            
            NSMutableArray *arr_method  = [recipeMethodArr valueForKey:@"recipe_method"];
            NSLog(@"%@",arr_method);
            
            //self.recipe_methodlbl.text = [arr_method objectAtIndex:0];
            //[self.recipe_methodlbl sizeToFit];
            recipeMethodstr = [arr_method objectAtIndex:0];
            
            
            
            [database close];
        }
        if([self.imageFile isEqualToString: @"Pineapple.jpg"])
        {
            [self databaseOpen];
            
            
            //For name
            
            NSString *queryname= [NSString stringWithFormat:@"Select recipe_subcategory,recipe_name,recipe_type from winter_tbl where recipe_name ='Pineapple' AND recipe_type ='Cinch' "];
            recipeNameArr =[[NSMutableArray alloc]init];
            recipeNameArr =[[database executeQuery:queryname]mutableCopy];
            
            NSMutableArray *arr_name = [recipeNameArr valueForKey:@"recipe_subcategory"];
            
            //self.recipe_namelbl.text = [arr_name objectAtIndex:0];
            
            recipeNamestr = [arr_name objectAtIndex:0];
            
            //For ingredients
            
            NSString *queryingredients=[ NSString stringWithFormat:@"Select recipe_ingredients from winter_tbl where recipe_name ='Pineapple' AND recipe_type ='Cinch' "];
            recipeIngredientsArr =[[NSMutableArray alloc]init];
            recipeIngredientsArr =[[database executeQuery:queryingredients]mutableCopy];
            
            
            NSMutableArray *arr_ingredients  = [recipeIngredientsArr valueForKey:@"recipe_ingredients"];
            NSLog(@"%@",arr_ingredients);
            
            //self.recipe_ingredientslbl.text = [arr_ingredients objectAtIndex:0];
            // [self.recipe_ingredientslbl sizeToFit];
            
            recipeIngredientsstr = [arr_ingredients objectAtIndex:0];
            
            //For method
            NSString *querymethod=[ NSString stringWithFormat:@"Select recipe_method from winter_tbl where recipe_name ='Pineapple' AND recipe_type ='Cinch' "];
            recipeMethodArr =[[NSMutableArray alloc]init];
            recipeMethodArr =[[database executeQuery:querymethod]mutableCopy];
            
            
            NSMutableArray *arr_method  = [recipeMethodArr valueForKey:@"recipe_method"];
            NSLog(@"%@",arr_method);
            
            //self.recipe_methodlbl.text = [arr_method objectAtIndex:0];
            //[self.recipe_methodlbl sizeToFit];
            recipeMethodstr = [arr_method objectAtIndex:0];
            
            
            
            [database close];
        }
        
        if([self.imageFile isEqualToString: @"Pomegranate.jpg"])
        {
            [self databaseOpen];
            
            
            //For name
            
            NSString *queryname= [NSString stringWithFormat:@"Select recipe_subcategory,recipe_name,recipe_type from winter_tbl where recipe_name ='Pomegranate' AND recipe_type ='Cinch' "];
            recipeNameArr =[[NSMutableArray alloc]init];
            recipeNameArr =[[database executeQuery:queryname]mutableCopy];
            
            NSMutableArray *arr_name = [recipeNameArr valueForKey:@"recipe_subcategory"];
            
            //self.recipe_namelbl.text = [arr_name objectAtIndex:0];
            
            recipeNamestr = [arr_name objectAtIndex:0];
            
            //For ingredients
            
            NSString *queryingredients=[ NSString stringWithFormat:@"Select recipe_ingredients from winter_tbl where recipe_name ='Pomegranate' AND recipe_type ='Cinch' "];
            recipeIngredientsArr =[[NSMutableArray alloc]init];
            recipeIngredientsArr =[[database executeQuery:queryingredients]mutableCopy];
            
            
            NSMutableArray *arr_ingredients  = [recipeIngredientsArr valueForKey:@"recipe_ingredients"];
            NSLog(@"%@",arr_ingredients);
            
            //self.recipe_ingredientslbl.text = [arr_ingredients objectAtIndex:0];
            // [self.recipe_ingredientslbl sizeToFit];
            
            recipeIngredientsstr = [arr_ingredients objectAtIndex:0];
            
            //For method
            NSString *querymethod=[ NSString stringWithFormat:@"Select recipe_method from winter_tbl where recipe_name ='Pomegranate' AND recipe_type ='Cinch' "];
            recipeMethodArr =[[NSMutableArray alloc]init];
            recipeMethodArr =[[database executeQuery:querymethod]mutableCopy];
            
            
            NSMutableArray *arr_method  = [recipeMethodArr valueForKey:@"recipe_method"];
            NSLog(@"%@",arr_method);
            
            //self.recipe_methodlbl.text = [arr_method objectAtIndex:0];
            //[self.recipe_methodlbl sizeToFit];
            recipeMethodstr = [arr_method objectAtIndex:0];
            
            
            
            [database close];
        }
        if([self.imageFile isEqualToString: @"Prune.jpg"])
        {
            [self databaseOpen];
            
            
            //For name
            
            NSString *queryname= [NSString stringWithFormat:@"Select recipe_subcategory,recipe_name,recipe_type from winter_tbl where recipe_name ='Prunes' AND recipe_type ='Cinch' "];
            recipeNameArr =[[NSMutableArray alloc]init];
            recipeNameArr =[[database executeQuery:queryname]mutableCopy];
            
            NSMutableArray *arr_name = [recipeNameArr valueForKey:@"recipe_subcategory"];
            
            //self.recipe_namelbl.text = [arr_name objectAtIndex:0];
            
            recipeNamestr = [arr_name objectAtIndex:0];
            
            //For ingredients
            
            NSString *queryingredients=[ NSString stringWithFormat:@"Select recipe_ingredients from winter_tbl where recipe_name ='Prunes' AND recipe_type ='Cinch' "];
            recipeIngredientsArr =[[NSMutableArray alloc]init];
            recipeIngredientsArr =[[database executeQuery:queryingredients]mutableCopy];
            
            
            NSMutableArray *arr_ingredients  = [recipeIngredientsArr valueForKey:@"recipe_ingredients"];
            NSLog(@"%@",arr_ingredients);
            
            //self.recipe_ingredientslbl.text = [arr_ingredients objectAtIndex:0];
            // [self.recipe_ingredientslbl sizeToFit];
            
            recipeIngredientsstr = [arr_ingredients objectAtIndex:0];
            
            //For method
            NSString *querymethod=[ NSString stringWithFormat:@"Select recipe_method from winter_tbl where recipe_name ='Prunes' AND recipe_type ='Cinch' "];
            recipeMethodArr =[[NSMutableArray alloc]init];
            recipeMethodArr =[[database executeQuery:querymethod]mutableCopy];
            
            
            NSMutableArray *arr_method  = [recipeMethodArr valueForKey:@"recipe_method"];
            NSLog(@"%@",arr_method);
            
            //self.recipe_methodlbl.text = [arr_method objectAtIndex:0];
            //[self.recipe_methodlbl sizeToFit];
            recipeMethodstr = [arr_method objectAtIndex:0];
            
            
            
            [database close];
        }
        if([self.imageFile isEqualToString: @"Rutabaga.jpg"])
        {
            [self databaseOpen];
            
            
            //For name
            
            NSString *queryname= [NSString stringWithFormat:@"Select recipe_subcategory,recipe_name,recipe_type from winter_tbl where recipe_name ='Rutabaga' AND recipe_type ='Cinch' "];
            recipeNameArr =[[NSMutableArray alloc]init];
            recipeNameArr =[[database executeQuery:queryname]mutableCopy];
            
            NSMutableArray *arr_name = [recipeNameArr valueForKey:@"recipe_subcategory"];
            
            //self.recipe_namelbl.text = [arr_name objectAtIndex:0];
            
            recipeNamestr = [arr_name objectAtIndex:0];
            
            //For ingredients
            
            NSString *queryingredients=[ NSString stringWithFormat:@"Select recipe_ingredients from winter_tbl where recipe_name ='Rutabaga' AND recipe_type ='Cinch' "];
            recipeIngredientsArr =[[NSMutableArray alloc]init];
            recipeIngredientsArr =[[database executeQuery:queryingredients]mutableCopy];
            
            
            NSMutableArray *arr_ingredients  = [recipeIngredientsArr valueForKey:@"recipe_ingredients"];
            NSLog(@"%@",arr_ingredients);
            
            //self.recipe_ingredientslbl.text = [arr_ingredients objectAtIndex:0];
            // [self.recipe_ingredientslbl sizeToFit];
            
            recipeIngredientsstr = [arr_ingredients objectAtIndex:0];
            
            //For method
            NSString *querymethod=[ NSString stringWithFormat:@"Select recipe_method from winter_tbl where recipe_name ='Rutabaga' AND recipe_type ='Cinch' "];
            recipeMethodArr =[[NSMutableArray alloc]init];
            recipeMethodArr =[[database executeQuery:querymethod]mutableCopy];
            
            
            NSMutableArray *arr_method  = [recipeMethodArr valueForKey:@"recipe_method"];
            NSLog(@"%@",arr_method);
            
            //self.recipe_methodlbl.text = [arr_method objectAtIndex:0];
            //[self.recipe_methodlbl sizeToFit];
            recipeMethodstr = [arr_method objectAtIndex:0];
            
            
            
            [database close];
        }
        
        if([self.imageFile isEqualToString: @"Sardines.jpg"])
        {
            [self databaseOpen];
            
            
            //For name
            
            NSString *queryname= [NSString stringWithFormat:@"Select recipe_subcategory,recipe_name,recipe_type from winter_tbl where recipe_name ='Sardine' AND recipe_type ='Cinch' "];
            recipeNameArr =[[NSMutableArray alloc]init];
            recipeNameArr =[[database executeQuery:queryname]mutableCopy];
            
            NSMutableArray *arr_name = [recipeNameArr valueForKey:@"recipe_subcategory"];
            
            //self.recipe_namelbl.text = [arr_name objectAtIndex:0];
            
            recipeNamestr = [arr_name objectAtIndex:0];
            
            //For ingredients
            
            NSString *queryingredients=[ NSString stringWithFormat:@"Select recipe_ingredients from winter_tbl where recipe_name ='Sardine' AND recipe_type ='Cinch' "];
            recipeIngredientsArr =[[NSMutableArray alloc]init];
            recipeIngredientsArr =[[database executeQuery:queryingredients]mutableCopy];
            
            
            NSMutableArray *arr_ingredients  = [recipeIngredientsArr valueForKey:@"recipe_ingredients"];
            NSLog(@"%@",arr_ingredients);
            
            //self.recipe_ingredientslbl.text = [arr_ingredients objectAtIndex:0];
            // [self.recipe_ingredientslbl sizeToFit];
            
            recipeIngredientsstr = [arr_ingredients objectAtIndex:0];
            
            //For method
            NSString *querymethod=[ NSString stringWithFormat:@"Select recipe_method from winter_tbl where recipe_name ='Sardine' AND recipe_type ='Cinch' "];
            recipeMethodArr =[[NSMutableArray alloc]init];
            recipeMethodArr =[[database executeQuery:querymethod]mutableCopy];
            
            
            NSMutableArray *arr_method  = [recipeMethodArr valueForKey:@"recipe_method"];
            NSLog(@"%@",arr_method);
            
            //self.recipe_methodlbl.text = [arr_method objectAtIndex:0];
            //[self.recipe_methodlbl sizeToFit];
            recipeMethodstr = [arr_method objectAtIndex:0];
            
            
            
            [database close];
        }
        
        if([self.imageFile isEqualToString: @"Walnut.jpg"])
        {
            [self databaseOpen];
            
            
            //For name
            
            NSString *queryname= [NSString stringWithFormat:@"Select recipe_subcategory,recipe_name,recipe_type from winter_tbl where recipe_name ='Walnut' AND recipe_type ='Cinch' "];
            recipeNameArr =[[NSMutableArray alloc]init];
            recipeNameArr =[[database executeQuery:queryname]mutableCopy];
            
            NSMutableArray *arr_name = [recipeNameArr valueForKey:@"recipe_subcategory"];
            
            //self.recipe_namelbl.text = [arr_name objectAtIndex:0];
            
            recipeNamestr = [arr_name objectAtIndex:0];
            
            //For ingredients
            
            NSString *queryingredients=[ NSString stringWithFormat:@"Select recipe_ingredients from winter_tbl where recipe_name ='Walnut' AND recipe_type ='Cinch' "];
            recipeIngredientsArr =[[NSMutableArray alloc]init];
            recipeIngredientsArr =[[database executeQuery:queryingredients]mutableCopy];
            
            
            NSMutableArray *arr_ingredients  = [recipeIngredientsArr valueForKey:@"recipe_ingredients"];
            NSLog(@"%@",arr_ingredients);
            
            //self.recipe_ingredientslbl.text = [arr_ingredients objectAtIndex:0];
            // [self.recipe_ingredientslbl sizeToFit];
            
            recipeIngredientsstr = [arr_ingredients objectAtIndex:0];
            
            //For method
            NSString *querymethod=[ NSString stringWithFormat:@"Select recipe_method from winter_tbl where recipe_name ='Walnut' AND recipe_type ='Cinch' "];
            recipeMethodArr =[[NSMutableArray alloc]init];
            recipeMethodArr =[[database executeQuery:querymethod]mutableCopy];
            
            
            NSMutableArray *arr_method  = [recipeMethodArr valueForKey:@"recipe_method"];
            NSLog(@"%@",arr_method);
            
            //self.recipe_methodlbl.text = [arr_method objectAtIndex:0];
            //[self.recipe_methodlbl sizeToFit];
            recipeMethodstr = [arr_method objectAtIndex:0];
            
            
            
            [database close];
        }
        if([self.imageFile isEqualToString: @"Yam.jpg"])
        {
            [self databaseOpen];
            
            
            //For name
            
            NSString *queryname= [NSString stringWithFormat:@"Select recipe_subcategory,recipe_name,recipe_type from winter_tbl where recipe_name ='Yam' AND recipe_type ='Cinch' "];
            recipeNameArr =[[NSMutableArray alloc]init];
            recipeNameArr =[[database executeQuery:queryname]mutableCopy];
            
            NSMutableArray *arr_name = [recipeNameArr valueForKey:@"recipe_subcategory"];
            
            //self.recipe_namelbl.text = [arr_name objectAtIndex:0];
            
            recipeNamestr = [arr_name objectAtIndex:0];
            
            //For ingredients
            
            NSString *queryingredients=[ NSString stringWithFormat:@"Select recipe_ingredients from winter_tbl where recipe_name ='Yam' AND recipe_type ='Cinch' "];
            recipeIngredientsArr =[[NSMutableArray alloc]init];
            recipeIngredientsArr =[[database executeQuery:queryingredients]mutableCopy];
            
            
            NSMutableArray *arr_ingredients  = [recipeIngredientsArr valueForKey:@"recipe_ingredients"];
            NSLog(@"%@",arr_ingredients);
            
            //self.recipe_ingredientslbl.text = [arr_ingredients objectAtIndex:0];
            // [self.recipe_ingredientslbl sizeToFit];
            
            recipeIngredientsstr = [arr_ingredients objectAtIndex:0];
            
            //For method
            NSString *querymethod=[ NSString stringWithFormat:@"Select recipe_method from winter_tbl where recipe_name ='Yam' AND recipe_type ='Cinch' "];
            recipeMethodArr =[[NSMutableArray alloc]init];
            recipeMethodArr =[[database executeQuery:querymethod]mutableCopy];
            
            
            NSMutableArray *arr_method  = [recipeMethodArr valueForKey:@"recipe_method"];
            NSLog(@"%@",arr_method);
            
            //self.recipe_methodlbl.text = [arr_method objectAtIndex:0];
            //[self.recipe_methodlbl sizeToFit];
            recipeMethodstr = [arr_method objectAtIndex:0];
            
            
            
            [database close];
        }
        [self performSegueWithIdentifier:@"cinchsegue" sender:self];
    }
    
    else if ([season isEqualToString:@"summer"])
    {
        if([self.imageFile isEqualToString: @"Eggplant.jpg"])
        {
            [self databaseOpen];
            
            
            //For name
            
            NSString *queryname= [NSString stringWithFormat:@"Select recipe_subcategory,recipe_name,recipe_type from summer_tbl where recipe_name ='EGGPLANT' AND recipe_type ='Cinch' "];
            recipeNameArr =[[NSMutableArray alloc]init];
            recipeNameArr =[[database executeQuery:queryname]mutableCopy];
            
            NSMutableArray *arr_name = [recipeNameArr valueForKey:@"recipe_subcategory"];
            
            //self.recipe_namelbl.text = [arr_name objectAtIndex:0];
            
            recipeNamestr = [arr_name objectAtIndex:0];
            
            //For ingredients
            
            NSString *queryingredients=[ NSString stringWithFormat:@"Select recipe_ingredients from summer_tbl where recipe_name ='EGGPLANT' AND recipe_type ='Cinch' "];
            recipeIngredientsArr =[[NSMutableArray alloc]init];
            recipeIngredientsArr =[[database executeQuery:queryingredients]mutableCopy];
            
            
            NSMutableArray *arr_ingredients  = [recipeIngredientsArr valueForKey:@"recipe_ingredients"];
            NSLog(@"%@",arr_ingredients);
            
            //self.recipe_ingredientslbl.text = [arr_ingredients objectAtIndex:0];
            // [self.recipe_ingredientslbl sizeToFit];
            
            recipeIngredientsstr = [arr_ingredients objectAtIndex:0];
            
            //For method
            NSString *querymethod=[ NSString stringWithFormat:@"Select recipe_method from summer_tbl where recipe_name ='EGGPLANT' AND recipe_type ='Cinch' "];
            recipeMethodArr =[[NSMutableArray alloc]init];
            recipeMethodArr =[[database executeQuery:querymethod]mutableCopy];
            
            
            NSMutableArray *arr_method  = [recipeMethodArr valueForKey:@"recipe_method"];
            NSLog(@"%@",arr_method);
            
            //self.recipe_methodlbl.text = [arr_method objectAtIndex:0];
            //[self.recipe_methodlbl sizeToFit];
            recipeMethodstr = [arr_method objectAtIndex:0];
            
            
            
            [database close];
        }
        
        else if([self.imageFile isEqualToString: @"Frisee.jpg"])
        {
            [self databaseOpen];
            
            
            //For name
            
            NSString *queryname= [NSString stringWithFormat:@"Select recipe_subcategory,recipe_name,recipe_type from summer_tbl where recipe_name ='FRISEE' AND recipe_type ='Cinch' "];
            recipeNameArr =[[NSMutableArray alloc]init];
            recipeNameArr =[[database executeQuery:queryname]mutableCopy];
            
            NSMutableArray *arr_name = [recipeNameArr valueForKey:@"recipe_subcategory"];
            
            //self.recipe_namelbl.text = [arr_name objectAtIndex:0];
            
            recipeNamestr = [arr_name objectAtIndex:0];
            
            //For ingredients
            
            NSString *queryingredients=[ NSString stringWithFormat:@"Select recipe_ingredients from summer_tbl where recipe_name ='FRISEE' AND recipe_type ='Cinch' "];
            recipeIngredientsArr =[[NSMutableArray alloc]init];
            recipeIngredientsArr =[[database executeQuery:queryingredients]mutableCopy];
            
            
            NSMutableArray *arr_ingredients  = [recipeIngredientsArr valueForKey:@"recipe_ingredients"];
            NSLog(@"%@",arr_ingredients);
            
            //self.recipe_ingredientslbl.text = [arr_ingredients objectAtIndex:0];
            // [self.recipe_ingredientslbl sizeToFit];
            
            recipeIngredientsstr = [arr_ingredients objectAtIndex:0];
            
            //For method
            NSString *querymethod=[ NSString stringWithFormat:@"Select recipe_method from summer_tbl where recipe_name ='FRISEE' AND recipe_type ='Cinch' "];
            recipeMethodArr =[[NSMutableArray alloc]init];
            recipeMethodArr =[[database executeQuery:querymethod]mutableCopy];
            
            
            NSMutableArray *arr_method  = [recipeMethodArr valueForKey:@"recipe_method"];
            NSLog(@"%@",arr_method);
            
            //self.recipe_methodlbl.text = [arr_method objectAtIndex:0];
            //[self.recipe_methodlbl sizeToFit];
            recipeMethodstr = [arr_method objectAtIndex:0];
            
            
            
            [database close];
        }
        
        else if([self.imageFile isEqualToString: @"Shrimp.jpg"])
        {
            [self databaseOpen];
            
            
            //For name
            
            NSString *queryname= [NSString stringWithFormat:@"Select recipe_subcategory,recipe_name,recipe_type from summer_tbl where recipe_name ='SHRIMP' AND recipe_type ='Cinch' "];
            recipeNameArr =[[NSMutableArray alloc]init];
            recipeNameArr =[[database executeQuery:queryname]mutableCopy];
            
            NSMutableArray *arr_name = [recipeNameArr valueForKey:@"recipe_subcategory"];
            
            //self.recipe_namelbl.text = [arr_name objectAtIndex:0];
            
            recipeNamestr = [arr_name objectAtIndex:0];
            
            //For ingredients
            
            NSString *queryingredients=[ NSString stringWithFormat:@"Select recipe_ingredients from summer_tbl where recipe_name ='SHRIMP' AND recipe_type ='Cinch' "];
            recipeIngredientsArr =[[NSMutableArray alloc]init];
            recipeIngredientsArr =[[database executeQuery:queryingredients]mutableCopy];
            
            
            NSMutableArray *arr_ingredients  = [recipeIngredientsArr valueForKey:@"recipe_ingredients"];
            NSLog(@"%@",arr_ingredients);
            
            //self.recipe_ingredientslbl.text = [arr_ingredients objectAtIndex:0];
            // [self.recipe_ingredientslbl sizeToFit];
            
            recipeIngredientsstr = [arr_ingredients objectAtIndex:0];
            
            //For method
            NSString *querymethod=[ NSString stringWithFormat:@"Select recipe_method from summer_tbl where recipe_name ='SHRIMP' AND recipe_type ='Cinch' "];
            recipeMethodArr =[[NSMutableArray alloc]init];
            recipeMethodArr =[[database executeQuery:querymethod]mutableCopy];
            
            
            NSMutableArray *arr_method  = [recipeMethodArr valueForKey:@"recipe_method"];
            NSLog(@"%@",arr_method);
            
            //self.recipe_methodlbl.text = [arr_method objectAtIndex:0];
            //[self.recipe_methodlbl sizeToFit];
            recipeMethodstr = [arr_method objectAtIndex:0];
            
            
            
            [database close];
        }
      else if([self.imageFile isEqualToString: @"Almond.jpg"])
        {
            [self databaseOpen];
            
            
            //For name
            
            NSString *queryname= [NSString stringWithFormat:@"Select recipe_subcategory,recipe_name,recipe_type from summer_tbl where recipe_name ='ALMOND' AND recipe_type ='Cinch' "];
            recipeNameArr =[[NSMutableArray alloc]init];
            recipeNameArr =[[database executeQuery:queryname]mutableCopy];
            
            NSMutableArray *arr_name = [recipeNameArr valueForKey:@"recipe_subcategory"];
            
            //self.recipe_namelbl.text = [arr_name objectAtIndex:0];
            
            recipeNamestr = [arr_name objectAtIndex:0];
            
            //For ingredients
            
            NSString *queryingredients=[ NSString stringWithFormat:@"Select recipe_ingredients from summer_tbl where recipe_name ='ALMOND' AND recipe_type ='Cinch' "];
            recipeIngredientsArr =[[NSMutableArray alloc]init];
            recipeIngredientsArr =[[database executeQuery:queryingredients]mutableCopy];
            
            
            NSMutableArray *arr_ingredients  = [recipeIngredientsArr valueForKey:@"recipe_ingredients"];
            NSLog(@"%@",arr_ingredients);
            
            //self.recipe_ingredientslbl.text = [arr_ingredients objectAtIndex:0];
            // [self.recipe_ingredientslbl sizeToFit];
            
            recipeIngredientsstr = [arr_ingredients objectAtIndex:0];
            
            //For method
            NSString *querymethod=[ NSString stringWithFormat:@"Select recipe_method from summer_tbl where recipe_name ='ALMOND' AND recipe_type ='Cinch' "];
            recipeMethodArr =[[NSMutableArray alloc]init];
            recipeMethodArr =[[database executeQuery:querymethod]mutableCopy];
            
            
            NSMutableArray *arr_method  = [recipeMethodArr valueForKey:@"recipe_method"];
            NSLog(@"%@",arr_method);
            
            //self.recipe_methodlbl.text = [arr_method objectAtIndex:0];
            //[self.recipe_methodlbl sizeToFit];
            recipeMethodstr = [arr_method objectAtIndex:0];
            
            
            
            [database close];
        }

      else if([self.imageFile isEqualToString: @"Avocado.jpg"])
      {
          [self databaseOpen];
          
          
          //For name
          
          NSString *queryname= [NSString stringWithFormat:@"Select recipe_subcategory,recipe_name,recipe_type from summer_tbl where recipe_name ='AVOCADO' AND recipe_type ='Cinch' "];
          recipeNameArr =[[NSMutableArray alloc]init];
          recipeNameArr =[[database executeQuery:queryname]mutableCopy];
          
          NSMutableArray *arr_name = [recipeNameArr valueForKey:@"recipe_subcategory"];
          
          //self.recipe_namelbl.text = [arr_name objectAtIndex:0];
          
          recipeNamestr = [arr_name objectAtIndex:0];
          
          //For ingredients
          
          NSString *queryingredients=[ NSString stringWithFormat:@"Select recipe_ingredients from summer_tbl where recipe_name ='AVOCADO' AND recipe_type ='Cinch' "];
          recipeIngredientsArr =[[NSMutableArray alloc]init];
          recipeIngredientsArr =[[database executeQuery:queryingredients]mutableCopy];
          
          
          NSMutableArray *arr_ingredients  = [recipeIngredientsArr valueForKey:@"recipe_ingredients"];
          NSLog(@"%@",arr_ingredients);
          
          //self.recipe_ingredientslbl.text = [arr_ingredients objectAtIndex:0];
          // [self.recipe_ingredientslbl sizeToFit];
          
          recipeIngredientsstr = [arr_ingredients objectAtIndex:0];
          
          //For method
          NSString *querymethod=[ NSString stringWithFormat:@"Select recipe_method from summer_tbl where recipe_name ='AVOCADO' AND recipe_type ='Cinch' "];
          recipeMethodArr =[[NSMutableArray alloc]init];
          recipeMethodArr =[[database executeQuery:querymethod]mutableCopy];
          
          
          NSMutableArray *arr_method  = [recipeMethodArr valueForKey:@"recipe_method"];
          NSLog(@"%@",arr_method);
          
          //self.recipe_methodlbl.text = [arr_method objectAtIndex:0];
          //[self.recipe_methodlbl sizeToFit];
          recipeMethodstr = [arr_method objectAtIndex:0];
          
          
          
          [database close];
      }

       else if([self.imageFile isEqualToString: @"Apricots.jpg"])
        {
            [self databaseOpen];
            
            
            //For name
            
            NSString *queryname= [NSString stringWithFormat:@"Select recipe_subcategory,recipe_name,recipe_type from summer_tbl where recipe_name ='APRICOT' AND recipe_type ='Cinch' "];
            recipeNameArr =[[NSMutableArray alloc]init];
            recipeNameArr =[[database executeQuery:queryname]mutableCopy];
            
            NSMutableArray *arr_name = [recipeNameArr valueForKey:@"recipe_subcategory"];
            
            //self.recipe_namelbl.text = [arr_name objectAtIndex:0];
            
            recipeNamestr = [arr_name objectAtIndex:0];
            
            //For ingredients
            
            NSString *queryingredients=[ NSString stringWithFormat:@"Select recipe_ingredients from summer_tbl where recipe_name ='APRICOT' AND recipe_type ='Cinch' "];
            recipeIngredientsArr =[[NSMutableArray alloc]init];
            recipeIngredientsArr =[[database executeQuery:queryingredients]mutableCopy];
            
            
            NSMutableArray *arr_ingredients  = [recipeIngredientsArr valueForKey:@"recipe_ingredients"];
            NSLog(@"%@",arr_ingredients);
            
            //self.recipe_ingredientslbl.text = [arr_ingredients objectAtIndex:0];
            // [self.recipe_ingredientslbl sizeToFit];
            
            recipeIngredientsstr = [arr_ingredients objectAtIndex:0];
            
            //For method
            NSString *querymethod=[ NSString stringWithFormat:@"Select recipe_method from summer_tbl where recipe_name ='APRICOT' AND recipe_type ='Cinch' "];
            recipeMethodArr =[[NSMutableArray alloc]init];
            recipeMethodArr =[[database executeQuery:querymethod]mutableCopy];
            
            
            NSMutableArray *arr_method  = [recipeMethodArr valueForKey:@"recipe_method"];
            NSLog(@"%@",arr_method);
            
            //self.recipe_methodlbl.text = [arr_method objectAtIndex:0];
            //[self.recipe_methodlbl sizeToFit];
            recipeMethodstr = [arr_method objectAtIndex:0];
            
            
            
            [database close];
        }
        if([self.imageFile isEqualToString: @"Arugula.jpg"])
        {
            [self databaseOpen];
            
            
            //For name
            
            NSString *queryname= [NSString stringWithFormat:@"Select recipe_subcategory,recipe_name,recipe_type from summer_tbl where recipe_name ='ARUGULA' AND recipe_type ='Cinch' "];
            recipeNameArr =[[NSMutableArray alloc]init];
            recipeNameArr =[[database executeQuery:queryname]mutableCopy];
            
            NSMutableArray *arr_name = [recipeNameArr valueForKey:@"recipe_subcategory"];
            
            //self.recipe_namelbl.text = [arr_name objectAtIndex:0];
            
            recipeNamestr = [arr_name objectAtIndex:0];
            
            //For ingredients
            
            NSString *queryingredients=[ NSString stringWithFormat:@"Select recipe_ingredients from summer_tbl where recipe_name ='ARUGULA' AND recipe_type ='Cinch' "];
            recipeIngredientsArr =[[NSMutableArray alloc]init];
            recipeIngredientsArr =[[database executeQuery:queryingredients]mutableCopy];
            
            
            NSMutableArray *arr_ingredients  = [recipeIngredientsArr valueForKey:@"recipe_ingredients"];
            NSLog(@"%@",arr_ingredients);
            
            //self.recipe_ingredientslbl.text = [arr_ingredients objectAtIndex:0];
            // [self.recipe_ingredientslbl sizeToFit];
            
            recipeIngredientsstr = [arr_ingredients objectAtIndex:0];
            
            //For method
            NSString *querymethod=[ NSString stringWithFormat:@"Select recipe_method from summer_tbl where recipe_name ='ARUGULA' AND recipe_type ='Cinch' "];
            recipeMethodArr =[[NSMutableArray alloc]init];
            recipeMethodArr =[[database executeQuery:querymethod]mutableCopy];
            
            
            NSMutableArray *arr_method  = [recipeMethodArr valueForKey:@"recipe_method"];
            NSLog(@"%@",arr_method);
            
            //self.recipe_methodlbl.text = [arr_method objectAtIndex:0];
            //[self.recipe_methodlbl sizeToFit];
            recipeMethodstr = [arr_method objectAtIndex:0];
            
            
            
            [database close];
        }
        
        if([self.imageFile isEqualToString: @"Bell-Pepper.jpg"])
        {
            [self databaseOpen];
            
            
            //For name
            
            NSString *queryname= [NSString stringWithFormat:@"Select recipe_subcategory,recipe_name,recipe_type from summer_tbl where recipe_name ='BELL PEPPER' AND recipe_type ='Cinch' "];
            recipeNameArr =[[NSMutableArray alloc]init];
            recipeNameArr =[[database executeQuery:queryname]mutableCopy];
            
            NSMutableArray *arr_name = [recipeNameArr valueForKey:@"recipe_subcategory"];
            
            //self.recipe_namelbl.text = [arr_name objectAtIndex:0];
            
            recipeNamestr = [arr_name objectAtIndex:0];
            
            //For ingredients
            
            NSString *queryingredients=[ NSString stringWithFormat:@"Select recipe_ingredients from  summer_tbl where recipe_name ='BELL PEPPER' AND recipe_type ='Cinch' "];
            recipeIngredientsArr =[[NSMutableArray alloc]init];
            recipeIngredientsArr =[[database executeQuery:queryingredients]mutableCopy];
            
            
            NSMutableArray *arr_ingredients  = [recipeIngredientsArr valueForKey:@"recipe_ingredients"];
            NSLog(@"%@",arr_ingredients);
            
            //self.recipe_ingredientslbl.text = [arr_ingredients objectAtIndex:0];
            // [self.recipe_ingredientslbl sizeToFit];
            
            recipeIngredientsstr = [arr_ingredients objectAtIndex:0];
            
            //For method
            NSString *querymethod=[ NSString stringWithFormat:@"Select recipe_method from  summer_tbl where recipe_name ='BELL PEPPER' AND recipe_type ='Cinch' "];
            recipeMethodArr =[[NSMutableArray alloc]init];
            recipeMethodArr =[[database executeQuery:querymethod]mutableCopy];
            
            
            NSMutableArray *arr_method  = [recipeMethodArr valueForKey:@"recipe_method"];
            NSLog(@"%@",arr_method);
            
            //self.recipe_methodlbl.text = [arr_method objectAtIndex:0];
            //[self.recipe_methodlbl sizeToFit];
            recipeMethodstr = [arr_method objectAtIndex:0];
            
            
            
            [database close];
        }
        if([self.imageFile isEqualToString: @"Blueberry.jpg"])
        {
            [self databaseOpen];
            
            
            //For name
            
            NSString *queryname= [NSString stringWithFormat:@"Select recipe_subcategory,recipe_name,recipe_type from  summer_tbl where recipe_name ='BLUEBERRY' AND recipe_type ='Cinch' "];
            recipeNameArr =[[NSMutableArray alloc]init];
            recipeNameArr =[[database executeQuery:queryname]mutableCopy];
            
            NSMutableArray *arr_name = [recipeNameArr valueForKey:@"recipe_subcategory"];
            
            //self.recipe_namelbl.text = [arr_name objectAtIndex:0];
            
            recipeNamestr = [arr_name objectAtIndex:0];
            
            //For ingredients
            
            NSString *queryingredients=[ NSString stringWithFormat:@"Select recipe_ingredients from  summer_tbl where recipe_name ='BLUEBERRY' AND recipe_type ='Cinch' "];
            recipeIngredientsArr =[[NSMutableArray alloc]init];
            recipeIngredientsArr =[[database executeQuery:queryingredients]mutableCopy];
            
            
            NSMutableArray *arr_ingredients  = [recipeIngredientsArr valueForKey:@"recipe_ingredients"];
            NSLog(@"%@",arr_ingredients);
            
            //self.recipe_ingredientslbl.text = [arr_ingredients objectAtIndex:0];
            // [self.recipe_ingredientslbl sizeToFit];
            
            recipeIngredientsstr = [arr_ingredients objectAtIndex:0];
            
            //For method
            NSString *querymethod=[ NSString stringWithFormat:@"Select recipe_method from  summer_tbl where recipe_name ='BLUEBERRY' AND recipe_type ='Cinch' "];
            recipeMethodArr =[[NSMutableArray alloc]init];
            recipeMethodArr =[[database executeQuery:querymethod]mutableCopy];
            
            
            NSMutableArray *arr_method  = [recipeMethodArr valueForKey:@"recipe_method"];
            NSLog(@"%@",arr_method);
            
            //self.recipe_methodlbl.text = [arr_method objectAtIndex:0];
            //[self.recipe_methodlbl sizeToFit];
            recipeMethodstr = [arr_method objectAtIndex:0];
            
            
            
            [database close];
        }
        
        if([self.imageFile isEqualToString: @"Bok-Choy.jpg"])
        {
            [self databaseOpen];
            
            
            //For name
            
            NSString *queryname= [NSString stringWithFormat:@"Select recipe_subcategory,recipe_name,recipe_type from  summer_tbl where recipe_name ='BOK CHOY' AND recipe_type ='Cinch' "];
            recipeNameArr =[[NSMutableArray alloc]init];
            recipeNameArr =[[database executeQuery:queryname]mutableCopy];
            
            NSMutableArray *arr_name = [recipeNameArr valueForKey:@"recipe_subcategory"];
            
            //self.recipe_namelbl.text = [arr_name objectAtIndex:0];
            
            recipeNamestr = [arr_name objectAtIndex:0];
            
            //For ingredients
            
            NSString *queryingredients=[ NSString stringWithFormat:@"Select recipe_ingredients from  summer_tbl where recipe_name ='BOK CHOY' AND recipe_type ='Cinch' "];
            recipeIngredientsArr =[[NSMutableArray alloc]init];
            recipeIngredientsArr =[[database executeQuery:queryingredients]mutableCopy];
            
            
            NSMutableArray *arr_ingredients  = [recipeIngredientsArr valueForKey:@"recipe_ingredients"];
            NSLog(@"%@",arr_ingredients);
            
            //self.recipe_ingredientslbl.text = [arr_ingredients objectAtIndex:0];
            // [self.recipe_ingredientslbl sizeToFit];
            
            recipeIngredientsstr = [arr_ingredients objectAtIndex:0];
            
            //For method
            NSString *querymethod=[ NSString stringWithFormat:@"Select recipe_method from  summer_tbl where recipe_name ='BOK CHOY' AND recipe_type ='Cinch' "];
            recipeMethodArr =[[NSMutableArray alloc]init];
            recipeMethodArr =[[database executeQuery:querymethod]mutableCopy];
            
            
            NSMutableArray *arr_method  = [recipeMethodArr valueForKey:@"recipe_method"];
            NSLog(@"%@",arr_method);
            
            //self.recipe_methodlbl.text = [arr_method objectAtIndex:0];
            //[self.recipe_methodlbl sizeToFit];
            recipeMethodstr = [arr_method objectAtIndex:0];
            
            
            
            [database close];
        }
        if([self.imageFile isEqualToString: @"Chicken.jpg"])
        {
            [self databaseOpen];
            
            
            //For name
            
            NSString *queryname= [NSString stringWithFormat:@"Select recipe_subcategory,recipe_name,recipe_type from  summer_tbl where recipe_name ='CHICKEN' AND recipe_type ='Cinch' "];
            recipeNameArr =[[NSMutableArray alloc]init];
            recipeNameArr =[[database executeQuery:queryname]mutableCopy];
            
            NSMutableArray *arr_name = [recipeNameArr valueForKey:@"recipe_subcategory"];
            
            //self.recipe_namelbl.text = [arr_name objectAtIndex:0];
            
            recipeNamestr = [arr_name objectAtIndex:0];
            
            //For ingredients
            
            NSString *queryingredients=[ NSString stringWithFormat:@"Select recipe_ingredients from  summer_tbl where recipe_name ='CHICKEN' AND recipe_type ='Cinch' "];
            recipeIngredientsArr =[[NSMutableArray alloc]init];
            recipeIngredientsArr =[[database executeQuery:queryingredients]mutableCopy];
            
            
            NSMutableArray *arr_ingredients  = [recipeIngredientsArr valueForKey:@"recipe_ingredients"];
            NSLog(@"%@",arr_ingredients);
            
            //self.recipe_ingredientslbl.text = [arr_ingredients objectAtIndex:0];
            // [self.recipe_ingredientslbl sizeToFit];
            
            recipeIngredientsstr = [arr_ingredients objectAtIndex:0];
            
            //For method
            NSString *querymethod=[ NSString stringWithFormat:@"Select recipe_method from  summer_tbl where recipe_name ='CHICKEN' AND recipe_type ='Cinch' "];
            recipeMethodArr =[[NSMutableArray alloc]init];
            recipeMethodArr =[[database executeQuery:querymethod]mutableCopy];
            
            
            NSMutableArray *arr_method  = [recipeMethodArr valueForKey:@"recipe_method"];
            NSLog(@"%@",arr_method);
            
            //self.recipe_methodlbl.text = [arr_method objectAtIndex:0];
            //[self.recipe_methodlbl sizeToFit];
            recipeMethodstr = [arr_method objectAtIndex:0];
            
            
            
            [database close];
        }
        
        if([self.imageFile isEqualToString: @"Cilantro.jpg"])
        {
            [self databaseOpen];
            
            
            //For name
            
            NSString *queryname= [NSString stringWithFormat:@"Select recipe_subcategory,recipe_name,recipe_type from  summer_tbl where recipe_name ='CILANTRO' AND recipe_type ='Cinch' "];
            recipeNameArr =[[NSMutableArray alloc]init];
            recipeNameArr =[[database executeQuery:queryname]mutableCopy];
            
            NSMutableArray *arr_name = [recipeNameArr valueForKey:@"recipe_subcategory"];
            
            //self.recipe_namelbl.text = [arr_name objectAtIndex:0];
            
            recipeNamestr = [arr_name objectAtIndex:0];
            
            //For ingredients
            
            NSString *queryingredients=[ NSString stringWithFormat:@"Select recipe_ingredients from  summer_tbl where recipe_name ='CILANTRO' AND recipe_type ='Cinch' "];
            recipeIngredientsArr =[[NSMutableArray alloc]init];
            recipeIngredientsArr =[[database executeQuery:queryingredients]mutableCopy];
            
            
            NSMutableArray *arr_ingredients  = [recipeIngredientsArr valueForKey:@"recipe_ingredients"];
            NSLog(@"%@",arr_ingredients);
            
            //self.recipe_ingredientslbl.text = [arr_ingredients objectAtIndex:0];
            // [self.recipe_ingredientslbl sizeToFit];
            
            recipeIngredientsstr = [arr_ingredients objectAtIndex:0];
            
            //For method
            NSString *querymethod=[ NSString stringWithFormat:@"Select recipe_method from  summer_tbl where recipe_name ='CILANTRO' AND recipe_type ='Cinch' "];
            recipeMethodArr =[[NSMutableArray alloc]init];
            recipeMethodArr =[[database executeQuery:querymethod]mutableCopy];
            
            
            NSMutableArray *arr_method  = [recipeMethodArr valueForKey:@"recipe_method"];
            NSLog(@"%@",arr_method);
            
            //self.recipe_methodlbl.text = [arr_method objectAtIndex:0];
            //[self.recipe_methodlbl sizeToFit];
            recipeMethodstr = [arr_method objectAtIndex:0];
            
            
            
            [database close];
        }
        if([self.imageFile isEqualToString: @"Corn.jpg"])
        {
            [self databaseOpen];
            
            
            //For name
            
            NSString *queryname= [NSString stringWithFormat:@"Select recipe_subcategory,recipe_name,recipe_type from  summer_tbl where recipe_name ='CORN' AND recipe_type ='Cinch' "];
            recipeNameArr =[[NSMutableArray alloc]init];
            recipeNameArr =[[database executeQuery:queryname]mutableCopy];
            
            NSMutableArray *arr_name = [recipeNameArr valueForKey:@"recipe_subcategory"];
            
            //self.recipe_namelbl.text = [arr_name objectAtIndex:0];
            
            recipeNamestr = [arr_name objectAtIndex:0];
            
            //For ingredients
            
            NSString *queryingredients=[ NSString stringWithFormat:@"Select recipe_ingredients from  summer_tbl where recipe_name ='CORN' AND recipe_type ='Cinch' "];
            recipeIngredientsArr =[[NSMutableArray alloc]init];
            recipeIngredientsArr =[[database executeQuery:queryingredients]mutableCopy];
            
            
            NSMutableArray *arr_ingredients  = [recipeIngredientsArr valueForKey:@"recipe_ingredients"];
            NSLog(@"%@",arr_ingredients);
            
            //self.recipe_ingredientslbl.text = [arr_ingredients objectAtIndex:0];
            // [self.recipe_ingredientslbl sizeToFit];
            
            recipeIngredientsstr = [arr_ingredients objectAtIndex:0];
            
            //For method
            NSString *querymethod=[ NSString stringWithFormat:@"Select recipe_method from  summer_tbl where recipe_name ='CORN' AND recipe_type ='Cinch' "];
            recipeMethodArr =[[NSMutableArray alloc]init];
            recipeMethodArr =[[database executeQuery:querymethod]mutableCopy];
            
            
            NSMutableArray *arr_method  = [recipeMethodArr valueForKey:@"recipe_method"];
            NSLog(@"%@",arr_method);
            
            //self.recipe_methodlbl.text = [arr_method objectAtIndex:0];
            //[self.recipe_methodlbl sizeToFit];
            recipeMethodstr = [arr_method objectAtIndex:0];
            
            
            
            [database close];
        }
        
        if([self.imageFile isEqualToString: @"Cucumber.jpg"])
        {
            [self databaseOpen];
            
            
            //For name
            
            NSString *queryname= [NSString stringWithFormat:@"Select recipe_subcategory,recipe_name,recipe_type from  summer_tbl where recipe_name ='CUCUMBER' AND recipe_type ='Cinch' "];
            recipeNameArr =[[NSMutableArray alloc]init];
            recipeNameArr =[[database executeQuery:queryname]mutableCopy];
            
            NSMutableArray *arr_name = [recipeNameArr valueForKey:@"recipe_subcategory"];
            
            //self.recipe_namelbl.text = [arr_name objectAtIndex:0];
            
            recipeNamestr = [arr_name objectAtIndex:0];
            
            //For ingredients
            
            NSString *queryingredients=[ NSString stringWithFormat:@"Select recipe_ingredients from  summer_tbl where recipe_name ='CUCUMBER' AND recipe_type ='Cinch' "];
            recipeIngredientsArr =[[NSMutableArray alloc]init];
            recipeIngredientsArr =[[database executeQuery:queryingredients]mutableCopy];
            
            
            NSMutableArray *arr_ingredients  = [recipeIngredientsArr valueForKey:@"recipe_ingredients"];
            NSLog(@"%@",arr_ingredients);
            
            //self.recipe_ingredientslbl.text = [arr_ingredients objectAtIndex:0];
            // [self.recipe_ingredientslbl sizeToFit];
            
            recipeIngredientsstr = [arr_ingredients objectAtIndex:0];
            
            //For method
            NSString *querymethod=[ NSString stringWithFormat:@"Select recipe_method from  summer_tbl where recipe_name ='CUCUMBER' AND recipe_type ='Cinch' "];
            recipeMethodArr =[[NSMutableArray alloc]init];
            recipeMethodArr =[[database executeQuery:querymethod]mutableCopy];
            
            
            NSMutableArray *arr_method  = [recipeMethodArr valueForKey:@"recipe_method"];
            NSLog(@"%@",arr_method);
            
            //self.recipe_methodlbl.text = [arr_method objectAtIndex:0];
            //[self.recipe_methodlbl sizeToFit];
            recipeMethodstr = [arr_method objectAtIndex:0];
            
            
            
            [database close];
        }
        if([self.imageFile isEqualToString: @"Endive.jpg"])
        {
            [self databaseOpen];
            
            
            //For name
            
            NSString *queryname= [NSString stringWithFormat:@"Select recipe_subcategory,recipe_name,recipe_type from  summer_tbl where recipe_name ='ENDIVE' AND recipe_type ='Cinch' "];
            recipeNameArr =[[NSMutableArray alloc]init];
            recipeNameArr =[[database executeQuery:queryname]mutableCopy];
            
            NSMutableArray *arr_name = [recipeNameArr valueForKey:@"recipe_subcategory"];
            
            //self.recipe_namelbl.text = [arr_name objectAtIndex:0];
            
            recipeNamestr = [arr_name objectAtIndex:0];
            
            //For ingredients
            
            NSString *queryingredients=[ NSString stringWithFormat:@"Select recipe_ingredients from  summer_tbl where recipe_name ='ENDIVE' AND recipe_type ='Cinch' "];
            recipeIngredientsArr =[[NSMutableArray alloc]init];
            recipeIngredientsArr =[[database executeQuery:queryingredients]mutableCopy];
            
            
            NSMutableArray *arr_ingredients  = [recipeIngredientsArr valueForKey:@"recipe_ingredients"];
            NSLog(@"%@",arr_ingredients);
            
            //self.recipe_ingredientslbl.text = [arr_ingredients objectAtIndex:0];
            // [self.recipe_ingredientslbl sizeToFit];
            
            recipeIngredientsstr = [arr_ingredients objectAtIndex:0];
            
            //For method
            NSString *querymethod=[ NSString stringWithFormat:@"Select recipe_method from  summer_tbl where recipe_name ='ENDIVE' AND recipe_type ='Cinch' "];
            recipeMethodArr =[[NSMutableArray alloc]init];
            recipeMethodArr =[[database executeQuery:querymethod]mutableCopy];
            
            
            NSMutableArray *arr_method  = [recipeMethodArr valueForKey:@"recipe_method"];
            NSLog(@"%@",arr_method);
            
            //self.recipe_methodlbl.text = [arr_method objectAtIndex:0];
            //[self.recipe_methodlbl sizeToFit];
            recipeMethodstr = [arr_method objectAtIndex:0];
            
            
            
            [database close];
        }
        if([self.imageFile isEqualToString: @"Green-Bean.jpg"])
        {
            [self databaseOpen];
            
            
            //For name
            
            NSString *queryname= [NSString stringWithFormat:@"Select recipe_subcategory,recipe_name,recipe_type from  summer_tbl where recipe_name ='GREEN BEAN' AND recipe_type ='Cinch' "];
            recipeNameArr =[[NSMutableArray alloc]init];
            recipeNameArr =[[database executeQuery:queryname]mutableCopy];
            
            NSMutableArray *arr_name = [recipeNameArr valueForKey:@"recipe_subcategory"];
            
            //self.recipe_namelbl.text = [arr_name objectAtIndex:0];
            
            recipeNamestr = [arr_name objectAtIndex:0];
            
            //For ingredients
            
            NSString *queryingredients=[ NSString stringWithFormat:@"Select recipe_ingredients from  summer_tbl where recipe_name ='GREEN BEAN' AND recipe_type ='Cinch' "];
            recipeIngredientsArr =[[NSMutableArray alloc]init];
            recipeIngredientsArr =[[database executeQuery:queryingredients]mutableCopy];
            
            
            NSMutableArray *arr_ingredients  = [recipeIngredientsArr valueForKey:@"recipe_ingredients"];
            NSLog(@"%@",arr_ingredients);
            
            //self.recipe_ingredientslbl.text = [arr_ingredients objectAtIndex:0];
            // [self.recipe_ingredientslbl sizeToFit];
            
            recipeIngredientsstr = [arr_ingredients objectAtIndex:0];
            
            //For method
            NSString *querymethod=[ NSString stringWithFormat:@"Select recipe_method from  summer_tbl where recipe_name ='GREEN BEAN' AND recipe_type ='Cinch' "];
            recipeMethodArr =[[NSMutableArray alloc]init];
            recipeMethodArr =[[database executeQuery:querymethod]mutableCopy];
            
            
            NSMutableArray *arr_method  = [recipeMethodArr valueForKey:@"recipe_method"];
            NSLog(@"%@",arr_method);
            
            //self.recipe_methodlbl.text = [arr_method objectAtIndex:0];
            //[self.recipe_methodlbl sizeToFit];
            recipeMethodstr = [arr_method objectAtIndex:0];
            
            
            
            [database close];
        }
        if([self.imageFile isEqualToString: @"Melons.jpg"])
        {
            [self databaseOpen];
            
            
            //For name
            
            NSString *queryname= [NSString stringWithFormat:@"Select recipe_subcategory,recipe_name,recipe_type from  summer_tbl where recipe_name ='MELON' AND recipe_type ='Cinch' "];
            recipeNameArr =[[NSMutableArray alloc]init];
            recipeNameArr =[[database executeQuery:queryname]mutableCopy];
            
            NSMutableArray *arr_name = [recipeNameArr valueForKey:@"recipe_subcategory"];
            
            //self.recipe_namelbl.text = [arr_name objectAtIndex:0];
            
            recipeNamestr = [arr_name objectAtIndex:0];
            
            //For ingredients
            
            NSString *queryingredients=[ NSString stringWithFormat:@"Select recipe_ingredients from  summer_tbl where recipe_name ='MELON' AND recipe_type ='Cinch' "];
            recipeIngredientsArr =[[NSMutableArray alloc]init];
            recipeIngredientsArr =[[database executeQuery:queryingredients]mutableCopy];
            
            
            NSMutableArray *arr_ingredients  = [recipeIngredientsArr valueForKey:@"recipe_ingredients"];
            NSLog(@"%@",arr_ingredients);
            
            //self.recipe_ingredientslbl.text = [arr_ingredients objectAtIndex:0];
            // [self.recipe_ingredientslbl sizeToFit];
            
            recipeIngredientsstr = [arr_ingredients objectAtIndex:0];
            
            //For method
            NSString *querymethod=[ NSString stringWithFormat:@"Select recipe_method from  summer_tbl where recipe_name ='MELON' AND recipe_type ='Cinch' "];
            recipeMethodArr =[[NSMutableArray alloc]init];
            recipeMethodArr =[[database executeQuery:querymethod]mutableCopy];
            
            
            NSMutableArray *arr_method  = [recipeMethodArr valueForKey:@"recipe_method"];
            NSLog(@"%@",arr_method);
            
            //self.recipe_methodlbl.text = [arr_method objectAtIndex:0];
            //[self.recipe_methodlbl sizeToFit];
            recipeMethodstr = [arr_method objectAtIndex:0];
            
            
            
            [database close];
        }
        
        if([self.imageFile isEqualToString: @"Peach.jpg"])
        {
            [self databaseOpen];
            
            
            //For name
            
            NSString *queryname= [NSString stringWithFormat:@"Select recipe_subcategory,recipe_name,recipe_type from  summer_tbl where recipe_name ='PEACH' AND recipe_type ='Cinch' "];
            recipeNameArr =[[NSMutableArray alloc]init];
            recipeNameArr =[[database executeQuery:queryname]mutableCopy];
            
            NSMutableArray *arr_name = [recipeNameArr valueForKey:@"recipe_subcategory"];
            
            //self.recipe_namelbl.text = [arr_name objectAtIndex:0];
            
            recipeNamestr = [arr_name objectAtIndex:0];
            
            //For ingredients
            
            NSString *queryingredients=[ NSString stringWithFormat:@"Select recipe_ingredients from  summer_tbl where recipe_name ='PEACH' AND recipe_type ='Cinch' "];
            recipeIngredientsArr =[[NSMutableArray alloc]init];
            recipeIngredientsArr =[[database executeQuery:queryingredients]mutableCopy];
            
            
            NSMutableArray *arr_ingredients  = [recipeIngredientsArr valueForKey:@"recipe_ingredients"];
            NSLog(@"%@",arr_ingredients);
            
            //self.recipe_ingredientslbl.text = [arr_ingredients objectAtIndex:0];
            // [self.recipe_ingredientslbl sizeToFit];
            
            recipeIngredientsstr = [arr_ingredients objectAtIndex:0];
            
            //For method
            NSString *querymethod=[ NSString stringWithFormat:@"Select recipe_method from  summer_tbl where recipe_name ='PEACH' AND recipe_type ='Cinch' "];
            recipeMethodArr =[[NSMutableArray alloc]init];
            recipeMethodArr =[[database executeQuery:querymethod]mutableCopy];
            
            
            NSMutableArray *arr_method  = [recipeMethodArr valueForKey:@"recipe_method"];
            NSLog(@"%@",arr_method);
            
            //self.recipe_methodlbl.text = [arr_method objectAtIndex:0];
            //[self.recipe_methodlbl sizeToFit];
            recipeMethodstr = [arr_method objectAtIndex:0];
            
            
            
            [database close];
        }
        
        if([self.imageFile isEqualToString: @"Radicchio.jpg"])
        {
            [self databaseOpen];
            
            
            //For name
            
            NSString *queryname= [NSString stringWithFormat:@"Select recipe_subcategory,recipe_name,recipe_type from  summer_tbl where recipe_name ='RADICCHIO' AND recipe_type ='Cinch' "];
            recipeNameArr =[[NSMutableArray alloc]init];
            recipeNameArr =[[database executeQuery:queryname]mutableCopy];
            
            NSMutableArray *arr_name = [recipeNameArr valueForKey:@"recipe_subcategory"];
            
            //self.recipe_namelbl.text = [arr_name objectAtIndex:0];
            
            recipeNamestr = [arr_name objectAtIndex:0];
            
            //For ingredients
            
            NSString *queryingredients=[ NSString stringWithFormat:@"Select recipe_ingredients from  summer_tbl where recipe_name ='RADICCHIO' AND recipe_type ='Cinch' "];
            recipeIngredientsArr =[[NSMutableArray alloc]init];
            recipeIngredientsArr =[[database executeQuery:queryingredients]mutableCopy];
            
            
            NSMutableArray *arr_ingredients  = [recipeIngredientsArr valueForKey:@"recipe_ingredients"];
            NSLog(@"%@",arr_ingredients);
            
            //self.recipe_ingredientslbl.text = [arr_ingredients objectAtIndex:0];
            // [self.recipe_ingredientslbl sizeToFit];
            
            recipeIngredientsstr = [arr_ingredients objectAtIndex:0];
            
            //For method
            NSString *querymethod=[ NSString stringWithFormat:@"Select recipe_method from  summer_tbl where recipe_name ='RADICCHIO' AND recipe_type ='Cinch' "];
            recipeMethodArr =[[NSMutableArray alloc]init];
            recipeMethodArr =[[database executeQuery:querymethod]mutableCopy];
            
            
            NSMutableArray *arr_method  = [recipeMethodArr valueForKey:@"recipe_method"];
            NSLog(@"%@",arr_method);
            
            //self.recipe_methodlbl.text = [arr_method objectAtIndex:0];
            //[self.recipe_methodlbl sizeToFit];
            recipeMethodstr = [arr_method objectAtIndex:0];
            
            
            
            [database close];
        }
        if([self.imageFile isEqualToString: @"Salmon.jpg"])
        {
            [self databaseOpen];
            
            
            //For name
            
            NSString *queryname= [NSString stringWithFormat:@"Select recipe_subcategory,recipe_name,recipe_type from  summer_tbl where recipe_name ='SALMON' AND recipe_type ='Cinch' "];
            recipeNameArr =[[NSMutableArray alloc]init];
            recipeNameArr =[[database executeQuery:queryname]mutableCopy];
            
            NSMutableArray *arr_name = [recipeNameArr valueForKey:@"recipe_subcategory"];
            
            //self.recipe_namelbl.text = [arr_name objectAtIndex:0];
            
            recipeNamestr = [arr_name objectAtIndex:0];
            
            //For ingredients
            
            NSString *queryingredients=[ NSString stringWithFormat:@"Select recipe_ingredients from  summer_tbl where recipe_name ='SALMON' AND recipe_type ='Cinch' "];
            recipeIngredientsArr =[[NSMutableArray alloc]init];
            recipeIngredientsArr =[[database executeQuery:queryingredients]mutableCopy];
            
            
            NSMutableArray *arr_ingredients  = [recipeIngredientsArr valueForKey:@"recipe_ingredients"];
            NSLog(@"%@",arr_ingredients);
            
            //self.recipe_ingredientslbl.text = [arr_ingredients objectAtIndex:0];
            // [self.recipe_ingredientslbl sizeToFit];
            
            recipeIngredientsstr = [arr_ingredients objectAtIndex:0];
            
            //For method
            NSString *querymethod=[ NSString stringWithFormat:@"Select recipe_method from  summer_tbl where recipe_name ='SALMON' AND recipe_type ='Cinch' "];
            recipeMethodArr =[[NSMutableArray alloc]init];
            recipeMethodArr =[[database executeQuery:querymethod]mutableCopy];
            
            
            NSMutableArray *arr_method  = [recipeMethodArr valueForKey:@"recipe_method"];
            NSLog(@"%@",arr_method);
            
            //self.recipe_methodlbl.text = [arr_method objectAtIndex:0];
            //[self.recipe_methodlbl sizeToFit];
            recipeMethodstr = [arr_method objectAtIndex:0];
            
            
            
            [database close];
        }
        
        if([self.imageFile isEqualToString: @"Sesame-Seeds.jpg"])
        {
            [self databaseOpen];
            
            
            //For name
            
            NSString *queryname= [NSString stringWithFormat:@"Select recipe_subcategory,recipe_name,recipe_type from  summer_tbl where recipe_name ='SESAME SEEDS' AND recipe_type ='Cinch' "];
            recipeNameArr =[[NSMutableArray alloc]init];
            recipeNameArr =[[database executeQuery:queryname]mutableCopy];
            
            NSMutableArray *arr_name = [recipeNameArr valueForKey:@"recipe_subcategory"];
            
            //self.recipe_namelbl.text = [arr_name objectAtIndex:0];
            
            recipeNamestr = [arr_name objectAtIndex:0];
            
            //For ingredients
            
            NSString *queryingredients=[ NSString stringWithFormat:@"Select recipe_ingredients from  summer_tbl where recipe_name ='SESAME SEEDS' AND recipe_type ='Cinch' "];
            recipeIngredientsArr =[[NSMutableArray alloc]init];
            recipeIngredientsArr =[[database executeQuery:queryingredients]mutableCopy];
            
            
            NSMutableArray *arr_ingredients  = [recipeIngredientsArr valueForKey:@"recipe_ingredients"];
            NSLog(@"%@",arr_ingredients);
            
            //self.recipe_ingredientslbl.text = [arr_ingredients objectAtIndex:0];
            // [self.recipe_ingredientslbl sizeToFit];
            
            recipeIngredientsstr = [arr_ingredients objectAtIndex:0];
            
            //For method
            NSString *querymethod=[ NSString stringWithFormat:@"Select recipe_method from  summer_tbl where recipe_name ='SESAME SEEDS' AND recipe_type ='Cinch' "];
            recipeMethodArr =[[NSMutableArray alloc]init];
            recipeMethodArr =[[database executeQuery:querymethod]mutableCopy];
            
            
            NSMutableArray *arr_method  = [recipeMethodArr valueForKey:@"recipe_method"];
            NSLog(@"%@",arr_method);
            
            //self.recipe_methodlbl.text = [arr_method objectAtIndex:0];
            //[self.recipe_methodlbl sizeToFit];
            recipeMethodstr = [arr_method objectAtIndex:0];
            
            
            
            [database close];
        }
        if([self.imageFile isEqualToString: @"Tomatillo.jpg"])
        {
            [self databaseOpen];
            
            
            //For name
            
            NSString *queryname= [NSString stringWithFormat:@"Select recipe_subcategory,recipe_name,recipe_type from  summer_tbl where recipe_name ='TOMATILLO' AND recipe_type ='Cinch' "];
            recipeNameArr =[[NSMutableArray alloc]init];
            recipeNameArr =[[database executeQuery:queryname]mutableCopy];
            
            NSMutableArray *arr_name = [recipeNameArr valueForKey:@"recipe_subcategory"];
            
            //self.recipe_namelbl.text = [arr_name objectAtIndex:0];
            
            recipeNamestr = [arr_name objectAtIndex:0];
            
            //For ingredients
            
            NSString *queryingredients=[ NSString stringWithFormat:@"Select recipe_ingredients from  summer_tbl where recipe_name ='TOMATILLO' AND recipe_type ='Cinch' "];
            recipeIngredientsArr =[[NSMutableArray alloc]init];
            recipeIngredientsArr =[[database executeQuery:queryingredients]mutableCopy];
            
            
            NSMutableArray *arr_ingredients  = [recipeIngredientsArr valueForKey:@"recipe_ingredients"];
            NSLog(@"%@",arr_ingredients);
            
            //self.recipe_ingredientslbl.text = [arr_ingredients objectAtIndex:0];
            // [self.recipe_ingredientslbl sizeToFit];
            
            recipeIngredientsstr = [arr_ingredients objectAtIndex:0];
            
            //For method
            NSString *querymethod=[ NSString stringWithFormat:@"Select recipe_method from  summer_tbl where recipe_name ='TOMATILLO' AND recipe_type ='Cinch' "];
            recipeMethodArr =[[NSMutableArray alloc]init];
            recipeMethodArr =[[database executeQuery:querymethod]mutableCopy];
            
            
            NSMutableArray *arr_method  = [recipeMethodArr valueForKey:@"recipe_method"];
            NSLog(@"%@",arr_method);
            
            //self.recipe_methodlbl.text = [arr_method objectAtIndex:0];
            //[self.recipe_methodlbl sizeToFit];
            recipeMethodstr = [arr_method objectAtIndex:0];
            
            
            
            [database close];
        }
        
        if([self.imageFile isEqualToString: @"Tomato.jpg"])
        {
            [self databaseOpen];
            
            
            //For name
            
            NSString *queryname= [NSString stringWithFormat:@"Select recipe_subcategory,recipe_name,recipe_type from  summer_tbl where recipe_name ='TOMATO' AND recipe_type ='Cinch' "];
            recipeNameArr =[[NSMutableArray alloc]init];
            recipeNameArr =[[database executeQuery:queryname]mutableCopy];
            
            NSMutableArray *arr_name = [recipeNameArr valueForKey:@"recipe_subcategory"];
            
            //self.recipe_namelbl.text = [arr_name objectAtIndex:0];
            
            recipeNamestr = [arr_name objectAtIndex:0];
            
            //For ingredients
            
            NSString *queryingredients=[ NSString stringWithFormat:@"Select recipe_ingredients from  summer_tbl where recipe_name ='TOMATO' AND recipe_type ='Cinch' "];
            recipeIngredientsArr =[[NSMutableArray alloc]init];
            recipeIngredientsArr =[[database executeQuery:queryingredients]mutableCopy];
            
            
            NSMutableArray *arr_ingredients  = [recipeIngredientsArr valueForKey:@"recipe_ingredients"];
            NSLog(@"%@",arr_ingredients);
            
            //self.recipe_ingredientslbl.text = [arr_ingredients objectAtIndex:0];
            // [self.recipe_ingredientslbl sizeToFit];
            
            recipeIngredientsstr = [arr_ingredients objectAtIndex:0];
            
            //For method
            NSString *querymethod=[ NSString stringWithFormat:@"Select recipe_method from  summer_tbl where recipe_name ='TOMATO' AND recipe_type ='Cinch' "];
            recipeMethodArr =[[NSMutableArray alloc]init];
            recipeMethodArr =[[database executeQuery:querymethod]mutableCopy];
            
            
            NSMutableArray *arr_method  = [recipeMethodArr valueForKey:@"recipe_method"];
            NSLog(@"%@",arr_method);
            
            //self.recipe_methodlbl.text = [arr_method objectAtIndex:0];
            //[self.recipe_methodlbl sizeToFit];
            recipeMethodstr = [arr_method objectAtIndex:0];
            
            
            
            [database close];
        }
        if([self.imageFile isEqualToString: @"Water.jpg"])
        {
            [self databaseOpen];
            
            
            //For name
            
            NSString *queryname= [NSString stringWithFormat:@"Select recipe_subcategory,recipe_name,recipe_type from  summer_tbl where recipe_name ='WATER' AND recipe_type ='Cinch' "];
            recipeNameArr =[[NSMutableArray alloc]init];
            recipeNameArr =[[database executeQuery:queryname]mutableCopy];
            
            NSMutableArray *arr_name = [recipeNameArr valueForKey:@"recipe_subcategory"];
            
            //self.recipe_namelbl.text = [arr_name objectAtIndex:0];
            
            recipeNamestr = [arr_name objectAtIndex:0];
            
            //For ingredients
            
            NSString *queryingredients=[ NSString stringWithFormat:@"Select recipe_ingredients from  summer_tbl where recipe_name ='WATER' AND recipe_type ='Cinch' "];
            recipeIngredientsArr =[[NSMutableArray alloc]init];
            recipeIngredientsArr =[[database executeQuery:queryingredients]mutableCopy];
            
            
            NSMutableArray *arr_ingredients  = [recipeIngredientsArr valueForKey:@"recipe_ingredients"];
            NSLog(@"%@",arr_ingredients);
            
            //self.recipe_ingredientslbl.text = [arr_ingredients objectAtIndex:0];
            // [self.recipe_ingredientslbl sizeToFit];
            
            recipeIngredientsstr = [arr_ingredients objectAtIndex:0];
            
            //For method
            NSString *querymethod=[ NSString stringWithFormat:@"Select recipe_method from  summer_tbl where recipe_name ='WATER' AND recipe_type ='Cinch' "];
            recipeMethodArr =[[NSMutableArray alloc]init];
            recipeMethodArr =[[database executeQuery:querymethod]mutableCopy];
            
            
            NSMutableArray *arr_method  = [recipeMethodArr valueForKey:@"recipe_method"];
            NSLog(@"%@",arr_method);
            
            //self.recipe_methodlbl.text = [arr_method objectAtIndex:0];
            //[self.recipe_methodlbl sizeToFit];
            recipeMethodstr = [arr_method objectAtIndex:0];
            
            
            
            [database close];
        }
        if([self.imageFile isEqualToString: @"Zucchini.jpg"])
        {
            [self databaseOpen];
            
            
            //For name
            
            NSString *queryname= [NSString stringWithFormat:@"Select recipe_subcategory,recipe_name,recipe_type from  summer_tbl where recipe_name ='ZUCCHINI' AND recipe_type ='Cinch' "];
            recipeNameArr =[[NSMutableArray alloc]init];
            recipeNameArr =[[database executeQuery:queryname]mutableCopy];
            
            NSMutableArray *arr_name = [recipeNameArr valueForKey:@"recipe_subcategory"];
            
            //self.recipe_namelbl.text = [arr_name objectAtIndex:0];
            
            recipeNamestr = [arr_name objectAtIndex:0];
            
            //For ingredients
            
            NSString *queryingredients=[ NSString stringWithFormat:@"Select recipe_ingredients from  summer_tbl where recipe_name ='ZUCCHINI' AND recipe_type ='Cinch' "];
            recipeIngredientsArr =[[NSMutableArray alloc]init];
            recipeIngredientsArr =[[database executeQuery:queryingredients]mutableCopy];
            
            
            NSMutableArray *arr_ingredients  = [recipeIngredientsArr valueForKey:@"recipe_ingredients"];
            NSLog(@"%@",arr_ingredients);
            
            //self.recipe_ingredientslbl.text = [arr_ingredients objectAtIndex:0];
            // [self.recipe_ingredientslbl sizeToFit];
            
            recipeIngredientsstr = [arr_ingredients objectAtIndex:0];
            
            //For method
            NSString *querymethod=[ NSString stringWithFormat:@"Select recipe_method from  summer_tbl where recipe_name ='ZUCCHINI' AND recipe_type ='Cinch' "];
            recipeMethodArr =[[NSMutableArray alloc]init];
            recipeMethodArr =[[database executeQuery:querymethod]mutableCopy];
            
            
            NSMutableArray *arr_method  = [recipeMethodArr valueForKey:@"recipe_method"];
            NSLog(@"%@",arr_method);
            
            //self.recipe_methodlbl.text = [arr_method objectAtIndex:0];
            //[self.recipe_methodlbl sizeToFit];
            recipeMethodstr = [arr_method objectAtIndex:0];
            
            
            
            [database close];
        }
        [self performSegueWithIdentifier:@"cinchsegue" sender:self];
    }
   else if ([season isEqualToString:@"fall"])
   {
       
       
       //Apple.jpg
       
       if([self.imageFile isEqualToString: @"Apple.jpg"])
       {
           [self databaseOpen];
           
           
           //For name
           
           NSString *queryname= [NSString stringWithFormat:@"Select recipe_subcategory,recipe_name,recipe_type from fall_tbl where recipe_name = 'Apple' AND recipe_type = 'Cinch' "];
           recipeNameArr =[[NSMutableArray alloc]init];
           recipeNameArr =[[database executeQuery:queryname]mutableCopy];
           
           NSMutableArray *arr_name = [recipeNameArr valueForKey:@"recipe_subcategory"];
           
           //self.recipe_namelbl.text = [arr_name objectAtIndex:0];
           
           recipeNamestr = [arr_name objectAtIndex:0];
           
           //For ingredients
           
           NSString *queryingredients=[ NSString stringWithFormat:@"Select recipe_ingredients from fall_tbl where recipe_name = 'Apple' AND recipe_type = 'Cinch' "];
           recipeIngredientsArr =[[NSMutableArray alloc]init];
           recipeIngredientsArr =[[database executeQuery:queryingredients]mutableCopy];
           
           
           NSMutableArray *arr_ingredients  = [recipeIngredientsArr valueForKey:@"recipe_ingredients"];
           NSLog(@"%@",arr_ingredients);
           
           //self.recipe_ingredientslbl.text = [arr_ingredients objectAtIndex:0];
           // [self.recipe_ingredientslbl sizeToFit];
           
           recipeIngredientsstr = [arr_ingredients objectAtIndex:0];
           
           //For method
           NSString *querymethod=[ NSString stringWithFormat:@"Select recipe_method from fall_tbl where recipe_name = 'Apple' AND recipe_type = 'Cinch' "];
           recipeMethodArr =[[NSMutableArray alloc]init];
           recipeMethodArr =[[database executeQuery:querymethod]mutableCopy];
           
           
           NSMutableArray *arr_method  = [recipeMethodArr valueForKey:@"recipe_method"];
           NSLog(@"%@",arr_method);
           
           //self.recipe_methodlbl.text = [arr_method objectAtIndex:0];
           //[self.recipe_methodlbl sizeToFit];
           recipeMethodstr = [arr_method objectAtIndex:0];
           
           
           
           [database close];
       }
       
       
       
       
       //Beet.jpg
       
       
       if([self.imageFile isEqualToString: @"Beet.jpg"])
       {
           [self databaseOpen];
           
           
           //For name
           
           NSString *queryname= [NSString stringWithFormat:@"Select recipe_subcategory,recipe_name,recipe_type from fall_tbl where recipe_name = 'Beet' AND recipe_type = 'Cinch' "];
           recipeNameArr =[[NSMutableArray alloc]init];
           recipeNameArr =[[database executeQuery:queryname]mutableCopy];
           
           NSMutableArray *arr_name = [recipeNameArr valueForKey:@"recipe_subcategory"];
           
           //self.recipe_namelbl.text = [arr_name objectAtIndex:0];
           
           recipeNamestr = [arr_name objectAtIndex:0];
           
           //For ingredients
           
           NSString *queryingredients=[ NSString stringWithFormat:@"Select recipe_ingredients from fall_tbl where recipe_name = 'Beet' AND recipe_type = 'Cinch' "];
           recipeIngredientsArr =[[NSMutableArray alloc]init];
           recipeIngredientsArr =[[database executeQuery:queryingredients]mutableCopy];
           
           
           NSMutableArray *arr_ingredients  = [recipeIngredientsArr valueForKey:@"recipe_ingredients"];
           NSLog(@"%@",arr_ingredients);
           
           //self.recipe_ingredientslbl.text = [arr_ingredients objectAtIndex:0];
           // [self.recipe_ingredientslbl sizeToFit];
           
           recipeIngredientsstr = [arr_ingredients objectAtIndex:0];
           
           //For method
           NSString *querymethod=[ NSString stringWithFormat:@"Select recipe_method from fall_tbl where recipe_name = 'Beet' AND recipe_type = 'Cinch' "];
           recipeMethodArr =[[NSMutableArray alloc]init];
           recipeMethodArr =[[database executeQuery:querymethod]mutableCopy];
           
           
           NSMutableArray *arr_method  = [recipeMethodArr valueForKey:@"recipe_method"];
           NSLog(@"%@",arr_method);
           
           //self.recipe_methodlbl.text = [arr_method objectAtIndex:0];
           //[self.recipe_methodlbl sizeToFit];
           recipeMethodstr = [arr_method objectAtIndex:0];
           
           
           
           [database close];
       }
       
       
       
       // Brussels.jpg
       
       if([self.imageFile isEqualToString: @"Brussels.jpg"])
       {
           [self databaseOpen];
           
           
           //For name
           
           NSString *queryname= [NSString stringWithFormat:@"Select recipe_subcategory,recipe_name,recipe_type from fall_tbl where recipe_name = 'Brussel Sprout' AND recipe_type = 'Cinch' "];
           recipeNameArr =[[NSMutableArray alloc]init];
           recipeNameArr =[[database executeQuery:queryname]mutableCopy];
           
           NSMutableArray *arr_name = [recipeNameArr valueForKey:@"recipe_subcategory"];
           
           //self.recipe_namelbl.text = [arr_name objectAtIndex:0];
           
           recipeNamestr = [arr_name objectAtIndex:0];
           
           //For ingredients
           
           NSString *queryingredients=[ NSString stringWithFormat:@"Select recipe_ingredients from fall_tbl where recipe_name = 'Brussel Sprout' AND recipe_type = 'Cinch' "];
           recipeIngredientsArr =[[NSMutableArray alloc]init];
           recipeIngredientsArr =[[database executeQuery:queryingredients]mutableCopy];
           
           
           NSMutableArray *arr_ingredients  = [recipeIngredientsArr valueForKey:@"recipe_ingredients"];
           NSLog(@"%@",arr_ingredients);
           
           //self.recipe_ingredientslbl.text = [arr_ingredients objectAtIndex:0];
           // [self.recipe_ingredientslbl sizeToFit];
           
           recipeIngredientsstr = [arr_ingredients objectAtIndex:0];
           
           //For method
           NSString *querymethod=[ NSString stringWithFormat:@"Select recipe_method from fall_tbl where recipe_name = 'Brussel Sprout' AND recipe_type = 'Cinch' "];
           recipeMethodArr =[[NSMutableArray alloc]init];
           recipeMethodArr =[[database executeQuery:querymethod]mutableCopy];
           
           
           NSMutableArray *arr_method  = [recipeMethodArr valueForKey:@"recipe_method"];
           NSLog(@"%@",arr_method);
           
           //self.recipe_methodlbl.text = [arr_method objectAtIndex:0];
           //[self.recipe_methodlbl sizeToFit];
           recipeMethodstr = [arr_method objectAtIndex:0];
           
           
           
           [database close];
       }
       
       
       
       // Cabbage.jpg
       
       if([self.imageFile isEqualToString: @"Cabbage.jpg"])
       {
           [self databaseOpen];
           
           
           //For name
           
           NSString *queryname= [NSString stringWithFormat:@"Select recipe_subcategory,recipe_name,recipe_type from fall_tbl where recipe_name = 'Cabbage' AND recipe_type = 'Cinch' "];
           recipeNameArr =[[NSMutableArray alloc]init];
           recipeNameArr =[[database executeQuery:queryname]mutableCopy];
           
           NSMutableArray *arr_name = [recipeNameArr valueForKey:@"recipe_subcategory"];
           
           //self.recipe_namelbl.text = [arr_name objectAtIndex:0];
           
           recipeNamestr = [arr_name objectAtIndex:0];
           
           //For ingredients
           
           NSString *queryingredients=[ NSString stringWithFormat:@"Select recipe_ingredients from fall_tbl where recipe_name = 'Cabbage' AND recipe_type = 'Cinch' "];
           recipeIngredientsArr =[[NSMutableArray alloc]init];
           recipeIngredientsArr =[[database executeQuery:queryingredients]mutableCopy];
           
           
           NSMutableArray *arr_ingredients  = [recipeIngredientsArr valueForKey:@"recipe_ingredients"];
           NSLog(@"%@",arr_ingredients);
           
           //self.recipe_ingredientslbl.text = [arr_ingredients objectAtIndex:0];
           // [self.recipe_ingredientslbl sizeToFit];
           
           recipeIngredientsstr = [arr_ingredients objectAtIndex:0];
           
           //For method
           NSString *querymethod=[ NSString stringWithFormat:@"Select recipe_method from fall_tbl where recipe_name = 'Cabbage' AND recipe_type = 'Cinch' "];
           recipeMethodArr =[[NSMutableArray alloc]init];
           recipeMethodArr =[[database executeQuery:querymethod]mutableCopy];
           
           
           NSMutableArray *arr_method  = [recipeMethodArr valueForKey:@"recipe_method"];
           NSLog(@"%@",arr_method);
           
           //self.recipe_methodlbl.text = [arr_method objectAtIndex:0];
           //[self.recipe_methodlbl sizeToFit];
           recipeMethodstr = [arr_method objectAtIndex:0];
           
           
           
           [database close];
       }
       
       
       
       //  Carrot.jpg
       
       if([self.imageFile isEqualToString: @"Carrot.jpg"])
       {
           [self databaseOpen];
           
           
           //For name
           
           NSString *queryname= [NSString stringWithFormat:@"Select recipe_subcategory,recipe_name,recipe_type from fall_tbl where recipe_name = 'Carrot' AND recipe_type = 'Cinch' "];
           recipeNameArr =[[NSMutableArray alloc]init];
           recipeNameArr =[[database executeQuery:queryname]mutableCopy];
           
           NSMutableArray *arr_name = [recipeNameArr valueForKey:@"recipe_subcategory"];
           
           //self.recipe_namelbl.text = [arr_name objectAtIndex:0];
           
           recipeNamestr = [arr_name objectAtIndex:0];
           
           //For ingredients
           
           NSString *queryingredients=[ NSString stringWithFormat:@"Select recipe_ingredients from fall_tbl where recipe_name = 'Carrot' AND recipe_type = 'Cinch' "];
           recipeIngredientsArr =[[NSMutableArray alloc]init];
           recipeIngredientsArr =[[database executeQuery:queryingredients]mutableCopy];
           
           
           NSMutableArray *arr_ingredients  = [recipeIngredientsArr valueForKey:@"recipe_ingredients"];
           NSLog(@"%@",arr_ingredients);
           
           //self.recipe_ingredientslbl.text = [arr_ingredients objectAtIndex:0];
           // [self.recipe_ingredientslbl sizeToFit];
           
           recipeIngredientsstr = [arr_ingredients objectAtIndex:0];
           
           //For method
           NSString *querymethod=[ NSString stringWithFormat:@"Select recipe_method from fall_tbl where recipe_name = 'Carrot' AND recipe_type = 'Cinch' "];
           recipeMethodArr =[[NSMutableArray alloc]init];
           recipeMethodArr =[[database executeQuery:querymethod]mutableCopy];
           
           
           NSMutableArray *arr_method  = [recipeMethodArr valueForKey:@"recipe_method"];
           NSLog(@"%@",arr_method);
           
           //self.recipe_methodlbl.text = [arr_method objectAtIndex:0];
           //[self.recipe_methodlbl sizeToFit];
           recipeMethodstr = [arr_method objectAtIndex:0];
           
           
           
           [database close];
       }
       
       
       
       // Cauliflower.jpg
       
       if([self.imageFile isEqualToString: @"Cauliflower.jpg"])
       {
           [self databaseOpen];
           
           
           //For name
           
           NSString *queryname= [NSString stringWithFormat:@"Select recipe_subcategory,recipe_name,recipe_type from fall_tbl where recipe_name = 'Cauliflower' AND recipe_type = 'Cinch' "];
           recipeNameArr =[[NSMutableArray alloc]init];
           recipeNameArr =[[database executeQuery:queryname]mutableCopy];
           
           NSMutableArray *arr_name = [recipeNameArr valueForKey:@"recipe_subcategory"];
           
           //self.recipe_namelbl.text = [arr_name objectAtIndex:0];
           
           recipeNamestr = [arr_name objectAtIndex:0];
           
           //For ingredients
           
           NSString *queryingredients=[ NSString stringWithFormat:@"Select recipe_ingredients from fall_tbl where recipe_name = 'Cauliflower' AND recipe_type = 'Cinch' "];
           recipeIngredientsArr =[[NSMutableArray alloc]init];
           recipeIngredientsArr =[[database executeQuery:queryingredients]mutableCopy];
           
           
           NSMutableArray *arr_ingredients  = [recipeIngredientsArr valueForKey:@"recipe_ingredients"];
           NSLog(@"%@",arr_ingredients);
           
           //self.recipe_ingredientslbl.text = [arr_ingredients objectAtIndex:0];
           // [self.recipe_ingredientslbl sizeToFit];
           
           recipeIngredientsstr = [arr_ingredients objectAtIndex:0];
           
           //For method
           NSString *querymethod=[ NSString stringWithFormat:@"Select recipe_method from fall_tbl where recipe_name = 'Cauliflower' AND recipe_type = 'Cinch' "];
           recipeMethodArr =[[NSMutableArray alloc]init];
           recipeMethodArr =[[database executeQuery:querymethod]mutableCopy];
           
           
           NSMutableArray *arr_method  = [recipeMethodArr valueForKey:@"recipe_method"];
           NSLog(@"%@",arr_method);
           
           //self.recipe_methodlbl.text = [arr_method objectAtIndex:0];
           //[self.recipe_methodlbl sizeToFit];
           recipeMethodstr = [arr_method objectAtIndex:0];
           
           
           
           [database close];
       }
       
       
       
       // Celery.jpg
       
       if([self.imageFile isEqualToString: @"Celery.jpg"])
       {
           [self databaseOpen];
           
           
           //For name
           
           NSString *queryname= [NSString stringWithFormat:@"Select recipe_subcategory,recipe_name,recipe_type from fall_tbl where recipe_name = 'Celery' AND recipe_type = 'Cinch' "];
           recipeNameArr =[[NSMutableArray alloc]init];
           recipeNameArr =[[database executeQuery:queryname]mutableCopy];
           
           NSMutableArray *arr_name = [recipeNameArr valueForKey:@"recipe_subcategory"];
           
           //self.recipe_namelbl.text = [arr_name objectAtIndex:0];
           
           recipeNamestr = [arr_name objectAtIndex:0];
           
           //For ingredients
           
           NSString *queryingredients=[ NSString stringWithFormat:@"Select recipe_ingredients from fall_tbl where recipe_name = 'Celery' AND recipe_type = 'Cinch' "];
           recipeIngredientsArr =[[NSMutableArray alloc]init];
           recipeIngredientsArr =[[database executeQuery:queryingredients]mutableCopy];
           
           
           NSMutableArray *arr_ingredients  = [recipeIngredientsArr valueForKey:@"recipe_ingredients"];
           NSLog(@"%@",arr_ingredients);
           
           //self.recipe_ingredientslbl.text = [arr_ingredients objectAtIndex:0];
           // [self.recipe_ingredientslbl sizeToFit];
           
           recipeIngredientsstr = [arr_ingredients objectAtIndex:0];
           
           //For method
           NSString *querymethod=[ NSString stringWithFormat:@"Select recipe_method from fall_tbl where recipe_name = 'Celery' AND recipe_type = 'Cinch' "];
           recipeMethodArr =[[NSMutableArray alloc]init];
           recipeMethodArr =[[database executeQuery:querymethod]mutableCopy];
           
           
           NSMutableArray *arr_method  = [recipeMethodArr valueForKey:@"recipe_method"];
           NSLog(@"%@",arr_method);
           
           //self.recipe_methodlbl.text = [arr_method objectAtIndex:0];
           //[self.recipe_methodlbl sizeToFit];
           recipeMethodstr = [arr_method objectAtIndex:0];
           
           
           
           [database close];
       }
       
       
       
       //  Chard.jpg
       
       if([self.imageFile isEqualToString: @"Chard.jpg"])
       {
           [self databaseOpen];
           
           
           //For name
           
           NSString *queryname= [NSString stringWithFormat:@"Select recipe_subcategory,recipe_name,recipe_type from fall_tbl where recipe_name = 'Chard' AND recipe_type = 'Cinch' "];
           recipeNameArr =[[NSMutableArray alloc]init];
           recipeNameArr =[[database executeQuery:queryname]mutableCopy];
           
           NSMutableArray *arr_name = [recipeNameArr valueForKey:@"recipe_subcategory"];
           
           //self.recipe_namelbl.text = [arr_name objectAtIndex:0];
           
           recipeNamestr = [arr_name objectAtIndex:0];
           
           //For ingredients
           
           NSString *queryingredients=[ NSString stringWithFormat:@"Select recipe_ingredients from fall_tbl where recipe_name = 'Chard' AND recipe_type = 'Cinch' "];
           recipeIngredientsArr =[[NSMutableArray alloc]init];
           recipeIngredientsArr =[[database executeQuery:queryingredients]mutableCopy];
           
           
           NSMutableArray *arr_ingredients  = [recipeIngredientsArr valueForKey:@"recipe_ingredients"];
           NSLog(@"%@",arr_ingredients);
           
           //self.recipe_ingredientslbl.text = [arr_ingredients objectAtIndex:0];
           // [self.recipe_ingredientslbl sizeToFit];
           
           recipeIngredientsstr = [arr_ingredients objectAtIndex:0];
           
           //For method
           NSString *querymethod=[ NSString stringWithFormat:@"Select recipe_method from fall_tbl where recipe_name = 'Chard' AND recipe_type = 'Cinch' "];
           recipeMethodArr =[[NSMutableArray alloc]init];
           recipeMethodArr =[[database executeQuery:querymethod]mutableCopy];
           
           
           NSMutableArray *arr_method  = [recipeMethodArr valueForKey:@"recipe_method"];
           NSLog(@"%@",arr_method);
           
           //self.recipe_methodlbl.text = [arr_method objectAtIndex:0];
           //[self.recipe_methodlbl sizeToFit];
           recipeMethodstr = [arr_method objectAtIndex:0];
           
           
           
           [database close];
       }
       
       
       
       // Chile.jpg
       
       if([self.imageFile isEqualToString: @"Chile.jpg"])
       {
           [self databaseOpen];
           
           
           //For name
           
           NSString *queryname= [NSString stringWithFormat:@"Select recipe_subcategory,recipe_name,recipe_type from fall_tbl where recipe_name = 'Chile' AND recipe_type = 'Cinch' "];
           recipeNameArr =[[NSMutableArray alloc]init];
           recipeNameArr =[[database executeQuery:queryname]mutableCopy];
           
           NSMutableArray *arr_name = [recipeNameArr valueForKey:@"recipe_subcategory"];
           
           //self.recipe_namelbl.text = [arr_name objectAtIndex:0];
           
           recipeNamestr = [arr_name objectAtIndex:0];
           
           //For ingredients
           
           NSString *queryingredients=[ NSString stringWithFormat:@"Select recipe_ingredients from fall_tbl where recipe_name = 'Chile' AND recipe_type = 'Cinch' "];
           recipeIngredientsArr =[[NSMutableArray alloc]init];
           recipeIngredientsArr =[[database executeQuery:queryingredients]mutableCopy];
           
           
           NSMutableArray *arr_ingredients  = [recipeIngredientsArr valueForKey:@"recipe_ingredients"];
           NSLog(@"%@",arr_ingredients);
           
           //self.recipe_ingredientslbl.text = [arr_ingredients objectAtIndex:0];
           // [self.recipe_ingredientslbl sizeToFit];
           
           recipeIngredientsstr = [arr_ingredients objectAtIndex:0];
           
           //For method
           NSString *querymethod=[ NSString stringWithFormat:@"Select recipe_method from fall_tbl where recipe_name = 'Chile' AND recipe_type = 'Cinch' "];
           recipeMethodArr =[[NSMutableArray alloc]init];
           recipeMethodArr =[[database executeQuery:querymethod]mutableCopy];
           
           
           NSMutableArray *arr_method  = [recipeMethodArr valueForKey:@"recipe_method"];
           NSLog(@"%@",arr_method);
           
           //self.recipe_methodlbl.text = [arr_method objectAtIndex:0];
           //[self.recipe_methodlbl sizeToFit];
           recipeMethodstr = [arr_method objectAtIndex:0];
           
           
           
           [database close];
       }
       
       
       
       // Collard.jpg
       
       if([self.imageFile isEqualToString: @"Collard.jpg"])
       {
           [self databaseOpen];
           
           
           //For name
           
           NSString *queryname= [NSString stringWithFormat:@"Select recipe_subcategory,recipe_name,recipe_type from fall_tbl where recipe_name = 'Collard' AND recipe_type = 'Cinch' "];
           recipeNameArr =[[NSMutableArray alloc]init];
           recipeNameArr =[[database executeQuery:queryname]mutableCopy];
           
           NSMutableArray *arr_name = [recipeNameArr valueForKey:@"recipe_subcategory"];
           
           //self.recipe_namelbl.text = [arr_name objectAtIndex:0];
           
           recipeNamestr = [arr_name objectAtIndex:0];
           
           //For ingredients
           
           NSString *queryingredients=[ NSString stringWithFormat:@"Select recipe_ingredients from fall_tbl where recipe_name = 'Collard' AND recipe_type = 'Cinch' "];
           recipeIngredientsArr =[[NSMutableArray alloc]init];
           recipeIngredientsArr =[[database executeQuery:queryingredients]mutableCopy];
           
           
           NSMutableArray *arr_ingredients  = [recipeIngredientsArr valueForKey:@"recipe_ingredients"];
           NSLog(@"%@",arr_ingredients);
           
           //self.recipe_ingredientslbl.text = [arr_ingredients objectAtIndex:0];
           // [self.recipe_ingredientslbl sizeToFit];
           
           recipeIngredientsstr = [arr_ingredients objectAtIndex:0];
           
           //For method
           NSString *querymethod=[ NSString stringWithFormat:@"Select recipe_method from fall_tbl where recipe_name = 'Collard' AND recipe_type = 'Cinch' "];
           recipeMethodArr =[[NSMutableArray alloc]init];
           recipeMethodArr =[[database executeQuery:querymethod]mutableCopy];
           
           
           NSMutableArray *arr_method  = [recipeMethodArr valueForKey:@"recipe_method"];
           NSLog(@"%@",arr_method);
           
           //self.recipe_methodlbl.text = [arr_method objectAtIndex:0];
           //[self.recipe_methodlbl sizeToFit];
           recipeMethodstr = [arr_method objectAtIndex:0];
           
           
           
           [database close];
       }
       
       
       
       // Cranberry.jpg
       
       if([self.imageFile isEqualToString: @"Cranberry.jpg"])
       {
           [self databaseOpen];
           
           
           //For name
           
           NSString *queryname= [NSString stringWithFormat:@"Select recipe_subcategory,recipe_name,recipe_type from fall_tbl where recipe_name = 'Cranberry' AND recipe_type = 'Cinch' "];
           recipeNameArr =[[NSMutableArray alloc]init];
           recipeNameArr =[[database executeQuery:queryname]mutableCopy];
           
           NSMutableArray *arr_name = [recipeNameArr valueForKey:@"recipe_subcategory"];
           
           //self.recipe_namelbl.text = [arr_name objectAtIndex:0];
           
           recipeNamestr = [arr_name objectAtIndex:0];
           
           //For ingredients
           
           NSString *queryingredients=[ NSString stringWithFormat:@"Select recipe_ingredients from fall_tbl where recipe_name = 'Cranberry' AND recipe_type = 'Cinch' "];
           recipeIngredientsArr =[[NSMutableArray alloc]init];
           recipeIngredientsArr =[[database executeQuery:queryingredients]mutableCopy];
           
           
           NSMutableArray *arr_ingredients  = [recipeIngredientsArr valueForKey:@"recipe_ingredients"];
           NSLog(@"%@",arr_ingredients);
           
           //self.recipe_ingredientslbl.text = [arr_ingredients objectAtIndex:0];
           // [self.recipe_ingredientslbl sizeToFit];
           
           recipeIngredientsstr = [arr_ingredients objectAtIndex:0];
           
           //For method
           NSString *querymethod=[ NSString stringWithFormat:@"Select recipe_method from fall_tbl where recipe_name = 'Cranberry' AND recipe_type = 'Cinch' "];
           recipeMethodArr =[[NSMutableArray alloc]init];
           recipeMethodArr =[[database executeQuery:querymethod]mutableCopy];
           
           
           NSMutableArray *arr_method  = [recipeMethodArr valueForKey:@"recipe_method"];
           NSLog(@"%@",arr_method);
           
           //self.recipe_methodlbl.text = [arr_method objectAtIndex:0];
           //[self.recipe_methodlbl sizeToFit];
           recipeMethodstr = [arr_method objectAtIndex:0];
           
           
           
           [database close];
       }
       
       
       
       // Fig.jpg
       
       if([self.imageFile isEqualToString: @"Fig.jpg"])
       {
           [self databaseOpen];
           
           
           //For name
           
           NSString *queryname= [NSString stringWithFormat:@"Select recipe_subcategory,recipe_name,recipe_type from fall_tbl where recipe_name = 'Fig' AND recipe_type = 'Cinch' "];
           recipeNameArr =[[NSMutableArray alloc]init];
           recipeNameArr =[[database executeQuery:queryname]mutableCopy];
           
           NSMutableArray *arr_name = [recipeNameArr valueForKey:@"recipe_subcategory"];
           
           //self.recipe_namelbl.text = [arr_name objectAtIndex:0];
           
           recipeNamestr = [arr_name objectAtIndex:0];
           
           //For ingredients
           
           NSString *queryingredients=[ NSString stringWithFormat:@"Select recipe_ingredients from fall_tbl where recipe_name = 'Fig' AND recipe_type = 'Cinch' "];
           recipeIngredientsArr =[[NSMutableArray alloc]init];
           recipeIngredientsArr =[[database executeQuery:queryingredients]mutableCopy];
           
           
           NSMutableArray *arr_ingredients  = [recipeIngredientsArr valueForKey:@"recipe_ingredients"];
           NSLog(@"%@",arr_ingredients);
           
           //self.recipe_ingredientslbl.text = [arr_ingredients objectAtIndex:0];
           // [self.recipe_ingredientslbl sizeToFit];
           
           recipeIngredientsstr = [arr_ingredients objectAtIndex:0];
           
           //For method
           NSString *querymethod=[ NSString stringWithFormat:@"Select recipe_method from fall_tbl where recipe_name = 'Fig' AND recipe_type = 'Cinch' "];
           recipeMethodArr =[[NSMutableArray alloc]init];
           recipeMethodArr =[[database executeQuery:querymethod]mutableCopy];
           
           
           NSMutableArray *arr_method  = [recipeMethodArr valueForKey:@"recipe_method"];
           NSLog(@"%@",arr_method);
           
           //self.recipe_methodlbl.text = [arr_method objectAtIndex:0];
           //[self.recipe_methodlbl sizeToFit];
           recipeMethodstr = [arr_method objectAtIndex:0];
           
           
           
           [database close];
       }
       
       
       
       
       // Garlic.jpg
       
       if([self.imageFile isEqualToString: @"Garlic.jpg"])
       {
           [self databaseOpen];
           
           
           //For name
           
           NSString *queryname= [NSString stringWithFormat:@"Select recipe_subcategory,recipe_name,recipe_type from fall_tbl where recipe_name = 'Garlic' AND recipe_type = 'Cinch' "];
           recipeNameArr =[[NSMutableArray alloc]init];
           recipeNameArr =[[database executeQuery:queryname]mutableCopy];
           
           NSMutableArray *arr_name = [recipeNameArr valueForKey:@"recipe_subcategory"];
           
           //self.recipe_namelbl.text = [arr_name objectAtIndex:0];
           
           recipeNamestr = [arr_name objectAtIndex:0];
           
           //For ingredients
           
           NSString *queryingredients=[ NSString stringWithFormat:@"Select recipe_ingredients from fall_tbl where recipe_name = 'Garlic' AND recipe_type = 'Cinch' "];
           recipeIngredientsArr =[[NSMutableArray alloc]init];
           recipeIngredientsArr =[[database executeQuery:queryingredients]mutableCopy];
           
           
           NSMutableArray *arr_ingredients  = [recipeIngredientsArr valueForKey:@"recipe_ingredients"];
           NSLog(@"%@",arr_ingredients);
           
           //self.recipe_ingredientslbl.text = [arr_ingredients objectAtIndex:0];
           // [self.recipe_ingredientslbl sizeToFit];
           
           recipeIngredientsstr = [arr_ingredients objectAtIndex:0];
           
           //For method
           NSString *querymethod=[ NSString stringWithFormat:@"Select recipe_method from fall_tbl where recipe_name = 'Garlic' AND recipe_type = 'Cinch' "];
           recipeMethodArr =[[NSMutableArray alloc]init];
           recipeMethodArr =[[database executeQuery:querymethod]mutableCopy];
           
           
           NSMutableArray *arr_method  = [recipeMethodArr valueForKey:@"recipe_method"];
           NSLog(@"%@",arr_method);
           
           //self.recipe_methodlbl.text = [arr_method objectAtIndex:0];
           //[self.recipe_methodlbl sizeToFit];
           recipeMethodstr = [arr_method objectAtIndex:0];
           
           
           
           [database close];
       }
       
       
       
       
       // Grape.jpg
       
       if([self.imageFile isEqualToString: @"Grape.jpg"])
       {
           [self databaseOpen];
           
           
           //For name
           
           NSString *queryname= [NSString stringWithFormat:@"Select recipe_subcategory,recipe_name,recipe_type from fall_tbl where recipe_name = 'Grape' AND recipe_type = 'Cinch' "];
           recipeNameArr =[[NSMutableArray alloc]init];
           recipeNameArr =[[database executeQuery:queryname]mutableCopy];
           
           NSMutableArray *arr_name = [recipeNameArr valueForKey:@"recipe_subcategory"];
           
           //self.recipe_namelbl.text = [arr_name objectAtIndex:0];
           
           recipeNamestr = [arr_name objectAtIndex:0];
           
           //For ingredients
           
           NSString *queryingredients=[ NSString stringWithFormat:@"Select recipe_ingredients from fall_tbl where recipe_name = 'Grape' AND recipe_type = 'Cinch' "];
           recipeIngredientsArr =[[NSMutableArray alloc]init];
           recipeIngredientsArr =[[database executeQuery:queryingredients]mutableCopy];
           
           
           NSMutableArray *arr_ingredients  = [recipeIngredientsArr valueForKey:@"recipe_ingredients"];
           NSLog(@"%@",arr_ingredients);
           
           //self.recipe_ingredientslbl.text = [arr_ingredients objectAtIndex:0];
           // [self.recipe_ingredientslbl sizeToFit];
           
           recipeIngredientsstr = [arr_ingredients objectAtIndex:0];
           
           //For method
           NSString *querymethod=[ NSString stringWithFormat:@"Select recipe_method from fall_tbl where recipe_name = 'Grape' AND recipe_type = 'Cinch' "];
           recipeMethodArr =[[NSMutableArray alloc]init];
           recipeMethodArr =[[database executeQuery:querymethod]mutableCopy];
           
           
           NSMutableArray *arr_method  = [recipeMethodArr valueForKey:@"recipe_method"];
           NSLog(@"%@",arr_method);
           
           //self.recipe_methodlbl.text = [arr_method objectAtIndex:0];
           //[self.recipe_methodlbl sizeToFit];
           recipeMethodstr = [arr_method objectAtIndex:0];
           
           
           
           [database close];
       }
       
       
       
       
       // Oregano.jpg
       
       if([self.imageFile isEqualToString: @"Oregano.jpg"])
       {
           [self databaseOpen];
           
           
           //For name
           
           NSString *queryname= [NSString stringWithFormat:@"Select recipe_subcategory,recipe_name,recipe_type from fall_tbl where recipe_name = 'Oregano' AND recipe_type = 'Cinch' "];
           recipeNameArr =[[NSMutableArray alloc]init];
           recipeNameArr =[[database executeQuery:queryname]mutableCopy];
           
           NSMutableArray *arr_name = [recipeNameArr valueForKey:@"recipe_subcategory"];
           
           //self.recipe_namelbl.text = [arr_name objectAtIndex:0];
           
           recipeNamestr = [arr_name objectAtIndex:0];
           
           //For ingredients
           
           NSString *queryingredients=[ NSString stringWithFormat:@"Select recipe_ingredients from fall_tbl where recipe_name = 'Oregano' AND recipe_type = 'Cinch' "];
           recipeIngredientsArr =[[NSMutableArray alloc]init];
           recipeIngredientsArr =[[database executeQuery:queryingredients]mutableCopy];
           
           
           NSMutableArray *arr_ingredients  = [recipeIngredientsArr valueForKey:@"recipe_ingredients"];
           NSLog(@"%@",arr_ingredients);
           
           //self.recipe_ingredientslbl.text = [arr_ingredients objectAtIndex:0];
           // [self.recipe_ingredientslbl sizeToFit];
           
           recipeIngredientsstr = [arr_ingredients objectAtIndex:0];
           
           //For method
           NSString *querymethod=[ NSString stringWithFormat:@"Select recipe_method from fall_tbl where recipe_name = 'Oregano' AND recipe_type = 'Cinch' "];
           recipeMethodArr =[[NSMutableArray alloc]init];
           recipeMethodArr =[[database executeQuery:querymethod]mutableCopy];
           
           
           NSMutableArray *arr_method  = [recipeMethodArr valueForKey:@"recipe_method"];
           NSLog(@"%@",arr_method);
           
           //self.recipe_methodlbl.text = [arr_method objectAtIndex:0];
           //[self.recipe_methodlbl sizeToFit];
           recipeMethodstr = [arr_method objectAtIndex:0];
           
           
           
           [database close];
       }
       
       
       
       
       // Parsley.jpg
       
       if([self.imageFile isEqualToString: @"Parsley.jpg"])
       {
           [self databaseOpen];
           
           
           //For name
           
           NSString *queryname= [NSString stringWithFormat:@"Select recipe_subcategory,recipe_name,recipe_type from fall_tbl where recipe_name = 'Parsley' AND recipe_type = 'Cinch' "];
           recipeNameArr =[[NSMutableArray alloc]init];
           recipeNameArr =[[database executeQuery:queryname]mutableCopy];
           
           NSMutableArray *arr_name = [recipeNameArr valueForKey:@"recipe_subcategory"];
           
           //self.recipe_namelbl.text = [arr_name objectAtIndex:0];
           
           recipeNamestr = [arr_name objectAtIndex:0];
           
           //For ingredients
           
           NSString *queryingredients=[ NSString stringWithFormat:@"Select recipe_ingredients from fall_tbl where recipe_name = 'Parsley' AND recipe_type = 'Cinch' "];
           recipeIngredientsArr =[[NSMutableArray alloc]init];
           recipeIngredientsArr =[[database executeQuery:queryingredients]mutableCopy];
           
           
           NSMutableArray *arr_ingredients  = [recipeIngredientsArr valueForKey:@"recipe_ingredients"];
           NSLog(@"%@",arr_ingredients);
           
           //self.recipe_ingredientslbl.text = [arr_ingredients objectAtIndex:0];
           // [self.recipe_ingredientslbl sizeToFit];
           
           recipeIngredientsstr = [arr_ingredients objectAtIndex:0];
           
           //For method
           NSString *querymethod=[ NSString stringWithFormat:@"Select recipe_method from fall_tbl where recipe_name = 'Parsley' AND recipe_type = 'Cinch' "];
           recipeMethodArr =[[NSMutableArray alloc]init];
           recipeMethodArr =[[database executeQuery:querymethod]mutableCopy];
           
           
           NSMutableArray *arr_method  = [recipeMethodArr valueForKey:@"recipe_method"];
           NSLog(@"%@",arr_method);
           
           //self.recipe_methodlbl.text = [arr_method objectAtIndex:0];
           //[self.recipe_methodlbl sizeToFit];
           recipeMethodstr = [arr_method objectAtIndex:0];
           
           
           
           [database close];
       }
       
       
       
       
       // Pistachio.jpg
       
       if([self.imageFile isEqualToString: @"Pistachio.jpg"])
       {
           [self databaseOpen];
           
           
           //For name
           
           NSString *queryname= [NSString stringWithFormat:@"Select recipe_subcategory,recipe_name,recipe_type from fall_tbl where recipe_name = 'Pistachio' AND recipe_type = 'Cinch' "];
           recipeNameArr =[[NSMutableArray alloc]init];
           recipeNameArr =[[database executeQuery:queryname]mutableCopy];
           
           NSMutableArray *arr_name = [recipeNameArr valueForKey:@"recipe_subcategory"];
           
           //self.recipe_namelbl.text = [arr_name objectAtIndex:0];
           
           recipeNamestr = [arr_name objectAtIndex:0];
           
           //For ingredients
           
           NSString *queryingredients=[ NSString stringWithFormat:@"Select recipe_ingredients from fall_tbl where recipe_name = 'Pistachio' AND recipe_type = 'Cinch' "];
           recipeIngredientsArr =[[NSMutableArray alloc]init];
           recipeIngredientsArr =[[database executeQuery:queryingredients]mutableCopy];
           
           
           NSMutableArray *arr_ingredients  = [recipeIngredientsArr valueForKey:@"recipe_ingredients"];
           NSLog(@"%@",arr_ingredients);
           
           //self.recipe_ingredientslbl.text = [arr_ingredients objectAtIndex:0];
           // [self.recipe_ingredientslbl sizeToFit];
           
           recipeIngredientsstr = [arr_ingredients objectAtIndex:0];
           
           //For method
           NSString *querymethod=[ NSString stringWithFormat:@"Select recipe_method from fall_tbl where recipe_name = 'Pistachio' AND recipe_type = 'Cinch' "];
           recipeMethodArr =[[NSMutableArray alloc]init];
           recipeMethodArr =[[database executeQuery:querymethod]mutableCopy];
           
           
           NSMutableArray *arr_method  = [recipeMethodArr valueForKey:@"recipe_method"];
           NSLog(@"%@",arr_method);
           
           //self.recipe_methodlbl.text = [arr_method objectAtIndex:0];
           //[self.recipe_methodlbl sizeToFit];
           recipeMethodstr = [arr_method objectAtIndex:0];
           
           
           
           [database close];
       }
       
       
       
       
       // Pork.jpg
       
       if([self.imageFile isEqualToString: @"Pork.jpg"])
       {
           [self databaseOpen];
           
           
           //For name
           
           NSString *queryname= [NSString stringWithFormat:@"Select recipe_subcategory,recipe_name,recipe_type from fall_tbl where recipe_name = 'Pork' AND recipe_type = 'Cinch' "];
           recipeNameArr =[[NSMutableArray alloc]init];
           recipeNameArr =[[database executeQuery:queryname]mutableCopy];
           
           NSMutableArray *arr_name = [recipeNameArr valueForKey:@"recipe_subcategory"];
           
           //self.recipe_namelbl.text = [arr_name objectAtIndex:0];
           
           recipeNamestr = [arr_name objectAtIndex:0];
           
           //For ingredients
           
           NSString *queryingredients=[ NSString stringWithFormat:@"Select recipe_ingredients from fall_tbl where recipe_name = 'Pork' AND recipe_type = 'Cinch' "];
           recipeIngredientsArr =[[NSMutableArray alloc]init];
           recipeIngredientsArr =[[database executeQuery:queryingredients]mutableCopy];
           
           
           NSMutableArray *arr_ingredients  = [recipeIngredientsArr valueForKey:@"recipe_ingredients"];
           NSLog(@"%@",arr_ingredients);
           
           //self.recipe_ingredientslbl.text = [arr_ingredients objectAtIndex:0];
           // [self.recipe_ingredientslbl sizeToFit];
           
           recipeIngredientsstr = [arr_ingredients objectAtIndex:0];
           
           //For method
           NSString *querymethod=[ NSString stringWithFormat:@"Select recipe_method from fall_tbl where recipe_name = 'Pork' AND recipe_type = 'Cinch' "];
           recipeMethodArr =[[NSMutableArray alloc]init];
           recipeMethodArr =[[database executeQuery:querymethod]mutableCopy];
           
           
           NSMutableArray *arr_method  = [recipeMethodArr valueForKey:@"recipe_method"];
           NSLog(@"%@",arr_method);
           
           //self.recipe_methodlbl.text = [arr_method objectAtIndex:0];
           //[self.recipe_methodlbl sizeToFit];
           recipeMethodstr = [arr_method objectAtIndex:0];
           
           
           
           [database close];
       }
       
       
       
       
       // PorkAlternate.jpg
       
       if([self.imageFile isEqualToString: @"PorkAlternate.jpg"])
       {
           [self databaseOpen];
           
           
           //For name
           
           NSString *queryname= [NSString stringWithFormat:@"Select recipe_subcategory,recipe_name,recipe_type from fall_tbl where recipe_name = 'PorkAlternate' AND recipe_type = 'Cinch' "];
           recipeNameArr =[[NSMutableArray alloc]init];
           recipeNameArr =[[database executeQuery:queryname]mutableCopy];
           
           NSMutableArray *arr_name = [recipeNameArr valueForKey:@"recipe_subcategory"];
           
           //self.recipe_namelbl.text = [arr_name objectAtIndex:0];
           
           recipeNamestr = [arr_name objectAtIndex:0];
           
           //For ingredients
           
           NSString *queryingredients=[ NSString stringWithFormat:@"Select recipe_ingredients from fall_tbl where recipe_name = 'PorkAlternate' AND recipe_type = 'Cinch' "];
           recipeIngredientsArr =[[NSMutableArray alloc]init];
           recipeIngredientsArr =[[database executeQuery:queryingredients]mutableCopy];
           
           
           NSMutableArray *arr_ingredients  = [recipeIngredientsArr valueForKey:@"recipe_ingredients"];
           NSLog(@"%@",arr_ingredients);
           
           //self.recipe_ingredientslbl.text = [arr_ingredients objectAtIndex:0];
           // [self.recipe_ingredientslbl sizeToFit];
           
           recipeIngredientsstr = [arr_ingredients objectAtIndex:0];
           
           //For method
           NSString *querymethod=[ NSString stringWithFormat:@"Select recipe_method from fall_tbl where recipe_name = 'PorkAlternate' AND recipe_type = 'Cinch' "];
           recipeMethodArr =[[NSMutableArray alloc]init];
           recipeMethodArr =[[database executeQuery:querymethod]mutableCopy];
           
           
           NSMutableArray *arr_method  = [recipeMethodArr valueForKey:@"recipe_method"];
           NSLog(@"%@",arr_method);
           
           //self.recipe_methodlbl.text = [arr_method objectAtIndex:0];
           //[self.recipe_methodlbl sizeToFit];
           recipeMethodstr = [arr_method objectAtIndex:0];
           
           
           
           [database close];
       }
       
       
       
       
       // Pumpkin Seeds.jpg
       
       if([self.imageFile isEqualToString: @"Pumpkin Seeds.jpg"])
       {
           [self databaseOpen];
           
           
           //For name
           
           NSString *queryname= [NSString stringWithFormat:@"Select recipe_subcategory,recipe_name,recipe_type from fall_tbl where recipe_name = 'Pumpkin Seeds' AND recipe_type = 'Cinch' "];
           recipeNameArr =[[NSMutableArray alloc]init];
           recipeNameArr =[[database executeQuery:queryname]mutableCopy];
           
           NSMutableArray *arr_name = [recipeNameArr valueForKey:@"recipe_subcategory"];
           
           //self.recipe_namelbl.text = [arr_name objectAtIndex:0];
           
           recipeNamestr = [arr_name objectAtIndex:0];
           
           //For ingredients
           
           NSString *queryingredients=[ NSString stringWithFormat:@"Select recipe_ingredients from fall_tbl where recipe_name = 'Pumpkin Seeds' AND recipe_type = 'Cinch' "];
           recipeIngredientsArr =[[NSMutableArray alloc]init];
           recipeIngredientsArr =[[database executeQuery:queryingredients]mutableCopy];
           
           
           NSMutableArray *arr_ingredients  = [recipeIngredientsArr valueForKey:@"recipe_ingredients"];
           NSLog(@"%@",arr_ingredients);
           
           //self.recipe_ingredientslbl.text = [arr_ingredients objectAtIndex:0];
           // [self.recipe_ingredientslbl sizeToFit];
           
           recipeIngredientsstr = [arr_ingredients objectAtIndex:0];
           
           //For method
           NSString *querymethod=[ NSString stringWithFormat:@"Select recipe_method from fall_tbl where recipe_name = 'Pumpkin Seeds' AND recipe_type = 'Cinch' "];
           recipeMethodArr =[[NSMutableArray alloc]init];
           recipeMethodArr =[[database executeQuery:querymethod]mutableCopy];
           
           
           NSMutableArray *arr_method  = [recipeMethodArr valueForKey:@"recipe_method"];
           NSLog(@"%@",arr_method);
           
           //self.recipe_methodlbl.text = [arr_method objectAtIndex:0];
           //[self.recipe_methodlbl sizeToFit];
           recipeMethodstr = [arr_method objectAtIndex:0];
           
           
           
           [database close];
       }
       
       
       
       
       // Pumpkin.jpg
       
       if([self.imageFile isEqualToString: @"Pumpkin.jpg"])
       {
           [self databaseOpen];
           
           
           //For name
           
           NSString *queryname= [NSString stringWithFormat:@"Select recipe_subcategory,recipe_name,recipe_type from fall_tbl where recipe_name = 'Pumpkin' AND recipe_type = 'Cinch' "];
           recipeNameArr =[[NSMutableArray alloc]init];
           recipeNameArr =[[database executeQuery:queryname]mutableCopy];
           
           NSMutableArray *arr_name = [recipeNameArr valueForKey:@"recipe_subcategory"];
           
           //self.recipe_namelbl.text = [arr_name objectAtIndex:0];
           
           recipeNamestr = [arr_name objectAtIndex:0];
           
           //For ingredients
           
           NSString *queryingredients=[ NSString stringWithFormat:@"Select recipe_ingredients from fall_tbl where recipe_name = 'Pumpkin' AND recipe_type = 'Cinch' "];
           recipeIngredientsArr =[[NSMutableArray alloc]init];
           recipeIngredientsArr =[[database executeQuery:queryingredients]mutableCopy];
           
           
           NSMutableArray *arr_ingredients  = [recipeIngredientsArr valueForKey:@"recipe_ingredients"];
           NSLog(@"%@",arr_ingredients);
           
           //self.recipe_ingredientslbl.text = [arr_ingredients objectAtIndex:0];
           // [self.recipe_ingredientslbl sizeToFit];
           
           recipeIngredientsstr = [arr_ingredients objectAtIndex:0];
           
           //For method
           NSString *querymethod=[ NSString stringWithFormat:@"Select recipe_method from fall_tbl where recipe_name = 'Pumpkin' AND recipe_type = 'Cinch' "];
           recipeMethodArr =[[NSMutableArray alloc]init];
           recipeMethodArr =[[database executeQuery:querymethod]mutableCopy];
           
           
           NSMutableArray *arr_method  = [recipeMethodArr valueForKey:@"recipe_method"];
           NSLog(@"%@",arr_method);
           
           //self.recipe_methodlbl.text = [arr_method objectAtIndex:0];
           //[self.recipe_methodlbl sizeToFit];
           recipeMethodstr = [arr_method objectAtIndex:0];
           
           
           
           [database close];
       }
       
       
       // Raspberry.jpg
       
       if([self.imageFile isEqualToString: @"Raspberry.jpg"])
       {
           [self databaseOpen];
           
           
           //For name
           
           NSString *queryname= [NSString stringWithFormat:@"Select recipe_subcategory,recipe_name,recipe_type from fall_tbl where recipe_name = 'Raspberry' AND recipe_type = 'Cinch' "];
           recipeNameArr =[[NSMutableArray alloc]init];
           recipeNameArr =[[database executeQuery:queryname]mutableCopy];
           
           NSMutableArray *arr_name = [recipeNameArr valueForKey:@"recipe_subcategory"];
           
           //self.recipe_namelbl.text = [arr_name objectAtIndex:0];
           
           recipeNamestr = [arr_name objectAtIndex:0];
           
           //For ingredients
           
           NSString *queryingredients=[ NSString stringWithFormat:@"Select recipe_ingredients from fall_tbl where recipe_name = 'Raspberry' AND recipe_type = 'Cinch' "];
           recipeIngredientsArr =[[NSMutableArray alloc]init];
           recipeIngredientsArr =[[database executeQuery:queryingredients]mutableCopy];
           
           
           NSMutableArray *arr_ingredients  = [recipeIngredientsArr valueForKey:@"recipe_ingredients"];
           NSLog(@"%@",arr_ingredients);
           
           //self.recipe_ingredientslbl.text = [arr_ingredients objectAtIndex:0];
           // [self.recipe_ingredientslbl sizeToFit];
           
           recipeIngredientsstr = [arr_ingredients objectAtIndex:0];
           
           //For method
           NSString *querymethod=[ NSString stringWithFormat:@"Select recipe_method from fall_tbl where recipe_name = 'Raspberry' AND recipe_type = 'Cinch' "];
           recipeMethodArr =[[NSMutableArray alloc]init];
           recipeMethodArr =[[database executeQuery:querymethod]mutableCopy];
           
           
           NSMutableArray *arr_method  = [recipeMethodArr valueForKey:@"recipe_method"];
           NSLog(@"%@",arr_method);
           
           //self.recipe_methodlbl.text = [arr_method objectAtIndex:0];
           //[self.recipe_methodlbl sizeToFit];
           recipeMethodstr = [arr_method objectAtIndex:0];
           
           
           
           [database close];
       }
       
       
       
       // Shallot.jpg
       
       if([self.imageFile isEqualToString: @"Shallot.jpg"])
       {
           [self databaseOpen];
           
           
           //For name
           
           NSString *queryname= [NSString stringWithFormat:@"Select recipe_subcategory,recipe_name,recipe_type from fall_tbl where recipe_name = 'Shallot' AND recipe_type = 'Cinch' "];
           recipeNameArr =[[NSMutableArray alloc]init];
           recipeNameArr =[[database executeQuery:queryname]mutableCopy];
           
           NSMutableArray *arr_name = [recipeNameArr valueForKey:@"recipe_subcategory"];
           
           //self.recipe_namelbl.text = [arr_name objectAtIndex:0];
           
           recipeNamestr = [arr_name objectAtIndex:0];
           
           //For ingredients
           
           NSString *queryingredients=[ NSString stringWithFormat:@"Select recipe_ingredients from fall_tbl where recipe_name = 'Shallot' AND recipe_type = 'Cinch' "];
           recipeIngredientsArr =[[NSMutableArray alloc]init];
           recipeIngredientsArr =[[database executeQuery:queryingredients]mutableCopy];
           
           
           NSMutableArray *arr_ingredients  = [recipeIngredientsArr valueForKey:@"recipe_ingredients"];
           NSLog(@"%@",arr_ingredients);
           
           //self.recipe_ingredientslbl.text = [arr_ingredients objectAtIndex:0];
           // [self.recipe_ingredientslbl sizeToFit];
           
           recipeIngredientsstr = [arr_ingredients objectAtIndex:0];
           
           //For method
           NSString *querymethod=[ NSString stringWithFormat:@"Select recipe_method from fall_tbl where recipe_name = 'Shallot' AND recipe_type = 'Cinch' "];
           recipeMethodArr =[[NSMutableArray alloc]init];
           recipeMethodArr =[[database executeQuery:querymethod]mutableCopy];
           
           
           NSMutableArray *arr_method  = [recipeMethodArr valueForKey:@"recipe_method"];
           NSLog(@"%@",arr_method);
           
           //self.recipe_methodlbl.text = [arr_method objectAtIndex:0];
           //[self.recipe_methodlbl sizeToFit];
           recipeMethodstr = [arr_method objectAtIndex:0];
           
           
           
           [database close];
       }
       
       
       // Squash.jpg
       
       if([self.imageFile isEqualToString: @"Squash.jpg"])
       {
           [self databaseOpen];
           
           
           //For name
           
           NSString *queryname= [NSString stringWithFormat:@"Select recipe_subcategory,recipe_name,recipe_type from fall_tbl where recipe_name = 'Squash' AND recipe_type = 'Cinch' "];
           recipeNameArr =[[NSMutableArray alloc]init];
           recipeNameArr =[[database executeQuery:queryname]mutableCopy];
           
           NSMutableArray *arr_name = [recipeNameArr valueForKey:@"recipe_subcategory"];
           
           //self.recipe_namelbl.text = [arr_name objectAtIndex:0];
           
           recipeNamestr = [arr_name objectAtIndex:0];
           
           //For ingredients
           
           NSString *queryingredients=[ NSString stringWithFormat:@"Select recipe_ingredients from fall_tbl where recipe_name = 'Squash' AND recipe_type = 'Cinch' "];
           recipeIngredientsArr =[[NSMutableArray alloc]init];
           recipeIngredientsArr =[[database executeQuery:queryingredients]mutableCopy];
           
           
           NSMutableArray *arr_ingredients  = [recipeIngredientsArr valueForKey:@"recipe_ingredients"];
           NSLog(@"%@",arr_ingredients);
           
           //self.recipe_ingredientslbl.text = [arr_ingredients objectAtIndex:0];
           // [self.recipe_ingredientslbl sizeToFit];
           
           recipeIngredientsstr = [arr_ingredients objectAtIndex:0];
           
           //For method
           NSString *querymethod=[ NSString stringWithFormat:@"Select recipe_method from fall_tbl where recipe_name = 'Squash' AND recipe_type = 'Cinch' "];
           recipeMethodArr =[[NSMutableArray alloc]init];
           recipeMethodArr =[[database executeQuery:querymethod]mutableCopy];
           
           
           NSMutableArray *arr_method  = [recipeMethodArr valueForKey:@"recipe_method"];
           NSLog(@"%@",arr_method);
           
           //self.recipe_methodlbl.text = [arr_method objectAtIndex:0];
           //[self.recipe_methodlbl sizeToFit];
           recipeMethodstr = [arr_method objectAtIndex:0];
           
           
           
           [database close];
       }
       
       
       
       // Turkey.jpg
       
       if([self.imageFile isEqualToString: @"Turkey.jpg"])
       {
           [self databaseOpen];
           
           
           //For name
           
           NSString *queryname= [NSString stringWithFormat:@"Select recipe_subcategory,recipe_name,recipe_type from fall_tbl where recipe_name = 'Turkey' AND recipe_type = 'Cinch' "];
           recipeNameArr =[[NSMutableArray alloc]init];
           recipeNameArr =[[database executeQuery:queryname]mutableCopy];
           
           NSMutableArray *arr_name = [recipeNameArr valueForKey:@"recipe_subcategory"];
           
           //self.recipe_namelbl.text = [arr_name objectAtIndex:0];
           
           recipeNamestr = [arr_name objectAtIndex:0];
           
           //For ingredients
           
           NSString *queryingredients=[ NSString stringWithFormat:@"Select recipe_ingredients from fall_tbl where recipe_name = 'Turkey' AND recipe_type = 'Cinch' "];
           recipeIngredientsArr =[[NSMutableArray alloc]init];
           recipeIngredientsArr =[[database executeQuery:queryingredients]mutableCopy];
           
           
           NSMutableArray *arr_ingredients  = [recipeIngredientsArr valueForKey:@"recipe_ingredients"];
           NSLog(@"%@",arr_ingredients);
           
           //self.recipe_ingredientslbl.text = [arr_ingredients objectAtIndex:0];
           // [self.recipe_ingredientslbl sizeToFit];
           
           recipeIngredientsstr = [arr_ingredients objectAtIndex:0];
           
           //For method
           NSString *querymethod=[ NSString stringWithFormat:@"Select recipe_method from fall_tbl where recipe_name = 'Turkey' AND recipe_type = 'Cinch' "];
           recipeMethodArr =[[NSMutableArray alloc]init];
           recipeMethodArr =[[database executeQuery:querymethod]mutableCopy];
           
           
           NSMutableArray *arr_method  = [recipeMethodArr valueForKey:@"recipe_method"];
           NSLog(@"%@",arr_method);
           
           //self.recipe_methodlbl.text = [arr_method objectAtIndex:0];
           //[self.recipe_methodlbl sizeToFit];
           recipeMethodstr = [arr_method objectAtIndex:0];
           
           
           
           [database close];
       }
       
       
       
       // Venison.jpg
       
       if([self.imageFile isEqualToString: @"Venison.jpg"])
       {
           [self databaseOpen];
           
           
           //For name
           
           NSString *queryname= [NSString stringWithFormat:@"Select recipe_subcategory,recipe_name,recipe_type from fall_tbl where recipe_name = 'Venison' AND recipe_type = 'Cinch' "];
           recipeNameArr =[[NSMutableArray alloc]init];
           recipeNameArr =[[database executeQuery:queryname]mutableCopy];
           
           NSMutableArray *arr_name = [recipeNameArr valueForKey:@"recipe_subcategory"];
           
           //self.recipe_namelbl.text = [arr_name objectAtIndex:0];
           
           recipeNamestr = [arr_name objectAtIndex:0];
           
           //For ingredients
           
           NSString *queryingredients=[ NSString stringWithFormat:@"Select recipe_ingredients from fall_tbl where recipe_name = 'Venison' AND recipe_type = 'Cinch' "];
           recipeIngredientsArr =[[NSMutableArray alloc]init];
           recipeIngredientsArr =[[database executeQuery:queryingredients]mutableCopy];
           
           
           NSMutableArray *arr_ingredients  = [recipeIngredientsArr valueForKey:@"recipe_ingredients"];
           NSLog(@"%@",arr_ingredients);
           
           //self.recipe_ingredientslbl.text = [arr_ingredients objectAtIndex:0];
           // [self.recipe_ingredientslbl sizeToFit];
           
           recipeIngredientsstr = [arr_ingredients objectAtIndex:0];
           
           //For method
           NSString *querymethod=[ NSString stringWithFormat:@"Select recipe_method from fall_tbl where recipe_name = 'Venison' AND recipe_type = 'Cinch' "];
           recipeMethodArr =[[NSMutableArray alloc]init];
           recipeMethodArr =[[database executeQuery:querymethod]mutableCopy];
           
           
           NSMutableArray *arr_method  = [recipeMethodArr valueForKey:@"recipe_method"];
           NSLog(@"%@",arr_method);
           
           //self.recipe_methodlbl.text = [arr_method objectAtIndex:0];
           //[self.recipe_methodlbl sizeToFit];
           recipeMethodstr = [arr_method objectAtIndex:0];
           
           
           
           [database close];
       }
       
       
       
       
       
       

   }
    
    NSMutableArray *arr_recipe = [recipeNameArr valueForKey:@"recipe_name"];
    recipestr = [arr_recipe objectAtIndex:0];
    
    NSMutableArray *arr_recipetype = [recipeNameArr valueForKey:@"recipe_type"];
    recipeTypestr = [arr_recipetype objectAtIndex:0];

    [[NSUserDefaults standardUserDefaults]setValue:recipestr forKey:@"recipeName"];
    [[NSUserDefaults standardUserDefaults]setValue:recipeTypestr forKey:@"recipeType"];

    
}
-(IBAction)simplebtnPressed:(id)sender
{
    NSString *season = [[NSUserDefaults standardUserDefaults]valueForKey:@"recipe"];
   // NSLog(@"%@",season);
        if([season isEqualToString:@"spring"])
    {
        if([self.imageFile isEqualToString: @"Spinach.jpg"])
        {
            [self databaseOpen];
            
            
            //For name
            
            NSString *queryname= [NSString stringWithFormat:@"Select recipe_subcategory,recipe_name,recipe_type from spring_tbl where recipe_name ='SPINACH' AND recipe_type ='Simple' "];
            recipeNameArr =[[NSMutableArray alloc]init];
            recipeNameArr =[[database executeQuery:queryname]mutableCopy];
            
            NSMutableArray *arr_name = [recipeNameArr valueForKey:@"recipe_subcategory"];
            
            //self.recipe_namelbl.text = [arr_name objectAtIndex:0];
            recipeNamestr = [arr_name objectAtIndex:0];
            
            //For ingredients
            
            NSString *queryingredients=[ NSString stringWithFormat:@"Select recipe_ingredients from spring_tbl where recipe_name ='SPINACH' AND recipe_type ='Simple' "];
            recipeIngredientsArr =[[NSMutableArray alloc]init];
            recipeIngredientsArr =[[database executeQuery:queryingredients]mutableCopy];
            
            
            NSMutableArray *arr_ingredients  = [recipeIngredientsArr valueForKey:@"recipe_ingredients"];
            NSLog(@"%@",arr_ingredients);
            
            //self.recipe_ingredientslbl.text = [arr_ingredients objectAtIndex:0];
            // [self.recipe_ingredientslbl sizeToFit];
            recipeIngredientsstr = [arr_ingredients objectAtIndex:0];
            //For method
            NSString *querymethod=[ NSString stringWithFormat:@"Select recipe_method from spring_tbl where recipe_name ='SPINACH' AND recipe_type ='Simple' "];
            recipeMethodArr =[[NSMutableArray alloc]init];
            recipeMethodArr =[[database executeQuery:querymethod]mutableCopy];
            
            
            NSMutableArray *arr_method  = [recipeMethodArr valueForKey:@"recipe_method"];
            NSLog(@"%@",arr_ingredients);
            
            //self.recipe_methodlbl.text = [arr_method objectAtIndex:0];
            //[self.recipe_methodlbl sizeToFit];
            
            recipeMethodstr = [arr_method objectAtIndex:0];
            
            [database close];
            
        }

        if([self.imageFile isEqualToString: @"Peas.jpg"])
        {
            [self databaseOpen];
            
            
            //For name
            
            NSString *queryname= [NSString stringWithFormat:@"Select recipe_subcategory,recipe_name,recipe_type from spring_tbl where recipe_name ='PEA' AND recipe_type ='Simple' "];
            recipeNameArr =[[NSMutableArray alloc]init];
            recipeNameArr =[[database executeQuery:queryname]mutableCopy];
            
            NSMutableArray *arr_name = [recipeNameArr valueForKey:@"recipe_subcategory"];
            
            //self.recipe_namelbl.text = [arr_name objectAtIndex:0];
            recipeNamestr = [arr_name objectAtIndex:0];
            
            //For ingredients
            
            NSString *queryingredients=[ NSString stringWithFormat:@"Select recipe_ingredients from spring_tbl where recipe_name ='PEA' AND recipe_type ='Simple' "];
            recipeIngredientsArr =[[NSMutableArray alloc]init];
            recipeIngredientsArr =[[database executeQuery:queryingredients]mutableCopy];
            
            
            NSMutableArray *arr_ingredients  = [recipeIngredientsArr valueForKey:@"recipe_ingredients"];
            NSLog(@"%@",arr_ingredients);
            
            //self.recipe_ingredientslbl.text = [arr_ingredients objectAtIndex:0];
            // [self.recipe_ingredientslbl sizeToFit];
            recipeIngredientsstr = [arr_ingredients objectAtIndex:0];
            //For method
            NSString *querymethod=[ NSString stringWithFormat:@"Select recipe_method from spring_tbl where recipe_name ='PEA' AND recipe_type ='Simple' "];
            recipeMethodArr =[[NSMutableArray alloc]init];
            recipeMethodArr =[[database executeQuery:querymethod]mutableCopy];
            
            
            NSMutableArray *arr_method  = [recipeMethodArr valueForKey:@"recipe_method"];
            NSLog(@"%@",arr_ingredients);
            
            //self.recipe_methodlbl.text = [arr_method objectAtIndex:0];
            //[self.recipe_methodlbl sizeToFit];
            
            recipeMethodstr = [arr_method objectAtIndex:0];
            
            [database close];
            
        }
        if([self.imageFile isEqualToString: @"Currant.jpg"])
        {
            [self databaseOpen];
            
            
            //For name
            
            NSString *queryname= [NSString stringWithFormat:@"Select recipe_subcategory,recipe_name,recipe_type from spring_tbl where recipe_name ='CURRANT' AND recipe_type ='Simple' "];
            recipeNameArr =[[NSMutableArray alloc]init];
            recipeNameArr =[[database executeQuery:queryname]mutableCopy];
            
            NSMutableArray *arr_name = [recipeNameArr valueForKey:@"recipe_subcategory"];
            
            //self.recipe_namelbl.text = [arr_name objectAtIndex:0];
            recipeNamestr = [arr_name objectAtIndex:0];
            
            //For ingredients
            
            NSString *queryingredients=[ NSString stringWithFormat:@"Select recipe_ingredients from spring_tbl where recipe_name ='CURRANT' AND recipe_type ='Simple' "];
            recipeIngredientsArr =[[NSMutableArray alloc]init];
            recipeIngredientsArr =[[database executeQuery:queryingredients]mutableCopy];
            
            
            NSMutableArray *arr_ingredients  = [recipeIngredientsArr valueForKey:@"recipe_ingredients"];
            NSLog(@"%@",arr_ingredients);
            
            //self.recipe_ingredientslbl.text = [arr_ingredients objectAtIndex:0];
            // [self.recipe_ingredientslbl sizeToFit];
            recipeIngredientsstr = [arr_ingredients objectAtIndex:0];
            //For method
            NSString *querymethod=[ NSString stringWithFormat:@"Select recipe_method from spring_tbl where recipe_name ='CURRANT' AND recipe_type ='Simple' "];
            recipeMethodArr =[[NSMutableArray alloc]init];
            recipeMethodArr =[[database executeQuery:querymethod]mutableCopy];
            
            
            NSMutableArray *arr_method  = [recipeMethodArr valueForKey:@"recipe_method"];
            NSLog(@"%@",arr_ingredients);
            
            //self.recipe_methodlbl.text = [arr_method objectAtIndex:0];
            //[self.recipe_methodlbl sizeToFit];
            
            recipeMethodstr = [arr_method objectAtIndex:0];
            
            [database close];
            
        }

        if([self.imageFile isEqualToString: @"Asparagus.jpg"])
        {
            [self databaseOpen];
            
            
            //For name
            
            NSString *queryname= [NSString stringWithFormat:@"Select recipe_subcategory,recipe_name,recipe_type from spring_tbl where recipe_name ='ASPARAGUS' AND recipe_type ='Simple' "];
            recipeNameArr =[[NSMutableArray alloc]init];
            recipeNameArr =[[database executeQuery:queryname]mutableCopy];
            
            NSMutableArray *arr_name = [recipeNameArr valueForKey:@"recipe_subcategory"];
            
            //self.recipe_namelbl.text = [arr_name objectAtIndex:0];
            
            recipeNamestr = [arr_name objectAtIndex:0];
            
            //For ingredients
            
            NSString *queryingredients=[ NSString stringWithFormat:@"Select recipe_ingredients from spring_tbl where recipe_name ='ASPARAGUS' AND recipe_type ='Simple' "];
            recipeIngredientsArr =[[NSMutableArray alloc]init];
            recipeIngredientsArr =[[database executeQuery:queryingredients]mutableCopy];
            
            
            NSMutableArray *arr_ingredients  = [recipeIngredientsArr valueForKey:@"recipe_ingredients"];
            NSLog(@"%@",arr_ingredients);
            
            //self.recipe_ingredientslbl.text = [arr_ingredients objectAtIndex:0];
            // [self.recipe_ingredientslbl sizeToFit];
            
            recipeIngredientsstr = [arr_ingredients objectAtIndex:0];
            
            //For method
            NSString *querymethod=[ NSString stringWithFormat:@"Select recipe_method from spring_tbl where recipe_name ='ASPARAGUS' AND recipe_type ='Simple' "];
            recipeMethodArr =[[NSMutableArray alloc]init];
            recipeMethodArr =[[database executeQuery:querymethod]mutableCopy];
            
            
            NSMutableArray *arr_method  = [recipeMethodArr valueForKey:@"recipe_method"];
            NSLog(@"%@",arr_method);
            
            //self.recipe_methodlbl.text = [arr_method objectAtIndex:0];
            //[self.recipe_methodlbl sizeToFit];
            recipeMethodstr = [arr_method objectAtIndex:0];
            
            
            
            [database close];
        }
        if([self.imageFile isEqualToString: @"Egg.jpg"])
        {
            [self databaseOpen];
            
            
            //For name
            
            NSString *queryname= [NSString stringWithFormat:@"Select recipe_subcategory,recipe_name,recipe_type from spring_tbl where recipe_name ='EGG' AND recipe_type ='Simple' "];
            recipeNameArr =[[NSMutableArray alloc]init];
            recipeNameArr =[[database executeQuery:queryname]mutableCopy];
            
            NSMutableArray *arr_name = [recipeNameArr valueForKey:@"recipe_subcategory"];
            
            //self.recipe_namelbl.text = [arr_name objectAtIndex:0];
            recipeNamestr = [arr_name objectAtIndex:0];
            
            //For ingredients
            
            NSString *queryingredients=[ NSString stringWithFormat:@"Select recipe_ingredients from spring_tbl where recipe_name ='EGG' AND recipe_type ='Simple' "];
            recipeIngredientsArr =[[NSMutableArray alloc]init];
            recipeIngredientsArr =[[database executeQuery:queryingredients]mutableCopy];
            
            
            NSMutableArray *arr_ingredients  = [recipeIngredientsArr valueForKey:@"recipe_ingredients"];
            NSLog(@"%@",arr_ingredients);
            
            //self.recipe_ingredientslbl.text = [arr_ingredients objectAtIndex:0];
            // [self.recipe_ingredientslbl sizeToFit];
            recipeIngredientsstr = [arr_ingredients objectAtIndex:0];
            
            //For method
            NSString *querymethod=[ NSString stringWithFormat:@"Select recipe_method from spring_tbl where recipe_name ='EGG' AND recipe_type ='Simple' "];
            recipeMethodArr =[[NSMutableArray alloc]init];
            recipeMethodArr =[[database executeQuery:querymethod]mutableCopy];
            
            
            NSMutableArray *arr_method  = [recipeMethodArr valueForKey:@"recipe_method"];
            NSLog(@"%@",arr_ingredients);
            
            //self.recipe_methodlbl.text = [arr_method objectAtIndex:0];
            //[self.recipe_methodlbl sizeToFit];
            recipeMethodstr = [arr_method objectAtIndex:0];
            
            
            [database close];
            
        }
        if([self.imageFile isEqualToString: @"Quinoa.jpg"])
        {
            [self databaseOpen];
            
            
            //For name
            
            NSString *queryname= [NSString stringWithFormat:@"Select recipe_subcategory,recipe_name,recipe_type from spring_tbl where recipe_name ='QUINOA' AND recipe_type ='Simple' "];
            recipeNameArr =[[NSMutableArray alloc]init];
            recipeNameArr =[[database executeQuery:queryname]mutableCopy];
            
            NSMutableArray *arr_name = [recipeNameArr valueForKey:@"recipe_subcategory"];
            
            //self.recipe_namelbl.text = [arr_name objectAtIndex:0];
            recipeNamestr = [arr_name objectAtIndex:0];
            
            //For ingredients
            
            NSString *queryingredients=[ NSString stringWithFormat:@"Select recipe_ingredients from spring_tbl where recipe_name ='QUINOA' AND recipe_type ='Simple' "];
            recipeIngredientsArr =[[NSMutableArray alloc]init];
            recipeIngredientsArr =[[database executeQuery:queryingredients]mutableCopy];
            
            
            NSMutableArray *arr_ingredients  = [recipeIngredientsArr valueForKey:@"recipe_ingredients"];
            NSLog(@"%@",arr_ingredients);
            
            //self.recipe_ingredientslbl.text = [arr_ingredients objectAtIndex:0];
            // [self.recipe_ingredientslbl sizeToFit];
            recipeIngredientsstr = [arr_ingredients objectAtIndex:0];
            //For method
            NSString *querymethod=[ NSString stringWithFormat:@"Select recipe_method from spring_tbl where recipe_name ='QUINOA' AND recipe_type ='Simple' "];
            recipeMethodArr =[[NSMutableArray alloc]init];
            recipeMethodArr =[[database executeQuery:querymethod]mutableCopy];
            
            
            NSMutableArray *arr_method  = [recipeMethodArr valueForKey:@"recipe_method"];
            NSLog(@"%@",arr_ingredients);
            
            //self.recipe_methodlbl.text = [arr_method objectAtIndex:0];
            //[self.recipe_methodlbl sizeToFit];
            
            recipeMethodstr = [arr_method objectAtIndex:0];
            
            [database close];
            
        }
        if([self.imageFile isEqualToString: @"Radish.jpg"])
        {
            [self databaseOpen];
            
            
            //For name
            
            NSString *queryname= [NSString stringWithFormat:@"Select recipe_subcategory,recipe_name,recipe_type from spring_tbl where recipe_name ='RADISH' AND recipe_type ='Simple' "];
            recipeNameArr =[[NSMutableArray alloc]init];
            recipeNameArr =[[database executeQuery:queryname]mutableCopy];
            
            NSMutableArray *arr_name = [recipeNameArr valueForKey:@"recipe_subcategory"];
            
            //self.recipe_namelbl.text = [arr_name objectAtIndex:0];
            recipeNamestr = [arr_name objectAtIndex:0];
            
            //For ingredients
            
            NSString *queryingredients=[ NSString stringWithFormat:@"Select recipe_ingredients from spring_tbl where recipe_name ='RADISH' AND recipe_type ='Simple' "];
            recipeIngredientsArr =[[NSMutableArray alloc]init];
            recipeIngredientsArr =[[database executeQuery:queryingredients]mutableCopy];
            
            
            NSMutableArray *arr_ingredients  = [recipeIngredientsArr valueForKey:@"recipe_ingredients"];
            NSLog(@"%@",arr_ingredients);
            
            //self.recipe_ingredientslbl.text = [arr_ingredients objectAtIndex:0];
            // [self.recipe_ingredientslbl sizeToFit];
            recipeIngredientsstr = [arr_ingredients objectAtIndex:0];
            //For method
            NSString *querymethod=[ NSString stringWithFormat:@"Select recipe_method from spring_tbl where recipe_name ='RADISH' AND recipe_type ='Simple' "];
            recipeMethodArr =[[NSMutableArray alloc]init];
            recipeMethodArr =[[database executeQuery:querymethod]mutableCopy];
            
            
            NSMutableArray *arr_method  = [recipeMethodArr valueForKey:@"recipe_method"];
            NSLog(@"%@",arr_ingredients);
            
            //self.recipe_methodlbl.text = [arr_method objectAtIndex:0];
            //[self.recipe_methodlbl sizeToFit];
            
            recipeMethodstr = [arr_method objectAtIndex:0];
            
            [database close];
            
        }
        if([self.imageFile isEqualToString: @"Rhubarb.jpg"])
        {
            [self databaseOpen];
            
            
            //For name
            
            NSString *queryname= [NSString stringWithFormat:@"Select recipe_subcategory,recipe_name,recipe_type from spring_tbl where recipe_name ='RHUBARB' AND recipe_type ='Simple' "];
            recipeNameArr =[[NSMutableArray alloc]init];
            recipeNameArr =[[database executeQuery:queryname]mutableCopy];
            
            NSMutableArray *arr_name = [recipeNameArr valueForKey:@"recipe_subcategory"];
            
            //self.recipe_namelbl.text = [arr_name objectAtIndex:0];
            recipeNamestr = [arr_name objectAtIndex:0];
            
            //For ingredients
            
            NSString *queryingredients=[ NSString stringWithFormat:@"Select recipe_ingredients from spring_tbl where recipe_name ='RHUBARB' AND recipe_type ='Simple' "];
            recipeIngredientsArr =[[NSMutableArray alloc]init];
            recipeIngredientsArr =[[database executeQuery:queryingredients]mutableCopy];
            
            
            NSMutableArray *arr_ingredients  = [recipeIngredientsArr valueForKey:@"recipe_ingredients"];
            NSLog(@"%@",arr_ingredients);
            
            //self.recipe_ingredientslbl.text = [arr_ingredients objectAtIndex:0];
            // [self.recipe_ingredientslbl sizeToFit];
            recipeIngredientsstr = [arr_ingredients objectAtIndex:0];
            //For method
            NSString *querymethod=[ NSString stringWithFormat:@"Select recipe_method from spring_tbl where recipe_name ='RHUBARB' AND recipe_type ='Simple' "];
            recipeMethodArr =[[NSMutableArray alloc]init];
            recipeMethodArr =[[database executeQuery:querymethod]mutableCopy];
            
            
            NSMutableArray *arr_method  = [recipeMethodArr valueForKey:@"recipe_method"];
            NSLog(@"%@",arr_ingredients);
            
            //self.recipe_methodlbl.text = [arr_method objectAtIndex:0];
            //[self.recipe_methodlbl sizeToFit];
            
            recipeMethodstr = [arr_method objectAtIndex:0];
            
            [database close];
            
        }
        if([self.imageFile isEqualToString: @"Broccoli.jpg"])
        {
            [self databaseOpen];
            
            
            //For name
            
            NSString *queryname= [NSString stringWithFormat:@"Select recipe_subcategory,recipe_name,recipe_type from spring_tbl where recipe_name ='BROCCOLI' AND recipe_type ='Simple' "];
            recipeNameArr =[[NSMutableArray alloc]init];
            recipeNameArr =[[database executeQuery:queryname]mutableCopy];
            
            NSMutableArray *arr_name = [recipeNameArr valueForKey:@"recipe_subcategory"];
            
            //self.recipe_namelbl.text = [arr_name objectAtIndex:0];
            recipeNamestr = [arr_name objectAtIndex:0];
            
            //For ingredients
            
            NSString *queryingredients=[ NSString stringWithFormat:@"Select recipe_ingredients from spring_tbl where recipe_name ='BROCCOLI' AND recipe_type ='Simple' "];
            recipeIngredientsArr =[[NSMutableArray alloc]init];
            recipeIngredientsArr =[[database executeQuery:queryingredients]mutableCopy];
            
            
            NSMutableArray *arr_ingredients  = [recipeIngredientsArr valueForKey:@"recipe_ingredients"];
            NSLog(@"%@",arr_ingredients);
            
            //self.recipe_ingredientslbl.text = [arr_ingredients objectAtIndex:0];
            // [self.recipe_ingredientslbl sizeToFit];
            recipeIngredientsstr = [arr_ingredients objectAtIndex:0];
            //For method
            NSString *querymethod=[ NSString stringWithFormat:@"Select recipe_method from spring_tbl where recipe_name ='BROCCOLI' AND recipe_type ='Simple' "];
            recipeMethodArr =[[NSMutableArray alloc]init];
            recipeMethodArr =[[database executeQuery:querymethod]mutableCopy];
            
            
            NSMutableArray *arr_method  = [recipeMethodArr valueForKey:@"recipe_method"];
            NSLog(@"%@",arr_ingredients);
            
            //self.recipe_methodlbl.text = [arr_method objectAtIndex:0];
            //[self.recipe_methodlbl sizeToFit];
            
            recipeMethodstr = [arr_method objectAtIndex:0];
            
            [database close];
            
        }
        if([self.imageFile isEqualToString: @"Crab.jpg"])
        {
            [self databaseOpen];
            
            
            //For name
            
            NSString *queryname= [NSString stringWithFormat:@"Select recipe_subcategory,recipe_name,recipe_type from spring_tbl where recipe_name ='CRAB' AND recipe_type ='Simple' "];
            recipeNameArr =[[NSMutableArray alloc]init];
            recipeNameArr =[[database executeQuery:queryname]mutableCopy];
            
            NSMutableArray *arr_name = [recipeNameArr valueForKey:@"recipe_subcategory"];
            
            //self.recipe_namelbl.text = [arr_name objectAtIndex:0];
            recipeNamestr = [arr_name objectAtIndex:0];
            
            //For ingredients
            
            NSString *queryingredients=[ NSString stringWithFormat:@"Select recipe_ingredients from spring_tbl where recipe_name ='CRAB' AND recipe_type ='Simple' "];
            recipeIngredientsArr =[[NSMutableArray alloc]init];
            recipeIngredientsArr =[[database executeQuery:queryingredients]mutableCopy];
            
            
            NSMutableArray *arr_ingredients  = [recipeIngredientsArr valueForKey:@"recipe_ingredients"];
            NSLog(@"%@",arr_ingredients);
            
            //self.recipe_ingredientslbl.text = [arr_ingredients objectAtIndex:0];
            // [self.recipe_ingredientslbl sizeToFit];
            recipeIngredientsstr = [arr_ingredients objectAtIndex:0];
            //For method
            NSString *querymethod=[ NSString stringWithFormat:@"Select recipe_method from spring_tbl where recipe_name ='CRAB' AND recipe_type ='Simple' "];
            recipeMethodArr =[[NSMutableArray alloc]init];
            recipeMethodArr =[[database executeQuery:querymethod]mutableCopy];
            
            
            NSMutableArray *arr_method  = [recipeMethodArr valueForKey:@"recipe_method"];
            NSLog(@"%@",arr_ingredients);
            
            //self.recipe_methodlbl.text = [arr_method objectAtIndex:0];
            //[self.recipe_methodlbl sizeToFit];
            
            
            recipeMethodstr = [arr_method objectAtIndex:0];
            [database close];
            
        }
        if([self.imageFile isEqualToString: @"Escarole.jpg"])
        {
            [self databaseOpen];
            
            
            //For name
            
            NSString *queryname= [NSString stringWithFormat:@"Select recipe_subcategory,recipe_name,recipe_type from spring_tbl where recipe_name ='ESCAROLE' AND recipe_type ='Simple' "];
            recipeNameArr =[[NSMutableArray alloc]init];
            recipeNameArr =[[database executeQuery:queryname]mutableCopy];
            
            NSMutableArray *arr_name = [recipeNameArr valueForKey:@"recipe_subcategory"];
            
            //self.recipe_namelbl.text = [arr_name objectAtIndex:0];
            recipeNamestr = [arr_name objectAtIndex:0];
            
            //For ingredients
            
            NSString *queryingredients=[ NSString stringWithFormat:@"Select recipe_ingredients from spring_tbl where recipe_name ='ESCAROLE' AND recipe_type ='Simple' "];
            recipeIngredientsArr =[[NSMutableArray alloc]init];
            recipeIngredientsArr =[[database executeQuery:queryingredients]mutableCopy];
            
            
            NSMutableArray *arr_ingredients  = [recipeIngredientsArr valueForKey:@"recipe_ingredients"];
            NSLog(@"%@",arr_ingredients);
            
            //self.recipe_ingredientslbl.text = [arr_ingredients objectAtIndex:0];
            // [self.recipe_ingredientslbl sizeToFit];
            recipeIngredientsstr = [arr_ingredients objectAtIndex:0];
            //For method
            NSString *querymethod=[ NSString stringWithFormat:@"Select recipe_method from spring_tbl where recipe_name ='ESCAROLE' AND recipe_type ='Simple' "];
            recipeMethodArr =[[NSMutableArray alloc]init];
            recipeMethodArr =[[database executeQuery:querymethod]mutableCopy];
            
            
            NSMutableArray *arr_method  = [recipeMethodArr valueForKey:@"recipe_method"];
            NSLog(@"%@",arr_ingredients);
            
            //self.recipe_methodlbl.text = [arr_method objectAtIndex:0];
            //[self.recipe_methodlbl sizeToFit];
            
            recipeMethodstr = [arr_method objectAtIndex:0];
            
            [database close];
            
        }
        if([self.imageFile isEqualToString: @"Fennel.jpg"])
        {
            [self databaseOpen];
            
            
            //For name
            
            NSString *queryname= [NSString stringWithFormat:@"Select recipe_subcategory,recipe_name,recipe_type from spring_tbl where recipe_name ='FENNEL' AND recipe_type ='Simple' "];
            recipeNameArr =[[NSMutableArray alloc]init];
            recipeNameArr =[[database executeQuery:queryname]mutableCopy];
            
            NSMutableArray *arr_name = [recipeNameArr valueForKey:@"recipe_subcategory"];
            recipeNamestr = [arr_name objectAtIndex:0];
            //self.recipe_namelbl.text = [arr_name objectAtIndex:0];
            
            
            //For ingredients
            
            NSString *queryingredients=[ NSString stringWithFormat:@"Select recipe_ingredients from spring_tbl where recipe_name ='FENNEL' AND recipe_type ='Simple' "];
            recipeIngredientsArr =[[NSMutableArray alloc]init];
            recipeIngredientsArr =[[database executeQuery:queryingredients]mutableCopy];
            
            
            NSMutableArray *arr_ingredients  = [recipeIngredientsArr valueForKey:@"recipe_ingredients"];
            NSLog(@"%@",arr_ingredients);
            
            //self.recipe_ingredientslbl.text = [arr_ingredients objectAtIndex:0];
            // [self.recipe_ingredientslbl sizeToFit];
            recipeIngredientsstr = [arr_ingredients objectAtIndex:0];
            //For method
            NSString *querymethod=[ NSString stringWithFormat:@"Select recipe_method from spring_tbl where recipe_name ='FENNEL' AND recipe_type ='Simple' "];
            recipeMethodArr =[[NSMutableArray alloc]init];
            recipeMethodArr =[[database executeQuery:querymethod]mutableCopy];
            
            
            NSMutableArray *arr_method  = [recipeMethodArr valueForKey:@"recipe_method"];
            NSLog(@"%@",arr_ingredients);
            
            //self.recipe_methodlbl.text = [arr_method objectAtIndex:0];
            //[self.recipe_methodlbl sizeToFit];
            
            
            recipeMethodstr = [arr_method objectAtIndex:0];
            [database close];
            
        }
        if([self.imageFile isEqualToString: @"Fiddlehead-Ferns.jpg"])
        {
            [self databaseOpen];
            
            
            //For name
            
            NSString *queryname= [NSString stringWithFormat:@"Select recipe_subcategory,recipe_name,recipe_type from spring_tbl where recipe_name ='FIDDLEHEAD FERNS' AND recipe_type ='Simple' "];
            recipeNameArr =[[NSMutableArray alloc]init];
            recipeNameArr =[[database executeQuery:queryname]mutableCopy];
            
            NSMutableArray *arr_name = [recipeNameArr valueForKey:@"recipe_subcategory"];
            recipeNamestr = [arr_name objectAtIndex:0];
            //self.recipe_namelbl.text = [arr_name objectAtIndex:0];
            
            
            //For ingredients
            
            NSString *queryingredients=[ NSString stringWithFormat:@"Select recipe_ingredients from spring_tbl where recipe_name ='FIDDLEHEAD FERNS' AND recipe_type ='Simple' "];
            recipeIngredientsArr =[[NSMutableArray alloc]init];
            recipeIngredientsArr =[[database executeQuery:queryingredients]mutableCopy];
            
            
            NSMutableArray *arr_ingredients  = [recipeIngredientsArr valueForKey:@"recipe_ingredients"];
            NSLog(@"%@",arr_ingredients);
            
            //self.recipe_ingredientslbl.text = [arr_ingredients objectAtIndex:0];
            // [self.recipe_ingredientslbl sizeToFit];
            recipeIngredientsstr = [arr_ingredients objectAtIndex:0];
            //For method
            NSString *querymethod=[ NSString stringWithFormat:@"Select recipe_method from spring_tbl where recipe_name ='FIDDLEHEAD FERNS' AND recipe_type ='Simple' "];
            recipeMethodArr =[[NSMutableArray alloc]init];
            recipeMethodArr =[[database executeQuery:querymethod]mutableCopy];
            
            
            NSMutableArray *arr_method  = [recipeMethodArr valueForKey:@"recipe_method"];
            NSLog(@"%@",arr_ingredients);
            
            //self.recipe_methodlbl.text = [arr_method objectAtIndex:0];
            //[self.recipe_methodlbl sizeToFit];
            
            
            recipeMethodstr = [arr_method objectAtIndex:0];
            [database close];
            
        }
        if([self.imageFile isEqualToString: @"Flounder.jpg"])
        {
            [self databaseOpen];
            
            
            //For name
            
            NSString *queryname= [NSString stringWithFormat:@"Select recipe_subcategory,recipe_name,recipe_type from spring_tbl where recipe_name ='FLOUNDER' AND recipe_type ='Simple' "];
            recipeNameArr =[[NSMutableArray alloc]init];
            recipeNameArr =[[database executeQuery:queryname]mutableCopy];
            
            NSMutableArray *arr_name = [recipeNameArr valueForKey:@"recipe_subcategory"];
            recipeNamestr = [arr_name objectAtIndex:0];
            //self.recipe_namelbl.text = [arr_name objectAtIndex:0];
            
            
            //For ingredients
            
            NSString *queryingredients=[ NSString stringWithFormat:@"Select recipe_ingredients from spring_tbl where recipe_name ='FLOUNDER' AND recipe_type ='Simple' "];
            recipeIngredientsArr =[[NSMutableArray alloc]init];
            recipeIngredientsArr =[[database executeQuery:queryingredients]mutableCopy];
            
            
            NSMutableArray *arr_ingredients  = [recipeIngredientsArr valueForKey:@"recipe_ingredients"];
            NSLog(@"%@",arr_ingredients);
            
            //self.recipe_ingredientslbl.text = [arr_ingredients objectAtIndex:0];
            // [self.recipe_ingredientslbl sizeToFit];
            recipeIngredientsstr = [arr_ingredients objectAtIndex:0];
            //For method
            NSString *querymethod=[ NSString stringWithFormat:@"Select recipe_method from spring_tbl where recipe_name ='FLOUNDER' AND recipe_type ='Simple' "];
            recipeMethodArr =[[NSMutableArray alloc]init];
            recipeMethodArr =[[database executeQuery:querymethod]mutableCopy];
            
            
            NSMutableArray *arr_method  = [recipeMethodArr valueForKey:@"recipe_method"];
            NSLog(@"%@",arr_ingredients);
            
            //self.recipe_methodlbl.text = [arr_method objectAtIndex:0];
            //[self.recipe_methodlbl sizeToFit];
            
            
            recipeMethodstr = [arr_method objectAtIndex:0];
            [database close];
            
        }
        
        if([self.imageFile isEqualToString: @"Ginger.jpg"])
        {
            [self databaseOpen];
            
            
            //For name
            
            NSString *queryname= [NSString stringWithFormat:@"Select recipe_subcategory,recipe_name,recipe_type from spring_tbl where recipe_name ='GINGER' AND recipe_type ='Simple' "];
            recipeNameArr =[[NSMutableArray alloc]init];
            recipeNameArr =[[database executeQuery:queryname]mutableCopy];
            
            NSMutableArray *arr_name = [recipeNameArr valueForKey:@"recipe_subcategory"];
            
            //self.recipe_namelbl.text = [arr_name objectAtIndex:0];
            recipeNamestr = [arr_name objectAtIndex:0];
            
            //For ingredients
            
            NSString *queryingredients=[ NSString stringWithFormat:@"Select recipe_ingredients from spring_tbl where recipe_name ='GINGER' AND recipe_type ='Simple' "];
            recipeIngredientsArr =[[NSMutableArray alloc]init];
            recipeIngredientsArr =[[database executeQuery:queryingredients]mutableCopy];
            
            
            NSMutableArray *arr_ingredients  = [recipeIngredientsArr valueForKey:@"recipe_ingredients"];
            NSLog(@"%@",arr_ingredients);
            recipeIngredientsstr = [arr_ingredients objectAtIndex:0];
            //self.recipe_ingredientslbl.text = [arr_ingredients objectAtIndex:0];
            // [self.recipe_ingredientslbl sizeToFit];
            
            //For method
            NSString *querymethod=[ NSString stringWithFormat:@"Select recipe_method from spring_tbl where recipe_name ='GINGER' AND recipe_type ='Simple' "];
            recipeMethodArr =[[NSMutableArray alloc]init];
            recipeMethodArr =[[database executeQuery:querymethod]mutableCopy];
            
            
            NSMutableArray *arr_method  = [recipeMethodArr valueForKey:@"recipe_method"];
            NSLog(@"%@",arr_ingredients);
            
            //self.recipe_methodlbl.text = [arr_method objectAtIndex:0];
            //[self.recipe_methodlbl sizeToFit];
            
            
            recipeMethodstr = [arr_method objectAtIndex:0];
            [database close];
            
        }
        if([self.imageFile isEqualToString: @"Grapefruit.jpg"])
        {
            [self databaseOpen];
            
            
            //For name
            
            NSString *queryname= [NSString stringWithFormat:@"Select recipe_subcategory,recipe_name,recipe_type from spring_tbl where recipe_name ='GRAPEFRUIT' AND recipe_type ='Simple' "];
            recipeNameArr =[[NSMutableArray alloc]init];
            recipeNameArr =[[database executeQuery:queryname]mutableCopy];
            
            NSMutableArray *arr_name = [recipeNameArr valueForKey:@"recipe_subcategory"];
            
            //self.recipe_namelbl.text = [arr_name objectAtIndex:0];
            recipeNamestr = [arr_name objectAtIndex:0];
            
            //For ingredients
            
            NSString *queryingredients=[ NSString stringWithFormat:@"Select recipe_ingredients from spring_tbl where recipe_name ='GRAPEFRUIT' AND recipe_type ='Simple' "];
            recipeIngredientsArr =[[NSMutableArray alloc]init];
            recipeIngredientsArr =[[database executeQuery:queryingredients]mutableCopy];
            
            
            NSMutableArray *arr_ingredients  = [recipeIngredientsArr valueForKey:@"recipe_ingredients"];
            NSLog(@"%@",arr_ingredients);
            recipeIngredientsstr = [arr_ingredients objectAtIndex:0];
            //self.recipe_ingredientslbl.text = [arr_ingredients objectAtIndex:0];
            // [self.recipe_ingredientslbl sizeToFit];
            
            //For method
            NSString *querymethod=[ NSString stringWithFormat:@"Select recipe_method from spring_tbl where recipe_name ='GRAPEFRUIT' AND recipe_type ='Simple' "];
            recipeMethodArr =[[NSMutableArray alloc]init];
            recipeMethodArr =[[database executeQuery:querymethod]mutableCopy];
            
            
            NSMutableArray *arr_method  = [recipeMethodArr valueForKey:@"recipe_method"];
            NSLog(@"%@",arr_ingredients);
            
            //self.recipe_methodlbl.text = [arr_method objectAtIndex:0];
            //[self.recipe_methodlbl sizeToFit];
            
            
            recipeMethodstr = [arr_method objectAtIndex:0];
            [database close];
            
        }
        if([self.imageFile isEqualToString: @"Lamb.jpg"])
        {
            [self databaseOpen];
            
            
            //For name
            
            NSString *queryname= [NSString stringWithFormat:@"Select recipe_subcategory,recipe_name,recipe_type from spring_tbl where recipe_name ='LAMB' AND recipe_type ='Simple' "];
            recipeNameArr =[[NSMutableArray alloc]init];
            recipeNameArr =[[database executeQuery:queryname]mutableCopy];
            
            NSMutableArray *arr_name = [recipeNameArr valueForKey:@"recipe_subcategory"];
            
            //self.recipe_namelbl.text = [arr_name objectAtIndex:0];
            recipeNamestr = [arr_name objectAtIndex:0];
            
            //For ingredients
            
            NSString *queryingredients=[ NSString stringWithFormat:@"Select recipe_ingredients from spring_tbl where recipe_name ='LAMB' AND recipe_type ='Simple' "];
            recipeIngredientsArr =[[NSMutableArray alloc]init];
            recipeIngredientsArr =[[database executeQuery:queryingredients]mutableCopy];
            
            
            NSMutableArray *arr_ingredients  = [recipeIngredientsArr valueForKey:@"recipe_ingredients"];
            NSLog(@"%@",arr_ingredients);
            recipeIngredientsstr = [arr_ingredients objectAtIndex:0];
            //self.recipe_ingredientslbl.text = [arr_ingredients objectAtIndex:0];
            // [self.recipe_ingredientslbl sizeToFit];
            
            //For method
            NSString *querymethod=[ NSString stringWithFormat:@"Select recipe_method from spring_tbl where recipe_name ='LAMB' AND recipe_type ='Simple' "];
            recipeMethodArr =[[NSMutableArray alloc]init];
            recipeMethodArr =[[database executeQuery:querymethod]mutableCopy];
            
            
            NSMutableArray *arr_method  = [recipeMethodArr valueForKey:@"recipe_method"];
            NSLog(@"%@",arr_ingredients);
            
            //self.recipe_methodlbl.text = [arr_method objectAtIndex:0];
            //[self.recipe_methodlbl sizeToFit];
            
            recipeMethodstr = [arr_method objectAtIndex:0];
            
            [database close];
            
        }
        if([self.imageFile isEqualToString: @"Leek.jpg"])
        {
            [self databaseOpen];
            
            
            //For name
            
            NSString *queryname= [NSString stringWithFormat:@"Select recipe_subcategory,recipe_name,recipe_type from spring_tbl where recipe_name ='LEEK' AND recipe_type ='Simple' "];
            recipeNameArr =[[NSMutableArray alloc]init];
            recipeNameArr =[[database executeQuery:queryname]mutableCopy];
            
            NSMutableArray *arr_name = [recipeNameArr valueForKey:@"recipe_subcategory"];
            
            //self.recipe_namelbl.text = [arr_name objectAtIndex:0];
            recipeNamestr = [arr_name objectAtIndex:0];
            
            //For ingredients
            
            NSString *queryingredients=[ NSString stringWithFormat:@"Select recipe_ingredients from spring_tbl where recipe_name ='LEEK' AND recipe_type ='Simple' "];
            recipeIngredientsArr =[[NSMutableArray alloc]init];
            recipeIngredientsArr =[[database executeQuery:queryingredients]mutableCopy];
            
            
            NSMutableArray *arr_ingredients  = [recipeIngredientsArr valueForKey:@"recipe_ingredients"];
            NSLog(@"%@",arr_ingredients);
            recipeIngredientsstr = [arr_ingredients objectAtIndex:0];
            //self.recipe_ingredientslbl.text = [arr_ingredients objectAtIndex:0];
            // [self.recipe_ingredientslbl sizeToFit];
            
            //For method
            NSString *querymethod=[ NSString stringWithFormat:@"Select recipe_method from spring_tbl where recipe_name ='LEEK' AND recipe_type ='Simple' "];
            recipeMethodArr =[[NSMutableArray alloc]init];
            recipeMethodArr =[[database executeQuery:querymethod]mutableCopy];
            
            
            NSMutableArray *arr_method  = [recipeMethodArr valueForKey:@"recipe_method"];
            NSLog(@"%@",arr_ingredients);
            
            //self.recipe_methodlbl.text = [arr_method objectAtIndex:0];
            //[self.recipe_methodlbl sizeToFit];
            
            recipeMethodstr = [arr_method objectAtIndex:0];
            
            [database close];
            
        }
        if([self.imageFile isEqualToString: @"Lemon.jpg"])
        {
            [self databaseOpen];
            
            
            //For name
            
            NSString *queryname= [NSString stringWithFormat:@"Select recipe_subcategory,recipe_name,recipe_type from spring_tbl where recipe_name ='LEMON' AND recipe_type ='Simple' "];
            recipeNameArr =[[NSMutableArray alloc]init];
            recipeNameArr =[[database executeQuery:queryname]mutableCopy];
            
            NSMutableArray *arr_name = [recipeNameArr valueForKey:@"recipe_subcategory"];
            recipeNamestr = [arr_name objectAtIndex:0];
            //self.recipe_namelbl.text = [arr_name objectAtIndex:0];
            
            
            //For ingredients
            
            NSString *queryingredients=[ NSString stringWithFormat:@"Select recipe_ingredients from spring_tbl where recipe_name ='LEMON' AND recipe_type ='Simple' "];
            recipeIngredientsArr =[[NSMutableArray alloc]init];
            recipeIngredientsArr =[[database executeQuery:queryingredients]mutableCopy];
            
            
            NSMutableArray *arr_ingredients  = [recipeIngredientsArr valueForKey:@"recipe_ingredients"];
            NSLog(@"%@",arr_ingredients);
            recipeIngredientsstr = [arr_ingredients objectAtIndex:0];
            //self.recipe_ingredientslbl.text = [arr_ingredients objectAtIndex:0];
            // [self.recipe_ingredientslbl sizeToFit];
            
            //For method
            NSString *querymethod=[ NSString stringWithFormat:@"Select recipe_method from spring_tbl where recipe_name ='LEMON' AND recipe_type ='Simple' "];
            recipeMethodArr =[[NSMutableArray alloc]init];
            recipeMethodArr =[[database executeQuery:querymethod]mutableCopy];
            
            
            NSMutableArray *arr_method  = [recipeMethodArr valueForKey:@"recipe_method"];
            NSLog(@"%@",arr_ingredients);
            
            //self.recipe_methodlbl.text = [arr_method objectAtIndex:0];
            //[self.recipe_methodlbl sizeToFit];
            
            
            recipeMethodstr = [arr_method objectAtIndex:0];
            [database close];
            
        }
        if([self.imageFile isEqualToString: @"Mint.jpg"])
        {
            [self databaseOpen];
            
            
            //For name
            
            NSString *queryname= [NSString stringWithFormat:@"Select recipe_subcategory,recipe_name,recipe_type from spring_tbl where recipe_name ='MINT' AND recipe_type ='Simple' "];
            recipeNameArr =[[NSMutableArray alloc]init];
            recipeNameArr =[[database executeQuery:queryname]mutableCopy];
            
            NSMutableArray *arr_name = [recipeNameArr valueForKey:@"recipe_subcategory"];
            recipeNamestr = [arr_name objectAtIndex:0];
            //self.recipe_namelbl.text = [arr_name objectAtIndex:0];
            
            
            //For ingredients
            
            NSString *queryingredients=[ NSString stringWithFormat:@"Select recipe_ingredients from spring_tbl where recipe_name ='MINT' AND recipe_type ='Simple' "];
            recipeIngredientsArr =[[NSMutableArray alloc]init];
            recipeIngredientsArr =[[database executeQuery:queryingredients]mutableCopy];
            
            
            NSMutableArray *arr_ingredients  = [recipeIngredientsArr valueForKey:@"recipe_ingredients"];
            NSLog(@"%@",arr_ingredients);
            recipeIngredientsstr = [arr_ingredients objectAtIndex:0];
            //self.recipe_ingredientslbl.text = [arr_ingredients objectAtIndex:0];
            // [self.recipe_ingredientslbl sizeToFit];
            
            //For method
            NSString *querymethod=[ NSString stringWithFormat:@"Select recipe_method from spring_tbl where recipe_name ='MINT' AND recipe_type ='Simple' "];
            recipeMethodArr =[[NSMutableArray alloc]init];
            recipeMethodArr =[[database executeQuery:querymethod]mutableCopy];
            
            
            NSMutableArray *arr_method  = [recipeMethodArr valueForKey:@"recipe_method"];
            NSLog(@"%@",arr_ingredients);
            
            //self.recipe_methodlbl.text = [arr_method objectAtIndex:0];
            //[self.recipe_methodlbl sizeToFit];
            
            recipeMethodstr = [arr_method objectAtIndex:0];
            
            [database close];
            
        }
        if([self.imageFile isEqualToString: @"Olive.jpg"])
        {
            [self databaseOpen];
            
            
            //For name
            
            NSString *queryname= [NSString stringWithFormat:@"Select recipe_subcategory,recipe_name,recipe_type from spring_tbl where recipe_name ='OLIVE' AND recipe_type ='Simple' "];
            recipeNameArr =[[NSMutableArray alloc]init];
            recipeNameArr =[[database executeQuery:queryname]mutableCopy];
            
            NSMutableArray *arr_name = [recipeNameArr valueForKey:@"recipe_subcategory"];
            recipeNamestr = [arr_name objectAtIndex:0];
            //self.recipe_namelbl.text = [arr_name objectAtIndex:0];
            
            
            //For ingredients
            
            NSString *queryingredients=[ NSString stringWithFormat:@"Select recipe_ingredients from spring_tbl where recipe_name ='OLIVE' AND recipe_type ='Simple' "];
            recipeIngredientsArr =[[NSMutableArray alloc]init];
            recipeIngredientsArr =[[database executeQuery:queryingredients]mutableCopy];
            
            
            NSMutableArray *arr_ingredients  = [recipeIngredientsArr valueForKey:@"recipe_ingredients"];
            NSLog(@"%@",arr_ingredients);
            recipeIngredientsstr = [arr_ingredients objectAtIndex:0];
            //self.recipe_ingredientslbl.text = [arr_ingredients objectAtIndex:0];
            // [self.recipe_ingredientslbl sizeToFit];
            
            //For method
            NSString *querymethod=[ NSString stringWithFormat:@"Select recipe_method from spring_tbl where recipe_name ='OLIVE' AND recipe_type ='Simple' "];
            recipeMethodArr =[[NSMutableArray alloc]init];
            recipeMethodArr =[[database executeQuery:querymethod]mutableCopy];
            
            
            NSMutableArray *arr_method  = [recipeMethodArr valueForKey:@"recipe_method"];
            NSLog(@"%@",arr_ingredients);
            
            //self.recipe_methodlbl.text = [arr_method objectAtIndex:0];
            //[self.recipe_methodlbl sizeToFit];
            
            recipeMethodstr = [arr_method objectAtIndex:0];
            
            [database close];
            
        }
        if([self.imageFile isEqualToString: @"Sea-Vegetables.jpg"])
        {
            [self databaseOpen];
            
            
            //For name
            
            NSString *queryname= [NSString stringWithFormat:@"Select recipe_subcategory,recipe_name,recipe_type from spring_tbl where recipe_name ='SEA VEGETABLES' AND recipe_type ='Simple' "];
            recipeNameArr =[[NSMutableArray alloc]init];
            recipeNameArr =[[database executeQuery:queryname]mutableCopy];
            
            NSMutableArray *arr_name = [recipeNameArr valueForKey:@"recipe_subcategory"];
            recipeNamestr = [arr_name objectAtIndex:0];
            //self.recipe_namelbl.text = [arr_name objectAtIndex:0];
            
            
            //For ingredients
            
            NSString *queryingredients=[ NSString stringWithFormat:@"Select recipe_ingredients from spring_tbl where recipe_name ='SEA VEGETABLES' AND recipe_type ='Simple' "];
            recipeIngredientsArr =[[NSMutableArray alloc]init];
            recipeIngredientsArr =[[database executeQuery:queryingredients]mutableCopy];
            
            
            NSMutableArray *arr_ingredients  = [recipeIngredientsArr valueForKey:@"recipe_ingredients"];
            NSLog(@"%@",arr_ingredients);
            recipeIngredientsstr = [arr_ingredients objectAtIndex:0];
            //self.recipe_ingredientslbl.text = [arr_ingredients objectAtIndex:0];
            // [self.recipe_ingredientslbl sizeToFit];
            
            //For method
            NSString *querymethod=[ NSString stringWithFormat:@"Select recipe_method from spring_tbl where recipe_name ='SEA VEGETABLES' AND recipe_type ='Simple' "];
            recipeMethodArr =[[NSMutableArray alloc]init];
            recipeMethodArr =[[database executeQuery:querymethod]mutableCopy];
            
            
            NSMutableArray *arr_method  = [recipeMethodArr valueForKey:@"recipe_method"];
            NSLog(@"%@",arr_ingredients);
            
            //self.recipe_methodlbl.text = [arr_method objectAtIndex:0];
            //[self.recipe_methodlbl sizeToFit];
            
            
            recipeMethodstr = [arr_method objectAtIndex:0];
            [database close];
            
        }
        if([self.imageFile isEqualToString: @"Strawberry.jpg"])
        {
            [self databaseOpen];
            
            
            //For name
            
            NSString *queryname= [NSString stringWithFormat:@"Select recipe_subcategory,recipe_name,recipe_type from spring_tbl where recipe_name ='STRAWBERRY' AND recipe_type ='Simple' "];
            recipeNameArr =[[NSMutableArray alloc]init];
            recipeNameArr =[[database executeQuery:queryname]mutableCopy];
            
            NSMutableArray *arr_name = [recipeNameArr valueForKey:@"recipe_subcategory"];
            recipeNamestr = [arr_name objectAtIndex:0];
            //self.recipe_namelbl.text = [arr_name objectAtIndex:0];
            
            
            //For ingredients
            
            NSString *queryingredients=[ NSString stringWithFormat:@"Select recipe_ingredients from spring_tbl where recipe_name ='STRAWBERRY' AND recipe_type ='Simple' "];
            recipeIngredientsArr =[[NSMutableArray alloc]init];
            recipeIngredientsArr =[[database executeQuery:queryingredients]mutableCopy];
            
            
            NSMutableArray *arr_ingredients  = [recipeIngredientsArr valueForKey:@"recipe_ingredients"];
            NSLog(@"%@",arr_ingredients);
            recipeIngredientsstr = [arr_ingredients objectAtIndex:0];
            //self.recipe_ingredientslbl.text = [arr_ingredients objectAtIndex:0];
            // [self.recipe_ingredientslbl sizeToFit];
            
            //For method
            NSString *querymethod=[ NSString stringWithFormat:@"Select recipe_method from spring_tbl where recipe_name ='STRAWBERRY' AND recipe_type ='Simple' "];
            recipeMethodArr =[[NSMutableArray alloc]init];
            recipeMethodArr =[[database executeQuery:querymethod]mutableCopy];
            
            
            NSMutableArray *arr_method  = [recipeMethodArr valueForKey:@"recipe_method"];
            NSLog(@"%@",arr_ingredients);
            
            //self.recipe_methodlbl.text = [arr_method objectAtIndex:0];
            //[self.recipe_methodlbl sizeToFit];
            
            recipeMethodstr = [arr_method objectAtIndex:0];
            
            [database close];
            
        }
        if([self.imageFile isEqualToString: @"Sunflower-Seeds.jpg"])
        {
            [self databaseOpen];
            
            
            //For name
            
            NSString *queryname= [NSString stringWithFormat:@"Select recipe_subcategory,recipe_name,recipe_type from spring_tbl where recipe_name ='SUNFLOWER SEEDS' AND recipe_type ='Simple' "];
            recipeNameArr =[[NSMutableArray alloc]init];
            recipeNameArr =[[database executeQuery:queryname]mutableCopy];
            
            NSMutableArray *arr_name = [recipeNameArr valueForKey:@"recipe_subcategory"];
            recipeNamestr = [arr_name objectAtIndex:0];
            //self.recipe_namelbl.text = [arr_name objectAtIndex:0];
            
            
            //For ingredients
            
            NSString *queryingredients=[ NSString stringWithFormat:@"Select recipe_ingredients from spring_tbl where recipe_name ='SUNFLOWER SEEDS' AND recipe_type ='Simple' "];
            recipeIngredientsArr =[[NSMutableArray alloc]init];
            recipeIngredientsArr =[[database executeQuery:queryingredients]mutableCopy];
            
            
            NSMutableArray *arr_ingredients  = [recipeIngredientsArr valueForKey:@"recipe_ingredients"];
            NSLog(@"%@",arr_ingredients);
            recipeIngredientsstr = [arr_ingredients objectAtIndex:0];
            //self.recipe_ingredientslbl.text = [arr_ingredients objectAtIndex:0];
            // [self.recipe_ingredientslbl sizeToFit];
            
            //For method
            NSString *querymethod=[ NSString stringWithFormat:@"Select recipe_method from spring_tbl where recipe_name ='SUNFLOWER SEEDS' AND recipe_type ='Simple' "];
            recipeMethodArr =[[NSMutableArray alloc]init];
            recipeMethodArr =[[database executeQuery:querymethod]mutableCopy];
            
            
            NSMutableArray *arr_method  = [recipeMethodArr valueForKey:@"recipe_method"];
            NSLog(@"%@",arr_ingredients);
            
            //self.recipe_methodlbl.text = [arr_method objectAtIndex:0];
            //[self.recipe_methodlbl sizeToFit];
            
            recipeMethodstr = [arr_method objectAtIndex:0];
            
            [database close];
            
        }
        if([self.imageFile isEqualToString: @"Watercress.jpg"])
        {
            [self databaseOpen];
            
            
            //For name
            
            NSString *queryname= [NSString stringWithFormat:@"Select recipe_subcategory,recipe_name,recipe_type from spring_tbl where recipe_name ='WATERCRESS' AND recipe_type ='Simple' "];
            recipeNameArr =[[NSMutableArray alloc]init];
            recipeNameArr =[[database executeQuery:queryname]mutableCopy];
            
            NSMutableArray *arr_name = [recipeNameArr valueForKey:@"recipe_subcategory"];
            recipeNamestr = [arr_name objectAtIndex:0];
            //self.recipe_namelbl.text = [arr_name objectAtIndex:0];
            
            
            //For ingredients
            
            NSString *queryingredients=[ NSString stringWithFormat:@"Select recipe_ingredients from spring_tbl where recipe_name ='WATERCRESS' AND recipe_type ='Simple' "];
            recipeIngredientsArr =[[NSMutableArray alloc]init];
            recipeIngredientsArr =[[database executeQuery:queryingredients]mutableCopy];
            
            
            NSMutableArray *arr_ingredients  = [recipeIngredientsArr valueForKey:@"recipe_ingredients"];
            NSLog(@"%@",arr_ingredients);
            recipeIngredientsstr = [arr_ingredients objectAtIndex:0];
            //self.recipe_ingredientslbl.text = [arr_ingredients objectAtIndex:0];
            // [self.recipe_ingredientslbl sizeToFit];
            
            //For method
            NSString *querymethod=[ NSString stringWithFormat:@"Select recipe_method from spring_tbl where recipe_name ='WATERCRESS' AND recipe_type ='Simple' "];
            recipeMethodArr =[[NSMutableArray alloc]init];
            recipeMethodArr =[[database executeQuery:querymethod]mutableCopy];
            
            
            NSMutableArray *arr_method  = [recipeMethodArr valueForKey:@"recipe_method"];
            NSLog(@"%@",arr_ingredients);
            
            //self.recipe_methodlbl.text = [arr_method objectAtIndex:0];
            //[self.recipe_methodlbl sizeToFit];
            
            
            recipeMethodstr = [arr_method objectAtIndex:0];
            [database close];
            
        }
        [self performSegueWithIdentifier:@"simplesegue" sender:self];
    }
    
    else if ([season isEqualToString:@"winter"])
    {
        if([self.imageFile isEqualToString: @"Cod.jpg"])
        {
            [self databaseOpen];
            
            
            //For name
            
            NSString *queryname= [NSString stringWithFormat:@"Select recipe_subcategory,recipe_name,recipe_type from winter_tbl where recipe_name ='Cod' AND recipe_type ='Simple' "];
            recipeNameArr =[[NSMutableArray alloc]init];
            recipeNameArr =[[database executeQuery:queryname]mutableCopy];
            
            NSMutableArray *arr_name = [recipeNameArr valueForKey:@"recipe_subcategory"];
            
            //self.recipe_namelbl.text = [arr_name objectAtIndex:0];
            
            recipeNamestr = [arr_name objectAtIndex:0];
            
            //For ingredients
            
            NSString *queryingredients=[ NSString stringWithFormat:@"Select recipe_ingredients from winter_tbl where recipe_name ='Cod' AND recipe_type ='Simple' "];
            recipeIngredientsArr =[[NSMutableArray alloc]init];
            recipeIngredientsArr =[[database executeQuery:queryingredients]mutableCopy];
            
            
            NSMutableArray *arr_ingredients  = [recipeIngredientsArr valueForKey:@"recipe_ingredients"];
            NSLog(@"%@",arr_ingredients);
            
            //self.recipe_ingredientslbl.text = [arr_ingredients objectAtIndex:0];
            // [self.recipe_ingredientslbl sizeToFit];
            
            recipeIngredientsstr = [arr_ingredients objectAtIndex:0];
            
            //For method
            NSString *querymethod=[ NSString stringWithFormat:@"Select recipe_method from winter_tbl where recipe_name ='Cod' AND recipe_type ='Simple' "];
            recipeMethodArr =[[NSMutableArray alloc]init];
            recipeMethodArr =[[database executeQuery:querymethod]mutableCopy];
            
            
            NSMutableArray *arr_method  = [recipeMethodArr valueForKey:@"recipe_method"];
            NSLog(@"%@",arr_method);
            
            //self.recipe_methodlbl.text = [arr_method objectAtIndex:0];
            //[self.recipe_methodlbl sizeToFit];
            recipeMethodstr = [arr_method objectAtIndex:0];
            
            
            
            [database close];
        }
        
        if([self.imageFile isEqualToString: @"Banana.jpg"])
        {
            [self databaseOpen];
            
            
            //For name
            
            NSString *queryname= [NSString stringWithFormat:@"Select recipe_subcategory,recipe_name,recipe_type from winter_tbl where recipe_name ='Banana' AND recipe_type ='Simple' "];
            recipeNameArr =[[NSMutableArray alloc]init];
            recipeNameArr =[[database executeQuery:queryname]mutableCopy];
            
            NSMutableArray *arr_name = [recipeNameArr valueForKey:@"recipe_subcategory"];
            
            //self.recipe_namelbl.text = [arr_name objectAtIndex:0];
            
            recipeNamestr = [arr_name objectAtIndex:0];
            
            //For ingredients
            
            NSString *queryingredients=[ NSString stringWithFormat:@"Select recipe_ingredients from winter_tbl where recipe_name ='Banana' AND recipe_type ='Simple' "];
            recipeIngredientsArr =[[NSMutableArray alloc]init];
            recipeIngredientsArr =[[database executeQuery:queryingredients]mutableCopy];
            
            
            NSMutableArray *arr_ingredients  = [recipeIngredientsArr valueForKey:@"recipe_ingredients"];
            NSLog(@"%@",arr_ingredients);
            
            //self.recipe_ingredientslbl.text = [arr_ingredients objectAtIndex:0];
            // [self.recipe_ingredientslbl sizeToFit];
            
            recipeIngredientsstr = [arr_ingredients objectAtIndex:0];
            
            //For method
            NSString *querymethod=[ NSString stringWithFormat:@"Select recipe_method from winter_tbl where recipe_name ='Banana' AND recipe_type ='Simple' "];
            recipeMethodArr =[[NSMutableArray alloc]init];
            recipeMethodArr =[[database executeQuery:querymethod]mutableCopy];
            
            
            NSMutableArray *arr_method  = [recipeMethodArr valueForKey:@"recipe_method"];
            NSLog(@"%@",arr_method);
            
            //self.recipe_methodlbl.text = [arr_method objectAtIndex:0];
            //[self.recipe_methodlbl sizeToFit];
            recipeMethodstr = [arr_method objectAtIndex:0];
            
            
            
            [database close];
        }
        if([self.imageFile isEqualToString: @"Beef.jpg"])
        {
            [self databaseOpen];
            
            
            //For name
            
            NSString *queryname= [NSString stringWithFormat:@"Select recipe_subcategory,recipe_name,recipe_type from winter_tbl where recipe_name ='Beef' AND recipe_type ='Simple' "];
            recipeNameArr =[[NSMutableArray alloc]init];
            recipeNameArr =[[database executeQuery:queryname]mutableCopy];
            
            NSMutableArray *arr_name = [recipeNameArr valueForKey:@"recipe_subcategory"];
            
            //self.recipe_namelbl.text = [arr_name objectAtIndex:0];
            
            recipeNamestr = [arr_name objectAtIndex:0];
            
            //For ingredients
            
            NSString *queryingredients=[ NSString stringWithFormat:@"Select recipe_ingredients from winter_tbl where recipe_name ='Beef' AND recipe_type ='Simple' "];
            recipeIngredientsArr =[[NSMutableArray alloc]init];
            recipeIngredientsArr =[[database executeQuery:queryingredients]mutableCopy];
            
            
            NSMutableArray *arr_ingredients  = [recipeIngredientsArr valueForKey:@"recipe_ingredients"];
            NSLog(@"%@",arr_ingredients);
            
            //self.recipe_ingredientslbl.text = [arr_ingredients objectAtIndex:0];
            // [self.recipe_ingredientslbl sizeToFit];
            
            recipeIngredientsstr = [arr_ingredients objectAtIndex:0];
            
            //For method
            NSString *querymethod=[ NSString stringWithFormat:@"Select recipe_method from winter_tbl where recipe_name ='Beef' AND recipe_type ='Simple' "];
            recipeMethodArr =[[NSMutableArray alloc]init];
            recipeMethodArr =[[database executeQuery:querymethod]mutableCopy];
            
            
            NSMutableArray *arr_method  = [recipeMethodArr valueForKey:@"recipe_method"];
            NSLog(@"%@",arr_method);
            
            //self.recipe_methodlbl.text = [arr_method objectAtIndex:0];
            //[self.recipe_methodlbl sizeToFit];
            recipeMethodstr = [arr_method objectAtIndex:0];
            
            
            
            [database close];
        }
        
        if([self.imageFile isEqualToString: @"Celeriac.jpg"])
        {
            [self databaseOpen];
            
            
            //For name
            
            NSString *queryname= [NSString stringWithFormat:@"Select recipe_subcategory,recipe_name,recipe_type from winter_tbl where recipe_name ='Celeriac' AND recipe_type ='Simple' "];
            recipeNameArr =[[NSMutableArray alloc]init];
            recipeNameArr =[[database executeQuery:queryname]mutableCopy];
            
            NSMutableArray *arr_name = [recipeNameArr valueForKey:@"recipe_subcategory"];
            
            //self.recipe_namelbl.text = [arr_name objectAtIndex:0];
            
            recipeNamestr = [arr_name objectAtIndex:0];
            
            //For ingredients
            
            NSString *queryingredients=[ NSString stringWithFormat:@"Select recipe_ingredients from winter_tbl where recipe_name ='Celeriac' AND recipe_type ='Simple' "];
            recipeIngredientsArr =[[NSMutableArray alloc]init];
            recipeIngredientsArr =[[database executeQuery:queryingredients]mutableCopy];
            
            
            NSMutableArray *arr_ingredients  = [recipeIngredientsArr valueForKey:@"recipe_ingredients"];
            NSLog(@"%@",arr_ingredients);
            
            //self.recipe_ingredientslbl.text = [arr_ingredients objectAtIndex:0];
            // [self.recipe_ingredientslbl sizeToFit];
            
            recipeIngredientsstr = [arr_ingredients objectAtIndex:0];
            
            //For method
            NSString *querymethod=[ NSString stringWithFormat:@"Select recipe_method from winter_tbl where recipe_name ='Celeriac' AND recipe_type ='Simple' "];
            recipeMethodArr =[[NSMutableArray alloc]init];
            recipeMethodArr =[[database executeQuery:querymethod]mutableCopy];
            
            
            NSMutableArray *arr_method  = [recipeMethodArr valueForKey:@"recipe_method"];
            NSLog(@"%@",arr_method);
            
            //self.recipe_methodlbl.text = [arr_method objectAtIndex:0];
            //[self.recipe_methodlbl sizeToFit];
            recipeMethodstr = [arr_method objectAtIndex:0];
            
            
            
            [database close];
        }
        
        if([self.imageFile isEqualToString: @"Chocolate.jpg"])
        {
            [self databaseOpen];
            
            
            //For name
            
            NSString *queryname= [NSString stringWithFormat:@"Select recipe_subcategory,recipe_name,recipe_type from winter_tbl where recipe_name ='Chocolate' AND recipe_type ='Simple' "];
            recipeNameArr =[[NSMutableArray alloc]init];
            recipeNameArr =[[database executeQuery:queryname]mutableCopy];
            
            NSMutableArray *arr_name = [recipeNameArr valueForKey:@"recipe_subcategory"];
            
            //self.recipe_namelbl.text = [arr_name objectAtIndex:0];
            
            recipeNamestr = [arr_name objectAtIndex:0];
            
            //For ingredients
            
            NSString *queryingredients=[ NSString stringWithFormat:@"Select recipe_ingredients from winter_tbl where recipe_name ='Chocolate' AND recipe_type ='Simple' "];
            recipeIngredientsArr =[[NSMutableArray alloc]init];
            recipeIngredientsArr =[[database executeQuery:queryingredients]mutableCopy];
            
            
            NSMutableArray *arr_ingredients  = [recipeIngredientsArr valueForKey:@"recipe_ingredients"];
            NSLog(@"%@",arr_ingredients);
            
            //self.recipe_ingredientslbl.text = [arr_ingredients objectAtIndex:0];
            // [self.recipe_ingredientslbl sizeToFit];
            
            recipeIngredientsstr = [arr_ingredients objectAtIndex:0];
            
            //For method
            NSString *querymethod=[ NSString stringWithFormat:@"Select recipe_method from winter_tbl where recipe_name ='Chocolate' AND recipe_type ='Simple' "];
            recipeMethodArr =[[NSMutableArray alloc]init];
            recipeMethodArr =[[database executeQuery:querymethod]mutableCopy];
            
            
            NSMutableArray *arr_method  = [recipeMethodArr valueForKey:@"recipe_method"];
            NSLog(@"%@",arr_method);
            
            //self.recipe_methodlbl.text = [arr_method objectAtIndex:0];
            //[self.recipe_methodlbl sizeToFit];
            recipeMethodstr = [arr_method objectAtIndex:0];
            
            
            
            [database close];
        }
        if([self.imageFile isEqualToString: @"Cinnamon.jpg"])
        {
            [self databaseOpen];
            
            
            //For name
            
            NSString *queryname= [NSString stringWithFormat:@"Select recipe_subcategory,recipe_name,recipe_type from winter_tbl where recipe_name ='Cinnamon' AND recipe_type ='Simple' "];
            recipeNameArr =[[NSMutableArray alloc]init];
            recipeNameArr =[[database executeQuery:queryname]mutableCopy];
            
            NSMutableArray *arr_name = [recipeNameArr valueForKey:@"recipe_subcategory"];
            
            //self.recipe_namelbl.text = [arr_name objectAtIndex:0];
            
            recipeNamestr = [arr_name objectAtIndex:0];
            
            //For ingredients
            
            NSString *queryingredients=[ NSString stringWithFormat:@"Select recipe_ingredients from winter_tbl where recipe_name ='Cinnamon' AND recipe_type ='Simple' "];
            recipeIngredientsArr =[[NSMutableArray alloc]init];
            recipeIngredientsArr =[[database executeQuery:queryingredients]mutableCopy];
            
            
            NSMutableArray *arr_ingredients  = [recipeIngredientsArr valueForKey:@"recipe_ingredients"];
            NSLog(@"%@",arr_ingredients);
            
            //self.recipe_ingredientslbl.text = [arr_ingredients objectAtIndex:0];
            // [self.recipe_ingredientslbl sizeToFit];
            
            recipeIngredientsstr = [arr_ingredients objectAtIndex:0];
            
            //For method
            NSString *querymethod=[ NSString stringWithFormat:@"Select recipe_method from winter_tbl where recipe_name ='Cinnamon' AND recipe_type ='Simple' "];
            recipeMethodArr =[[NSMutableArray alloc]init];
            recipeMethodArr =[[database executeQuery:querymethod]mutableCopy];
            
            
            NSMutableArray *arr_method  = [recipeMethodArr valueForKey:@"recipe_method"];
            NSLog(@"%@",arr_method);
            
            //self.recipe_methodlbl.text = [arr_method objectAtIndex:0];
            //[self.recipe_methodlbl sizeToFit];
            recipeMethodstr = [arr_method objectAtIndex:0];
            
            
            
            [database close];
        }
        if([self.imageFile isEqualToString: @"Coconut.jpg"])
        {
            [self databaseOpen];
            
            
            //For name
            
            NSString *queryname= [NSString stringWithFormat:@"Select recipe_subcategory,recipe_name,recipe_type from winter_tbl where recipe_name ='Coconut' AND recipe_type ='Simple' "];
            recipeNameArr =[[NSMutableArray alloc]init];
            recipeNameArr =[[database executeQuery:queryname]mutableCopy];
            
            NSMutableArray *arr_name = [recipeNameArr valueForKey:@"recipe_subcategory"];
            
            //self.recipe_namelbl.text = [arr_name objectAtIndex:0];
            
            recipeNamestr = [arr_name objectAtIndex:0];
            
            //For ingredients
            
            NSString *queryingredients=[ NSString stringWithFormat:@"Select recipe_ingredients from winter_tbl where recipe_name ='Coconut' AND recipe_type ='Simple' "];
            recipeIngredientsArr =[[NSMutableArray alloc]init];
            recipeIngredientsArr =[[database executeQuery:queryingredients]mutableCopy];
            
            
            NSMutableArray *arr_ingredients  = [recipeIngredientsArr valueForKey:@"recipe_ingredients"];
            NSLog(@"%@",arr_ingredients);
            
            //self.recipe_ingredientslbl.text = [arr_ingredients objectAtIndex:0];
            // [self.recipe_ingredientslbl sizeToFit];
            
            recipeIngredientsstr = [arr_ingredients objectAtIndex:0];
            
            //For method
            NSString *querymethod=[ NSString stringWithFormat:@"Select recipe_method from winter_tbl where recipe_name ='Coconut' AND recipe_type ='Simple' "];
            recipeMethodArr =[[NSMutableArray alloc]init];
            recipeMethodArr =[[database executeQuery:querymethod]mutableCopy];
            
            
            NSMutableArray *arr_method  = [recipeMethodArr valueForKey:@"recipe_method"];
            NSLog(@"%@",arr_method);
            
            //self.recipe_methodlbl.text = [arr_method objectAtIndex:0];
            //[self.recipe_methodlbl sizeToFit];
            recipeMethodstr = [arr_method objectAtIndex:0];
            
            
            
            [database close];
        }
        if([self.imageFile isEqualToString: @"Date.jpg"])
        {
            [self databaseOpen];
            
            
            //For name
            
            NSString *queryname= [NSString stringWithFormat:@"Select recipe_subcategory,recipe_name,recipe_type from winter_tbl where recipe_name ='Date' AND recipe_type ='Simple' "];
            recipeNameArr =[[NSMutableArray alloc]init];
            recipeNameArr =[[database executeQuery:queryname]mutableCopy];
            
            NSMutableArray *arr_name = [recipeNameArr valueForKey:@"recipe_subcategory"];
            
            //self.recipe_namelbl.text = [arr_name objectAtIndex:0];
            
            recipeNamestr = [arr_name objectAtIndex:0];
            
            //For ingredients
            
            NSString *queryingredients=[ NSString stringWithFormat:@"Select recipe_ingredients from winter_tbl where recipe_name ='Date' AND recipe_type ='Simple' "];
            recipeIngredientsArr =[[NSMutableArray alloc]init];
            recipeIngredientsArr =[[database executeQuery:queryingredients]mutableCopy];
            
            
            NSMutableArray *arr_ingredients  = [recipeIngredientsArr valueForKey:@"recipe_ingredients"];
            NSLog(@"%@",arr_ingredients);
            
            //self.recipe_ingredientslbl.text = [arr_ingredients objectAtIndex:0];
            // [self.recipe_ingredientslbl sizeToFit];
            
            recipeIngredientsstr = [arr_ingredients objectAtIndex:0];
            
            //For method
            NSString *querymethod=[ NSString stringWithFormat:@"Select recipe_method from winter_tbl where recipe_name ='Date' AND recipe_type ='Simple' "];
            recipeMethodArr =[[NSMutableArray alloc]init];
            recipeMethodArr =[[database executeQuery:querymethod]mutableCopy];
            
            
            NSMutableArray *arr_method  = [recipeMethodArr valueForKey:@"recipe_method"];
            NSLog(@"%@",arr_method);
            
            //self.recipe_methodlbl.text = [arr_method objectAtIndex:0];
            //[self.recipe_methodlbl sizeToFit];
            recipeMethodstr = [arr_method objectAtIndex:0];
            
            
            
            [database close];
        }
        if([self.imageFile isEqualToString: @"Kale.jpg"])
        {
            [self databaseOpen];
            
            
            //For name
            
            NSString *queryname= [NSString stringWithFormat:@"Select recipe_subcategory,recipe_name,recipe_type from winter_tbl where recipe_name ='Kale' AND recipe_type ='Simple' "];
            recipeNameArr =[[NSMutableArray alloc]init];
            recipeNameArr =[[database executeQuery:queryname]mutableCopy];
            
            NSMutableArray *arr_name = [recipeNameArr valueForKey:@"recipe_subcategory"];
            
            //self.recipe_namelbl.text = [arr_name objectAtIndex:0];
            
            recipeNamestr = [arr_name objectAtIndex:0];
            
            //For ingredients
            
            NSString *queryingredients=[ NSString stringWithFormat:@"Select recipe_ingredients from winter_tbl where recipe_name ='Kale' AND recipe_type ='Simple' "];
            recipeIngredientsArr =[[NSMutableArray alloc]init];
            recipeIngredientsArr =[[database executeQuery:queryingredients]mutableCopy];
            
            
            NSMutableArray *arr_ingredients  = [recipeIngredientsArr valueForKey:@"recipe_ingredients"];
            NSLog(@"%@",arr_ingredients);
            
            //self.recipe_ingredientslbl.text = [arr_ingredients objectAtIndex:0];
            // [self.recipe_ingredientslbl sizeToFit];
            
            recipeIngredientsstr = [arr_ingredients objectAtIndex:0];
            
            //For method
            NSString *querymethod=[ NSString stringWithFormat:@"Select recipe_method from winter_tbl where recipe_name ='Kale' AND recipe_type ='Simple' "];
            recipeMethodArr =[[NSMutableArray alloc]init];
            recipeMethodArr =[[database executeQuery:querymethod]mutableCopy];
            
            
            NSMutableArray *arr_method  = [recipeMethodArr valueForKey:@"recipe_method"];
            NSLog(@"%@",arr_method);
            
            //self.recipe_methodlbl.text = [arr_method objectAtIndex:0];
            //[self.recipe_methodlbl sizeToFit];
            recipeMethodstr = [arr_method objectAtIndex:0];
            
            
            
            [database close];
        }
        if([self.imageFile isEqualToString: @"Kiwi.jpg"])
        {
            [self databaseOpen];
            
            
            //For name
            
            NSString *queryname= [NSString stringWithFormat:@"Select recipe_subcategory,recipe_name,recipe_type from winter_tbl where recipe_name ='Kiwi' AND recipe_type ='Simple' "];
            recipeNameArr =[[NSMutableArray alloc]init];
            recipeNameArr =[[database executeQuery:queryname]mutableCopy];
            
            NSMutableArray *arr_name = [recipeNameArr valueForKey:@"recipe_subcategory"];
            
            //self.recipe_namelbl.text = [arr_name objectAtIndex:0];
            
            recipeNamestr = [arr_name objectAtIndex:0];
            
            //For ingredients
            
            NSString *queryingredients=[ NSString stringWithFormat:@"Select recipe_ingredients from winter_tbl where recipe_name ='Kiwi' AND recipe_type ='Simple' "];
            recipeIngredientsArr =[[NSMutableArray alloc]init];
            recipeIngredientsArr =[[database executeQuery:queryingredients]mutableCopy];
            
            
            NSMutableArray *arr_ingredients  = [recipeIngredientsArr valueForKey:@"recipe_ingredients"];
            NSLog(@"%@",arr_ingredients);
            
            //self.recipe_ingredientslbl.text = [arr_ingredients objectAtIndex:0];
            // [self.recipe_ingredientslbl sizeToFit];
            
            recipeIngredientsstr = [arr_ingredients objectAtIndex:0];
            
            //For method
            NSString *querymethod=[ NSString stringWithFormat:@"Select recipe_method from winter_tbl where recipe_name ='Kiwi' AND recipe_type ='Simple' "];
            recipeMethodArr =[[NSMutableArray alloc]init];
            recipeMethodArr =[[database executeQuery:querymethod]mutableCopy];
            
            
            NSMutableArray *arr_method  = [recipeMethodArr valueForKey:@"recipe_method"];
            NSLog(@"%@",arr_method);
            
            //self.recipe_methodlbl.text = [arr_method objectAtIndex:0];
            //[self.recipe_methodlbl sizeToFit];
            recipeMethodstr = [arr_method objectAtIndex:0];
            
            
            
            [database close];
        }
        
        
        if([self.imageFile isEqualToString: @"Lentil.jpg"])
        {
            [self databaseOpen];
            
            
            //For name
            
            NSString *queryname= [NSString stringWithFormat:@"Select recipe_subcategory,recipe_name,recipe_type from winter_tbl where recipe_name ='Lentil' AND recipe_type ='Simple' "];
            recipeNameArr =[[NSMutableArray alloc]init];
            recipeNameArr =[[database executeQuery:queryname]mutableCopy];
            
            NSMutableArray *arr_name = [recipeNameArr valueForKey:@"recipe_subcategory"];
            
            //self.recipe_namelbl.text = [arr_name objectAtIndex:0];
            
            recipeNamestr = [arr_name objectAtIndex:0];
            
            //For ingredients
            
            NSString *queryingredients=[ NSString stringWithFormat:@"Select recipe_ingredients from winter_tbl where recipe_name ='Lentil' AND recipe_type ='Simple' "];
            recipeIngredientsArr =[[NSMutableArray alloc]init];
            recipeIngredientsArr =[[database executeQuery:queryingredients]mutableCopy];
            
            
            NSMutableArray *arr_ingredients  = [recipeIngredientsArr valueForKey:@"recipe_ingredients"];
            NSLog(@"%@",arr_ingredients);
            
            //self.recipe_ingredientslbl.text = [arr_ingredients objectAtIndex:0];
            // [self.recipe_ingredientslbl sizeToFit];
            
            recipeIngredientsstr = [arr_ingredients objectAtIndex:0];
            
            //For method
            NSString *querymethod=[ NSString stringWithFormat:@"Select recipe_method from winter_tbl where recipe_name ='Lentil' AND recipe_type ='Simple' "];
            recipeMethodArr =[[NSMutableArray alloc]init];
            recipeMethodArr =[[database executeQuery:querymethod]mutableCopy];
            
            
            NSMutableArray *arr_method  = [recipeMethodArr valueForKey:@"recipe_method"];
            NSLog(@"%@",arr_method);
            
            //self.recipe_methodlbl.text = [arr_method objectAtIndex:0];
            //[self.recipe_methodlbl sizeToFit];
            recipeMethodstr = [arr_method objectAtIndex:0];
            
            
            
            [database close];
        }
        
        if([self.imageFile isEqualToString: @"Mango.jpg"])
        {
            [self databaseOpen];
            
            
            //For name
            
            NSString *queryname= [NSString stringWithFormat:@"Select recipe_subcategory,recipe_name,recipe_type from winter_tbl where recipe_name ='Mango' AND recipe_type ='Simple' "];
            recipeNameArr =[[NSMutableArray alloc]init];
            recipeNameArr =[[database executeQuery:queryname]mutableCopy];
            
            NSMutableArray *arr_name = [recipeNameArr valueForKey:@"recipe_subcategory"];
            
            //self.recipe_namelbl.text = [arr_name objectAtIndex:0];
            
            recipeNamestr = [arr_name objectAtIndex:0];
            
            //For ingredients
            
            NSString *queryingredients=[ NSString stringWithFormat:@"Select recipe_ingredients from winter_tbl where recipe_name ='Mango' AND recipe_type ='Simple' "];
            recipeIngredientsArr =[[NSMutableArray alloc]init];
            recipeIngredientsArr =[[database executeQuery:queryingredients]mutableCopy];
            
            
            NSMutableArray *arr_ingredients  = [recipeIngredientsArr valueForKey:@"recipe_ingredients"];
            NSLog(@"%@",arr_ingredients);
            
            //self.recipe_ingredientslbl.text = [arr_ingredients objectAtIndex:0];
            // [self.recipe_ingredientslbl sizeToFit];
            
            recipeIngredientsstr = [arr_ingredients objectAtIndex:0];
            
            //For method
            NSString *querymethod=[ NSString stringWithFormat:@"Select recipe_method from winter_tbl where recipe_name ='Mango' AND recipe_type ='Simple' "];
            recipeMethodArr =[[NSMutableArray alloc]init];
            recipeMethodArr =[[database executeQuery:querymethod]mutableCopy];
            
            
            NSMutableArray *arr_method  = [recipeMethodArr valueForKey:@"recipe_method"];
            NSLog(@"%@",arr_method);
            
            //self.recipe_methodlbl.text = [arr_method objectAtIndex:0];
            //[self.recipe_methodlbl sizeToFit];
            recipeMethodstr = [arr_method objectAtIndex:0];
            
            
            
            [database close];
        }
        
        if([self.imageFile isEqualToString: @"Mushroom.jpg"])
        {
            [self databaseOpen];
            
            
            //For name
            
            NSString *queryname= [NSString stringWithFormat:@"Select recipe_subcategory,recipe_name,recipe_type from winter_tbl where recipe_name ='Mushroom' AND recipe_type ='Simple' "];
            recipeNameArr =[[NSMutableArray alloc]init];
            recipeNameArr =[[database executeQuery:queryname]mutableCopy];
            
            NSMutableArray *arr_name = [recipeNameArr valueForKey:@"recipe_subcategory"];
            
            //self.recipe_namelbl.text = [arr_name objectAtIndex:0];
            
            recipeNamestr = [arr_name objectAtIndex:0];
            
            //For ingredients
            
            NSString *queryingredients=[ NSString stringWithFormat:@"Select recipe_ingredients from winter_tbl where recipe_name ='Mushroom' AND recipe_type ='Simple' "];
            recipeIngredientsArr =[[NSMutableArray alloc]init];
            recipeIngredientsArr =[[database executeQuery:queryingredients]mutableCopy];
            
            
            NSMutableArray *arr_ingredients  = [recipeIngredientsArr valueForKey:@"recipe_ingredients"];
            NSLog(@"%@",arr_ingredients);
            
            //self.recipe_ingredientslbl.text = [arr_ingredients objectAtIndex:0];
            // [self.recipe_ingredientslbl sizeToFit];
            
            recipeIngredientsstr = [arr_ingredients objectAtIndex:0];
            
            //For method
            NSString *querymethod=[ NSString stringWithFormat:@"Select recipe_method from winter_tbl where recipe_name ='Mushroom' AND recipe_type ='Simple' "];
            recipeMethodArr =[[NSMutableArray alloc]init];
            recipeMethodArr =[[database executeQuery:querymethod]mutableCopy];
            
            
            NSMutableArray *arr_method  = [recipeMethodArr valueForKey:@"recipe_method"];
            NSLog(@"%@",arr_method);
            
            //self.recipe_methodlbl.text = [arr_method objectAtIndex:0];
            //[self.recipe_methodlbl sizeToFit];
            recipeMethodstr = [arr_method objectAtIndex:0];
            
            
            
            [database close];
        }
        
        if([self.imageFile isEqualToString: @"Onion.jpg"])
        {
            [self databaseOpen];
            
            
            //For name
            
            NSString *queryname= [NSString stringWithFormat:@"Select recipe_subcategory,recipe_name,recipe_type from winter_tbl where recipe_name ='Onion' AND recipe_type ='Simple' "];
            recipeNameArr =[[NSMutableArray alloc]init];
            recipeNameArr =[[database executeQuery:queryname]mutableCopy];
            
            NSMutableArray *arr_name = [recipeNameArr valueForKey:@"recipe_subcategory"];
            
            //self.recipe_namelbl.text = [arr_name objectAtIndex:0];
            
            recipeNamestr = [arr_name objectAtIndex:0];
            
            //For ingredients
            
            NSString *queryingredients=[ NSString stringWithFormat:@"Select recipe_ingredients from winter_tbl where recipe_name ='Onion' AND recipe_type ='Simple' "];
            recipeIngredientsArr =[[NSMutableArray alloc]init];
            recipeIngredientsArr =[[database executeQuery:queryingredients]mutableCopy];
            
            
            NSMutableArray *arr_ingredients  = [recipeIngredientsArr valueForKey:@"recipe_ingredients"];
            NSLog(@"%@",arr_ingredients);
            
            //self.recipe_ingredientslbl.text = [arr_ingredients objectAtIndex:0];
            // [self.recipe_ingredientslbl sizeToFit];
            
            recipeIngredientsstr = [arr_ingredients objectAtIndex:0];
            
            //For method
            NSString *querymethod=[ NSString stringWithFormat:@"Select recipe_method from winter_tbl where recipe_name ='Onion' AND recipe_type ='Simple' "];
            recipeMethodArr =[[NSMutableArray alloc]init];
            recipeMethodArr =[[database executeQuery:querymethod]mutableCopy];
            
            
            NSMutableArray *arr_method  = [recipeMethodArr valueForKey:@"recipe_method"];
            NSLog(@"%@",arr_method);
            
            //self.recipe_methodlbl.text = [arr_method objectAtIndex:0];
            //[self.recipe_methodlbl sizeToFit];
            recipeMethodstr = [arr_method objectAtIndex:0];
            
            
            
            [database close];
        }
        
        if([self.imageFile isEqualToString: @"Orange.jpg"])
        {
            [self databaseOpen];
            
            
            //For name
            
            NSString *queryname= [NSString stringWithFormat:@"Select recipe_subcategory,recipe_name,recipe_type from winter_tbl where recipe_name ='Orange' AND recipe_type ='Simple' "];
            recipeNameArr =[[NSMutableArray alloc]init];
            recipeNameArr =[[database executeQuery:queryname]mutableCopy];
            
            NSMutableArray *arr_name = [recipeNameArr valueForKey:@"recipe_subcategory"];
            
            //self.recipe_namelbl.text = [arr_name objectAtIndex:0];
            
            recipeNamestr = [arr_name objectAtIndex:0];
            
            //For ingredients
            
            NSString *queryingredients=[ NSString stringWithFormat:@"Select recipe_ingredients from winter_tbl where recipe_name ='Orange' AND recipe_type ='Simple' "];
            recipeIngredientsArr =[[NSMutableArray alloc]init];
            recipeIngredientsArr =[[database executeQuery:queryingredients]mutableCopy];
            
            
            NSMutableArray *arr_ingredients  = [recipeIngredientsArr valueForKey:@"recipe_ingredients"];
            NSLog(@"%@",arr_ingredients);
            
            //self.recipe_ingredientslbl.text = [arr_ingredients objectAtIndex:0];
            // [self.recipe_ingredientslbl sizeToFit];
            
            recipeIngredientsstr = [arr_ingredients objectAtIndex:0];
            
            //For method
            NSString *querymethod=[ NSString stringWithFormat:@"Select recipe_method from winter_tbl where recipe_name ='Orange' AND recipe_type ='Simple' "];
            recipeMethodArr =[[NSMutableArray alloc]init];
            recipeMethodArr =[[database executeQuery:querymethod]mutableCopy];
            
            
            NSMutableArray *arr_method  = [recipeMethodArr valueForKey:@"recipe_method"];
            NSLog(@"%@",arr_method);
            
            //self.recipe_methodlbl.text = [arr_method objectAtIndex:0];
            //[self.recipe_methodlbl sizeToFit];
            recipeMethodstr = [arr_method objectAtIndex:0];
            
            
            
            [database close];
        }
        if([self.imageFile isEqualToString: @"Papaya.jpg"])
        {
            [self databaseOpen];
            
            
            //For name
            
            NSString *queryname= [NSString stringWithFormat:@"Select recipe_subcategory,recipe_name,recipe_type from winter_tbl where recipe_name ='Papaya' AND recipe_type ='Simple' "];
            recipeNameArr =[[NSMutableArray alloc]init];
            recipeNameArr =[[database executeQuery:queryname]mutableCopy];
            
            NSMutableArray *arr_name = [recipeNameArr valueForKey:@"recipe_subcategory"];
            
            //self.recipe_namelbl.text = [arr_name objectAtIndex:0];
            
            recipeNamestr = [arr_name objectAtIndex:0];
            
            //For ingredients
            
            NSString *queryingredients=[ NSString stringWithFormat:@"Select recipe_ingredients from winter_tbl where recipe_name ='Papaya' AND recipe_type ='Simple' "];
            recipeIngredientsArr =[[NSMutableArray alloc]init];
            recipeIngredientsArr =[[database executeQuery:queryingredients]mutableCopy];
            
            
            NSMutableArray *arr_ingredients  = [recipeIngredientsArr valueForKey:@"recipe_ingredients"];
            NSLog(@"%@",arr_ingredients);
            
            //self.recipe_ingredientslbl.text = [arr_ingredients objectAtIndex:0];
            // [self.recipe_ingredientslbl sizeToFit];
            
            recipeIngredientsstr = [arr_ingredients objectAtIndex:0];
            
            //For method
            NSString *querymethod=[ NSString stringWithFormat:@"Select recipe_method from winter_tbl where recipe_name ='Papaya' AND recipe_type ='Simple' "];
            recipeMethodArr =[[NSMutableArray alloc]init];
            recipeMethodArr =[[database executeQuery:querymethod]mutableCopy];
            
            
            NSMutableArray *arr_method  = [recipeMethodArr valueForKey:@"recipe_method"];
            NSLog(@"%@",arr_method);
            
            //self.recipe_methodlbl.text = [arr_method objectAtIndex:0];
            //[self.recipe_methodlbl sizeToFit];
            recipeMethodstr = [arr_method objectAtIndex:0];
            
            
            
            [database close];
        }
        
        if([self.imageFile isEqualToString: @"Parsnip.jpg"])
        {
            [self databaseOpen];
            
            
            //For name
            
            NSString *queryname= [NSString stringWithFormat:@"Select recipe_subcategory,recipe_name,recipe_type from winter_tbl where recipe_name ='Parsnip' AND recipe_type ='Simple' "];
            recipeNameArr =[[NSMutableArray alloc]init];
            recipeNameArr =[[database executeQuery:queryname]mutableCopy];
            
            NSMutableArray *arr_name = [recipeNameArr valueForKey:@"recipe_subcategory"];
            
            //self.recipe_namelbl.text = [arr_name objectAtIndex:0];
            
            recipeNamestr = [arr_name objectAtIndex:0];
            
            //For ingredients
            
            NSString *queryingredients=[ NSString stringWithFormat:@"Select recipe_ingredients from winter_tbl where recipe_name ='Parsnip' AND recipe_type ='Simple' "];
            recipeIngredientsArr =[[NSMutableArray alloc]init];
            recipeIngredientsArr =[[database executeQuery:queryingredients]mutableCopy];
            
            
            NSMutableArray *arr_ingredients  = [recipeIngredientsArr valueForKey:@"recipe_ingredients"];
            NSLog(@"%@",arr_ingredients);
            
            //self.recipe_ingredientslbl.text = [arr_ingredients objectAtIndex:0];
            // [self.recipe_ingredientslbl sizeToFit];
            
            recipeIngredientsstr = [arr_ingredients objectAtIndex:0];
            
            //For method
            NSString *querymethod=[ NSString stringWithFormat:@"Select recipe_method from winter_tbl where recipe_name ='Parsnip' AND recipe_type ='Simple' "];
            recipeMethodArr =[[NSMutableArray alloc]init];
            recipeMethodArr =[[database executeQuery:querymethod]mutableCopy];
            
            
            NSMutableArray *arr_method  = [recipeMethodArr valueForKey:@"recipe_method"];
            NSLog(@"%@",arr_method);
            
            //self.recipe_methodlbl.text = [arr_method objectAtIndex:0];
            //[self.recipe_methodlbl sizeToFit];
            recipeMethodstr = [arr_method objectAtIndex:0];
            
            
            
            [database close];
        }
        
        if([self.imageFile isEqualToString: @"Pear.jpg"])
        {
            [self databaseOpen];
            
            
            //For name
            
            NSString *queryname= [NSString stringWithFormat:@"Select recipe_subcategory,recipe_name,recipe_type from winter_tbl where recipe_name ='Pear' AND recipe_type ='Simple' "];
            recipeNameArr =[[NSMutableArray alloc]init];
            recipeNameArr =[[database executeQuery:queryname]mutableCopy];
            
            NSMutableArray *arr_name = [recipeNameArr valueForKey:@"recipe_subcategory"];
            
            //self.recipe_namelbl.text = [arr_name objectAtIndex:0];
            
            recipeNamestr = [arr_name objectAtIndex:0];
            
            //For ingredients
            
            NSString *queryingredients=[ NSString stringWithFormat:@"Select recipe_ingredients from winter_tbl where recipe_name ='Pear' AND recipe_type ='Simple' "];
            recipeIngredientsArr =[[NSMutableArray alloc]init];
            recipeIngredientsArr =[[database executeQuery:queryingredients]mutableCopy];
            
            
            NSMutableArray *arr_ingredients  = [recipeIngredientsArr valueForKey:@"recipe_ingredients"];
            NSLog(@"%@",arr_ingredients);
            
            //self.recipe_ingredientslbl.text = [arr_ingredients objectAtIndex:0];
            // [self.recipe_ingredientslbl sizeToFit];
            
            recipeIngredientsstr = [arr_ingredients objectAtIndex:0];
            
            //For method
            NSString *querymethod=[ NSString stringWithFormat:@"Select recipe_method from winter_tbl where recipe_name ='Pear' AND recipe_type ='Simple' "];
            recipeMethodArr =[[NSMutableArray alloc]init];
            recipeMethodArr =[[database executeQuery:querymethod]mutableCopy];
            
            
            NSMutableArray *arr_method  = [recipeMethodArr valueForKey:@"recipe_method"];
            NSLog(@"%@",arr_method);
            
            //self.recipe_methodlbl.text = [arr_method objectAtIndex:0];
            //[self.recipe_methodlbl sizeToFit];
            recipeMethodstr = [arr_method objectAtIndex:0];
            
            
            
            [database close];
        }
        if([self.imageFile isEqualToString: @"Pineapple.jpg"])
        {
            [self databaseOpen];
            
            
            //For name
            
            NSString *queryname= [NSString stringWithFormat:@"Select recipe_subcategory,recipe_name,recipe_type from winter_tbl where recipe_name ='Pineapple' AND recipe_type ='Simple' "];
            recipeNameArr =[[NSMutableArray alloc]init];
            recipeNameArr =[[database executeQuery:queryname]mutableCopy];
            
            NSMutableArray *arr_name = [recipeNameArr valueForKey:@"recipe_subcategory"];
            
            //self.recipe_namelbl.text = [arr_name objectAtIndex:0];
            
            recipeNamestr = [arr_name objectAtIndex:0];
            
            //For ingredients
            
            NSString *queryingredients=[ NSString stringWithFormat:@"Select recipe_ingredients from winter_tbl where recipe_name ='Pineapple' AND recipe_type ='Simple' "];
            recipeIngredientsArr =[[NSMutableArray alloc]init];
            recipeIngredientsArr =[[database executeQuery:queryingredients]mutableCopy];
            
            
            NSMutableArray *arr_ingredients  = [recipeIngredientsArr valueForKey:@"recipe_ingredients"];
            NSLog(@"%@",arr_ingredients);
            
            //self.recipe_ingredientslbl.text = [arr_ingredients objectAtIndex:0];
            // [self.recipe_ingredientslbl sizeToFit];
            
            recipeIngredientsstr = [arr_ingredients objectAtIndex:0];
            
            //For method
            NSString *querymethod=[ NSString stringWithFormat:@"Select recipe_method from winter_tbl where recipe_name ='Pineapple' AND recipe_type ='Simple' "];
            recipeMethodArr =[[NSMutableArray alloc]init];
            recipeMethodArr =[[database executeQuery:querymethod]mutableCopy];
            
            
            NSMutableArray *arr_method  = [recipeMethodArr valueForKey:@"recipe_method"];
            NSLog(@"%@",arr_method);
            
            //self.recipe_methodlbl.text = [arr_method objectAtIndex:0];
            //[self.recipe_methodlbl sizeToFit];
            recipeMethodstr = [arr_method objectAtIndex:0];
            
            
            
            [database close];
        }
        
        if([self.imageFile isEqualToString: @"Pomegranate.jpg"])
        {
            [self databaseOpen];
            
            
            //For name
            
            NSString *queryname= [NSString stringWithFormat:@"Select recipe_subcategory,recipe_name,recipe_type from winter_tbl where recipe_name ='Pomegranate' AND recipe_type ='Simple' "];
            recipeNameArr =[[NSMutableArray alloc]init];
            recipeNameArr =[[database executeQuery:queryname]mutableCopy];
            
            NSMutableArray *arr_name = [recipeNameArr valueForKey:@"recipe_subcategory"];
            
            //self.recipe_namelbl.text = [arr_name objectAtIndex:0];
            
            recipeNamestr = [arr_name objectAtIndex:0];
            
            //For ingredients
            
            NSString *queryingredients=[ NSString stringWithFormat:@"Select recipe_ingredients from winter_tbl where recipe_name ='Pomegranate' AND recipe_type ='Simple' "];
            recipeIngredientsArr =[[NSMutableArray alloc]init];
            recipeIngredientsArr =[[database executeQuery:queryingredients]mutableCopy];
            
            
            NSMutableArray *arr_ingredients  = [recipeIngredientsArr valueForKey:@"recipe_ingredients"];
            NSLog(@"%@",arr_ingredients);
            
            //self.recipe_ingredientslbl.text = [arr_ingredients objectAtIndex:0];
            // [self.recipe_ingredientslbl sizeToFit];
            
            recipeIngredientsstr = [arr_ingredients objectAtIndex:0];
            
            //For method
            NSString *querymethod=[ NSString stringWithFormat:@"Select recipe_method from winter_tbl where recipe_name ='Pomegranate' AND recipe_type ='Simple' "];
            recipeMethodArr =[[NSMutableArray alloc]init];
            recipeMethodArr =[[database executeQuery:querymethod]mutableCopy];
            
            
            NSMutableArray *arr_method  = [recipeMethodArr valueForKey:@"recipe_method"];
            NSLog(@"%@",arr_method);
            
            //self.recipe_methodlbl.text = [arr_method objectAtIndex:0];
            //[self.recipe_methodlbl sizeToFit];
            recipeMethodstr = [arr_method objectAtIndex:0];
            
            
            
            [database close];
        }
        if([self.imageFile isEqualToString: @"Prune.jpg"])
        {
            [self databaseOpen];
            
            
            //For name
            
            NSString *queryname= [NSString stringWithFormat:@"Select recipe_subcategory,recipe_name,recipe_type from winter_tbl where recipe_name ='Prunes' AND recipe_type ='Simple' "];
            recipeNameArr =[[NSMutableArray alloc]init];
            recipeNameArr =[[database executeQuery:queryname]mutableCopy];
            
            NSMutableArray *arr_name = [recipeNameArr valueForKey:@"recipe_subcategory"];
            
            //self.recipe_namelbl.text = [arr_name objectAtIndex:0];
            
            recipeNamestr = [arr_name objectAtIndex:0];
            
            //For ingredients
            
            NSString *queryingredients=[ NSString stringWithFormat:@"Select recipe_ingredients from winter_tbl where recipe_name ='Prunes' AND recipe_type ='Simple' "];
            recipeIngredientsArr =[[NSMutableArray alloc]init];
            recipeIngredientsArr =[[database executeQuery:queryingredients]mutableCopy];
            
            
            NSMutableArray *arr_ingredients  = [recipeIngredientsArr valueForKey:@"recipe_ingredients"];
            NSLog(@"%@",arr_ingredients);
            
            //self.recipe_ingredientslbl.text = [arr_ingredients objectAtIndex:0];
            // [self.recipe_ingredientslbl sizeToFit];
            
            recipeIngredientsstr = [arr_ingredients objectAtIndex:0];
            
            //For method
            NSString *querymethod=[ NSString stringWithFormat:@"Select recipe_method from winter_tbl where recipe_name ='Prunes' AND recipe_type ='Simple' "];
            recipeMethodArr =[[NSMutableArray alloc]init];
            recipeMethodArr =[[database executeQuery:querymethod]mutableCopy];
            
            
            NSMutableArray *arr_method  = [recipeMethodArr valueForKey:@"recipe_method"];
            NSLog(@"%@",arr_method);
            
            //self.recipe_methodlbl.text = [arr_method objectAtIndex:0];
            //[self.recipe_methodlbl sizeToFit];
            recipeMethodstr = [arr_method objectAtIndex:0];
            
            
            
            [database close];
        }
        if([self.imageFile isEqualToString: @"Rutabaga.jpg"])
        {
            [self databaseOpen];
            
            
            //For name
            
            NSString *queryname= [NSString stringWithFormat:@"Select recipe_subcategory,recipe_name,recipe_type from winter_tbl where recipe_name ='Rutabaga' AND recipe_type ='Simple' "];
            recipeNameArr =[[NSMutableArray alloc]init];
            recipeNameArr =[[database executeQuery:queryname]mutableCopy];
            
            NSMutableArray *arr_name = [recipeNameArr valueForKey:@"recipe_subcategory"];
            
            //self.recipe_namelbl.text = [arr_name objectAtIndex:0];
            
            recipeNamestr = [arr_name objectAtIndex:0];
            
            //For ingredients
            
            NSString *queryingredients=[ NSString stringWithFormat:@"Select recipe_ingredients from winter_tbl where recipe_name ='Rutabaga' AND recipe_type ='Simple' "];
            recipeIngredientsArr =[[NSMutableArray alloc]init];
            recipeIngredientsArr =[[database executeQuery:queryingredients]mutableCopy];
            
            
            NSMutableArray *arr_ingredients  = [recipeIngredientsArr valueForKey:@"recipe_ingredients"];
            NSLog(@"%@",arr_ingredients);
            
            //self.recipe_ingredientslbl.text = [arr_ingredients objectAtIndex:0];
            // [self.recipe_ingredientslbl sizeToFit];
            
            recipeIngredientsstr = [arr_ingredients objectAtIndex:0];
            
            //For method
            NSString *querymethod=[ NSString stringWithFormat:@"Select recipe_method from winter_tbl where recipe_name ='Rutabaga' AND recipe_type ='Simple' "];
            recipeMethodArr =[[NSMutableArray alloc]init];
            recipeMethodArr =[[database executeQuery:querymethod]mutableCopy];
            
            
            NSMutableArray *arr_method  = [recipeMethodArr valueForKey:@"recipe_method"];
            NSLog(@"%@",arr_method);
            
            //self.recipe_methodlbl.text = [arr_method objectAtIndex:0];
            //[self.recipe_methodlbl sizeToFit];
            recipeMethodstr = [arr_method objectAtIndex:0];
            
            
            
            [database close];
        }
        
        if([self.imageFile isEqualToString: @"Sardines.jpg"])
        {
            [self databaseOpen];
            
            
            //For name
            
            NSString *queryname= [NSString stringWithFormat:@"Select recipe_subcategory,recipe_name,recipe_type from winter_tbl where recipe_name ='Sardine' AND recipe_type ='Simple' "];
            recipeNameArr =[[NSMutableArray alloc]init];
            recipeNameArr =[[database executeQuery:queryname]mutableCopy];
            
            NSMutableArray *arr_name = [recipeNameArr valueForKey:@"recipe_subcategory"];
            
            //self.recipe_namelbl.text = [arr_name objectAtIndex:0];
            
            recipeNamestr = [arr_name objectAtIndex:0];
            
            //For ingredients
            
            NSString *queryingredients=[ NSString stringWithFormat:@"Select recipe_ingredients from winter_tbl where recipe_name ='Sardine' AND recipe_type ='Simple' "];
            recipeIngredientsArr =[[NSMutableArray alloc]init];
            recipeIngredientsArr =[[database executeQuery:queryingredients]mutableCopy];
            
            
            NSMutableArray *arr_ingredients  = [recipeIngredientsArr valueForKey:@"recipe_ingredients"];
            NSLog(@"%@",arr_ingredients);
            
            //self.recipe_ingredientslbl.text = [arr_ingredients objectAtIndex:0];
            // [self.recipe_ingredientslbl sizeToFit];
            
            recipeIngredientsstr = [arr_ingredients objectAtIndex:0];
            
            //For method
            NSString *querymethod=[ NSString stringWithFormat:@"Select recipe_method from winter_tbl where recipe_name ='Sardine' AND recipe_type ='Simple' "];
            recipeMethodArr =[[NSMutableArray alloc]init];
            recipeMethodArr =[[database executeQuery:querymethod]mutableCopy];
            
            
            NSMutableArray *arr_method  = [recipeMethodArr valueForKey:@"recipe_method"];
            NSLog(@"%@",arr_method);
            
            //self.recipe_methodlbl.text = [arr_method objectAtIndex:0];
            //[self.recipe_methodlbl sizeToFit];
            recipeMethodstr = [arr_method objectAtIndex:0];
            
            
            
            [database close];
        }
        
        if([self.imageFile isEqualToString: @"Walnut.jpg"])
        {
            [self databaseOpen];
            
            
            //For name
            
            NSString *queryname= [NSString stringWithFormat:@"Select recipe_subcategory,recipe_name,recipe_type from winter_tbl where recipe_name ='Walnut' AND recipe_type ='Simple' "];
            recipeNameArr =[[NSMutableArray alloc]init];
            recipeNameArr =[[database executeQuery:queryname]mutableCopy];
            
            NSMutableArray *arr_name = [recipeNameArr valueForKey:@"recipe_subcategory"];
            
            //self.recipe_namelbl.text = [arr_name objectAtIndex:0];
            
            recipeNamestr = [arr_name objectAtIndex:0];
            
            //For ingredients
            
            NSString *queryingredients=[ NSString stringWithFormat:@"Select recipe_ingredients from winter_tbl where recipe_name ='Walnut' AND recipe_type ='Simple' "];
            recipeIngredientsArr =[[NSMutableArray alloc]init];
            recipeIngredientsArr =[[database executeQuery:queryingredients]mutableCopy];
            
            
            NSMutableArray *arr_ingredients  = [recipeIngredientsArr valueForKey:@"recipe_ingredients"];
            NSLog(@"%@",arr_ingredients);
            
            //self.recipe_ingredientslbl.text = [arr_ingredients objectAtIndex:0];
            // [self.recipe_ingredientslbl sizeToFit];
            
            recipeIngredientsstr = [arr_ingredients objectAtIndex:0];
            
            //For method
            NSString *querymethod=[ NSString stringWithFormat:@"Select recipe_method from winter_tbl where recipe_name ='Walnut' AND recipe_type ='Simple' "];
            recipeMethodArr =[[NSMutableArray alloc]init];
            recipeMethodArr =[[database executeQuery:querymethod]mutableCopy];
            
            
            NSMutableArray *arr_method  = [recipeMethodArr valueForKey:@"recipe_method"];
            NSLog(@"%@",arr_method);
            
            //self.recipe_methodlbl.text = [arr_method objectAtIndex:0];
            //[self.recipe_methodlbl sizeToFit];
            recipeMethodstr = [arr_method objectAtIndex:0];
            
            
            
            [database close];
        }
        if([self.imageFile isEqualToString: @"Yam.jpg"])
        {
            [self databaseOpen];
            
            
            //For name
            
            NSString *queryname= [NSString stringWithFormat:@"Select recipe_subcategory,recipe_name,recipe_type from winter_tbl where recipe_name ='Yam' AND recipe_type ='Simple' "];
            recipeNameArr =[[NSMutableArray alloc]init];
            recipeNameArr =[[database executeQuery:queryname]mutableCopy];
            
            NSMutableArray *arr_name = [recipeNameArr valueForKey:@"recipe_subcategory"];
            
            //self.recipe_namelbl.text = [arr_name objectAtIndex:0];
            
            recipeNamestr = [arr_name objectAtIndex:0];
            
            //For ingredients
            
            NSString *queryingredients=[ NSString stringWithFormat:@"Select recipe_ingredients from winter_tbl where recipe_name ='Yam' AND recipe_type ='Simple' "];
            recipeIngredientsArr =[[NSMutableArray alloc]init];
            recipeIngredientsArr =[[database executeQuery:queryingredients]mutableCopy];
            
            
            NSMutableArray *arr_ingredients  = [recipeIngredientsArr valueForKey:@"recipe_ingredients"];
            NSLog(@"%@",arr_ingredients);
            
            //self.recipe_ingredientslbl.text = [arr_ingredients objectAtIndex:0];
            // [self.recipe_ingredientslbl sizeToFit];
            
            recipeIngredientsstr = [arr_ingredients objectAtIndex:0];
            
            //For method
            NSString *querymethod=[ NSString stringWithFormat:@"Select recipe_method from winter_tbl where recipe_name ='Yam' AND recipe_type ='Simple' "];
            recipeMethodArr =[[NSMutableArray alloc]init];
            recipeMethodArr =[[database executeQuery:querymethod]mutableCopy];
            
            
            NSMutableArray *arr_method  = [recipeMethodArr valueForKey:@"recipe_method"];
            NSLog(@"%@",arr_method);
            
            //self.recipe_methodlbl.text = [arr_method objectAtIndex:0];
            //[self.recipe_methodlbl sizeToFit];
            recipeMethodstr = [arr_method objectAtIndex:0];
            
            
            
            [database close];
        }
        
     [self performSegueWithIdentifier:@"simplesegue" sender:self];

    }
    
    else if ([season isEqualToString:@"summer"])
    {
        if([self.imageFile isEqualToString: @"Eggplant.jpg"])
        {
            [self databaseOpen];
            
            
            //For name
            
            NSString *queryname= [NSString stringWithFormat:@"Select recipe_subcategory,recipe_name,recipe_type from summer_tbl where recipe_name ='EGGPLANT' AND recipe_type ='Simple' "];
            recipeNameArr =[[NSMutableArray alloc]init];
            recipeNameArr =[[database executeQuery:queryname]mutableCopy];
            
            NSMutableArray *arr_name = [recipeNameArr valueForKey:@"recipe_subcategory"];
            
            //self.recipe_namelbl.text = [arr_name objectAtIndex:0];
            
            recipeNamestr = [arr_name objectAtIndex:0];
            
            //For ingredients
            
            NSString *queryingredients=[ NSString stringWithFormat:@"Select recipe_ingredients from summer_tbl where recipe_name ='EGGPLANT' AND recipe_type ='Simple' "];
            recipeIngredientsArr =[[NSMutableArray alloc]init];
            recipeIngredientsArr =[[database executeQuery:queryingredients]mutableCopy];
            
            
            NSMutableArray *arr_ingredients  = [recipeIngredientsArr valueForKey:@"recipe_ingredients"];
            NSLog(@"%@",arr_ingredients);
            
            //self.recipe_ingredientslbl.text = [arr_ingredients objectAtIndex:0];
            // [self.recipe_ingredientslbl sizeToFit];
            
            recipeIngredientsstr = [arr_ingredients objectAtIndex:0];
            
            //For method
            NSString *querymethod=[ NSString stringWithFormat:@"Select recipe_method from summer_tbl where recipe_name ='EGGPLANT' AND recipe_type ='Simple' "];
            recipeMethodArr =[[NSMutableArray alloc]init];
            recipeMethodArr =[[database executeQuery:querymethod]mutableCopy];
            
            
            NSMutableArray *arr_method  = [recipeMethodArr valueForKey:@"recipe_method"];
            NSLog(@"%@",arr_method);
            
            //self.recipe_methodlbl.text = [arr_method objectAtIndex:0];
            //[self.recipe_methodlbl sizeToFit];
            recipeMethodstr = [arr_method objectAtIndex:0];
            
            
            
            [database close];
        }
        else if([self.imageFile isEqualToString: @"Frisee.jpg"])
        {
            [self databaseOpen];
            
            
            //For name
            
            NSString *queryname= [NSString stringWithFormat:@"Select recipe_subcategory,recipe_name,recipe_type from summer_tbl where recipe_name ='FRISEE' AND recipe_type ='Simple' "];
            recipeNameArr =[[NSMutableArray alloc]init];
            recipeNameArr =[[database executeQuery:queryname]mutableCopy];
            
            NSMutableArray *arr_name = [recipeNameArr valueForKey:@"recipe_subcategory"];
            
            //self.recipe_namelbl.text = [arr_name objectAtIndex:0];
            
            recipeNamestr = [arr_name objectAtIndex:0];
            
            //For ingredients
            
            NSString *queryingredients=[ NSString stringWithFormat:@"Select recipe_ingredients from summer_tbl where recipe_name ='FRISEE' AND recipe_type ='Simple' "];
            recipeIngredientsArr =[[NSMutableArray alloc]init];
            recipeIngredientsArr =[[database executeQuery:queryingredients]mutableCopy];
            
            
            NSMutableArray *arr_ingredients  = [recipeIngredientsArr valueForKey:@"recipe_ingredients"];
            NSLog(@"%@",arr_ingredients);
            
            //self.recipe_ingredientslbl.text = [arr_ingredients objectAtIndex:0];
            // [self.recipe_ingredientslbl sizeToFit];
            
            recipeIngredientsstr = [arr_ingredients objectAtIndex:0];
            
            //For method
            NSString *querymethod=[ NSString stringWithFormat:@"Select recipe_method from summer_tbl where recipe_name ='FRISEE' AND recipe_type ='Simple' "];
            recipeMethodArr =[[NSMutableArray alloc]init];
            recipeMethodArr =[[database executeQuery:querymethod]mutableCopy];
            
            
            NSMutableArray *arr_method  = [recipeMethodArr valueForKey:@"recipe_method"];
            NSLog(@"%@",arr_method);
            
            //self.recipe_methodlbl.text = [arr_method objectAtIndex:0];
            //[self.recipe_methodlbl sizeToFit];
            recipeMethodstr = [arr_method objectAtIndex:0];
            
            
            
            [database close];
        }
        else if([self.imageFile isEqualToString: @"Shrimp.jpg"])
        {
            [self databaseOpen];
            
            
            //For name
            
            NSString *queryname= [NSString stringWithFormat:@"Select recipe_subcategory,recipe_name,recipe_type from summer_tbl where recipe_name ='SHRIMP' AND recipe_type ='Simple' "];
            recipeNameArr =[[NSMutableArray alloc]init];
            recipeNameArr =[[database executeQuery:queryname]mutableCopy];
            
            NSMutableArray *arr_name = [recipeNameArr valueForKey:@"recipe_subcategory"];
            
            //self.recipe_namelbl.text = [arr_name objectAtIndex:0];
            
            recipeNamestr = [arr_name objectAtIndex:0];
            
            //For ingredients
            
            NSString *queryingredients=[ NSString stringWithFormat:@"Select recipe_ingredients from summer_tbl where recipe_name ='SHRIMP' AND recipe_type ='Simple' "];
            recipeIngredientsArr =[[NSMutableArray alloc]init];
            recipeIngredientsArr =[[database executeQuery:queryingredients]mutableCopy];
            
            
            NSMutableArray *arr_ingredients  = [recipeIngredientsArr valueForKey:@"recipe_ingredients"];
            NSLog(@"%@",arr_ingredients);
            
            //self.recipe_ingredientslbl.text = [arr_ingredients objectAtIndex:0];
            // [self.recipe_ingredientslbl sizeToFit];
            
            recipeIngredientsstr = [arr_ingredients objectAtIndex:0];
            
            //For method
            NSString *querymethod=[ NSString stringWithFormat:@"Select recipe_method from summer_tbl where recipe_name ='SHRIMP' AND recipe_type ='Simple' "];
            recipeMethodArr =[[NSMutableArray alloc]init];
            recipeMethodArr =[[database executeQuery:querymethod]mutableCopy];
            
            
            NSMutableArray *arr_method  = [recipeMethodArr valueForKey:@"recipe_method"];
            NSLog(@"%@",arr_method);
            
            //self.recipe_methodlbl.text = [arr_method objectAtIndex:0];
            //[self.recipe_methodlbl sizeToFit];
            recipeMethodstr = [arr_method objectAtIndex:0];
            
            
            
            [database close];
        }
        else if([self.imageFile isEqualToString: @"Avocado.jpg"])
        {
            [self databaseOpen];
            
            
            //For name
            
            NSString *queryname= [NSString stringWithFormat:@"Select recipe_subcategory,recipe_name,recipe_type from summer_tbl where recipe_name ='AVOCADO' AND recipe_type ='Simple' "];
            recipeNameArr =[[NSMutableArray alloc]init];
            recipeNameArr =[[database executeQuery:queryname]mutableCopy];
            
            NSMutableArray *arr_name = [recipeNameArr valueForKey:@"recipe_subcategory"];
            
            //self.recipe_namelbl.text = [arr_name objectAtIndex:0];
            
            recipeNamestr = [arr_name objectAtIndex:0];
            
            //For ingredients
            
            NSString *queryingredients=[ NSString stringWithFormat:@"Select recipe_ingredients from summer_tbl where recipe_name ='AVOCADO' AND recipe_type ='Simple' "];
            recipeIngredientsArr =[[NSMutableArray alloc]init];
            recipeIngredientsArr =[[database executeQuery:queryingredients]mutableCopy];
            
            
            NSMutableArray *arr_ingredients  = [recipeIngredientsArr valueForKey:@"recipe_ingredients"];
            NSLog(@"%@",arr_ingredients);
            
            //self.recipe_ingredientslbl.text = [arr_ingredients objectAtIndex:0];
            // [self.recipe_ingredientslbl sizeToFit];
            
            recipeIngredientsstr = [arr_ingredients objectAtIndex:0];
            
            //For method
            NSString *querymethod=[ NSString stringWithFormat:@"Select recipe_method from summer_tbl where recipe_name ='AVOCADO' AND recipe_type ='Simple' "];
            recipeMethodArr =[[NSMutableArray alloc]init];
            recipeMethodArr =[[database executeQuery:querymethod]mutableCopy];
            
            
            NSMutableArray *arr_method  = [recipeMethodArr valueForKey:@"recipe_method"];
            NSLog(@"%@",arr_method);
            
            //self.recipe_methodlbl.text = [arr_method objectAtIndex:0];
            //[self.recipe_methodlbl sizeToFit];
            recipeMethodstr = [arr_method objectAtIndex:0];
            
            
            
            [database close];
        }
        else if([self.imageFile isEqualToString: @"Almond.jpg"])
        {
            [self databaseOpen];
            
            
            //For name
            
            NSString *queryname= [NSString stringWithFormat:@"Select recipe_subcategory,recipe_name,recipe_type from summer_tbl where recipe_name ='ALMOND' AND recipe_type ='Simple' "];
            recipeNameArr =[[NSMutableArray alloc]init];
            recipeNameArr =[[database executeQuery:queryname]mutableCopy];
            
            NSMutableArray *arr_name = [recipeNameArr valueForKey:@"recipe_subcategory"];
            
            //self.recipe_namelbl.text = [arr_name objectAtIndex:0];
            
            recipeNamestr = [arr_name objectAtIndex:0];
            
            //For ingredients
            
            NSString *queryingredients=[ NSString stringWithFormat:@"Select recipe_ingredients from summer_tbl where recipe_name ='ALMOND' AND recipe_type ='Simple' "];
            recipeIngredientsArr =[[NSMutableArray alloc]init];
            recipeIngredientsArr =[[database executeQuery:queryingredients]mutableCopy];
            
            
            NSMutableArray *arr_ingredients  = [recipeIngredientsArr valueForKey:@"recipe_ingredients"];
            NSLog(@"%@",arr_ingredients);
            
            //self.recipe_ingredientslbl.text = [arr_ingredients objectAtIndex:0];
            // [self.recipe_ingredientslbl sizeToFit];
            
            recipeIngredientsstr = [arr_ingredients objectAtIndex:0];
            
            //For method
            NSString *querymethod=[ NSString stringWithFormat:@"Select recipe_method from summer_tbl where recipe_name ='ALMOND' AND recipe_type ='Simple' "];
            recipeMethodArr =[[NSMutableArray alloc]init];
            recipeMethodArr =[[database executeQuery:querymethod]mutableCopy];
            
            
            NSMutableArray *arr_method  = [recipeMethodArr valueForKey:@"recipe_method"];
            NSLog(@"%@",arr_method);
            
            //self.recipe_methodlbl.text = [arr_method objectAtIndex:0];
            //[self.recipe_methodlbl sizeToFit];
            recipeMethodstr = [arr_method objectAtIndex:0];
            
            
            
            [database close];
        }
        else if([self.imageFile isEqualToString: @"Apricots.jpg"])
        {
            [self databaseOpen];
            
            
            //For name
            
            NSString *queryname= [NSString stringWithFormat:@"Select recipe_subcategory,recipe_name,recipe_type from summer_tbl where recipe_name ='APRICOT' AND recipe_type ='Simple' "];
            recipeNameArr =[[NSMutableArray alloc]init];
            recipeNameArr =[[database executeQuery:queryname]mutableCopy];
            
            NSMutableArray *arr_name = [recipeNameArr valueForKey:@"recipe_subcategory"];
            
            //self.recipe_namelbl.text = [arr_name objectAtIndex:0];
            
            recipeNamestr = [arr_name objectAtIndex:0];
            
            //For ingredients
            
            NSString *queryingredients=[ NSString stringWithFormat:@"Select recipe_ingredients from summer_tbl where recipe_name ='APRICOT' AND recipe_type ='Simple' "];
            recipeIngredientsArr =[[NSMutableArray alloc]init];
            recipeIngredientsArr =[[database executeQuery:queryingredients]mutableCopy];
            
            
            NSMutableArray *arr_ingredients  = [recipeIngredientsArr valueForKey:@"recipe_ingredients"];
            NSLog(@"%@",arr_ingredients);
            
            //self.recipe_ingredientslbl.text = [arr_ingredients objectAtIndex:0];
            // [self.recipe_ingredientslbl sizeToFit];
            
            recipeIngredientsstr = [arr_ingredients objectAtIndex:0];
            
            //For method
            NSString *querymethod=[ NSString stringWithFormat:@"Select recipe_method from summer_tbl where recipe_name ='APRICOT' AND recipe_type ='Simple' "];
            recipeMethodArr =[[NSMutableArray alloc]init];
            recipeMethodArr =[[database executeQuery:querymethod]mutableCopy];
            
            
            NSMutableArray *arr_method  = [recipeMethodArr valueForKey:@"recipe_method"];
            NSLog(@"%@",arr_method);
            
            //self.recipe_methodlbl.text = [arr_method objectAtIndex:0];
            //[self.recipe_methodlbl sizeToFit];
            recipeMethodstr = [arr_method objectAtIndex:0];
            
            
            
            [database close];
        }
        if([self.imageFile isEqualToString: @"Arugula.jpg"])
        {
            [self databaseOpen];
            
            
            //For name
            
            NSString *queryname= [NSString stringWithFormat:@"Select recipe_subcategory,recipe_name,recipe_type from summer_tbl where recipe_name ='ARUGULA' AND recipe_type ='Simple' "];
            recipeNameArr =[[NSMutableArray alloc]init];
            recipeNameArr =[[database executeQuery:queryname]mutableCopy];
            
            NSMutableArray *arr_name = [recipeNameArr valueForKey:@"recipe_subcategory"];
            
            //self.recipe_namelbl.text = [arr_name objectAtIndex:0];
            
            recipeNamestr = [arr_name objectAtIndex:0];
            
            //For ingredients
            
            NSString *queryingredients=[ NSString stringWithFormat:@"Select recipe_ingredients from summer_tbl where recipe_name ='ARUGULA' AND recipe_type ='Simple' "];
            recipeIngredientsArr =[[NSMutableArray alloc]init];
            recipeIngredientsArr =[[database executeQuery:queryingredients]mutableCopy];
            
            
            NSMutableArray *arr_ingredients  = [recipeIngredientsArr valueForKey:@"recipe_ingredients"];
            NSLog(@"%@",arr_ingredients);
            
            //self.recipe_ingredientslbl.text = [arr_ingredients objectAtIndex:0];
            // [self.recipe_ingredientslbl sizeToFit];
            
            recipeIngredientsstr = [arr_ingredients objectAtIndex:0];
            
            //For method
            NSString *querymethod=[ NSString stringWithFormat:@"Select recipe_method from summer_tbl where recipe_name ='ARUGULA' AND recipe_type ='Simple' "];
            recipeMethodArr =[[NSMutableArray alloc]init];
            recipeMethodArr =[[database executeQuery:querymethod]mutableCopy];
            
            
            NSMutableArray *arr_method  = [recipeMethodArr valueForKey:@"recipe_method"];
            NSLog(@"%@",arr_method);
            
            //self.recipe_methodlbl.text = [arr_method objectAtIndex:0];
            //[self.recipe_methodlbl sizeToFit];
            recipeMethodstr = [arr_method objectAtIndex:0];
            
            
            
            [database close];
        }
        
        if([self.imageFile isEqualToString: @"Bell-Pepper.jpg"])
        {
            [self databaseOpen];
            
            
            //For name
            
            NSString *queryname= [NSString stringWithFormat:@"Select recipe_subcategory,recipe_name,recipe_type from summer_tbl where recipe_name ='BELL PEPPER' AND recipe_type ='Simple' "];
            recipeNameArr =[[NSMutableArray alloc]init];
            recipeNameArr =[[database executeQuery:queryname]mutableCopy];
            
            NSMutableArray *arr_name = [recipeNameArr valueForKey:@"recipe_subcategory"];
            
            //self.recipe_namelbl.text = [arr_name objectAtIndex:0];
            
            recipeNamestr = [arr_name objectAtIndex:0];
            
            //For ingredients
            
            NSString *queryingredients=[ NSString stringWithFormat:@"Select recipe_ingredients from  summer_tbl where recipe_name ='BELL PEPPER' AND recipe_type ='Simple' "];
            recipeIngredientsArr =[[NSMutableArray alloc]init];
            recipeIngredientsArr =[[database executeQuery:queryingredients]mutableCopy];
            
            
            NSMutableArray *arr_ingredients  = [recipeIngredientsArr valueForKey:@"recipe_ingredients"];
            NSLog(@"%@",arr_ingredients);
            
            //self.recipe_ingredientslbl.text = [arr_ingredients objectAtIndex:0];
            // [self.recipe_ingredientslbl sizeToFit];
            
            recipeIngredientsstr = [arr_ingredients objectAtIndex:0];
            
            //For method
            NSString *querymethod=[ NSString stringWithFormat:@"Select recipe_method from  summer_tbl where recipe_name ='BELL PEPPER' AND recipe_type ='Simple' "];
            recipeMethodArr =[[NSMutableArray alloc]init];
            recipeMethodArr =[[database executeQuery:querymethod]mutableCopy];
            
            
            NSMutableArray *arr_method  = [recipeMethodArr valueForKey:@"recipe_method"];
            NSLog(@"%@",arr_method);
            
            //self.recipe_methodlbl.text = [arr_method objectAtIndex:0];
            //[self.recipe_methodlbl sizeToFit];
            recipeMethodstr = [arr_method objectAtIndex:0];
            
            
            
            [database close];
        }
        if([self.imageFile isEqualToString: @"Blueberry.jpg"])
        {
            [self databaseOpen];
            
            
            //For name
            
            NSString *queryname= [NSString stringWithFormat:@"Select recipe_subcategory,recipe_name,recipe_type from  summer_tbl where recipe_name ='BLUEBERRY' AND recipe_type ='Simple' "];
            recipeNameArr =[[NSMutableArray alloc]init];
            recipeNameArr =[[database executeQuery:queryname]mutableCopy];
            
            NSMutableArray *arr_name = [recipeNameArr valueForKey:@"recipe_subcategory"];
            
            //self.recipe_namelbl.text = [arr_name objectAtIndex:0];
            
            recipeNamestr = [arr_name objectAtIndex:0];
            
            //For ingredients
            
            NSString *queryingredients=[ NSString stringWithFormat:@"Select recipe_ingredients from  summer_tbl where recipe_name ='BLUEBERRY' AND recipe_type ='Simple' "];
            recipeIngredientsArr =[[NSMutableArray alloc]init];
            recipeIngredientsArr =[[database executeQuery:queryingredients]mutableCopy];
            
            
            NSMutableArray *arr_ingredients  = [recipeIngredientsArr valueForKey:@"recipe_ingredients"];
            NSLog(@"%@",arr_ingredients);
            
            //self.recipe_ingredientslbl.text = [arr_ingredients objectAtIndex:0];
            // [self.recipe_ingredientslbl sizeToFit];
            
            recipeIngredientsstr = [arr_ingredients objectAtIndex:0];
            
            //For method
            NSString *querymethod=[ NSString stringWithFormat:@"Select recipe_method from  summer_tbl where recipe_name ='BLUEBERRY' AND recipe_type ='Simple' "];
            recipeMethodArr =[[NSMutableArray alloc]init];
            recipeMethodArr =[[database executeQuery:querymethod]mutableCopy];
            
            
            NSMutableArray *arr_method  = [recipeMethodArr valueForKey:@"recipe_method"];
            NSLog(@"%@",arr_method);
            
            //self.recipe_methodlbl.text = [arr_method objectAtIndex:0];
            //[self.recipe_methodlbl sizeToFit];
            recipeMethodstr = [arr_method objectAtIndex:0];
            
            
            
            [database close];
        }
        
        if([self.imageFile isEqualToString: @"Bok-Choy.jpg"])
        {
            [self databaseOpen];
            
            
            //For name
            
            NSString *queryname= [NSString stringWithFormat:@"Select recipe_subcategory,recipe_name,recipe_type from  summer_tbl where recipe_name ='BOK CHOY' AND recipe_type ='Simple' "];
            recipeNameArr =[[NSMutableArray alloc]init];
            recipeNameArr =[[database executeQuery:queryname]mutableCopy];
            
            NSMutableArray *arr_name = [recipeNameArr valueForKey:@"recipe_subcategory"];
            
            //self.recipe_namelbl.text = [arr_name objectAtIndex:0];
            
            recipeNamestr = [arr_name objectAtIndex:0];
            
            //For ingredients
            
            NSString *queryingredients=[ NSString stringWithFormat:@"Select recipe_ingredients from  summer_tbl where recipe_name ='BOK CHOY' AND recipe_type ='Simple' "];
            recipeIngredientsArr =[[NSMutableArray alloc]init];
            recipeIngredientsArr =[[database executeQuery:queryingredients]mutableCopy];
            
            
            NSMutableArray *arr_ingredients  = [recipeIngredientsArr valueForKey:@"recipe_ingredients"];
            NSLog(@"%@",arr_ingredients);
            
            //self.recipe_ingredientslbl.text = [arr_ingredients objectAtIndex:0];
            // [self.recipe_ingredientslbl sizeToFit];
            
            recipeIngredientsstr = [arr_ingredients objectAtIndex:0];
            
            //For method
            NSString *querymethod=[ NSString stringWithFormat:@"Select recipe_method from  summer_tbl where recipe_name ='BOK CHOY' AND recipe_type ='Simple' "];
            recipeMethodArr =[[NSMutableArray alloc]init];
            recipeMethodArr =[[database executeQuery:querymethod]mutableCopy];
            
            
            NSMutableArray *arr_method  = [recipeMethodArr valueForKey:@"recipe_method"];
            NSLog(@"%@",arr_method);
            
            //self.recipe_methodlbl.text = [arr_method objectAtIndex:0];
            //[self.recipe_methodlbl sizeToFit];
            recipeMethodstr = [arr_method objectAtIndex:0];
            
            
            
            [database close];
        }
        if([self.imageFile isEqualToString: @"Chicken.jpg"])
        {
            [self databaseOpen];
            
            
            //For name
            
            NSString *queryname= [NSString stringWithFormat:@"Select recipe_subcategory,recipe_name,recipe_type from  summer_tbl where recipe_name ='CHICKEN' AND recipe_type ='Simple' "];
            recipeNameArr =[[NSMutableArray alloc]init];
            recipeNameArr =[[database executeQuery:queryname]mutableCopy];
            
            NSMutableArray *arr_name = [recipeNameArr valueForKey:@"recipe_subcategory"];
            
            //self.recipe_namelbl.text = [arr_name objectAtIndex:0];
            
            recipeNamestr = [arr_name objectAtIndex:0];
            
            //For ingredients
            
            NSString *queryingredients=[ NSString stringWithFormat:@"Select recipe_ingredients from  summer_tbl where recipe_name ='CHICKEN' AND recipe_type ='Simple' "];
            recipeIngredientsArr =[[NSMutableArray alloc]init];
            recipeIngredientsArr =[[database executeQuery:queryingredients]mutableCopy];
            
            
            NSMutableArray *arr_ingredients  = [recipeIngredientsArr valueForKey:@"recipe_ingredients"];
            NSLog(@"%@",arr_ingredients);
            
            //self.recipe_ingredientslbl.text = [arr_ingredients objectAtIndex:0];
            // [self.recipe_ingredientslbl sizeToFit];
            
            recipeIngredientsstr = [arr_ingredients objectAtIndex:0];
            
            //For method
            NSString *querymethod=[ NSString stringWithFormat:@"Select recipe_method from  summer_tbl where recipe_name ='CHICKEN' AND recipe_type ='Simple' "];
            recipeMethodArr =[[NSMutableArray alloc]init];
            recipeMethodArr =[[database executeQuery:querymethod]mutableCopy];
            
            
            NSMutableArray *arr_method  = [recipeMethodArr valueForKey:@"recipe_method"];
            NSLog(@"%@",arr_method);
            
            //self.recipe_methodlbl.text = [arr_method objectAtIndex:0];
            //[self.recipe_methodlbl sizeToFit];
            recipeMethodstr = [arr_method objectAtIndex:0];
            
            
            
            [database close];
        }
        
        if([self.imageFile isEqualToString: @"Cilantro.jpg"])
        {
            [self databaseOpen];
            
            
            //For name
            
            NSString *queryname= [NSString stringWithFormat:@"Select recipe_subcategory,recipe_name,recipe_type from  summer_tbl where recipe_name ='CILANTRO' AND recipe_type ='Simple' "];
            recipeNameArr =[[NSMutableArray alloc]init];
            recipeNameArr =[[database executeQuery:queryname]mutableCopy];
            
            NSMutableArray *arr_name = [recipeNameArr valueForKey:@"recipe_subcategory"];
            
            //self.recipe_namelbl.text = [arr_name objectAtIndex:0];
            
            recipeNamestr = [arr_name objectAtIndex:0];
            
            //For ingredients
            
            NSString *queryingredients=[ NSString stringWithFormat:@"Select recipe_ingredients from  summer_tbl where recipe_name ='CILANTRO' AND recipe_type ='Simple' "];
            recipeIngredientsArr =[[NSMutableArray alloc]init];
            recipeIngredientsArr =[[database executeQuery:queryingredients]mutableCopy];
            
            
            NSMutableArray *arr_ingredients  = [recipeIngredientsArr valueForKey:@"recipe_ingredients"];
            NSLog(@"%@",arr_ingredients);
            
            //self.recipe_ingredientslbl.text = [arr_ingredients objectAtIndex:0];
            // [self.recipe_ingredientslbl sizeToFit];
            
            recipeIngredientsstr = [arr_ingredients objectAtIndex:0];
            
            //For method
            NSString *querymethod=[ NSString stringWithFormat:@"Select recipe_method from  summer_tbl where recipe_name ='CILANTRO' AND recipe_type ='Simple' "];
            recipeMethodArr =[[NSMutableArray alloc]init];
            recipeMethodArr =[[database executeQuery:querymethod]mutableCopy];
            
            
            NSMutableArray *arr_method  = [recipeMethodArr valueForKey:@"recipe_method"];
            NSLog(@"%@",arr_method);
            
            //self.recipe_methodlbl.text = [arr_method objectAtIndex:0];
            //[self.recipe_methodlbl sizeToFit];
            recipeMethodstr = [arr_method objectAtIndex:0];
            
            
            
            [database close];
        }
        if([self.imageFile isEqualToString: @"Corn.jpg"])
        {
            [self databaseOpen];
            
            
            //For name
            
            NSString *queryname= [NSString stringWithFormat:@"Select recipe_subcategory,recipe_name,recipe_type from  summer_tbl where recipe_name ='CORN' AND recipe_type ='Simple' "];
            recipeNameArr =[[NSMutableArray alloc]init];
            recipeNameArr =[[database executeQuery:queryname]mutableCopy];
            
            NSMutableArray *arr_name = [recipeNameArr valueForKey:@"recipe_subcategory"];
            
            //self.recipe_namelbl.text = [arr_name objectAtIndex:0];
            
            recipeNamestr = [arr_name objectAtIndex:0];
            
            //For ingredients
            
            NSString *queryingredients=[ NSString stringWithFormat:@"Select recipe_ingredients from  summer_tbl where recipe_name ='CORN' AND recipe_type ='Simple' "];
            recipeIngredientsArr =[[NSMutableArray alloc]init];
            recipeIngredientsArr =[[database executeQuery:queryingredients]mutableCopy];
            
            
            NSMutableArray *arr_ingredients  = [recipeIngredientsArr valueForKey:@"recipe_ingredients"];
            NSLog(@"%@",arr_ingredients);
            
            //self.recipe_ingredientslbl.text = [arr_ingredients objectAtIndex:0];
            // [self.recipe_ingredientslbl sizeToFit];
            
            recipeIngredientsstr = [arr_ingredients objectAtIndex:0];
            
            //For method
            NSString *querymethod=[ NSString stringWithFormat:@"Select recipe_method from  summer_tbl where recipe_name ='CORN' AND recipe_type ='Simple' "];
            recipeMethodArr =[[NSMutableArray alloc]init];
            recipeMethodArr =[[database executeQuery:querymethod]mutableCopy];
            
            
            NSMutableArray *arr_method  = [recipeMethodArr valueForKey:@"recipe_method"];
            NSLog(@"%@",arr_method);
            
            //self.recipe_methodlbl.text = [arr_method objectAtIndex:0];
            //[self.recipe_methodlbl sizeToFit];
            recipeMethodstr = [arr_method objectAtIndex:0];
            
            
            
            [database close];
        }
        
        if([self.imageFile isEqualToString: @"Cucumber.jpg"])
        {
            [self databaseOpen];
            
            
            //For name
            
            NSString *queryname= [NSString stringWithFormat:@"Select recipe_subcategory,recipe_name,recipe_type from  summer_tbl where recipe_name ='CUCUMBER' AND recipe_type ='Simple' "];
            recipeNameArr =[[NSMutableArray alloc]init];
            recipeNameArr =[[database executeQuery:queryname]mutableCopy];
            
            NSMutableArray *arr_name = [recipeNameArr valueForKey:@"recipe_subcategory"];
            
            //self.recipe_namelbl.text = [arr_name objectAtIndex:0];
            
            recipeNamestr = [arr_name objectAtIndex:0];
            
            //For ingredients
            
            NSString *queryingredients=[ NSString stringWithFormat:@"Select recipe_ingredients from  summer_tbl where recipe_name ='CUCUMBER' AND recipe_type ='Simple' "];
            recipeIngredientsArr =[[NSMutableArray alloc]init];
            recipeIngredientsArr =[[database executeQuery:queryingredients]mutableCopy];
            
            
            NSMutableArray *arr_ingredients  = [recipeIngredientsArr valueForKey:@"recipe_ingredients"];
            NSLog(@"%@",arr_ingredients);
            
            //self.recipe_ingredientslbl.text = [arr_ingredients objectAtIndex:0];
            // [self.recipe_ingredientslbl sizeToFit];
            
            recipeIngredientsstr = [arr_ingredients objectAtIndex:0];
            
            //For method
            NSString *querymethod=[ NSString stringWithFormat:@"Select recipe_method from  summer_tbl where recipe_name ='CUCUMBER' AND recipe_type ='Simple' "];
            recipeMethodArr =[[NSMutableArray alloc]init];
            recipeMethodArr =[[database executeQuery:querymethod]mutableCopy];
            
            
            NSMutableArray *arr_method  = [recipeMethodArr valueForKey:@"recipe_method"];
            NSLog(@"%@",arr_method);
            
            //self.recipe_methodlbl.text = [arr_method objectAtIndex:0];
            //[self.recipe_methodlbl sizeToFit];
            recipeMethodstr = [arr_method objectAtIndex:0];
            
            
            
            [database close];
        }
        if([self.imageFile isEqualToString: @"Endive.jpg"])
        {
            [self databaseOpen];
            
            
            //For name
            
            NSString *queryname= [NSString stringWithFormat:@"Select recipe_subcategory,recipe_name,recipe_type from  summer_tbl where recipe_name ='ENDIVE' AND recipe_type ='Simple' "];
            recipeNameArr =[[NSMutableArray alloc]init];
            recipeNameArr =[[database executeQuery:queryname]mutableCopy];
            
            NSMutableArray *arr_name = [recipeNameArr valueForKey:@"recipe_subcategory"];
            
            //self.recipe_namelbl.text = [arr_name objectAtIndex:0];
            
            recipeNamestr = [arr_name objectAtIndex:0];
            
            //For ingredients
            
            NSString *queryingredients=[ NSString stringWithFormat:@"Select recipe_ingredients from  summer_tbl where recipe_name ='ENDIVE' AND recipe_type ='Simple' "];
            recipeIngredientsArr =[[NSMutableArray alloc]init];
            recipeIngredientsArr =[[database executeQuery:queryingredients]mutableCopy];
            
            
            NSMutableArray *arr_ingredients  = [recipeIngredientsArr valueForKey:@"recipe_ingredients"];
            NSLog(@"%@",arr_ingredients);
            
            //self.recipe_ingredientslbl.text = [arr_ingredients objectAtIndex:0];
            // [self.recipe_ingredientslbl sizeToFit];
            
            recipeIngredientsstr = [arr_ingredients objectAtIndex:0];
            
            //For method
            NSString *querymethod=[ NSString stringWithFormat:@"Select recipe_method from  summer_tbl where recipe_name ='ENDIVE' AND recipe_type ='Simple' "];
            recipeMethodArr =[[NSMutableArray alloc]init];
            recipeMethodArr =[[database executeQuery:querymethod]mutableCopy];
            
            
            NSMutableArray *arr_method  = [recipeMethodArr valueForKey:@"recipe_method"];
            NSLog(@"%@",arr_method);
            
            //self.recipe_methodlbl.text = [arr_method objectAtIndex:0];
            //[self.recipe_methodlbl sizeToFit];
            recipeMethodstr = [arr_method objectAtIndex:0];
            
            
            
            [database close];
        }
        if([self.imageFile isEqualToString: @"Green-Bean.jpg"])
        {
            [self databaseOpen];
            
            
            //For name
            
            NSString *queryname= [NSString stringWithFormat:@"Select recipe_subcategory,recipe_name,recipe_type from  summer_tbl where recipe_name ='GREEN BEAN' AND recipe_type ='Simple' "];
            recipeNameArr =[[NSMutableArray alloc]init];
            recipeNameArr =[[database executeQuery:queryname]mutableCopy];
            
            NSMutableArray *arr_name = [recipeNameArr valueForKey:@"recipe_subcategory"];
            
            //self.recipe_namelbl.text = [arr_name objectAtIndex:0];
            
            recipeNamestr = [arr_name objectAtIndex:0];
            
            //For ingredients
            
            NSString *queryingredients=[ NSString stringWithFormat:@"Select recipe_ingredients from  summer_tbl where recipe_name ='GREEN BEAN' AND recipe_type ='Simple' "];
            recipeIngredientsArr =[[NSMutableArray alloc]init];
            recipeIngredientsArr =[[database executeQuery:queryingredients]mutableCopy];
            
            
            NSMutableArray *arr_ingredients  = [recipeIngredientsArr valueForKey:@"recipe_ingredients"];
            NSLog(@"%@",arr_ingredients);
            
            //self.recipe_ingredientslbl.text = [arr_ingredients objectAtIndex:0];
            // [self.recipe_ingredientslbl sizeToFit];
            
            recipeIngredientsstr = [arr_ingredients objectAtIndex:0];
            
            //For method
            NSString *querymethod=[ NSString stringWithFormat:@"Select recipe_method from  summer_tbl where recipe_name ='GREEN BEAN' AND recipe_type ='Simple' "];
            recipeMethodArr =[[NSMutableArray alloc]init];
            recipeMethodArr =[[database executeQuery:querymethod]mutableCopy];
            
            
            NSMutableArray *arr_method  = [recipeMethodArr valueForKey:@"recipe_method"];
            NSLog(@"%@",arr_method);
            
            //self.recipe_methodlbl.text = [arr_method objectAtIndex:0];
            //[self.recipe_methodlbl sizeToFit];
            recipeMethodstr = [arr_method objectAtIndex:0];
            
            
            
            [database close];
        }
        
        if([self.imageFile isEqualToString: @"Melons.jpg"])
        {
            [self databaseOpen];
            
            
            //For name
            
            NSString *queryname= [NSString stringWithFormat:@"Select recipe_subcategory,recipe_name,recipe_type from  summer_tbl where recipe_name ='MELON' AND recipe_type ='Simple' "];
            recipeNameArr =[[NSMutableArray alloc]init];
            recipeNameArr =[[database executeQuery:queryname]mutableCopy];
            
            NSMutableArray *arr_name = [recipeNameArr valueForKey:@"recipe_subcategory"];
            
            //self.recipe_namelbl.text = [arr_name objectAtIndex:0];
            
            recipeNamestr = [arr_name objectAtIndex:0];
            
            //For ingredients
            
            NSString *queryingredients=[ NSString stringWithFormat:@"Select recipe_ingredients from  summer_tbl where recipe_name ='MELON' AND recipe_type ='Simple' "];
            recipeIngredientsArr =[[NSMutableArray alloc]init];
            recipeIngredientsArr =[[database executeQuery:queryingredients]mutableCopy];
            
            
            NSMutableArray *arr_ingredients  = [recipeIngredientsArr valueForKey:@"recipe_ingredients"];
            NSLog(@"%@",arr_ingredients);
            
            //self.recipe_ingredientslbl.text = [arr_ingredients objectAtIndex:0];
            // [self.recipe_ingredientslbl sizeToFit];
            
            recipeIngredientsstr = [arr_ingredients objectAtIndex:0];
            
            //For method
            NSString *querymethod=[ NSString stringWithFormat:@"Select recipe_method from  summer_tbl where recipe_name ='MELON' AND recipe_type ='Simple' "];
            recipeMethodArr =[[NSMutableArray alloc]init];
            recipeMethodArr =[[database executeQuery:querymethod]mutableCopy];
            
            
            NSMutableArray *arr_method  = [recipeMethodArr valueForKey:@"recipe_method"];
            NSLog(@"%@",arr_method);
            
            //self.recipe_methodlbl.text = [arr_method objectAtIndex:0];
            //[self.recipe_methodlbl sizeToFit];
            recipeMethodstr = [arr_method objectAtIndex:0];
            
            
            
            [database close];
        }
        
        if([self.imageFile isEqualToString: @"Peach.jpg"])
        {
            [self databaseOpen];
            
            
            //For name
            
            NSString *queryname= [NSString stringWithFormat:@"Select recipe_subcategory,recipe_name,recipe_type from  summer_tbl where recipe_name ='PEACH' AND recipe_type ='Simple' "];
            recipeNameArr =[[NSMutableArray alloc]init];
            recipeNameArr =[[database executeQuery:queryname]mutableCopy];
            
            NSMutableArray *arr_name = [recipeNameArr valueForKey:@"recipe_subcategory"];
            
            //self.recipe_namelbl.text = [arr_name objectAtIndex:0];
            
            recipeNamestr = [arr_name objectAtIndex:0];
            
            //For ingredients
            
            NSString *queryingredients=[ NSString stringWithFormat:@"Select recipe_ingredients from  summer_tbl where recipe_name ='PEACH' AND recipe_type ='Simple' "];
            recipeIngredientsArr =[[NSMutableArray alloc]init];
            recipeIngredientsArr =[[database executeQuery:queryingredients]mutableCopy];
            
            
            NSMutableArray *arr_ingredients  = [recipeIngredientsArr valueForKey:@"recipe_ingredients"];
            NSLog(@"%@",arr_ingredients);
            
            //self.recipe_ingredientslbl.text = [arr_ingredients objectAtIndex:0];
            // [self.recipe_ingredientslbl sizeToFit];
            
            recipeIngredientsstr = [arr_ingredients objectAtIndex:0];
            
            //For method
            NSString *querymethod=[ NSString stringWithFormat:@"Select recipe_method from  summer_tbl where recipe_name ='PEACH' AND recipe_type ='Simple' "];
            recipeMethodArr =[[NSMutableArray alloc]init];
            recipeMethodArr =[[database executeQuery:querymethod]mutableCopy];
            
            
            NSMutableArray *arr_method  = [recipeMethodArr valueForKey:@"recipe_method"];
            NSLog(@"%@",arr_method);
            
            //self.recipe_methodlbl.text = [arr_method objectAtIndex:0];
            //[self.recipe_methodlbl sizeToFit];
            recipeMethodstr = [arr_method objectAtIndex:0];
            
            
            
            [database close];
        }
        
        if([self.imageFile isEqualToString: @"Radicchio.jpg"])
        {
            [self databaseOpen];
            
            
            //For name
            
            NSString *queryname= [NSString stringWithFormat:@"Select recipe_subcategory,recipe_name,recipe_type from  summer_tbl where recipe_name ='RADICCHIO' AND recipe_type ='Simple' "];
            recipeNameArr =[[NSMutableArray alloc]init];
            recipeNameArr =[[database executeQuery:queryname]mutableCopy];
            
            NSMutableArray *arr_name = [recipeNameArr valueForKey:@"recipe_subcategory"];
            
            //self.recipe_namelbl.text = [arr_name objectAtIndex:0];
            
            recipeNamestr = [arr_name objectAtIndex:0];
            
            //For ingredients
            
            NSString *queryingredients=[ NSString stringWithFormat:@"Select recipe_ingredients from  summer_tbl where recipe_name ='RADICCHIO' AND recipe_type ='Simple' "];
            recipeIngredientsArr =[[NSMutableArray alloc]init];
            recipeIngredientsArr =[[database executeQuery:queryingredients]mutableCopy];
            
            
            NSMutableArray *arr_ingredients  = [recipeIngredientsArr valueForKey:@"recipe_ingredients"];
            NSLog(@"%@",arr_ingredients);
            
            //self.recipe_ingredientslbl.text = [arr_ingredients objectAtIndex:0];
            // [self.recipe_ingredientslbl sizeToFit];
            
            recipeIngredientsstr = [arr_ingredients objectAtIndex:0];
            
            //For method
            NSString *querymethod=[ NSString stringWithFormat:@"Select recipe_method from  summer_tbl where recipe_name ='RADICCHIO' AND recipe_type ='Simple' "];
            recipeMethodArr =[[NSMutableArray alloc]init];
            recipeMethodArr =[[database executeQuery:querymethod]mutableCopy];
            
            
            NSMutableArray *arr_method  = [recipeMethodArr valueForKey:@"recipe_method"];
            NSLog(@"%@",arr_method);
            
            //self.recipe_methodlbl.text = [arr_method objectAtIndex:0];
            //[self.recipe_methodlbl sizeToFit];
            recipeMethodstr = [arr_method objectAtIndex:0];
            
            
            
            [database close];
        }
        if([self.imageFile isEqualToString: @"Salmon.jpg"])
        {
            [self databaseOpen];
            
            
            //For name
            
            NSString *queryname= [NSString stringWithFormat:@"Select recipe_subcategory,recipe_name,recipe_type from  summer_tbl where recipe_name ='SALMON' AND recipe_type ='Simple' "];
            recipeNameArr =[[NSMutableArray alloc]init];
            recipeNameArr =[[database executeQuery:queryname]mutableCopy];
            
            NSMutableArray *arr_name = [recipeNameArr valueForKey:@"recipe_subcategory"];
            
            //self.recipe_namelbl.text = [arr_name objectAtIndex:0];
            
            recipeNamestr = [arr_name objectAtIndex:0];
            
            //For ingredients
            
            NSString *queryingredients=[ NSString stringWithFormat:@"Select recipe_ingredients from  summer_tbl where recipe_name ='SALMON' AND recipe_type ='Simple' "];
            recipeIngredientsArr =[[NSMutableArray alloc]init];
            recipeIngredientsArr =[[database executeQuery:queryingredients]mutableCopy];
            
            
            NSMutableArray *arr_ingredients  = [recipeIngredientsArr valueForKey:@"recipe_ingredients"];
            NSLog(@"%@",arr_ingredients);
            
            //self.recipe_ingredientslbl.text = [arr_ingredients objectAtIndex:0];
            // [self.recipe_ingredientslbl sizeToFit];
            
            recipeIngredientsstr = [arr_ingredients objectAtIndex:0];
            
            //For method
            NSString *querymethod=[ NSString stringWithFormat:@"Select recipe_method from  summer_tbl where recipe_name ='SALMON' AND recipe_type ='Simple' "];
            recipeMethodArr =[[NSMutableArray alloc]init];
            recipeMethodArr =[[database executeQuery:querymethod]mutableCopy];
            
            
            NSMutableArray *arr_method  = [recipeMethodArr valueForKey:@"recipe_method"];
            NSLog(@"%@",arr_method);
            
            //self.recipe_methodlbl.text = [arr_method objectAtIndex:0];
            //[self.recipe_methodlbl sizeToFit];
            recipeMethodstr = [arr_method objectAtIndex:0];
            
            
            
            [database close];
        }
        
        if([self.imageFile isEqualToString: @"Sesame-Seeds.jpg"])
        {
            [self databaseOpen];
            
            
            //For name
            
            NSString *queryname= [NSString stringWithFormat:@"Select recipe_subcategory,recipe_name,recipe_type from  summer_tbl where recipe_name ='SESAME SEEDS' AND recipe_type ='Simple' "];
            recipeNameArr =[[NSMutableArray alloc]init];
            recipeNameArr =[[database executeQuery:queryname]mutableCopy];
            
            NSMutableArray *arr_name = [recipeNameArr valueForKey:@"recipe_subcategory"];
            
            //self.recipe_namelbl.text = [arr_name objectAtIndex:0];
            
            recipeNamestr = [arr_name objectAtIndex:0];
            
            //For ingredients
            
            NSString *queryingredients=[ NSString stringWithFormat:@"Select recipe_ingredients from  summer_tbl where recipe_name ='SESAME SEEDS' AND recipe_type ='Simple' "];
            recipeIngredientsArr =[[NSMutableArray alloc]init];
            recipeIngredientsArr =[[database executeQuery:queryingredients]mutableCopy];
            
            
            NSMutableArray *arr_ingredients  = [recipeIngredientsArr valueForKey:@"recipe_ingredients"];
            NSLog(@"%@",arr_ingredients);
            
            //self.recipe_ingredientslbl.text = [arr_ingredients objectAtIndex:0];
            // [self.recipe_ingredientslbl sizeToFit];
            
            recipeIngredientsstr = [arr_ingredients objectAtIndex:0];
            
            //For method
            NSString *querymethod=[ NSString stringWithFormat:@"Select recipe_method from  summer_tbl where recipe_name ='SESAME SEEDS' AND recipe_type ='Simple' "];
            recipeMethodArr =[[NSMutableArray alloc]init];
            recipeMethodArr =[[database executeQuery:querymethod]mutableCopy];
            
            
            NSMutableArray *arr_method  = [recipeMethodArr valueForKey:@"recipe_method"];
            NSLog(@"%@",arr_method);
            
            //self.recipe_methodlbl.text = [arr_method objectAtIndex:0];
            //[self.recipe_methodlbl sizeToFit];
            recipeMethodstr = [arr_method objectAtIndex:0];
            
            
            
            [database close];
        }
        if([self.imageFile isEqualToString: @"Tomatillo.jpg"])
        {
            [self databaseOpen];
            
            
            //For name
            
            NSString *queryname= [NSString stringWithFormat:@"Select recipe_subcategory,recipe_name,recipe_type from  summer_tbl where recipe_name ='TOMATILLO' AND recipe_type ='Simple' "];
            recipeNameArr =[[NSMutableArray alloc]init];
            recipeNameArr =[[database executeQuery:queryname]mutableCopy];
            
            NSMutableArray *arr_name = [recipeNameArr valueForKey:@"recipe_subcategory"];
            
            //self.recipe_namelbl.text = [arr_name objectAtIndex:0];
            
            recipeNamestr = [arr_name objectAtIndex:0];
            
            //For ingredients
            
            NSString *queryingredients=[ NSString stringWithFormat:@"Select recipe_ingredients from  summer_tbl where recipe_name ='TOMATILLO' AND recipe_type ='Simple' "];
            recipeIngredientsArr =[[NSMutableArray alloc]init];
            recipeIngredientsArr =[[database executeQuery:queryingredients]mutableCopy];
            
            
            NSMutableArray *arr_ingredients  = [recipeIngredientsArr valueForKey:@"recipe_ingredients"];
            NSLog(@"%@",arr_ingredients);
            
            //self.recipe_ingredientslbl.text = [arr_ingredients objectAtIndex:0];
            // [self.recipe_ingredientslbl sizeToFit];
            
            recipeIngredientsstr = [arr_ingredients objectAtIndex:0];
            
            //For method
            NSString *querymethod=[ NSString stringWithFormat:@"Select recipe_method from  summer_tbl where recipe_name ='TOMATILLO' AND recipe_type ='Simple' "];
            recipeMethodArr =[[NSMutableArray alloc]init];
            recipeMethodArr =[[database executeQuery:querymethod]mutableCopy];
            
            
            NSMutableArray *arr_method  = [recipeMethodArr valueForKey:@"recipe_method"];
            NSLog(@"%@",arr_method);
            
            //self.recipe_methodlbl.text = [arr_method objectAtIndex:0];
            //[self.recipe_methodlbl sizeToFit];
            recipeMethodstr = [arr_method objectAtIndex:0];
            
            
            
            [database close];
        }
        
        if([self.imageFile isEqualToString: @"Tomato.jpg"])
        {
            [self databaseOpen];
            
            
            //For name
            
            NSString *queryname= [NSString stringWithFormat:@"Select recipe_subcategory,recipe_name,recipe_type from  summer_tbl where recipe_name ='TOMATO' AND recipe_type ='Simple' "];
            recipeNameArr =[[NSMutableArray alloc]init];
            recipeNameArr =[[database executeQuery:queryname]mutableCopy];
            
            NSMutableArray *arr_name = [recipeNameArr valueForKey:@"recipe_subcategory"];
            
            //self.recipe_namelbl.text = [arr_name objectAtIndex:0];
            
            recipeNamestr = [arr_name objectAtIndex:0];
            
            //For ingredients
            
            NSString *queryingredients=[ NSString stringWithFormat:@"Select recipe_ingredients from  summer_tbl where recipe_name ='TOMATO' AND recipe_type ='Simple' "];
            recipeIngredientsArr =[[NSMutableArray alloc]init];
            recipeIngredientsArr =[[database executeQuery:queryingredients]mutableCopy];
            
            
            NSMutableArray *arr_ingredients  = [recipeIngredientsArr valueForKey:@"recipe_ingredients"];
            NSLog(@"%@",arr_ingredients);
            
            //self.recipe_ingredientslbl.text = [arr_ingredients objectAtIndex:0];
            // [self.recipe_ingredientslbl sizeToFit];
            
            recipeIngredientsstr = [arr_ingredients objectAtIndex:0];
            
            //For method
            NSString *querymethod=[ NSString stringWithFormat:@"Select recipe_method from  summer_tbl where recipe_name ='TOMATO' AND recipe_type ='Simple' "];
            recipeMethodArr =[[NSMutableArray alloc]init];
            recipeMethodArr =[[database executeQuery:querymethod]mutableCopy];
            
            
            NSMutableArray *arr_method  = [recipeMethodArr valueForKey:@"recipe_method"];
            NSLog(@"%@",arr_method);
            
            //self.recipe_methodlbl.text = [arr_method objectAtIndex:0];
            //[self.recipe_methodlbl sizeToFit];
            recipeMethodstr = [arr_method objectAtIndex:0];
            
            
            
            [database close];
        }
        if([self.imageFile isEqualToString: @"Water.jpg"])
        {
            [self databaseOpen];
            
            
            //For name
            
            NSString *queryname= [NSString stringWithFormat:@"Select recipe_subcategory,recipe_name,recipe_type from  summer_tbl where recipe_name ='WATER' AND recipe_type ='Simple' "];
            recipeNameArr =[[NSMutableArray alloc]init];
            recipeNameArr =[[database executeQuery:queryname]mutableCopy];
            
            NSMutableArray *arr_name = [recipeNameArr valueForKey:@"recipe_subcategory"];
            
            //self.recipe_namelbl.text = [arr_name objectAtIndex:0];
            
            recipeNamestr = [arr_name objectAtIndex:0];
            
            //For ingredients
            
            NSString *queryingredients=[ NSString stringWithFormat:@"Select recipe_ingredients from  summer_tbl where recipe_name ='WATER' AND recipe_type ='Simple' "];
            recipeIngredientsArr =[[NSMutableArray alloc]init];
            recipeIngredientsArr =[[database executeQuery:queryingredients]mutableCopy];
            
            
            NSMutableArray *arr_ingredients  = [recipeIngredientsArr valueForKey:@"recipe_ingredients"];
            NSLog(@"%@",arr_ingredients);
            
            //self.recipe_ingredientslbl.text = [arr_ingredients objectAtIndex:0];
            // [self.recipe_ingredientslbl sizeToFit];
            
            recipeIngredientsstr = [arr_ingredients objectAtIndex:0];
            
            //For method
            NSString *querymethod=[ NSString stringWithFormat:@"Select recipe_method from  summer_tbl where recipe_name ='WATER' AND recipe_type ='Simple' "];
            recipeMethodArr =[[NSMutableArray alloc]init];
            recipeMethodArr =[[database executeQuery:querymethod]mutableCopy];
            
            
            NSMutableArray *arr_method  = [recipeMethodArr valueForKey:@"recipe_method"];
            NSLog(@"%@",arr_method);
            
            //self.recipe_methodlbl.text = [arr_method objectAtIndex:0];
            //[self.recipe_methodlbl sizeToFit];
            recipeMethodstr = [arr_method objectAtIndex:0];
            
            
            
            [database close];
        }
        if([self.imageFile isEqualToString: @"Zucchini.jpg"])
        {
            [self databaseOpen];
            
            
            //For name
            
            NSString *queryname= [NSString stringWithFormat:@"Select recipe_subcategory,recipe_name,recipe_type from  summer_tbl where recipe_name ='ZUCCHINI' AND recipe_type ='Simple' "];
            recipeNameArr =[[NSMutableArray alloc]init];
            recipeNameArr =[[database executeQuery:queryname]mutableCopy];
            
            NSMutableArray *arr_name = [recipeNameArr valueForKey:@"recipe_subcategory"];
            
            //self.recipe_namelbl.text = [arr_name objectAtIndex:0];
            
            recipeNamestr = [arr_name objectAtIndex:0];
            
            //For ingredients
            
            NSString *queryingredients=[ NSString stringWithFormat:@"Select recipe_ingredients from  summer_tbl where recipe_name ='ZUCCHINI' AND recipe_type ='Simple' "];
            recipeIngredientsArr =[[NSMutableArray alloc]init];
            recipeIngredientsArr =[[database executeQuery:queryingredients]mutableCopy];
            
            
            NSMutableArray *arr_ingredients  = [recipeIngredientsArr valueForKey:@"recipe_ingredients"];
            NSLog(@"%@",arr_ingredients);
            
            //self.recipe_ingredientslbl.text = [arr_ingredients objectAtIndex:0];
            // [self.recipe_ingredientslbl sizeToFit];
            
            recipeIngredientsstr = [arr_ingredients objectAtIndex:0];
            
            //For method
            NSString *querymethod=[ NSString stringWithFormat:@"Select recipe_method from  summer_tbl where recipe_name ='ZUCCHINI' AND recipe_type ='Simple' "];
            recipeMethodArr =[[NSMutableArray alloc]init];
            recipeMethodArr =[[database executeQuery:querymethod]mutableCopy];
            
            
            NSMutableArray *arr_method  = [recipeMethodArr valueForKey:@"recipe_method"];
            NSLog(@"%@",arr_method);
            
            //self.recipe_methodlbl.text = [arr_method objectAtIndex:0];
            //[self.recipe_methodlbl sizeToFit];
            recipeMethodstr = [arr_method objectAtIndex:0];
            
            
            
            [database close];
        }
 [self performSegueWithIdentifier:@"simplesegue" sender:self];
    }
else if ([season isEqualToString:@"fall"])
{
    
    //Apple.jpg
    
    if([self.imageFile isEqualToString: @"Apple.jpg"])
    {
        [self databaseOpen];
        
        
        //For name
        
        NSString *queryname= [NSString stringWithFormat:@"Select recipe_subcategory,recipe_name,recipe_type from fall_tbl where recipe_name = 'Apple' AND recipe_type = 'Simple' "];
        recipeNameArr =[[NSMutableArray alloc]init];
        recipeNameArr =[[database executeQuery:queryname]mutableCopy];
        
        NSMutableArray *arr_name = [recipeNameArr valueForKey:@"recipe_subcategory"];
        
        //self.recipe_namelbl.text = [arr_name objectAtIndex:0];
        
        recipeNamestr = [arr_name objectAtIndex:0];
        
        //For ingredients
        
        NSString *queryingredients=[ NSString stringWithFormat:@"Select recipe_ingredients from fall_tbl where recipe_name = 'Apple' AND recipe_type = 'Simple' "];
        recipeIngredientsArr =[[NSMutableArray alloc]init];
        recipeIngredientsArr =[[database executeQuery:queryingredients]mutableCopy];
        
        
        NSMutableArray *arr_ingredients  = [recipeIngredientsArr valueForKey:@"recipe_ingredients"];
        NSLog(@"%@",arr_ingredients);
        
        //self.recipe_ingredientslbl.text = [arr_ingredients objectAtIndex:0];
        // [self.recipe_ingredientslbl sizeToFit];
        
        recipeIngredientsstr = [arr_ingredients objectAtIndex:0];
        
        //For method
        NSString *querymethod=[ NSString stringWithFormat:@"Select recipe_method from fall_tbl where recipe_name = 'Apple' AND recipe_type = 'Simple' "];
        recipeMethodArr =[[NSMutableArray alloc]init];
        recipeMethodArr =[[database executeQuery:querymethod]mutableCopy];
        
        
        NSMutableArray *arr_method  = [recipeMethodArr valueForKey:@"recipe_method"];
        NSLog(@"%@",arr_method);
        
        //self.recipe_methodlbl.text = [arr_method objectAtIndex:0];
        //[self.recipe_methodlbl sizeToFit];
        recipeMethodstr = [arr_method objectAtIndex:0];
        
        
        
        [database close];
    }
    
    
    
    
    //Beet.jpg
    
    
    if([self.imageFile isEqualToString: @"Beet.jpg"])
    {
        [self databaseOpen];
        
        
        //For name
        
        NSString *queryname= [NSString stringWithFormat:@"Select recipe_subcategory,recipe_name,recipe_type from fall_tbl where recipe_name = 'Beet' AND recipe_type = 'Simple' "];
        recipeNameArr =[[NSMutableArray alloc]init];
        recipeNameArr =[[database executeQuery:queryname]mutableCopy];
        
        NSMutableArray *arr_name = [recipeNameArr valueForKey:@"recipe_subcategory"];
        
        //self.recipe_namelbl.text = [arr_name objectAtIndex:0];
        
        recipeNamestr = [arr_name objectAtIndex:0];
        
        //For ingredients
        
        NSString *queryingredients=[ NSString stringWithFormat:@"Select recipe_ingredients from fall_tbl where recipe_name = 'Beet' AND recipe_type = 'Simple' "];
        recipeIngredientsArr =[[NSMutableArray alloc]init];
        recipeIngredientsArr =[[database executeQuery:queryingredients]mutableCopy];
        
        
        NSMutableArray *arr_ingredients  = [recipeIngredientsArr valueForKey:@"recipe_ingredients"];
        NSLog(@"%@",arr_ingredients);
        
        //self.recipe_ingredientslbl.text = [arr_ingredients objectAtIndex:0];
        // [self.recipe_ingredientslbl sizeToFit];
        
        recipeIngredientsstr = [arr_ingredients objectAtIndex:0];
        
        //For method
        NSString *querymethod=[ NSString stringWithFormat:@"Select recipe_method from fall_tbl where recipe_name = 'Beet' AND recipe_type = 'Simple' "];
        recipeMethodArr =[[NSMutableArray alloc]init];
        recipeMethodArr =[[database executeQuery:querymethod]mutableCopy];
        
        
        NSMutableArray *arr_method  = [recipeMethodArr valueForKey:@"recipe_method"];
        NSLog(@"%@",arr_method);
        
        //self.recipe_methodlbl.text = [arr_method objectAtIndex:0];
        //[self.recipe_methodlbl sizeToFit];
        recipeMethodstr = [arr_method objectAtIndex:0];
        
        
        
        [database close];
    }
    
    
    
    // Brussels.jpg
    
    if([self.imageFile isEqualToString: @"Brussels.jpg"])
    {
        [self databaseOpen];
        
        
        //For name
        
        NSString *queryname= [NSString stringWithFormat:@"Select recipe_subcategory,recipe_name,recipe_type from fall_tbl where recipe_name = 'Brussel Sprout' AND recipe_type = 'Simple' "];
        recipeNameArr =[[NSMutableArray alloc]init];
        recipeNameArr =[[database executeQuery:queryname]mutableCopy];
        
        NSMutableArray *arr_name = [recipeNameArr valueForKey:@"recipe_subcategory"];
        
        //self.recipe_namelbl.text = [arr_name objectAtIndex:0];
        
        recipeNamestr = [arr_name objectAtIndex:0];
        
        //For ingredients
        
        NSString *queryingredients=[ NSString stringWithFormat:@"Select recipe_ingredients from fall_tbl where recipe_name = 'Brussel Sprout' AND recipe_type = 'Simple' "];
        recipeIngredientsArr =[[NSMutableArray alloc]init];
        recipeIngredientsArr =[[database executeQuery:queryingredients]mutableCopy];
        
        
        NSMutableArray *arr_ingredients  = [recipeIngredientsArr valueForKey:@"recipe_ingredients"];
        NSLog(@"%@",arr_ingredients);
        
        //self.recipe_ingredientslbl.text = [arr_ingredients objectAtIndex:0];
        // [self.recipe_ingredientslbl sizeToFit];
        
        recipeIngredientsstr = [arr_ingredients objectAtIndex:0];
        
        //For method
        NSString *querymethod=[ NSString stringWithFormat:@"Select recipe_method from fall_tbl where recipe_name = 'Brussel Sprout' AND recipe_type = 'Simple' "];
        recipeMethodArr =[[NSMutableArray alloc]init];
        recipeMethodArr =[[database executeQuery:querymethod]mutableCopy];
        
        
        NSMutableArray *arr_method  = [recipeMethodArr valueForKey:@"recipe_method"];
        NSLog(@"%@",arr_method);
        
        //self.recipe_methodlbl.text = [arr_method objectAtIndex:0];
        //[self.recipe_methodlbl sizeToFit];
        recipeMethodstr = [arr_method objectAtIndex:0];
        
        
        
        [database close];
    }
    
    
    
    // Cabbage.jpg
    
    if([self.imageFile isEqualToString: @"Cabbage.jpg"])
    {
        [self databaseOpen];
        
        
        //For name
        
        NSString *queryname= [NSString stringWithFormat:@"Select recipe_subcategory,recipe_name,recipe_type from fall_tbl where recipe_name = 'Cabbage' AND recipe_type = 'Simple' "];
        recipeNameArr =[[NSMutableArray alloc]init];
        recipeNameArr =[[database executeQuery:queryname]mutableCopy];
        
        NSMutableArray *arr_name = [recipeNameArr valueForKey:@"recipe_subcategory"];
        
        //self.recipe_namelbl.text = [arr_name objectAtIndex:0];
        
        recipeNamestr = [arr_name objectAtIndex:0];
        
        //For ingredients
        
        NSString *queryingredients=[ NSString stringWithFormat:@"Select recipe_ingredients from fall_tbl where recipe_name = 'Cabbage' AND recipe_type = 'Simple' "];
        recipeIngredientsArr =[[NSMutableArray alloc]init];
        recipeIngredientsArr =[[database executeQuery:queryingredients]mutableCopy];
        
        
        NSMutableArray *arr_ingredients  = [recipeIngredientsArr valueForKey:@"recipe_ingredients"];
        NSLog(@"%@",arr_ingredients);
        
        //self.recipe_ingredientslbl.text = [arr_ingredients objectAtIndex:0];
        // [self.recipe_ingredientslbl sizeToFit];
        
        recipeIngredientsstr = [arr_ingredients objectAtIndex:0];
        
        //For method
        NSString *querymethod=[ NSString stringWithFormat:@"Select recipe_method from fall_tbl where recipe_name = 'Cabbage' AND recipe_type = 'Simple' "];
        recipeMethodArr =[[NSMutableArray alloc]init];
        recipeMethodArr =[[database executeQuery:querymethod]mutableCopy];
        
        
        NSMutableArray *arr_method  = [recipeMethodArr valueForKey:@"recipe_method"];
        NSLog(@"%@",arr_method);
        
        //self.recipe_methodlbl.text = [arr_method objectAtIndex:0];
        //[self.recipe_methodlbl sizeToFit];
        recipeMethodstr = [arr_method objectAtIndex:0];
        
        
        
        [database close];
    }
    
    
    
    //  Carrot.jpg
    
    if([self.imageFile isEqualToString: @"Carrot.jpg"])
    {
        [self databaseOpen];
        
        
        //For name
        
        NSString *queryname= [NSString stringWithFormat:@"Select recipe_subcategory,recipe_name,recipe_type from fall_tbl where recipe_name = 'Carrot' AND recipe_type = 'Simple' "];
        recipeNameArr =[[NSMutableArray alloc]init];
        recipeNameArr =[[database executeQuery:queryname]mutableCopy];
        
        NSMutableArray *arr_name = [recipeNameArr valueForKey:@"recipe_subcategory"];
        
        //self.recipe_namelbl.text = [arr_name objectAtIndex:0];
        
        recipeNamestr = [arr_name objectAtIndex:0];
        
        //For ingredients
        
        NSString *queryingredients=[ NSString stringWithFormat:@"Select recipe_ingredients from fall_tbl where recipe_name = 'Carrot' AND recipe_type = 'Simple' "];
        recipeIngredientsArr =[[NSMutableArray alloc]init];
        recipeIngredientsArr =[[database executeQuery:queryingredients]mutableCopy];
        
        
        NSMutableArray *arr_ingredients  = [recipeIngredientsArr valueForKey:@"recipe_ingredients"];
        NSLog(@"%@",arr_ingredients);
        
        //self.recipe_ingredientslbl.text = [arr_ingredients objectAtIndex:0];
        // [self.recipe_ingredientslbl sizeToFit];
        
        recipeIngredientsstr = [arr_ingredients objectAtIndex:0];
        
        //For method
        NSString *querymethod=[ NSString stringWithFormat:@"Select recipe_method from fall_tbl where recipe_name = 'Carrot' AND recipe_type = 'Simple' "];
        recipeMethodArr =[[NSMutableArray alloc]init];
        recipeMethodArr =[[database executeQuery:querymethod]mutableCopy];
        
        
        NSMutableArray *arr_method  = [recipeMethodArr valueForKey:@"recipe_method"];
        NSLog(@"%@",arr_method);
        
        //self.recipe_methodlbl.text = [arr_method objectAtIndex:0];
        //[self.recipe_methodlbl sizeToFit];
        recipeMethodstr = [arr_method objectAtIndex:0];
        
        
        
        [database close];
    }
    
    
    
    // Cauliflower.jpg
    
    if([self.imageFile isEqualToString: @"Cauliflower.jpg"])
    {
        [self databaseOpen];
        
        
        //For name
        
        NSString *queryname= [NSString stringWithFormat:@"Select recipe_subcategory,recipe_name,recipe_type from fall_tbl where recipe_name = 'Cauliflower' AND recipe_type = 'Simple' "];
        recipeNameArr =[[NSMutableArray alloc]init];
        recipeNameArr =[[database executeQuery:queryname]mutableCopy];
        
        NSMutableArray *arr_name = [recipeNameArr valueForKey:@"recipe_subcategory"];
        
        //self.recipe_namelbl.text = [arr_name objectAtIndex:0];
        
        recipeNamestr = [arr_name objectAtIndex:0];
        
        //For ingredients
        
        NSString *queryingredients=[ NSString stringWithFormat:@"Select recipe_ingredients from fall_tbl where recipe_name = 'Cauliflower' AND recipe_type = 'Simple' "];
        recipeIngredientsArr =[[NSMutableArray alloc]init];
        recipeIngredientsArr =[[database executeQuery:queryingredients]mutableCopy];
        
        
        NSMutableArray *arr_ingredients  = [recipeIngredientsArr valueForKey:@"recipe_ingredients"];
        NSLog(@"%@",arr_ingredients);
        
        //self.recipe_ingredientslbl.text = [arr_ingredients objectAtIndex:0];
        // [self.recipe_ingredientslbl sizeToFit];
        
        recipeIngredientsstr = [arr_ingredients objectAtIndex:0];
        
        //For method
        NSString *querymethod=[ NSString stringWithFormat:@"Select recipe_method from fall_tbl where recipe_name = 'Cauliflower' AND recipe_type = 'Simple' "];
        recipeMethodArr =[[NSMutableArray alloc]init];
        recipeMethodArr =[[database executeQuery:querymethod]mutableCopy];
        
        
        NSMutableArray *arr_method  = [recipeMethodArr valueForKey:@"recipe_method"];
        NSLog(@"%@",arr_method);
        
        //self.recipe_methodlbl.text = [arr_method objectAtIndex:0];
        //[self.recipe_methodlbl sizeToFit];
        recipeMethodstr = [arr_method objectAtIndex:0];
        
        
        
        [database close];
    }
    
    
    
    // Celery.jpg
    
    if([self.imageFile isEqualToString: @"Celery.jpg"])
    {
        [self databaseOpen];
        
        
        //For name
        
        NSString *queryname= [NSString stringWithFormat:@"Select recipe_subcategory,recipe_name,recipe_type from fall_tbl where recipe_name = 'Celery' AND recipe_type = 'Simple' "];
        recipeNameArr =[[NSMutableArray alloc]init];
        recipeNameArr =[[database executeQuery:queryname]mutableCopy];
        
        NSMutableArray *arr_name = [recipeNameArr valueForKey:@"recipe_subcategory"];
        
        //self.recipe_namelbl.text = [arr_name objectAtIndex:0];
        
        recipeNamestr = [arr_name objectAtIndex:0];
        
        //For ingredients
        
        NSString *queryingredients=[ NSString stringWithFormat:@"Select recipe_ingredients from fall_tbl where recipe_name = 'Celery' AND recipe_type = 'Simple' "];
        recipeIngredientsArr =[[NSMutableArray alloc]init];
        recipeIngredientsArr =[[database executeQuery:queryingredients]mutableCopy];
        
        
        NSMutableArray *arr_ingredients  = [recipeIngredientsArr valueForKey:@"recipe_ingredients"];
        NSLog(@"%@",arr_ingredients);
        
        //self.recipe_ingredientslbl.text = [arr_ingredients objectAtIndex:0];
        // [self.recipe_ingredientslbl sizeToFit];
        
        recipeIngredientsstr = [arr_ingredients objectAtIndex:0];
        
        //For method
        NSString *querymethod=[ NSString stringWithFormat:@"Select recipe_method from fall_tbl where recipe_name = 'Celery' AND recipe_type = 'Simple' "];
        recipeMethodArr =[[NSMutableArray alloc]init];
        recipeMethodArr =[[database executeQuery:querymethod]mutableCopy];
        
        
        NSMutableArray *arr_method  = [recipeMethodArr valueForKey:@"recipe_method"];
        NSLog(@"%@",arr_method);
        
        //self.recipe_methodlbl.text = [arr_method objectAtIndex:0];
        //[self.recipe_methodlbl sizeToFit];
        recipeMethodstr = [arr_method objectAtIndex:0];
        
        
        
        [database close];
    }
    
    
    
    //  Chard.jpg
    
    if([self.imageFile isEqualToString: @"Chard.jpg"])
    {
        [self databaseOpen];
        
        
        //For name
        
        NSString *queryname= [NSString stringWithFormat:@"Select recipe_subcategory,recipe_name,recipe_type from fall_tbl where recipe_name = 'Chard' AND recipe_type = 'Simple' "];
        recipeNameArr =[[NSMutableArray alloc]init];
        recipeNameArr =[[database executeQuery:queryname]mutableCopy];
        
        NSMutableArray *arr_name = [recipeNameArr valueForKey:@"recipe_subcategory"];
        
        //self.recipe_namelbl.text = [arr_name objectAtIndex:0];
        
        recipeNamestr = [arr_name objectAtIndex:0];
        
        //For ingredients
        
        NSString *queryingredients=[ NSString stringWithFormat:@"Select recipe_ingredients from fall_tbl where recipe_name = 'Chard' AND recipe_type = 'Simple' "];
        recipeIngredientsArr =[[NSMutableArray alloc]init];
        recipeIngredientsArr =[[database executeQuery:queryingredients]mutableCopy];
        
        
        NSMutableArray *arr_ingredients  = [recipeIngredientsArr valueForKey:@"recipe_ingredients"];
        NSLog(@"%@",arr_ingredients);
        
        //self.recipe_ingredientslbl.text = [arr_ingredients objectAtIndex:0];
        // [self.recipe_ingredientslbl sizeToFit];
        
        recipeIngredientsstr = [arr_ingredients objectAtIndex:0];
        
        //For method
        NSString *querymethod=[ NSString stringWithFormat:@"Select recipe_method from fall_tbl where recipe_name = 'Chard' AND recipe_type = 'Simple' "];
        recipeMethodArr =[[NSMutableArray alloc]init];
        recipeMethodArr =[[database executeQuery:querymethod]mutableCopy];
        
        
        NSMutableArray *arr_method  = [recipeMethodArr valueForKey:@"recipe_method"];
        NSLog(@"%@",arr_method);
        
        //self.recipe_methodlbl.text = [arr_method objectAtIndex:0];
        //[self.recipe_methodlbl sizeToFit];
        recipeMethodstr = [arr_method objectAtIndex:0];
        
        
        
        [database close];
    }
    
    
    
    // Chile.jpg
    
    if([self.imageFile isEqualToString: @"Chile.jpg"])
    {
        [self databaseOpen];
        
        
        //For name
        
        NSString *queryname= [NSString stringWithFormat:@"Select recipe_subcategory,recipe_name,recipe_type from fall_tbl where recipe_name = 'Chile' AND recipe_type = 'Simple' "];
        recipeNameArr =[[NSMutableArray alloc]init];
        recipeNameArr =[[database executeQuery:queryname]mutableCopy];
        
        NSMutableArray *arr_name = [recipeNameArr valueForKey:@"recipe_subcategory"];
        
        //self.recipe_namelbl.text = [arr_name objectAtIndex:0];
        
        recipeNamestr = [arr_name objectAtIndex:0];
        
        //For ingredients
        
        NSString *queryingredients=[ NSString stringWithFormat:@"Select recipe_ingredients from fall_tbl where recipe_name = 'Chile' AND recipe_type = 'Simple' "];
        recipeIngredientsArr =[[NSMutableArray alloc]init];
        recipeIngredientsArr =[[database executeQuery:queryingredients]mutableCopy];
        
        
        NSMutableArray *arr_ingredients  = [recipeIngredientsArr valueForKey:@"recipe_ingredients"];
        NSLog(@"%@",arr_ingredients);
        
        //self.recipe_ingredientslbl.text = [arr_ingredients objectAtIndex:0];
        // [self.recipe_ingredientslbl sizeToFit];
        
        recipeIngredientsstr = [arr_ingredients objectAtIndex:0];
        
        //For method
        NSString *querymethod=[ NSString stringWithFormat:@"Select recipe_method from fall_tbl where recipe_name = 'Chile' AND recipe_type = 'Simple' "];
        recipeMethodArr =[[NSMutableArray alloc]init];
        recipeMethodArr =[[database executeQuery:querymethod]mutableCopy];
        
        
        NSMutableArray *arr_method  = [recipeMethodArr valueForKey:@"recipe_method"];
        NSLog(@"%@",arr_method);
        
        //self.recipe_methodlbl.text = [arr_method objectAtIndex:0];
        //[self.recipe_methodlbl sizeToFit];
        recipeMethodstr = [arr_method objectAtIndex:0];
        
        
        
        [database close];
    }
    
    
    
    // Collard.jpg
    
    if([self.imageFile isEqualToString: @"Collard.jpg"])
    {
        [self databaseOpen];
        
        
        //For name
        
        NSString *queryname= [NSString stringWithFormat:@"Select recipe_subcategory,recipe_name,recipe_type from fall_tbl where recipe_name = 'Collard' AND recipe_type = 'Simple' "];
        recipeNameArr =[[NSMutableArray alloc]init];
        recipeNameArr =[[database executeQuery:queryname]mutableCopy];
        
        NSMutableArray *arr_name = [recipeNameArr valueForKey:@"recipe_subcategory"];
        
        //self.recipe_namelbl.text = [arr_name objectAtIndex:0];
        
        recipeNamestr = [arr_name objectAtIndex:0];
        
        //For ingredients
        
        NSString *queryingredients=[ NSString stringWithFormat:@"Select recipe_ingredients from fall_tbl where recipe_name = 'Collard' AND recipe_type = 'Simple' "];
        recipeIngredientsArr =[[NSMutableArray alloc]init];
        recipeIngredientsArr =[[database executeQuery:queryingredients]mutableCopy];
        
        
        NSMutableArray *arr_ingredients  = [recipeIngredientsArr valueForKey:@"recipe_ingredients"];
        NSLog(@"%@",arr_ingredients);
        
        //self.recipe_ingredientslbl.text = [arr_ingredients objectAtIndex:0];
        // [self.recipe_ingredientslbl sizeToFit];
        
        recipeIngredientsstr = [arr_ingredients objectAtIndex:0];
        
        //For method
        NSString *querymethod=[ NSString stringWithFormat:@"Select recipe_method from fall_tbl where recipe_name = 'Collard' AND recipe_type = 'Simple' "];
        recipeMethodArr =[[NSMutableArray alloc]init];
        recipeMethodArr =[[database executeQuery:querymethod]mutableCopy];
        
        
        NSMutableArray *arr_method  = [recipeMethodArr valueForKey:@"recipe_method"];
        NSLog(@"%@",arr_method);
        
        //self.recipe_methodlbl.text = [arr_method objectAtIndex:0];
        //[self.recipe_methodlbl sizeToFit];
        recipeMethodstr = [arr_method objectAtIndex:0];
        
        
        
        [database close];
    }
    
    
    
    // Cranberry.jpg
    
    if([self.imageFile isEqualToString: @"Cranberry.jpg"])
    {
        [self databaseOpen];
        
        
        //For name
        
        NSString *queryname= [NSString stringWithFormat:@"Select recipe_subcategory,recipe_name,recipe_type from fall_tbl where recipe_name = 'Cranberry' AND recipe_type = 'Simple' "];
        recipeNameArr =[[NSMutableArray alloc]init];
        recipeNameArr =[[database executeQuery:queryname]mutableCopy];
        
        NSMutableArray *arr_name = [recipeNameArr valueForKey:@"recipe_subcategory"];
        
        //self.recipe_namelbl.text = [arr_name objectAtIndex:0];
        
        recipeNamestr = [arr_name objectAtIndex:0];
        
        //For ingredients
        
        NSString *queryingredients=[ NSString stringWithFormat:@"Select recipe_ingredients from fall_tbl where recipe_name = 'Cranberry' AND recipe_type = 'Simple' "];
        recipeIngredientsArr =[[NSMutableArray alloc]init];
        recipeIngredientsArr =[[database executeQuery:queryingredients]mutableCopy];
        
        
        NSMutableArray *arr_ingredients  = [recipeIngredientsArr valueForKey:@"recipe_ingredients"];
        NSLog(@"%@",arr_ingredients);
        
        //self.recipe_ingredientslbl.text = [arr_ingredients objectAtIndex:0];
        // [self.recipe_ingredientslbl sizeToFit];
        
        recipeIngredientsstr = [arr_ingredients objectAtIndex:0];
        
        //For method
        NSString *querymethod=[ NSString stringWithFormat:@"Select recipe_method from fall_tbl where recipe_name = 'Cranberry' AND recipe_type = 'Simple' "];
        recipeMethodArr =[[NSMutableArray alloc]init];
        recipeMethodArr =[[database executeQuery:querymethod]mutableCopy];
        
        
        NSMutableArray *arr_method  = [recipeMethodArr valueForKey:@"recipe_method"];
        NSLog(@"%@",arr_method);
        
        //self.recipe_methodlbl.text = [arr_method objectAtIndex:0];
        //[self.recipe_methodlbl sizeToFit];
        recipeMethodstr = [arr_method objectAtIndex:0];
        
        
        
        [database close];
    }
    
    
    
    // Fig.jpg
    
    if([self.imageFile isEqualToString: @"Fig.jpg"])
    {
        [self databaseOpen];
        
        
        //For name
        
        NSString *queryname= [NSString stringWithFormat:@"Select recipe_subcategory,recipe_name,recipe_type from fall_tbl where recipe_name = 'Fig' AND recipe_type = 'Simple' "];
        recipeNameArr =[[NSMutableArray alloc]init];
        recipeNameArr =[[database executeQuery:queryname]mutableCopy];
        
        NSMutableArray *arr_name = [recipeNameArr valueForKey:@"recipe_subcategory"];
        
        //self.recipe_namelbl.text = [arr_name objectAtIndex:0];
        
        recipeNamestr = [arr_name objectAtIndex:0];
        
        //For ingredients
        
        NSString *queryingredients=[ NSString stringWithFormat:@"Select recipe_ingredients from fall_tbl where recipe_name = 'Fig' AND recipe_type = 'Simple' "];
        recipeIngredientsArr =[[NSMutableArray alloc]init];
        recipeIngredientsArr =[[database executeQuery:queryingredients]mutableCopy];
        
        
        NSMutableArray *arr_ingredients  = [recipeIngredientsArr valueForKey:@"recipe_ingredients"];
        NSLog(@"%@",arr_ingredients);
        
        //self.recipe_ingredientslbl.text = [arr_ingredients objectAtIndex:0];
        // [self.recipe_ingredientslbl sizeToFit];
        
        recipeIngredientsstr = [arr_ingredients objectAtIndex:0];
        
        //For method
        NSString *querymethod=[ NSString stringWithFormat:@"Select recipe_method from fall_tbl where recipe_name = 'Fig' AND recipe_type = 'Simple' "];
        recipeMethodArr =[[NSMutableArray alloc]init];
        recipeMethodArr =[[database executeQuery:querymethod]mutableCopy];
        
        
        NSMutableArray *arr_method  = [recipeMethodArr valueForKey:@"recipe_method"];
        NSLog(@"%@",arr_method);
        
        //self.recipe_methodlbl.text = [arr_method objectAtIndex:0];
        //[self.recipe_methodlbl sizeToFit];
        recipeMethodstr = [arr_method objectAtIndex:0];
        
        
        
        [database close];
    }
    
    
    
    
    // Garlic.jpg
    
    if([self.imageFile isEqualToString: @"Garlic.jpg"])
    {
        [self databaseOpen];
        
        
        //For name
        
        NSString *queryname= [NSString stringWithFormat:@"Select recipe_subcategory,recipe_name,recipe_type from fall_tbl where recipe_name = 'Garlic' AND recipe_type = 'Simple' "];
        recipeNameArr =[[NSMutableArray alloc]init];
        recipeNameArr =[[database executeQuery:queryname]mutableCopy];
        
        NSMutableArray *arr_name = [recipeNameArr valueForKey:@"recipe_subcategory"];
        
        //self.recipe_namelbl.text = [arr_name objectAtIndex:0];
        
        recipeNamestr = [arr_name objectAtIndex:0];
        
        //For ingredients
        
        NSString *queryingredients=[ NSString stringWithFormat:@"Select recipe_ingredients from fall_tbl where recipe_name = 'Garlic' AND recipe_type = 'Simple' "];
        recipeIngredientsArr =[[NSMutableArray alloc]init];
        recipeIngredientsArr =[[database executeQuery:queryingredients]mutableCopy];
        
        
        NSMutableArray *arr_ingredients  = [recipeIngredientsArr valueForKey:@"recipe_ingredients"];
        NSLog(@"%@",arr_ingredients);
        
        //self.recipe_ingredientslbl.text = [arr_ingredients objectAtIndex:0];
        // [self.recipe_ingredientslbl sizeToFit];
        
        recipeIngredientsstr = [arr_ingredients objectAtIndex:0];
        
        //For method
        NSString *querymethod=[ NSString stringWithFormat:@"Select recipe_method from fall_tbl where recipe_name = 'Garlic' AND recipe_type = 'Simple' "];
        recipeMethodArr =[[NSMutableArray alloc]init];
        recipeMethodArr =[[database executeQuery:querymethod]mutableCopy];
        
        
        NSMutableArray *arr_method  = [recipeMethodArr valueForKey:@"recipe_method"];
        NSLog(@"%@",arr_method);
        
        //self.recipe_methodlbl.text = [arr_method objectAtIndex:0];
        //[self.recipe_methodlbl sizeToFit];
        recipeMethodstr = [arr_method objectAtIndex:0];
        
        
        
        [database close];
    }
    
    
    
    
    // Grape.jpg
    
    if([self.imageFile isEqualToString: @"Grape.jpg"])
    {
        [self databaseOpen];
        
        
        //For name
        
        NSString *queryname= [NSString stringWithFormat:@"Select recipe_subcategory,recipe_name,recipe_type from fall_tbl where recipe_name = 'Grape' AND recipe_type = 'Simple' "];
        recipeNameArr =[[NSMutableArray alloc]init];
        recipeNameArr =[[database executeQuery:queryname]mutableCopy];
        
        NSMutableArray *arr_name = [recipeNameArr valueForKey:@"recipe_subcategory"];
        
        //self.recipe_namelbl.text = [arr_name objectAtIndex:0];
        
        recipeNamestr = [arr_name objectAtIndex:0];
        
        //For ingredients
        
        NSString *queryingredients=[ NSString stringWithFormat:@"Select recipe_ingredients from fall_tbl where recipe_name = 'Grape' AND recipe_type = 'Simple' "];
        recipeIngredientsArr =[[NSMutableArray alloc]init];
        recipeIngredientsArr =[[database executeQuery:queryingredients]mutableCopy];
        
        
        NSMutableArray *arr_ingredients  = [recipeIngredientsArr valueForKey:@"recipe_ingredients"];
        NSLog(@"%@",arr_ingredients);
        
        //self.recipe_ingredientslbl.text = [arr_ingredients objectAtIndex:0];
        // [self.recipe_ingredientslbl sizeToFit];
        
        recipeIngredientsstr = [arr_ingredients objectAtIndex:0];
        
        //For method
        NSString *querymethod=[ NSString stringWithFormat:@"Select recipe_method from fall_tbl where recipe_name = 'Grape' AND recipe_type = 'Simple' "];
        recipeMethodArr =[[NSMutableArray alloc]init];
        recipeMethodArr =[[database executeQuery:querymethod]mutableCopy];
        
        
        NSMutableArray *arr_method  = [recipeMethodArr valueForKey:@"recipe_method"];
        NSLog(@"%@",arr_method);
        
        //self.recipe_methodlbl.text = [arr_method objectAtIndex:0];
        //[self.recipe_methodlbl sizeToFit];
        recipeMethodstr = [arr_method objectAtIndex:0];
        
        
        
        [database close];
    }
    
    
    
    
    // Oregano.jpg
    
    if([self.imageFile isEqualToString: @"Oregano.jpg"])
    {
        [self databaseOpen];
        
        
        //For name
        
        NSString *queryname= [NSString stringWithFormat:@"Select recipe_subcategory,recipe_name,recipe_type from fall_tbl where recipe_name = 'Oregano' AND recipe_type = 'Simple' "];
        recipeNameArr =[[NSMutableArray alloc]init];
        recipeNameArr =[[database executeQuery:queryname]mutableCopy];
        
        NSMutableArray *arr_name = [recipeNameArr valueForKey:@"recipe_subcategory"];
        
        //self.recipe_namelbl.text = [arr_name objectAtIndex:0];
        
        recipeNamestr = [arr_name objectAtIndex:0];
        
        //For ingredients
        
        NSString *queryingredients=[ NSString stringWithFormat:@"Select recipe_ingredients from fall_tbl where recipe_name = 'Oregano' AND recipe_type = 'Simple' "];
        recipeIngredientsArr =[[NSMutableArray alloc]init];
        recipeIngredientsArr =[[database executeQuery:queryingredients]mutableCopy];
        
        
        NSMutableArray *arr_ingredients  = [recipeIngredientsArr valueForKey:@"recipe_ingredients"];
        NSLog(@"%@",arr_ingredients);
        
        //self.recipe_ingredientslbl.text = [arr_ingredients objectAtIndex:0];
        // [self.recipe_ingredientslbl sizeToFit];
        
        recipeIngredientsstr = [arr_ingredients objectAtIndex:0];
        
        //For method
        NSString *querymethod=[ NSString stringWithFormat:@"Select recipe_method from fall_tbl where recipe_name = 'Oregano' AND recipe_type = 'Simple' "];
        recipeMethodArr =[[NSMutableArray alloc]init];
        recipeMethodArr =[[database executeQuery:querymethod]mutableCopy];
        
        
        NSMutableArray *arr_method  = [recipeMethodArr valueForKey:@"recipe_method"];
        NSLog(@"%@",arr_method);
        
        //self.recipe_methodlbl.text = [arr_method objectAtIndex:0];
        //[self.recipe_methodlbl sizeToFit];
        recipeMethodstr = [arr_method objectAtIndex:0];
        
        
        
        [database close];
    }
    
    
    
    
    // Parsley.jpg
    
    if([self.imageFile isEqualToString: @"Parsley.jpg"])
    {
        [self databaseOpen];
        
        
        //For name
        
        NSString *queryname= [NSString stringWithFormat:@"Select recipe_subcategory,recipe_name,recipe_type from fall_tbl where recipe_name = 'Parsley' AND recipe_type = 'Simple' "];
        recipeNameArr =[[NSMutableArray alloc]init];
        recipeNameArr =[[database executeQuery:queryname]mutableCopy];
        
        NSMutableArray *arr_name = [recipeNameArr valueForKey:@"recipe_subcategory"];
        
        //self.recipe_namelbl.text = [arr_name objectAtIndex:0];
        
        recipeNamestr = [arr_name objectAtIndex:0];
        
        //For ingredients
        
        NSString *queryingredients=[ NSString stringWithFormat:@"Select recipe_ingredients from fall_tbl where recipe_name = 'Parsley' AND recipe_type = 'Simple' "];
        recipeIngredientsArr =[[NSMutableArray alloc]init];
        recipeIngredientsArr =[[database executeQuery:queryingredients]mutableCopy];
        
        
        NSMutableArray *arr_ingredients  = [recipeIngredientsArr valueForKey:@"recipe_ingredients"];
        NSLog(@"%@",arr_ingredients);
        
        //self.recipe_ingredientslbl.text = [arr_ingredients objectAtIndex:0];
        // [self.recipe_ingredientslbl sizeToFit];
        
        recipeIngredientsstr = [arr_ingredients objectAtIndex:0];
        
        //For method
        NSString *querymethod=[ NSString stringWithFormat:@"Select recipe_method from fall_tbl where recipe_name = 'Parsley' AND recipe_type = 'Simple' "];
        recipeMethodArr =[[NSMutableArray alloc]init];
        recipeMethodArr =[[database executeQuery:querymethod]mutableCopy];
        
        
        NSMutableArray *arr_method  = [recipeMethodArr valueForKey:@"recipe_method"];
        NSLog(@"%@",arr_method);
        
        //self.recipe_methodlbl.text = [arr_method objectAtIndex:0];
        //[self.recipe_methodlbl sizeToFit];
        recipeMethodstr = [arr_method objectAtIndex:0];
        
        
        
        [database close];
    }
    
    
    
    
    // Pistachio.jpg
    
    if([self.imageFile isEqualToString: @"Pistachio.jpg"])
    {
        [self databaseOpen];
        
        
        //For name
        
        NSString *queryname= [NSString stringWithFormat:@"Select recipe_subcategory,recipe_name,recipe_type from fall_tbl where recipe_name = 'Pistachio' AND recipe_type = 'Simple' "];
        recipeNameArr =[[NSMutableArray alloc]init];
        recipeNameArr =[[database executeQuery:queryname]mutableCopy];
        
        NSMutableArray *arr_name = [recipeNameArr valueForKey:@"recipe_subcategory"];
        
        //self.recipe_namelbl.text = [arr_name objectAtIndex:0];
        
        recipeNamestr = [arr_name objectAtIndex:0];
        
        //For ingredients
        
        NSString *queryingredients=[ NSString stringWithFormat:@"Select recipe_ingredients from fall_tbl where recipe_name = 'Pistachio' AND recipe_type = 'Simple' "];
        recipeIngredientsArr =[[NSMutableArray alloc]init];
        recipeIngredientsArr =[[database executeQuery:queryingredients]mutableCopy];
        
        
        NSMutableArray *arr_ingredients  = [recipeIngredientsArr valueForKey:@"recipe_ingredients"];
        NSLog(@"%@",arr_ingredients);
        
        //self.recipe_ingredientslbl.text = [arr_ingredients objectAtIndex:0];
        // [self.recipe_ingredientslbl sizeToFit];
        
        recipeIngredientsstr = [arr_ingredients objectAtIndex:0];
        
        //For method
        NSString *querymethod=[ NSString stringWithFormat:@"Select recipe_method from fall_tbl where recipe_name = 'Pistachio' AND recipe_type = 'Simple' "];
        recipeMethodArr =[[NSMutableArray alloc]init];
        recipeMethodArr =[[database executeQuery:querymethod]mutableCopy];
        
        
        NSMutableArray *arr_method  = [recipeMethodArr valueForKey:@"recipe_method"];
        NSLog(@"%@",arr_method);
        
        //self.recipe_methodlbl.text = [arr_method objectAtIndex:0];
        //[self.recipe_methodlbl sizeToFit];
        recipeMethodstr = [arr_method objectAtIndex:0];
        
        
        
        [database close];
    }
    
    
    
    
    // Pork.jpg
    
    if([self.imageFile isEqualToString: @"Pork.jpg"])
    {
        [self databaseOpen];
        
        
        //For name
        
        NSString *queryname= [NSString stringWithFormat:@"Select recipe_subcategory,recipe_name,recipe_type from fall_tbl where recipe_name = 'Pork' AND recipe_type = 'Simple' "];
        recipeNameArr =[[NSMutableArray alloc]init];
        recipeNameArr =[[database executeQuery:queryname]mutableCopy];
        
        NSMutableArray *arr_name = [recipeNameArr valueForKey:@"recipe_subcategory"];
        
        //self.recipe_namelbl.text = [arr_name objectAtIndex:0];
        
        recipeNamestr = [arr_name objectAtIndex:0];
        
        //For ingredients
        
        NSString *queryingredients=[ NSString stringWithFormat:@"Select recipe_ingredients from fall_tbl where recipe_name = 'Pork' AND recipe_type = 'Simple' "];
        recipeIngredientsArr =[[NSMutableArray alloc]init];
        recipeIngredientsArr =[[database executeQuery:queryingredients]mutableCopy];
        
        
        NSMutableArray *arr_ingredients  = [recipeIngredientsArr valueForKey:@"recipe_ingredients"];
        NSLog(@"%@",arr_ingredients);
        
        //self.recipe_ingredientslbl.text = [arr_ingredients objectAtIndex:0];
        // [self.recipe_ingredientslbl sizeToFit];
        
        recipeIngredientsstr = [arr_ingredients objectAtIndex:0];
        
        //For method
        NSString *querymethod=[ NSString stringWithFormat:@"Select recipe_method from fall_tbl where recipe_name = 'Pork' AND recipe_type = 'Simple' "];
        recipeMethodArr =[[NSMutableArray alloc]init];
        recipeMethodArr =[[database executeQuery:querymethod]mutableCopy];
        
        
        NSMutableArray *arr_method  = [recipeMethodArr valueForKey:@"recipe_method"];
        NSLog(@"%@",arr_method);
        
        //self.recipe_methodlbl.text = [arr_method objectAtIndex:0];
        //[self.recipe_methodlbl sizeToFit];
        recipeMethodstr = [arr_method objectAtIndex:0];
        
        
        
        [database close];
    }
    
    
    
    
    // PorkAlternate.jpg
    
    if([self.imageFile isEqualToString: @"PorkAlternate.jpg"])
    {
        [self databaseOpen];
        
        
        //For name
        
        NSString *queryname= [NSString stringWithFormat:@"Select recipe_subcategory,recipe_name,recipe_type from fall_tbl where recipe_name = 'PorkAlternate' AND recipe_type = 'Simple' "];
        recipeNameArr =[[NSMutableArray alloc]init];
        recipeNameArr =[[database executeQuery:queryname]mutableCopy];
        
        NSMutableArray *arr_name = [recipeNameArr valueForKey:@"recipe_subcategory"];
        
        //self.recipe_namelbl.text = [arr_name objectAtIndex:0];
        
        recipeNamestr = [arr_name objectAtIndex:0];
        
        //For ingredients
        
        NSString *queryingredients=[ NSString stringWithFormat:@"Select recipe_ingredients from fall_tbl where recipe_name = 'PorkAlternate' AND recipe_type = 'Simple' "];
        recipeIngredientsArr =[[NSMutableArray alloc]init];
        recipeIngredientsArr =[[database executeQuery:queryingredients]mutableCopy];
        
        
        NSMutableArray *arr_ingredients  = [recipeIngredientsArr valueForKey:@"recipe_ingredients"];
        NSLog(@"%@",arr_ingredients);
        
        //self.recipe_ingredientslbl.text = [arr_ingredients objectAtIndex:0];
        // [self.recipe_ingredientslbl sizeToFit];
        
        recipeIngredientsstr = [arr_ingredients objectAtIndex:0];
        
        //For method
        NSString *querymethod=[ NSString stringWithFormat:@"Select recipe_method from fall_tbl where recipe_name = 'PorkAlternate' AND recipe_type = 'Simple' "];
        recipeMethodArr =[[NSMutableArray alloc]init];
        recipeMethodArr =[[database executeQuery:querymethod]mutableCopy];
        
        
        NSMutableArray *arr_method  = [recipeMethodArr valueForKey:@"recipe_method"];
        NSLog(@"%@",arr_method);
        
        //self.recipe_methodlbl.text = [arr_method objectAtIndex:0];
        //[self.recipe_methodlbl sizeToFit];
        recipeMethodstr = [arr_method objectAtIndex:0];
        
        
        
        [database close];
    }
    
    
    
    
    // Pumpkin Seeds.jpg
    
    if([self.imageFile isEqualToString: @"Pumpkin Seeds.jpg"])
    {
        [self databaseOpen];
        
        
        //For name
        
        NSString *queryname= [NSString stringWithFormat:@"Select recipe_subcategory,recipe_name,recipe_type from fall_tbl where recipe_name = 'Pumpkin Seeds' AND recipe_type = 'Simple' "];
        recipeNameArr =[[NSMutableArray alloc]init];
        recipeNameArr =[[database executeQuery:queryname]mutableCopy];
        
        NSMutableArray *arr_name = [recipeNameArr valueForKey:@"recipe_subcategory"];
        
        //self.recipe_namelbl.text = [arr_name objectAtIndex:0];
        
        recipeNamestr = [arr_name objectAtIndex:0];
        
        //For ingredients
        
        NSString *queryingredients=[ NSString stringWithFormat:@"Select recipe_ingredients from fall_tbl where recipe_name = 'Pumpkin Seeds' AND recipe_type = 'Simple' "];
        recipeIngredientsArr =[[NSMutableArray alloc]init];
        recipeIngredientsArr =[[database executeQuery:queryingredients]mutableCopy];
        
        
        NSMutableArray *arr_ingredients  = [recipeIngredientsArr valueForKey:@"recipe_ingredients"];
        NSLog(@"%@",arr_ingredients);
        
        //self.recipe_ingredientslbl.text = [arr_ingredients objectAtIndex:0];
        // [self.recipe_ingredientslbl sizeToFit];
        
        recipeIngredientsstr = [arr_ingredients objectAtIndex:0];
        
        //For method
        NSString *querymethod=[ NSString stringWithFormat:@"Select recipe_method from fall_tbl where recipe_name = 'Pumpkin Seeds' AND recipe_type = 'Simple' "];
        recipeMethodArr =[[NSMutableArray alloc]init];
        recipeMethodArr =[[database executeQuery:querymethod]mutableCopy];
        
        
        NSMutableArray *arr_method  = [recipeMethodArr valueForKey:@"recipe_method"];
        NSLog(@"%@",arr_method);
        
        //self.recipe_methodlbl.text = [arr_method objectAtIndex:0];
        //[self.recipe_methodlbl sizeToFit];
        recipeMethodstr = [arr_method objectAtIndex:0];
        
        
        
        [database close];
    }
    
    
    
    
    // Pumpkin.jpg
    
    if([self.imageFile isEqualToString: @"Pumpkin.jpg"])
    {
        [self databaseOpen];
        
        
        //For name
        
        NSString *queryname= [NSString stringWithFormat:@"Select recipe_subcategory,recipe_name,recipe_type from fall_tbl where recipe_name = 'Pumpkin' AND recipe_type = 'Simple' "];
        recipeNameArr =[[NSMutableArray alloc]init];
        recipeNameArr =[[database executeQuery:queryname]mutableCopy];
        
        NSMutableArray *arr_name = [recipeNameArr valueForKey:@"recipe_subcategory"];
        
        //self.recipe_namelbl.text = [arr_name objectAtIndex:0];
        
        recipeNamestr = [arr_name objectAtIndex:0];
        
        //For ingredients
        
        NSString *queryingredients=[ NSString stringWithFormat:@"Select recipe_ingredients from fall_tbl where recipe_name = 'Pumpkin' AND recipe_type = 'Simple' "];
        recipeIngredientsArr =[[NSMutableArray alloc]init];
        recipeIngredientsArr =[[database executeQuery:queryingredients]mutableCopy];
        
        
        NSMutableArray *arr_ingredients  = [recipeIngredientsArr valueForKey:@"recipe_ingredients"];
        NSLog(@"%@",arr_ingredients);
        
        //self.recipe_ingredientslbl.text = [arr_ingredients objectAtIndex:0];
        // [self.recipe_ingredientslbl sizeToFit];
        
        recipeIngredientsstr = [arr_ingredients objectAtIndex:0];
        
        //For method
        NSString *querymethod=[ NSString stringWithFormat:@"Select recipe_method from fall_tbl where recipe_name = 'Pumpkin' AND recipe_type = 'Simple' "];
        recipeMethodArr =[[NSMutableArray alloc]init];
        recipeMethodArr =[[database executeQuery:querymethod]mutableCopy];
        
        
        NSMutableArray *arr_method  = [recipeMethodArr valueForKey:@"recipe_method"];
        NSLog(@"%@",arr_method);
        
        //self.recipe_methodlbl.text = [arr_method objectAtIndex:0];
        //[self.recipe_methodlbl sizeToFit];
        recipeMethodstr = [arr_method objectAtIndex:0];
        
        
        
        [database close];
    }
    
    
    // Raspberry.jpg
    
    if([self.imageFile isEqualToString: @"Raspberry.jpg"])
    {
        [self databaseOpen];
        
        
        //For name
        
        NSString *queryname= [NSString stringWithFormat:@"Select recipe_subcategory,recipe_name,recipe_type from fall_tbl where recipe_name = 'Raspberry' AND recipe_type = 'Simple' "];
        recipeNameArr =[[NSMutableArray alloc]init];
        recipeNameArr =[[database executeQuery:queryname]mutableCopy];
        
        NSMutableArray *arr_name = [recipeNameArr valueForKey:@"recipe_subcategory"];
        
        //self.recipe_namelbl.text = [arr_name objectAtIndex:0];
        
        recipeNamestr = [arr_name objectAtIndex:0];
        
        //For ingredients
        
        NSString *queryingredients=[ NSString stringWithFormat:@"Select recipe_ingredients from fall_tbl where recipe_name = 'Raspberry' AND recipe_type = 'Simple' "];
        recipeIngredientsArr =[[NSMutableArray alloc]init];
        recipeIngredientsArr =[[database executeQuery:queryingredients]mutableCopy];
        
        
        NSMutableArray *arr_ingredients  = [recipeIngredientsArr valueForKey:@"recipe_ingredients"];
        NSLog(@"%@",arr_ingredients);
        
        //self.recipe_ingredientslbl.text = [arr_ingredients objectAtIndex:0];
        // [self.recipe_ingredientslbl sizeToFit];
        
        recipeIngredientsstr = [arr_ingredients objectAtIndex:0];
        
        //For method
        NSString *querymethod=[ NSString stringWithFormat:@"Select recipe_method from fall_tbl where recipe_name = 'Raspberry' AND recipe_type = 'Simple' "];
        recipeMethodArr =[[NSMutableArray alloc]init];
        recipeMethodArr =[[database executeQuery:querymethod]mutableCopy];
        
        
        NSMutableArray *arr_method  = [recipeMethodArr valueForKey:@"recipe_method"];
        NSLog(@"%@",arr_method);
        
        //self.recipe_methodlbl.text = [arr_method objectAtIndex:0];
        //[self.recipe_methodlbl sizeToFit];
        recipeMethodstr = [arr_method objectAtIndex:0];
        
        
        
        [database close];
    }
    
    
    
    // Shallot.jpg
    
    if([self.imageFile isEqualToString: @"Shallot.jpg"])
    {
        [self databaseOpen];
        
        
        //For name
        
        NSString *queryname= [NSString stringWithFormat:@"Select recipe_subcategory,recipe_name,recipe_type from fall_tbl where recipe_name = 'Shallot' AND recipe_type = 'Simple' "];
        recipeNameArr =[[NSMutableArray alloc]init];
        recipeNameArr =[[database executeQuery:queryname]mutableCopy];
        
        NSMutableArray *arr_name = [recipeNameArr valueForKey:@"recipe_subcategory"];
        
        //self.recipe_namelbl.text = [arr_name objectAtIndex:0];
        
        recipeNamestr = [arr_name objectAtIndex:0];
        
        //For ingredients
        
        NSString *queryingredients=[ NSString stringWithFormat:@"Select recipe_ingredients from fall_tbl where recipe_name = 'Shallot' AND recipe_type = 'Simple' "];
        recipeIngredientsArr =[[NSMutableArray alloc]init];
        recipeIngredientsArr =[[database executeQuery:queryingredients]mutableCopy];
        
        
        NSMutableArray *arr_ingredients  = [recipeIngredientsArr valueForKey:@"recipe_ingredients"];
        NSLog(@"%@",arr_ingredients);
        
        //self.recipe_ingredientslbl.text = [arr_ingredients objectAtIndex:0];
        // [self.recipe_ingredientslbl sizeToFit];
        
        recipeIngredientsstr = [arr_ingredients objectAtIndex:0];
        
        //For method
        NSString *querymethod=[ NSString stringWithFormat:@"Select recipe_method from fall_tbl where recipe_name = 'Shallot' AND recipe_type = 'Simple' "];
        recipeMethodArr =[[NSMutableArray alloc]init];
        recipeMethodArr =[[database executeQuery:querymethod]mutableCopy];
        
        
        NSMutableArray *arr_method  = [recipeMethodArr valueForKey:@"recipe_method"];
        NSLog(@"%@",arr_method);
        
        //self.recipe_methodlbl.text = [arr_method objectAtIndex:0];
        //[self.recipe_methodlbl sizeToFit];
        recipeMethodstr = [arr_method objectAtIndex:0];
        
        
        
        [database close];
    }
    
       
    // Squash.jpg
    
    if([self.imageFile isEqualToString: @"Squash.jpg"])
    {
        [self databaseOpen];
        
        
        //For name
        
        NSString *queryname= [NSString stringWithFormat:@"Select recipe_subcategory,recipe_name,recipe_type from fall_tbl where recipe_name = 'Squash' AND recipe_type = 'Simple' "];
        recipeNameArr =[[NSMutableArray alloc]init];
        recipeNameArr =[[database executeQuery:queryname]mutableCopy];
        
        NSMutableArray *arr_name = [recipeNameArr valueForKey:@"recipe_subcategory"];
        
        //self.recipe_namelbl.text = [arr_name objectAtIndex:0];
        
        recipeNamestr = [arr_name objectAtIndex:0];
        
        //For ingredients
        
        NSString *queryingredients=[ NSString stringWithFormat:@"Select recipe_ingredients from fall_tbl where recipe_name = 'Squash' AND recipe_type = 'Simple' "];
        recipeIngredientsArr =[[NSMutableArray alloc]init];
        recipeIngredientsArr =[[database executeQuery:queryingredients]mutableCopy];
        
        
        NSMutableArray *arr_ingredients  = [recipeIngredientsArr valueForKey:@"recipe_ingredients"];
        NSLog(@"%@",arr_ingredients);
        
        //self.recipe_ingredientslbl.text = [arr_ingredients objectAtIndex:0];
        // [self.recipe_ingredientslbl sizeToFit];
        
        recipeIngredientsstr = [arr_ingredients objectAtIndex:0];
        
        //For method
        NSString *querymethod=[ NSString stringWithFormat:@"Select recipe_method from fall_tbl where recipe_name = 'Squash' AND recipe_type = 'Simple' "];
        recipeMethodArr =[[NSMutableArray alloc]init];
        recipeMethodArr =[[database executeQuery:querymethod]mutableCopy];
        
        
        NSMutableArray *arr_method  = [recipeMethodArr valueForKey:@"recipe_method"];
        NSLog(@"%@",arr_method);
        
        //self.recipe_methodlbl.text = [arr_method objectAtIndex:0];
        //[self.recipe_methodlbl sizeToFit];
        recipeMethodstr = [arr_method objectAtIndex:0];
        
        
        
        [database close];
    }
    
    
    
    // Turkey.jpg
    
    if([self.imageFile isEqualToString: @"Turkey.jpg"])
    {
        [self databaseOpen];
        
        
        //For name
        
        NSString *queryname= [NSString stringWithFormat:@"Select recipe_subcategory,recipe_name,recipe_type from fall_tbl where recipe_name = 'Turkey' AND recipe_type = 'Simple' "];
        recipeNameArr =[[NSMutableArray alloc]init];
        recipeNameArr =[[database executeQuery:queryname]mutableCopy];
        
        NSMutableArray *arr_name = [recipeNameArr valueForKey:@"recipe_subcategory"];
        
        //self.recipe_namelbl.text = [arr_name objectAtIndex:0];
        
        recipeNamestr = [arr_name objectAtIndex:0];
        
        //For ingredients
        
        NSString *queryingredients=[ NSString stringWithFormat:@"Select recipe_ingredients from fall_tbl where recipe_name = 'Turkey' AND recipe_type = 'Simple' "];
        recipeIngredientsArr =[[NSMutableArray alloc]init];
        recipeIngredientsArr =[[database executeQuery:queryingredients]mutableCopy];
        
        
        NSMutableArray *arr_ingredients  = [recipeIngredientsArr valueForKey:@"recipe_ingredients"];
        NSLog(@"%@",arr_ingredients);
        
        //self.recipe_ingredientslbl.text = [arr_ingredients objectAtIndex:0];
        // [self.recipe_ingredientslbl sizeToFit];
        
        recipeIngredientsstr = [arr_ingredients objectAtIndex:0];
        
        //For method
        NSString *querymethod=[ NSString stringWithFormat:@"Select recipe_method from fall_tbl where recipe_name = 'Turkey' AND recipe_type = 'Simple' "];
        recipeMethodArr =[[NSMutableArray alloc]init];
        recipeMethodArr =[[database executeQuery:querymethod]mutableCopy];
        
        
        NSMutableArray *arr_method  = [recipeMethodArr valueForKey:@"recipe_method"];
        NSLog(@"%@",arr_method);
        
        //self.recipe_methodlbl.text = [arr_method objectAtIndex:0];
        //[self.recipe_methodlbl sizeToFit];
        recipeMethodstr = [arr_method objectAtIndex:0];
        
        
        
        [database close];
    }
    
    
    
    // Venison.jpg
    
    if([self.imageFile isEqualToString: @"Venison.jpg"])
    {
        [self databaseOpen];
        
        
        //For name
        
        NSString *queryname= [NSString stringWithFormat:@"Select recipe_subcategory,recipe_name,recipe_type from fall_tbl where recipe_name = 'Venison' AND recipe_type = 'Simple' "];
        recipeNameArr =[[NSMutableArray alloc]init];
        recipeNameArr =[[database executeQuery:queryname]mutableCopy];
        
        NSMutableArray *arr_name = [recipeNameArr valueForKey:@"recipe_subcategory"];
        
        //self.recipe_namelbl.text = [arr_name objectAtIndex:0];
        
        recipeNamestr = [arr_name objectAtIndex:0];
        
        //For ingredients
        
        NSString *queryingredients=[ NSString stringWithFormat:@"Select recipe_ingredients from fall_tbl where recipe_name = 'Venison' AND recipe_type = 'Simple' "];
        recipeIngredientsArr =[[NSMutableArray alloc]init];
        recipeIngredientsArr =[[database executeQuery:queryingredients]mutableCopy];
        
        
        NSMutableArray *arr_ingredients  = [recipeIngredientsArr valueForKey:@"recipe_ingredients"];
        NSLog(@"%@",arr_ingredients);
        
        //self.recipe_ingredientslbl.text = [arr_ingredients objectAtIndex:0];
        // [self.recipe_ingredientslbl sizeToFit];
        
        recipeIngredientsstr = [arr_ingredients objectAtIndex:0];
        
        //For method
        NSString *querymethod=[ NSString stringWithFormat:@"Select recipe_method from fall_tbl where recipe_name = 'Venison' AND recipe_type = 'Simple' "];
        recipeMethodArr =[[NSMutableArray alloc]init];
        recipeMethodArr =[[database executeQuery:querymethod]mutableCopy];
        
        
        NSMutableArray *arr_method  = [recipeMethodArr valueForKey:@"recipe_method"];
        NSLog(@"%@",arr_method);
        
        //self.recipe_methodlbl.text = [arr_method objectAtIndex:0];
        //[self.recipe_methodlbl sizeToFit];
        recipeMethodstr = [arr_method objectAtIndex:0];
        
        
        
        [database close];
    }
    
    
    
    
    
    

}
    
    NSMutableArray *arr_recipe = [recipeNameArr valueForKey:@"recipe_name"];
    recipestr = [arr_recipe objectAtIndex:0];
    
    NSMutableArray *arr_recipetype = [recipeNameArr valueForKey:@"recipe_type"];
    recipeTypestr = [arr_recipetype objectAtIndex:0];
    
    [[NSUserDefaults standardUserDefaults]setValue:recipestr forKey:@"recipeName"];
    [[NSUserDefaults standardUserDefaults]setValue:recipeTypestr forKey:@"recipeType"];

}

-(IBAction)sensationalbtnPressed:(id)sender
{
    NSString *season = [[NSUserDefaults standardUserDefaults]valueForKey:@"recipe"];
    
    NSLog(@"%@",season);
    if([season isEqualToString:@"spring"])
    {
        if([self.imageFile isEqualToString: @"Peas.jpg"])
        {
            [self databaseOpen];
            
            
            //For name
            
            NSString *queryname= [NSString stringWithFormat:@"Select recipe_subcategory,recipe_name,recipe_type from spring_tbl where recipe_name ='PEA' AND recipe_type ='Sensational' "];
            recipeNameArr =[[NSMutableArray alloc]init];
            recipeNameArr =[[database executeQuery:queryname]mutableCopy];
            
            NSMutableArray *arr_name = [recipeNameArr valueForKey:@"recipe_subcategory"];
            
            //self.recipe_namelbl.text = [arr_name objectAtIndex:0];
            recipeNamestr = [arr_name objectAtIndex:0];
            
            //For ingredients
            
            NSString *queryingredients=[ NSString stringWithFormat:@"Select recipe_ingredients from spring_tbl where recipe_name ='PEA' AND recipe_type ='Sensational' "];
            recipeIngredientsArr =[[NSMutableArray alloc]init];
            recipeIngredientsArr =[[database executeQuery:queryingredients]mutableCopy];
            
            
            NSMutableArray *arr_ingredients  = [recipeIngredientsArr valueForKey:@"recipe_ingredients"];
            NSLog(@"%@",arr_ingredients);
            
            //self.recipe_ingredientslbl.text = [arr_ingredients objectAtIndex:0];
            // [self.recipe_ingredientslbl sizeToFit];
            recipeIngredientsstr = [arr_ingredients objectAtIndex:0];
            //For method
            NSString *querymethod=[ NSString stringWithFormat:@"Select recipe_method from spring_tbl where recipe_name ='PEA' AND recipe_type ='Sensational' "];
            recipeMethodArr =[[NSMutableArray alloc]init];
            recipeMethodArr =[[database executeQuery:querymethod]mutableCopy];
            
            
            NSMutableArray *arr_method  = [recipeMethodArr valueForKey:@"recipe_method"];
            NSLog(@"%@",arr_ingredients);
            
            //self.recipe_methodlbl.text = [arr_method objectAtIndex:0];
            //[self.recipe_methodlbl sizeToFit];
            
            recipeMethodstr = [arr_method objectAtIndex:0];
            
            [database close];
            
        }
        if([self.imageFile isEqualToString: @"Spinach.jpg"])
        {
            [self databaseOpen];
            
            
            //For name
            
            NSString *queryname= [NSString stringWithFormat:@"Select recipe_subcategory,recipe_name,recipe_type from spring_tbl where recipe_name ='SPINACH' AND recipe_type ='Sensational' "];
            recipeNameArr =[[NSMutableArray alloc]init];
            recipeNameArr =[[database executeQuery:queryname]mutableCopy];
            
            NSMutableArray *arr_name = [recipeNameArr valueForKey:@"recipe_subcategory"];
            
            //self.recipe_namelbl.text = [arr_name objectAtIndex:0];
            recipeNamestr = [arr_name objectAtIndex:0];
            
            //For ingredients
            
            NSString *queryingredients=[ NSString stringWithFormat:@"Select recipe_ingredients from spring_tbl where recipe_name ='SPINACH' AND recipe_type ='Sensational' "];
            recipeIngredientsArr =[[NSMutableArray alloc]init];
            recipeIngredientsArr =[[database executeQuery:queryingredients]mutableCopy];
            
            
            NSMutableArray *arr_ingredients  = [recipeIngredientsArr valueForKey:@"recipe_ingredients"];
            NSLog(@"%@",arr_ingredients);
            
            //self.recipe_ingredientslbl.text = [arr_ingredients objectAtIndex:0];
            // [self.recipe_ingredientslbl sizeToFit];
            recipeIngredientsstr = [arr_ingredients objectAtIndex:0];
            //For method
            NSString *querymethod=[ NSString stringWithFormat:@"Select recipe_method from spring_tbl where recipe_name ='SPINACH' AND recipe_type ='Sensational' "];
            recipeMethodArr =[[NSMutableArray alloc]init];
            recipeMethodArr =[[database executeQuery:querymethod]mutableCopy];
            
            
            NSMutableArray *arr_method  = [recipeMethodArr valueForKey:@"recipe_method"];
            NSLog(@"%@",arr_ingredients);
            
            //self.recipe_methodlbl.text = [arr_method objectAtIndex:0];
            //[self.recipe_methodlbl sizeToFit];
            
            recipeMethodstr = [arr_method objectAtIndex:0];
            
            [database close];
            
        }
        if([self.imageFile isEqualToString: @"Currant.jpg"])
        {
            [self databaseOpen];
            
            
            //For name
            
            NSString *queryname= [NSString stringWithFormat:@"Select recipe_subcategory,recipe_name,recipe_type from spring_tbl where recipe_name ='CURRANT' AND recipe_type ='Sensational' "];
            recipeNameArr =[[NSMutableArray alloc]init];
            recipeNameArr =[[database executeQuery:queryname]mutableCopy];
            
            NSMutableArray *arr_name = [recipeNameArr valueForKey:@"recipe_subcategory"];
            
            //self.recipe_namelbl.text = [arr_name objectAtIndex:0];
            recipeNamestr = [arr_name objectAtIndex:0];
            
            //For ingredients
            
            NSString *queryingredients=[ NSString stringWithFormat:@"Select recipe_ingredients from spring_tbl where recipe_name ='CURRANT' AND recipe_type ='Sensational' "];
            recipeIngredientsArr =[[NSMutableArray alloc]init];
            recipeIngredientsArr =[[database executeQuery:queryingredients]mutableCopy];
            
            
            NSMutableArray *arr_ingredients  = [recipeIngredientsArr valueForKey:@"recipe_ingredients"];
            NSLog(@"%@",arr_ingredients);
            
            //self.recipe_ingredientslbl.text = [arr_ingredients objectAtIndex:0];
            // [self.recipe_ingredientslbl sizeToFit];
            recipeIngredientsstr = [arr_ingredients objectAtIndex:0];
            //For method
            NSString *querymethod=[ NSString stringWithFormat:@"Select recipe_method from spring_tbl where recipe_name ='CURRANT' AND recipe_type ='Sensational' "];
            recipeMethodArr =[[NSMutableArray alloc]init];
            recipeMethodArr =[[database executeQuery:querymethod]mutableCopy];
            
            
            NSMutableArray *arr_method  = [recipeMethodArr valueForKey:@"recipe_method"];
            NSLog(@"%@",arr_ingredients);
            
            //self.recipe_methodlbl.text = [arr_method objectAtIndex:0];
            //[self.recipe_methodlbl sizeToFit];
            
            recipeMethodstr = [arr_method objectAtIndex:0];
            
            [database close];
            
        }

        if([self.imageFile isEqualToString: @"Asparagus.jpg"])
        {
            [self databaseOpen];
            
            
            //For name
            
            NSString *queryname= [NSString stringWithFormat:@"Select recipe_subcategory,recipe_name,recipe_type from spring_tbl where recipe_name ='ASPARAGUS' AND recipe_type ='Sensational' "];
            recipeNameArr =[[NSMutableArray alloc]init];
            recipeNameArr =[[database executeQuery:queryname]mutableCopy];
            
            NSMutableArray *arr_name = [recipeNameArr valueForKey:@"recipe_subcategory"];
            
            //self.recipe_namelbl.text = [arr_name objectAtIndex:0];
            
            recipeNamestr = [arr_name objectAtIndex:0];
            
            //For ingredients
            
            NSString *queryingredients=[ NSString stringWithFormat:@"Select recipe_ingredients from spring_tbl where recipe_name ='ASPARAGUS' AND recipe_type ='Sensational' "];
            recipeIngredientsArr =[[NSMutableArray alloc]init];
            recipeIngredientsArr =[[database executeQuery:queryingredients]mutableCopy];
            
            
            NSMutableArray *arr_ingredients  = [recipeIngredientsArr valueForKey:@"recipe_ingredients"];
            NSLog(@"%@",arr_ingredients);
            
            //self.recipe_ingredientslbl.text = [arr_ingredients objectAtIndex:0];
            // [self.recipe_ingredientslbl sizeToFit];
            
            recipeIngredientsstr = [arr_ingredients objectAtIndex:0];
            
            //For method
            NSString *querymethod=[ NSString stringWithFormat:@"Select recipe_method from spring_tbl where recipe_name ='ASPARAGUS' AND recipe_type ='Sensational' "];
            recipeMethodArr =[[NSMutableArray alloc]init];
            recipeMethodArr =[[database executeQuery:querymethod]mutableCopy];
            
            
            NSMutableArray *arr_method  = [recipeMethodArr valueForKey:@"recipe_method"];
            NSLog(@"%@",arr_method);
            
            //self.recipe_methodlbl.text = [arr_method objectAtIndex:0];
            //[self.recipe_methodlbl sizeToFit];
            recipeMethodstr = [arr_method objectAtIndex:0];
            
            
            
            [database close];
        }
        if([self.imageFile isEqualToString: @"Egg.jpg"])
        {
            [self databaseOpen];
            
            
            //For name
            
            NSString *queryname= [NSString stringWithFormat:@"Select recipe_subcategory,recipe_name,recipe_type from spring_tbl where recipe_name ='EGG' AND recipe_type ='Sensational' "];
            recipeNameArr =[[NSMutableArray alloc]init];
            recipeNameArr =[[database executeQuery:queryname]mutableCopy];
            
            NSMutableArray *arr_name = [recipeNameArr valueForKey:@"recipe_subcategory"];
            
            //self.recipe_namelbl.text = [arr_name objectAtIndex:0];
            recipeNamestr = [arr_name objectAtIndex:0];
            
            //For ingredients
            
            NSString *queryingredients=[ NSString stringWithFormat:@"Select recipe_ingredients from spring_tbl where recipe_name ='EGG' AND recipe_type ='Sensational' "];
            recipeIngredientsArr =[[NSMutableArray alloc]init];
            recipeIngredientsArr =[[database executeQuery:queryingredients]mutableCopy];
            
            
            NSMutableArray *arr_ingredients  = [recipeIngredientsArr valueForKey:@"recipe_ingredients"];
            NSLog(@"%@",arr_ingredients);
            
            //self.recipe_ingredientslbl.text = [arr_ingredients objectAtIndex:0];
            // [self.recipe_ingredientslbl sizeToFit];
            recipeIngredientsstr = [arr_ingredients objectAtIndex:0];
            
            //For method
            NSString *querymethod=[ NSString stringWithFormat:@"Select recipe_method from spring_tbl where recipe_name ='EGG' AND recipe_type ='Sensational' "];
            recipeMethodArr =[[NSMutableArray alloc]init];
            recipeMethodArr =[[database executeQuery:querymethod]mutableCopy];
            
            
            NSMutableArray *arr_method  = [recipeMethodArr valueForKey:@"recipe_method"];
            NSLog(@"%@",arr_ingredients);
            
            //self.recipe_methodlbl.text = [arr_method objectAtIndex:0];
            //[self.recipe_methodlbl sizeToFit];
            recipeMethodstr = [arr_method objectAtIndex:0];
            
            
            [database close];
            
        }
        if([self.imageFile isEqualToString: @"Quinoa.jpg"])
        {
            [self databaseOpen];
            
            
            //For name
            
            NSString *queryname= [NSString stringWithFormat:@"Select recipe_subcategory,recipe_name,recipe_type from spring_tbl where recipe_name ='QUINOA' AND recipe_type ='Sensational' "];
            recipeNameArr =[[NSMutableArray alloc]init];
            recipeNameArr =[[database executeQuery:queryname]mutableCopy];
            
            NSMutableArray *arr_name = [recipeNameArr valueForKey:@"recipe_subcategory"];
            
            //self.recipe_namelbl.text = [arr_name objectAtIndex:0];
            recipeNamestr = [arr_name objectAtIndex:0];
            
            
            //For ingredients
            
            NSString *queryingredients=[ NSString stringWithFormat:@"Select recipe_ingredients from spring_tbl where recipe_name ='QUINOA' AND recipe_type ='Sensational' "];
            recipeIngredientsArr =[[NSMutableArray alloc]init];
            recipeIngredientsArr =[[database executeQuery:queryingredients]mutableCopy];
            
            
            NSMutableArray *arr_ingredients  = [recipeIngredientsArr valueForKey:@"recipe_ingredients"];
            NSLog(@"%@",arr_ingredients);
            
            //self.recipe_ingredientslbl.text = [arr_ingredients objectAtIndex:0];
            // [self.recipe_ingredientslbl sizeToFit];
            recipeIngredientsstr = [arr_ingredients objectAtIndex:0];
            //For method
            NSString *querymethod=[ NSString stringWithFormat:@"Select recipe_method from spring_tbl where recipe_name ='QUINOA' AND recipe_type ='Sensational' "];
            recipeMethodArr =[[NSMutableArray alloc]init];
            recipeMethodArr =[[database executeQuery:querymethod]mutableCopy];
            
            
            NSMutableArray *arr_method  = [recipeMethodArr valueForKey:@"recipe_method"];
            NSLog(@"%@",arr_ingredients);
            
            //self.recipe_methodlbl.text = [arr_method objectAtIndex:0];
            //[self.recipe_methodlbl sizeToFit];
            
            recipeMethodstr = [arr_method objectAtIndex:0];
            
            [database close];
            
        }
        if([self.imageFile isEqualToString: @"Radish.jpg"])
        {
            [self databaseOpen];
            
            
            //For name
            
            NSString *queryname= [NSString stringWithFormat:@"Select recipe_subcategory,recipe_name,recipe_type from spring_tbl where recipe_name ='RADISH' AND recipe_type ='Sensational' "];
            recipeNameArr =[[NSMutableArray alloc]init];
            recipeNameArr =[[database executeQuery:queryname]mutableCopy];
            
            NSMutableArray *arr_name = [recipeNameArr valueForKey:@"recipe_subcategory"];
            
            //self.recipe_namelbl.text = [arr_name objectAtIndex:0];
            recipeNamestr = [arr_name objectAtIndex:0];
            
            //For ingredients
            
            NSString *queryingredients=[ NSString stringWithFormat:@"Select recipe_ingredients from spring_tbl where recipe_name ='RADISH' AND recipe_type ='Sensational' "];
            recipeIngredientsArr =[[NSMutableArray alloc]init];
            recipeIngredientsArr =[[database executeQuery:queryingredients]mutableCopy];
            
            
            NSMutableArray *arr_ingredients  = [recipeIngredientsArr valueForKey:@"recipe_ingredients"];
            NSLog(@"%@",arr_ingredients);
            
            //self.recipe_ingredientslbl.text = [arr_ingredients objectAtIndex:0];
            // [self.recipe_ingredientslbl sizeToFit];
            recipeIngredientsstr = [arr_ingredients objectAtIndex:0];
            //For method
            NSString *querymethod=[ NSString stringWithFormat:@"Select recipe_method from spring_tbl where recipe_name ='RADISH' AND recipe_type ='Sensational' "];
            recipeMethodArr =[[NSMutableArray alloc]init];
            recipeMethodArr =[[database executeQuery:querymethod]mutableCopy];
            
            
            NSMutableArray *arr_method  = [recipeMethodArr valueForKey:@"recipe_method"];
            NSLog(@"%@",arr_ingredients);
            
            //self.recipe_methodlbl.text = [arr_method objectAtIndex:0];
            //[self.recipe_methodlbl sizeToFit];
            
            recipeMethodstr = [arr_method objectAtIndex:0];
            
            [database close];
            
        }
        if([self.imageFile isEqualToString: @"Rhubarb.jpg"])
        {
            [self databaseOpen];
            
            
            //For name
            
            NSString *queryname= [NSString stringWithFormat:@"Select recipe_subcategory,recipe_name,recipe_type from spring_tbl where recipe_name ='RHUBARB' AND recipe_type ='Sensational' "];
            recipeNameArr =[[NSMutableArray alloc]init];
            recipeNameArr =[[database executeQuery:queryname]mutableCopy];
            
            NSMutableArray *arr_name = [recipeNameArr valueForKey:@"recipe_subcategory"];
            
            //self.recipe_namelbl.text = [arr_name objectAtIndex:0];
            recipeNamestr = [arr_name objectAtIndex:0];
            
            //For ingredients
            
            NSString *queryingredients=[ NSString stringWithFormat:@"Select recipe_ingredients from spring_tbl where recipe_name ='RHUBARB' AND recipe_type ='Sensational' "];
            recipeIngredientsArr =[[NSMutableArray alloc]init];
            recipeIngredientsArr =[[database executeQuery:queryingredients]mutableCopy];
            
            
            NSMutableArray *arr_ingredients  = [recipeIngredientsArr valueForKey:@"recipe_ingredients"];
            NSLog(@"%@",arr_ingredients);
            
            //self.recipe_ingredientslbl.text = [arr_ingredients objectAtIndex:0];
            // [self.recipe_ingredientslbl sizeToFit];
            recipeIngredientsstr = [arr_ingredients objectAtIndex:0];
            //For method
            NSString *querymethod=[ NSString stringWithFormat:@"Select recipe_method from spring_tbl where recipe_name ='RHUBARB' AND recipe_type ='Sensational' "];
            recipeMethodArr =[[NSMutableArray alloc]init];
            recipeMethodArr =[[database executeQuery:querymethod]mutableCopy];
            
            
            NSMutableArray *arr_method  = [recipeMethodArr valueForKey:@"recipe_method"];
            NSLog(@"%@",arr_ingredients);
            
            //self.recipe_methodlbl.text = [arr_method objectAtIndex:0];
            //[self.recipe_methodlbl sizeToFit];
            
            recipeMethodstr = [arr_method objectAtIndex:0];
            
            [database close];
            
        }
        if([self.imageFile isEqualToString: @"Broccoli.jpg"])
        {
            [self databaseOpen];
            
            
            //For name
            
            NSString *queryname= [NSString stringWithFormat:@"Select recipe_subcategory,recipe_name,recipe_type from spring_tbl where recipe_name ='BROCCOLI' AND recipe_type ='Sensational' "];
            recipeNameArr =[[NSMutableArray alloc]init];
            recipeNameArr =[[database executeQuery:queryname]mutableCopy];
            
            NSMutableArray *arr_name = [recipeNameArr valueForKey:@"recipe_subcategory"];
            
            //self.recipe_namelbl.text = [arr_name objectAtIndex:0];
            recipeNamestr = [arr_name objectAtIndex:0];
            
            //For ingredients
            
            NSString *queryingredients=[ NSString stringWithFormat:@"Select recipe_ingredients from spring_tbl where recipe_name ='BROCCOLI' AND recipe_type ='Sensational' "];
            recipeIngredientsArr =[[NSMutableArray alloc]init];
            recipeIngredientsArr =[[database executeQuery:queryingredients]mutableCopy];
            
            
            NSMutableArray *arr_ingredients  = [recipeIngredientsArr valueForKey:@"recipe_ingredients"];
            NSLog(@"%@",arr_ingredients);
            
            //self.recipe_ingredientslbl.text = [arr_ingredients objectAtIndex:0];
            // [self.recipe_ingredientslbl sizeToFit];
            recipeIngredientsstr = [arr_ingredients objectAtIndex:0];
            //For method
            NSString *querymethod=[ NSString stringWithFormat:@"Select recipe_method from spring_tbl where recipe_name ='BROCCOLI' AND recipe_type ='Sensational' "];
            recipeMethodArr =[[NSMutableArray alloc]init];
            recipeMethodArr =[[database executeQuery:querymethod]mutableCopy];
            
            
            NSMutableArray *arr_method  = [recipeMethodArr valueForKey:@"recipe_method"];
            NSLog(@"%@",arr_ingredients);
            
            //self.recipe_methodlbl.text = [arr_method objectAtIndex:0];
            //[self.recipe_methodlbl sizeToFit];
            
            recipeMethodstr = [arr_method objectAtIndex:0];
            
            [database close];
            
        }
        if([self.imageFile isEqualToString: @"Crab.jpg"])
        {
            [self databaseOpen];
            
            
            //For name
            
            NSString *queryname= [NSString stringWithFormat:@"Select recipe_subcategory,recipe_name,recipe_type from spring_tbl where recipe_name ='CRAB' AND recipe_type ='Sensational' "];
            recipeNameArr =[[NSMutableArray alloc]init];
            recipeNameArr =[[database executeQuery:queryname]mutableCopy];
            
            NSMutableArray *arr_name = [recipeNameArr valueForKey:@"recipe_subcategory"];
            
            //self.recipe_namelbl.text = [arr_name objectAtIndex:0];
            recipeNamestr = [arr_name objectAtIndex:0];
            
            //For ingredients
            
            NSString *queryingredients=[ NSString stringWithFormat:@"Select recipe_ingredients from spring_tbl where recipe_name ='CRAB' AND recipe_type ='Sensational' "];
            recipeIngredientsArr =[[NSMutableArray alloc]init];
            recipeIngredientsArr =[[database executeQuery:queryingredients]mutableCopy];
            
            
            NSMutableArray *arr_ingredients  = [recipeIngredientsArr valueForKey:@"recipe_ingredients"];
            NSLog(@"%@",arr_ingredients);
            
            //self.recipe_ingredientslbl.text = [arr_ingredients objectAtIndex:0];
            // [self.recipe_ingredientslbl sizeToFit];
            recipeIngredientsstr = [arr_ingredients objectAtIndex:0];
            //For method
            NSString *querymethod=[ NSString stringWithFormat:@"Select recipe_method from spring_tbl where recipe_name ='CRAB' AND recipe_type ='Sensational' "];
            recipeMethodArr =[[NSMutableArray alloc]init];
            recipeMethodArr =[[database executeQuery:querymethod]mutableCopy];
            
            
            NSMutableArray *arr_method  = [recipeMethodArr valueForKey:@"recipe_method"];
            NSLog(@"%@",arr_ingredients);
            
            //self.recipe_methodlbl.text = [arr_method objectAtIndex:0];
            //[self.recipe_methodlbl sizeToFit];
            
            
            recipeMethodstr = [arr_method objectAtIndex:0];
            [database close];
            
        }
        if([self.imageFile isEqualToString: @"Escarole.jpg"])
        {
            [self databaseOpen];
            
            
            //For name
            
            NSString *queryname= [NSString stringWithFormat:@"Select recipe_subcategory,recipe_name,recipe_type from spring_tbl where recipe_name ='ESCAROLE' AND recipe_type ='Sensational' "];
            recipeNameArr =[[NSMutableArray alloc]init];
            recipeNameArr =[[database executeQuery:queryname]mutableCopy];
            
            NSMutableArray *arr_name = [recipeNameArr valueForKey:@"recipe_subcategory"];
            
            //self.recipe_namelbl.text = [arr_name objectAtIndex:0];
            recipeNamestr = [arr_name objectAtIndex:0];
            
            //For ingredients
            
            NSString *queryingredients=[ NSString stringWithFormat:@"Select recipe_ingredients from spring_tbl where recipe_name ='ESCAROLE' AND recipe_type ='Sensational' "];
            recipeIngredientsArr =[[NSMutableArray alloc]init];
            recipeIngredientsArr =[[database executeQuery:queryingredients]mutableCopy];
            
            
            NSMutableArray *arr_ingredients  = [recipeIngredientsArr valueForKey:@"recipe_ingredients"];
            NSLog(@"%@",arr_ingredients);
            
            //self.recipe_ingredientslbl.text = [arr_ingredients objectAtIndex:0];
            // [self.recipe_ingredientslbl sizeToFit];
            recipeIngredientsstr = [arr_ingredients objectAtIndex:0];
            //For method
            NSString *querymethod=[ NSString stringWithFormat:@"Select recipe_method from spring_tbl where recipe_name ='ESCAROLE' AND recipe_type ='Sensational' "];
            recipeMethodArr =[[NSMutableArray alloc]init];
            recipeMethodArr =[[database executeQuery:querymethod]mutableCopy];
            
            
            NSMutableArray *arr_method  = [recipeMethodArr valueForKey:@"recipe_method"];
            NSLog(@"%@",arr_ingredients);
            
            //self.recipe_methodlbl.text = [arr_method objectAtIndex:0];
            //[self.recipe_methodlbl sizeToFit];
            
            recipeMethodstr = [arr_method objectAtIndex:0];
            
            [database close];
            
        }
        if([self.imageFile isEqualToString: @"Fennel.jpg"])
        {
            [self databaseOpen];
            
            
            //For name
            
            NSString *queryname= [NSString stringWithFormat:@"Select recipe_subcategory,recipe_name,recipe_type from spring_tbl where recipe_name ='FENNEL' AND recipe_type ='Sensational' "];
            recipeNameArr =[[NSMutableArray alloc]init];
            recipeNameArr =[[database executeQuery:queryname]mutableCopy];
            
            NSMutableArray *arr_name = [recipeNameArr valueForKey:@"recipe_subcategory"];
            recipeNamestr = [arr_name objectAtIndex:0];
            //self.recipe_namelbl.text = [arr_name objectAtIndex:0];
            
            
            //For ingredients
            
            NSString *queryingredients=[ NSString stringWithFormat:@"Select recipe_ingredients from spring_tbl where recipe_name ='FENNEL' AND recipe_type ='Sensational' "];
            recipeIngredientsArr =[[NSMutableArray alloc]init];
            recipeIngredientsArr =[[database executeQuery:queryingredients]mutableCopy];
            
            
            NSMutableArray *arr_ingredients  = [recipeIngredientsArr valueForKey:@"recipe_ingredients"];
            NSLog(@"%@",arr_ingredients);
            
            //self.recipe_ingredientslbl.text = [arr_ingredients objectAtIndex:0];
            // [self.recipe_ingredientslbl sizeToFit];
            recipeIngredientsstr = [arr_ingredients objectAtIndex:0];
            //For method
            NSString *querymethod=[ NSString stringWithFormat:@"Select recipe_method from spring_tbl where recipe_name ='FENNEL' AND recipe_type ='Sensational' "];
            recipeMethodArr =[[NSMutableArray alloc]init];
            recipeMethodArr =[[database executeQuery:querymethod]mutableCopy];
            
            
            NSMutableArray *arr_method  = [recipeMethodArr valueForKey:@"recipe_method"];
            NSLog(@"%@",arr_ingredients);
            
            //self.recipe_methodlbl.text = [arr_method objectAtIndex:0];
            //[self.recipe_methodlbl sizeToFit];
            
            
            recipeMethodstr = [arr_method objectAtIndex:0];
            [database close];
            
        }
        if([self.imageFile isEqualToString: @"Fiddlehead-Ferns.jpg"])
        {
            [self databaseOpen];
            
            
            //For name
            
            NSString *queryname= [NSString stringWithFormat:@"Select recipe_subcategory,recipe_name,recipe_type from spring_tbl where recipe_name ='FIDDLEHEAD FERNS' AND recipe_type ='Sensational' "];
            recipeNameArr =[[NSMutableArray alloc]init];
            recipeNameArr =[[database executeQuery:queryname]mutableCopy];
            
            NSMutableArray *arr_name = [recipeNameArr valueForKey:@"recipe_subcategory"];
            recipeNamestr = [arr_name objectAtIndex:0];
            //self.recipe_namelbl.text = [arr_name objectAtIndex:0];
            
            
            //For ingredients
            
            NSString *queryingredients=[ NSString stringWithFormat:@"Select recipe_ingredients from spring_tbl where recipe_name ='FIDDLEHEAD FERNS' AND recipe_type ='Sensational' "];
            recipeIngredientsArr =[[NSMutableArray alloc]init];
            recipeIngredientsArr =[[database executeQuery:queryingredients]mutableCopy];
            
            
            NSMutableArray *arr_ingredients  = [recipeIngredientsArr valueForKey:@"recipe_ingredients"];
            NSLog(@"%@",arr_ingredients);
            
            //self.recipe_ingredientslbl.text = [arr_ingredients objectAtIndex:0];
            // [self.recipe_ingredientslbl sizeToFit];
            recipeIngredientsstr = [arr_ingredients objectAtIndex:0];
            //For method
            NSString *querymethod=[ NSString stringWithFormat:@"Select recipe_method from spring_tbl where recipe_name ='FIDDLEHEAD FERNS' AND recipe_type ='Sensational' "];
            recipeMethodArr =[[NSMutableArray alloc]init];
            recipeMethodArr =[[database executeQuery:querymethod]mutableCopy];
            
            
            NSMutableArray *arr_method  = [recipeMethodArr valueForKey:@"recipe_method"];
            NSLog(@"%@",arr_ingredients);
            
            //self.recipe_methodlbl.text = [arr_method objectAtIndex:0];
            //[self.recipe_methodlbl sizeToFit];
            
            
            recipeMethodstr = [arr_method objectAtIndex:0];
            [database close];
            
        }
        if([self.imageFile isEqualToString: @"Flounder.jpg"])
        {
            [self databaseOpen];
            
            
            //For name
            
            NSString *queryname= [NSString stringWithFormat:@"Select recipe_subcategory,recipe_name,recipe_type from spring_tbl where recipe_name ='FLOUNDER' AND recipe_type ='Sensational' "];
            recipeNameArr =[[NSMutableArray alloc]init];
            recipeNameArr =[[database executeQuery:queryname]mutableCopy];
            
            NSMutableArray *arr_name = [recipeNameArr valueForKey:@"recipe_subcategory"];
            recipeNamestr = [arr_name objectAtIndex:0];
            //self.recipe_namelbl.text = [arr_name objectAtIndex:0];
            
            
            //For ingredients
            
            NSString *queryingredients=[ NSString stringWithFormat:@"Select recipe_ingredients from spring_tbl where recipe_name ='FLOUNDER' AND recipe_type ='Sensational' "];
            recipeIngredientsArr =[[NSMutableArray alloc]init];
            recipeIngredientsArr =[[database executeQuery:queryingredients]mutableCopy];
            
            
            NSMutableArray *arr_ingredients  = [recipeIngredientsArr valueForKey:@"recipe_ingredients"];
            NSLog(@"%@",arr_ingredients);
            
            //self.recipe_ingredientslbl.text = [arr_ingredients objectAtIndex:0];
            // [self.recipe_ingredientslbl sizeToFit];
            recipeIngredientsstr = [arr_ingredients objectAtIndex:0];
            //For method
            NSString *querymethod=[ NSString stringWithFormat:@"Select recipe_method from spring_tbl where recipe_name ='FLOUNDER' AND recipe_type ='Sensational' "];
            recipeMethodArr =[[NSMutableArray alloc]init];
            recipeMethodArr =[[database executeQuery:querymethod]mutableCopy];
            
            
            NSMutableArray *arr_method  = [recipeMethodArr valueForKey:@"recipe_method"];
            NSLog(@"%@",arr_ingredients);
            
            //self.recipe_methodlbl.text = [arr_method objectAtIndex:0];
            //[self.recipe_methodlbl sizeToFit];
            
            
            recipeMethodstr = [arr_method objectAtIndex:0];
            [database close];
            
        }
        
        if([self.imageFile isEqualToString: @"Ginger.jpg"])
        {
            [self databaseOpen];
            
            
            //For name
            
            NSString *queryname= [NSString stringWithFormat:@"Select recipe_subcategory,recipe_name,recipe_type from spring_tbl where recipe_name ='GINGER' AND recipe_type ='Sensational' "];
            recipeNameArr =[[NSMutableArray alloc]init];
            recipeNameArr =[[database executeQuery:queryname]mutableCopy];
            
            NSMutableArray *arr_name = [recipeNameArr valueForKey:@"recipe_subcategory"];
            
            //self.recipe_namelbl.text = [arr_name objectAtIndex:0];
            recipeNamestr = [arr_name objectAtIndex:0];
            
            //For ingredients
            
            NSString *queryingredients=[ NSString stringWithFormat:@"Select recipe_ingredients from spring_tbl where recipe_name ='GINGER' AND recipe_type ='Sensational' "];
            recipeIngredientsArr =[[NSMutableArray alloc]init];
            recipeIngredientsArr =[[database executeQuery:queryingredients]mutableCopy];
            
            
            NSMutableArray *arr_ingredients  = [recipeIngredientsArr valueForKey:@"recipe_ingredients"];
            NSLog(@"%@",arr_ingredients);
            recipeIngredientsstr = [arr_ingredients objectAtIndex:0];
            //self.recipe_ingredientslbl.text = [arr_ingredients objectAtIndex:0];
            // [self.recipe_ingredientslbl sizeToFit];
            
            //For method
            NSString *querymethod=[ NSString stringWithFormat:@"Select recipe_method from spring_tbl where recipe_name ='GINGER' AND recipe_type ='Sensational' "];
            recipeMethodArr =[[NSMutableArray alloc]init];
            recipeMethodArr =[[database executeQuery:querymethod]mutableCopy];
            
            
            NSMutableArray *arr_method  = [recipeMethodArr valueForKey:@"recipe_method"];
            NSLog(@"%@",arr_ingredients);
            
            //self.recipe_methodlbl.text = [arr_method objectAtIndex:0];
            //[self.recipe_methodlbl sizeToFit];
            
            
            recipeMethodstr = [arr_method objectAtIndex:0];
            [database close];
            
        }
        if([self.imageFile isEqualToString: @"Grapefruit.jpg"])
        {
            [self databaseOpen];
            
            
            //For name
            
            NSString *queryname= [NSString stringWithFormat:@"Select recipe_subcategory,recipe_name,recipe_type from spring_tbl where recipe_name ='GRAPEFRUIT' AND recipe_type ='Sensational' "];
            recipeNameArr =[[NSMutableArray alloc]init];
            recipeNameArr =[[database executeQuery:queryname]mutableCopy];
            
            NSMutableArray *arr_name = [recipeNameArr valueForKey:@"recipe_subcategory"];
            
            //self.recipe_namelbl.text = [arr_name objectAtIndex:0];
            recipeNamestr = [arr_name objectAtIndex:0];
            
            //For ingredients
            
            NSString *queryingredients=[ NSString stringWithFormat:@"Select recipe_ingredients from spring_tbl where recipe_name ='GRAPEFRUIT' AND recipe_type ='Sensational' "];
            recipeIngredientsArr =[[NSMutableArray alloc]init];
            recipeIngredientsArr =[[database executeQuery:queryingredients]mutableCopy];
            
            
            NSMutableArray *arr_ingredients  = [recipeIngredientsArr valueForKey:@"recipe_ingredients"];
            NSLog(@"%@",arr_ingredients);
            recipeIngredientsstr = [arr_ingredients objectAtIndex:0];
            //self.recipe_ingredientslbl.text = [arr_ingredients objectAtIndex:0];
            // [self.recipe_ingredientslbl sizeToFit];
            
            //For method
            NSString *querymethod=[ NSString stringWithFormat:@"Select recipe_method from spring_tbl where recipe_name ='GRAPEFRUIT' AND recipe_type ='Sensational' "];
            recipeMethodArr =[[NSMutableArray alloc]init];
            recipeMethodArr =[[database executeQuery:querymethod]mutableCopy];
            
            
            NSMutableArray *arr_method  = [recipeMethodArr valueForKey:@"recipe_method"];
            NSLog(@"%@",arr_ingredients);
            
            //self.recipe_methodlbl.text = [arr_method objectAtIndex:0];
            //[self.recipe_methodlbl sizeToFit];
            
            
            recipeMethodstr = [arr_method objectAtIndex:0];
            [database close];
            
        }
        if([self.imageFile isEqualToString: @"Lamb.jpg"])
        {
            [self databaseOpen];
            
            
            //For name
            
            NSString *queryname= [NSString stringWithFormat:@"Select recipe_subcategory,recipe_name,recipe_type from spring_tbl where recipe_name ='LAMB' AND recipe_type ='Sensational' "];
            recipeNameArr =[[NSMutableArray alloc]init];
            recipeNameArr =[[database executeQuery:queryname]mutableCopy];
            
            NSMutableArray *arr_name = [recipeNameArr valueForKey:@"recipe_subcategory"];
            
            //self.recipe_namelbl.text = [arr_name objectAtIndex:0];
            recipeNamestr = [arr_name objectAtIndex:0];
            
            //For ingredients
            
            NSString *queryingredients=[ NSString stringWithFormat:@"Select recipe_ingredients from spring_tbl where recipe_name ='LAMB' AND recipe_type ='Sensational' "];
            recipeIngredientsArr =[[NSMutableArray alloc]init];
            recipeIngredientsArr =[[database executeQuery:queryingredients]mutableCopy];
            
            
            NSMutableArray *arr_ingredients  = [recipeIngredientsArr valueForKey:@"recipe_ingredients"];
            NSLog(@"%@",arr_ingredients);
            recipeIngredientsstr = [arr_ingredients objectAtIndex:0];
            //self.recipe_ingredientslbl.text = [arr_ingredients objectAtIndex:0];
            // [self.recipe_ingredientslbl sizeToFit];
            
            //For method
            NSString *querymethod=[ NSString stringWithFormat:@"Select recipe_method from spring_tbl where recipe_name ='LAMB' AND recipe_type ='Sensational' "];
            recipeMethodArr =[[NSMutableArray alloc]init];
            recipeMethodArr =[[database executeQuery:querymethod]mutableCopy];
            
            
            NSMutableArray *arr_method  = [recipeMethodArr valueForKey:@"recipe_method"];
            NSLog(@"%@",arr_ingredients);
            
            //self.recipe_methodlbl.text = [arr_method objectAtIndex:0];
            //[self.recipe_methodlbl sizeToFit];
            
            recipeMethodstr = [arr_method objectAtIndex:0];
            
            [database close];
            
        }
        if([self.imageFile isEqualToString: @"Leek.jpg"])
        {
            [self databaseOpen];
            
            
            //For name
            
            NSString *queryname= [NSString stringWithFormat:@"Select recipe_subcategory,recipe_name,recipe_type from spring_tbl where recipe_name ='LEEK' AND recipe_type ='Sensational' "];
            recipeNameArr =[[NSMutableArray alloc]init];
            recipeNameArr =[[database executeQuery:queryname]mutableCopy];
            
            NSMutableArray *arr_name = [recipeNameArr valueForKey:@"recipe_subcategory"];
            
            //self.recipe_namelbl.text = [arr_name objectAtIndex:0];
            recipeNamestr = [arr_name objectAtIndex:0];
            
            //For ingredients
            
            NSString *queryingredients=[ NSString stringWithFormat:@"Select recipe_ingredients from spring_tbl where recipe_name ='LEEK' AND recipe_type ='Sensational' "];
            recipeIngredientsArr =[[NSMutableArray alloc]init];
            recipeIngredientsArr =[[database executeQuery:queryingredients]mutableCopy];
            
            
            NSMutableArray *arr_ingredients  = [recipeIngredientsArr valueForKey:@"recipe_ingredients"];
            NSLog(@"%@",arr_ingredients);
            recipeIngredientsstr = [arr_ingredients objectAtIndex:0];
            //self.recipe_ingredientslbl.text = [arr_ingredients objectAtIndex:0];
            // [self.recipe_ingredientslbl sizeToFit];
            
            //For method
            NSString *querymethod=[ NSString stringWithFormat:@"Select recipe_method from spring_tbl where recipe_name ='LEEK' AND recipe_type ='Sensational' "];
            recipeMethodArr =[[NSMutableArray alloc]init];
            recipeMethodArr =[[database executeQuery:querymethod]mutableCopy];
            
            
            NSMutableArray *arr_method  = [recipeMethodArr valueForKey:@"recipe_method"];
            NSLog(@"%@",arr_ingredients);
            
            //self.recipe_methodlbl.text = [arr_method objectAtIndex:0];
            //[self.recipe_methodlbl sizeToFit];
            
            recipeMethodstr = [arr_method objectAtIndex:0];
            
            [database close];
            
        }
        if([self.imageFile isEqualToString: @"Lemon.jpg"])
        {
            [self databaseOpen];
            
            
            //For name
            
            NSString *queryname= [NSString stringWithFormat:@"Select recipe_subcategory,recipe_name,recipe_type from spring_tbl where recipe_name ='LEMON' AND recipe_type ='Sensational' "];
            recipeNameArr =[[NSMutableArray alloc]init];
            recipeNameArr =[[database executeQuery:queryname]mutableCopy];
            
            NSMutableArray *arr_name = [recipeNameArr valueForKey:@"recipe_subcategory"];
            recipeNamestr = [arr_name objectAtIndex:0];
            //self.recipe_namelbl.text = [arr_name objectAtIndex:0];
            
            
            //For ingredients
            
            NSString *queryingredients=[ NSString stringWithFormat:@"Select recipe_ingredients from spring_tbl where recipe_name ='LEMON' AND recipe_type ='Sensational' "];
            recipeIngredientsArr =[[NSMutableArray alloc]init];
            recipeIngredientsArr =[[database executeQuery:queryingredients]mutableCopy];
            
            
            NSMutableArray *arr_ingredients  = [recipeIngredientsArr valueForKey:@"recipe_ingredients"];
            NSLog(@"%@",arr_ingredients);
            recipeIngredientsstr = [arr_ingredients objectAtIndex:0];
            //self.recipe_ingredientslbl.text = [arr_ingredients objectAtIndex:0];
            // [self.recipe_ingredientslbl sizeToFit];
            
            //For method
            NSString *querymethod=[ NSString stringWithFormat:@"Select recipe_method from spring_tbl where recipe_name ='LEMON' AND recipe_type ='Sensational' "];
            recipeMethodArr =[[NSMutableArray alloc]init];
            recipeMethodArr =[[database executeQuery:querymethod]mutableCopy];
            
            
            NSMutableArray *arr_method  = [recipeMethodArr valueForKey:@"recipe_method"];
            NSLog(@"%@",arr_ingredients);
            
            //self.recipe_methodlbl.text = [arr_method objectAtIndex:0];
            //[self.recipe_methodlbl sizeToFit];
            
            
            recipeMethodstr = [arr_method objectAtIndex:0];
            [database close];
            
        }
        if([self.imageFile isEqualToString: @"Mint.jpg"])
        {
            [self databaseOpen];
            
            
            //For name
            
            NSString *queryname= [NSString stringWithFormat:@"Select recipe_subcategory,recipe_name,recipe_type from spring_tbl where recipe_name ='MINT' AND recipe_type ='Sensational' "];
            recipeNameArr =[[NSMutableArray alloc]init];
            recipeNameArr =[[database executeQuery:queryname]mutableCopy];
            
            NSMutableArray *arr_name = [recipeNameArr valueForKey:@"recipe_subcategory"];
            recipeNamestr = [arr_name objectAtIndex:0];
            //self.recipe_namelbl.text = [arr_name objectAtIndex:0];
            
            
            //For ingredients
            
            NSString *queryingredients=[ NSString stringWithFormat:@"Select recipe_ingredients from spring_tbl where recipe_name ='MINT' AND recipe_type ='Sensational' "];
            recipeIngredientsArr =[[NSMutableArray alloc]init];
            recipeIngredientsArr =[[database executeQuery:queryingredients]mutableCopy];
            
            
            NSMutableArray *arr_ingredients  = [recipeIngredientsArr valueForKey:@"recipe_ingredients"];
            NSLog(@"%@",arr_ingredients);
            recipeIngredientsstr = [arr_ingredients objectAtIndex:0];
            //self.recipe_ingredientslbl.text = [arr_ingredients objectAtIndex:0];
            // [self.recipe_ingredientslbl sizeToFit];
            
            //For method
            NSString *querymethod=[ NSString stringWithFormat:@"Select recipe_method from spring_tbl where recipe_name ='MINT' AND recipe_type ='Sensational' "];
            recipeMethodArr =[[NSMutableArray alloc]init];
            recipeMethodArr =[[database executeQuery:querymethod]mutableCopy];
            
            
            NSMutableArray *arr_method  = [recipeMethodArr valueForKey:@"recipe_method"];
            NSLog(@"%@",arr_ingredients);
            
            //self.recipe_methodlbl.text = [arr_method objectAtIndex:0];
            //[self.recipe_methodlbl sizeToFit];
            
            recipeMethodstr = [arr_method objectAtIndex:0];
            
            [database close];
            
        }
        if([self.imageFile isEqualToString: @"Olive.jpg"])
        {
            [self databaseOpen];
            
            
            //For name
            
            NSString *queryname= [NSString stringWithFormat:@"Select recipe_subcategory,recipe_name,recipe_type from spring_tbl where recipe_name ='OLIVE' AND recipe_type ='Sensational' "];
            recipeNameArr =[[NSMutableArray alloc]init];
            recipeNameArr =[[database executeQuery:queryname]mutableCopy];
            
            NSMutableArray *arr_name = [recipeNameArr valueForKey:@"recipe_subcategory"];
            recipeNamestr = [arr_name objectAtIndex:0];
            //self.recipe_namelbl.text = [arr_name objectAtIndex:0];
            
            
            //For ingredients
            
            NSString *queryingredients=[ NSString stringWithFormat:@"Select recipe_ingredients from spring_tbl where recipe_name ='OLIVE' AND recipe_type ='Sensational' "];
            recipeIngredientsArr =[[NSMutableArray alloc]init];
            recipeIngredientsArr =[[database executeQuery:queryingredients]mutableCopy];
            
            
            NSMutableArray *arr_ingredients  = [recipeIngredientsArr valueForKey:@"recipe_ingredients"];
            NSLog(@"%@",arr_ingredients);
            recipeIngredientsstr = [arr_ingredients objectAtIndex:0];
            //self.recipe_ingredientslbl.text = [arr_ingredients objectAtIndex:0];
            // [self.recipe_ingredientslbl sizeToFit];
            
            //For method
            NSString *querymethod=[ NSString stringWithFormat:@"Select recipe_method from spring_tbl where recipe_name ='OLIVE' AND recipe_type ='Sensational' "];
            recipeMethodArr =[[NSMutableArray alloc]init];
            recipeMethodArr =[[database executeQuery:querymethod]mutableCopy];
            
            
            NSMutableArray *arr_method  = [recipeMethodArr valueForKey:@"recipe_method"];
            NSLog(@"%@",arr_ingredients);
            
            //self.recipe_methodlbl.text = [arr_method objectAtIndex:0];
            //[self.recipe_methodlbl sizeToFit];
            
            recipeMethodstr = [arr_method objectAtIndex:0];
            
            [database close];
            
        }
        if([self.imageFile isEqualToString: @"Sea-Vegetables.jpg"])
        {
            [self databaseOpen];
            
            
            //For name
            
            NSString *queryname= [NSString stringWithFormat:@"Select recipe_subcategory,recipe_name,recipe_type from spring_tbl where recipe_name ='SEA VEGETABLES' AND recipe_type ='Sensational' "];
            recipeNameArr =[[NSMutableArray alloc]init];
            recipeNameArr =[[database executeQuery:queryname]mutableCopy];
            
            NSMutableArray *arr_name = [recipeNameArr valueForKey:@"recipe_subcategory"];
            recipeNamestr = [arr_name objectAtIndex:0];
            //self.recipe_namelbl.text = [arr_name objectAtIndex:0];
            
            
            //For ingredients
            
            NSString *queryingredients=[ NSString stringWithFormat:@"Select recipe_ingredients from spring_tbl where recipe_name ='SEA VEGETABLES' AND recipe_type ='Sensational' "];
            recipeIngredientsArr =[[NSMutableArray alloc]init];
            recipeIngredientsArr =[[database executeQuery:queryingredients]mutableCopy];
            
            
            NSMutableArray *arr_ingredients  = [recipeIngredientsArr valueForKey:@"recipe_ingredients"];
            NSLog(@"%@",arr_ingredients);
            recipeIngredientsstr = [arr_ingredients objectAtIndex:0];
            //self.recipe_ingredientslbl.text = [arr_ingredients objectAtIndex:0];
            // [self.recipe_ingredientslbl sizeToFit];
            
            //For method
            NSString *querymethod=[ NSString stringWithFormat:@"Select recipe_method from spring_tbl where recipe_name ='SEA VEGETABLES' AND recipe_type ='Sensational' "];
            recipeMethodArr =[[NSMutableArray alloc]init];
            recipeMethodArr =[[database executeQuery:querymethod]mutableCopy];
            
            
            NSMutableArray *arr_method  = [recipeMethodArr valueForKey:@"recipe_method"];
            NSLog(@"%@",arr_ingredients);
            
            //self.recipe_methodlbl.text = [arr_method objectAtIndex:0];
            //[self.recipe_methodlbl sizeToFit];
            
            
            recipeMethodstr = [arr_method objectAtIndex:0];
            [database close];
            
        }
        if([self.imageFile isEqualToString: @"Strawberry.jpg"])
        {
            [self databaseOpen];
            
            
            //For name
            
            NSString *queryname= [NSString stringWithFormat:@"Select recipe_subcategory,recipe_name,recipe_type from spring_tbl where recipe_name ='STRAWBERRY' AND recipe_type ='Sensational' "];
            recipeNameArr =[[NSMutableArray alloc]init];
            recipeNameArr =[[database executeQuery:queryname]mutableCopy];
            
            NSMutableArray *arr_name = [recipeNameArr valueForKey:@"recipe_subcategory"];
            recipeNamestr = [arr_name objectAtIndex:0];
            //self.recipe_namelbl.text = [arr_name objectAtIndex:0];
            
            
            //For ingredients
            
            NSString *queryingredients=[ NSString stringWithFormat:@"Select recipe_ingredients from spring_tbl where recipe_name ='STRAWBERRY' AND recipe_type ='Sensational' "];
            recipeIngredientsArr =[[NSMutableArray alloc]init];
            recipeIngredientsArr =[[database executeQuery:queryingredients]mutableCopy];
            
            
            NSMutableArray *arr_ingredients  = [recipeIngredientsArr valueForKey:@"recipe_ingredients"];
            NSLog(@"%@",arr_ingredients);
            recipeIngredientsstr = [arr_ingredients objectAtIndex:0];
            //self.recipe_ingredientslbl.text = [arr_ingredients objectAtIndex:0];
            // [self.recipe_ingredientslbl sizeToFit];
            
            //For method
            NSString *querymethod=[ NSString stringWithFormat:@"Select recipe_method from spring_tbl where recipe_name ='STRAWBERRY' AND recipe_type ='Sensational' "];
            recipeMethodArr =[[NSMutableArray alloc]init];
            recipeMethodArr =[[database executeQuery:querymethod]mutableCopy];
            
            
            NSMutableArray *arr_method  = [recipeMethodArr valueForKey:@"recipe_method"];
            NSLog(@"%@",arr_ingredients);
            
            //self.recipe_methodlbl.text = [arr_method objectAtIndex:0];
            //[self.recipe_methodlbl sizeToFit];
            
            recipeMethodstr = [arr_method objectAtIndex:0];
            
            [database close];
            
        }
        if([self.imageFile isEqualToString: @"Sunflower-Seeds.jpg"])
        {
            [self databaseOpen];
            
            
            //For name
            
            NSString *queryname= [NSString stringWithFormat:@"Select recipe_subcategory,recipe_name,recipe_type from spring_tbl where recipe_name ='SUNFLOWER SEEDS' AND recipe_type ='Sensational' "];
            recipeNameArr =[[NSMutableArray alloc]init];
            recipeNameArr =[[database executeQuery:queryname]mutableCopy];
            
            NSMutableArray *arr_name = [recipeNameArr valueForKey:@"recipe_subcategory"];
            recipeNamestr = [arr_name objectAtIndex:0];
            //self.recipe_namelbl.text = [arr_name objectAtIndex:0];
            
            
            //For ingredients
            
            NSString *queryingredients=[ NSString stringWithFormat:@"Select recipe_ingredients from spring_tbl where recipe_name ='SUNFLOWER SEEDS' AND recipe_type ='Sensational' "];
            recipeIngredientsArr =[[NSMutableArray alloc]init];
            recipeIngredientsArr =[[database executeQuery:queryingredients]mutableCopy];
            
            
            NSMutableArray *arr_ingredients  = [recipeIngredientsArr valueForKey:@"recipe_ingredients"];
            NSLog(@"%@",arr_ingredients);
            recipeIngredientsstr = [arr_ingredients objectAtIndex:0];
            //self.recipe_ingredientslbl.text = [arr_ingredients objectAtIndex:0];
            // [self.recipe_ingredientslbl sizeToFit];
            
            //For method
            NSString *querymethod=[ NSString stringWithFormat:@"Select recipe_method from spring_tbl where recipe_name ='SUNFLOWER SEEDS' AND recipe_type ='Sensational' "];
            recipeMethodArr =[[NSMutableArray alloc]init];
            recipeMethodArr =[[database executeQuery:querymethod]mutableCopy];
            
            
            NSMutableArray *arr_method  = [recipeMethodArr valueForKey:@"recipe_method"];
            NSLog(@"%@",arr_ingredients);
            
            //self.recipe_methodlbl.text = [arr_method objectAtIndex:0];
            //[self.recipe_methodlbl sizeToFit];
            
            recipeMethodstr = [arr_method objectAtIndex:0];
            
            [database close];
            
        }
        if([self.imageFile isEqualToString: @"Watercress.jpg"])
        {
            [self databaseOpen];
            
            
            //For name
            
            NSString *queryname= [NSString stringWithFormat:@"Select recipe_subcategory,recipe_name,recipe_type from spring_tbl where recipe_name ='WATERCRESS' AND recipe_type ='Sensational' "];
            recipeNameArr =[[NSMutableArray alloc]init];
            recipeNameArr =[[database executeQuery:queryname]mutableCopy];
            
            NSMutableArray *arr_name = [recipeNameArr valueForKey:@"recipe_subcategory"];
            recipeNamestr = [arr_name objectAtIndex:0];
            //self.recipe_namelbl.text = [arr_name objectAtIndex:0];
            
            
            //For ingredients
            
            NSString *queryingredients=[ NSString stringWithFormat:@"Select recipe_ingredients from spring_tbl where recipe_name ='WATERCRESS' AND recipe_type ='Sensational' "];
            recipeIngredientsArr =[[NSMutableArray alloc]init];
            recipeIngredientsArr =[[database executeQuery:queryingredients]mutableCopy];
            
            
            NSMutableArray *arr_ingredients  = [recipeIngredientsArr valueForKey:@"recipe_ingredients"];
            NSLog(@"%@",arr_ingredients);
            recipeIngredientsstr = [arr_ingredients objectAtIndex:0];
            //self.recipe_ingredientslbl.text = [arr_ingredients objectAtIndex:0];
            // [self.recipe_ingredientslbl sizeToFit];
            
            //For method
            NSString *querymethod=[ NSString stringWithFormat:@"Select recipe_method from spring_tbl where recipe_name ='WATERCRESS' AND recipe_type ='Sensational' "];
            recipeMethodArr =[[NSMutableArray alloc]init];
            recipeMethodArr =[[database executeQuery:querymethod]mutableCopy];
            
            
            NSMutableArray *arr_method  = [recipeMethodArr valueForKey:@"recipe_method"];
            NSLog(@"%@",arr_ingredients);
            
            //self.recipe_methodlbl.text = [arr_method objectAtIndex:0];
            //[self.recipe_methodlbl sizeToFit];
            
            
            recipeMethodstr = [arr_method objectAtIndex:0];
            [database close];
            
        }
          [self performSegueWithIdentifier:@"sensationalsegue" sender:self];
    }
    
    else if ([season isEqualToString:@"winter"])
    {
        if([self.imageFile isEqualToString: @"Cod.jpg"])
        {
            [self databaseOpen];
            
            
            //For name
            
            NSString *queryname= [NSString stringWithFormat:@"Select recipe_subcategory,recipe_name,recipe_type from winter_tbl where recipe_name ='Cod' AND recipe_type ='Sensational' "];
            recipeNameArr =[[NSMutableArray alloc]init];
            recipeNameArr =[[database executeQuery:queryname]mutableCopy];
            
            NSMutableArray *arr_name = [recipeNameArr valueForKey:@"recipe_subcategory"];
            
            //self.recipe_namelbl.text = [arr_name objectAtIndex:0];
            
            recipeNamestr = [arr_name objectAtIndex:0];
            
            //For ingredients
            
            NSString *queryingredients=[ NSString stringWithFormat:@"Select recipe_ingredients from winter_tbl where recipe_name ='Cod' AND recipe_type ='Sensational' "];
            recipeIngredientsArr =[[NSMutableArray alloc]init];
            recipeIngredientsArr =[[database executeQuery:queryingredients]mutableCopy];
            
            
            NSMutableArray *arr_ingredients  = [recipeIngredientsArr valueForKey:@"recipe_ingredients"];
            NSLog(@"%@",arr_ingredients);
            
            //self.recipe_ingredientslbl.text = [arr_ingredients objectAtIndex:0];
            // [self.recipe_ingredientslbl sizeToFit];
            
            recipeIngredientsstr = [arr_ingredients objectAtIndex:0];
            
            //For method
            NSString *querymethod=[ NSString stringWithFormat:@"Select recipe_method from winter_tbl where recipe_name ='Cod' AND recipe_type ='Sensational' "];
            recipeMethodArr =[[NSMutableArray alloc]init];
            recipeMethodArr =[[database executeQuery:querymethod]mutableCopy];
            
            
            NSMutableArray *arr_method  = [recipeMethodArr valueForKey:@"recipe_method"];
            NSLog(@"%@",arr_method);
            
            //self.recipe_methodlbl.text = [arr_method objectAtIndex:0];
            //[self.recipe_methodlbl sizeToFit];
            recipeMethodstr = [arr_method objectAtIndex:0];
            
            
            
            [database close];
        }
        
        if([self.imageFile isEqualToString: @"Banana.jpg"])
        {
            [self databaseOpen];
            
            
            //For name
            
            NSString *queryname= [NSString stringWithFormat:@"Select recipe_subcategory,recipe_name,recipe_type from winter_tbl where recipe_name ='Banana' AND recipe_type ='Sensational' "];
            recipeNameArr =[[NSMutableArray alloc]init];
            recipeNameArr =[[database executeQuery:queryname]mutableCopy];
            
            NSMutableArray *arr_name = [recipeNameArr valueForKey:@"recipe_subcategory"];
            
            //self.recipe_namelbl.text = [arr_name objectAtIndex:0];
            
            recipeNamestr = [arr_name objectAtIndex:0];
            
            //For ingredients
            
            NSString *queryingredients=[ NSString stringWithFormat:@"Select recipe_ingredients from winter_tbl where recipe_name ='Banana' AND recipe_type ='Sensational' "];
            recipeIngredientsArr =[[NSMutableArray alloc]init];
            recipeIngredientsArr =[[database executeQuery:queryingredients]mutableCopy];
            
            
            NSMutableArray *arr_ingredients  = [recipeIngredientsArr valueForKey:@"recipe_ingredients"];
            NSLog(@"%@",arr_ingredients);
            
            //self.recipe_ingredientslbl.text = [arr_ingredients objectAtIndex:0];
            // [self.recipe_ingredientslbl sizeToFit];
            
            recipeIngredientsstr = [arr_ingredients objectAtIndex:0];
            
            //For method
            NSString *querymethod=[ NSString stringWithFormat:@"Select recipe_method from winter_tbl where recipe_name ='Banana' AND recipe_type ='Sensational' "];
            recipeMethodArr =[[NSMutableArray alloc]init];
            recipeMethodArr =[[database executeQuery:querymethod]mutableCopy];
            
            
            NSMutableArray *arr_method  = [recipeMethodArr valueForKey:@"recipe_method"];
            NSLog(@"%@",arr_method);
            
            //self.recipe_methodlbl.text = [arr_method objectAtIndex:0];
            //[self.recipe_methodlbl sizeToFit];
            recipeMethodstr = [arr_method objectAtIndex:0];
            
            
            
            [database close];
        }
        if([self.imageFile isEqualToString: @"Beef.jpg"])
        {
            [self databaseOpen];
            
            
            //For name
            
            NSString *queryname= [NSString stringWithFormat:@"Select recipe_subcategory,recipe_name,recipe_type from winter_tbl where recipe_name ='Beef' AND recipe_type ='Sensational' "];
            recipeNameArr =[[NSMutableArray alloc]init];
            recipeNameArr =[[database executeQuery:queryname]mutableCopy];
            
            NSMutableArray *arr_name = [recipeNameArr valueForKey:@"recipe_subcategory"];
            
            //self.recipe_namelbl.text = [arr_name objectAtIndex:0];
            
            recipeNamestr = [arr_name objectAtIndex:0];
            
            //For ingredients
            
            NSString *queryingredients=[ NSString stringWithFormat:@"Select recipe_ingredients from winter_tbl where recipe_name ='Beef' AND recipe_type ='Sensational' "];
            recipeIngredientsArr =[[NSMutableArray alloc]init];
            recipeIngredientsArr =[[database executeQuery:queryingredients]mutableCopy];
            
            
            NSMutableArray *arr_ingredients  = [recipeIngredientsArr valueForKey:@"recipe_ingredients"];
            NSLog(@"%@",arr_ingredients);
            
            //self.recipe_ingredientslbl.text = [arr_ingredients objectAtIndex:0];
            // [self.recipe_ingredientslbl sizeToFit];
            
            recipeIngredientsstr = [arr_ingredients objectAtIndex:0];
            
            //For method
            NSString *querymethod=[ NSString stringWithFormat:@"Select recipe_method from winter_tbl where recipe_name ='Beef' AND recipe_type ='Sensational' "];
            recipeMethodArr =[[NSMutableArray alloc]init];
            recipeMethodArr =[[database executeQuery:querymethod]mutableCopy];
            
            
            NSMutableArray *arr_method  = [recipeMethodArr valueForKey:@"recipe_method"];
            NSLog(@"%@",arr_method);
            
            //self.recipe_methodlbl.text = [arr_method objectAtIndex:0];
            //[self.recipe_methodlbl sizeToFit];
            recipeMethodstr = [arr_method objectAtIndex:0];
            
            
            
            [database close];
        }
        
        if([self.imageFile isEqualToString: @"Celeriac.jpg"])
        {
            [self databaseOpen];
            
            
            //For name
            
            NSString *queryname= [NSString stringWithFormat:@"Select recipe_subcategory,recipe_name,recipe_type from winter_tbl where recipe_name ='Celeriac' AND recipe_type ='Sensational' "];
            recipeNameArr =[[NSMutableArray alloc]init];
            recipeNameArr =[[database executeQuery:queryname]mutableCopy];
            
            NSMutableArray *arr_name = [recipeNameArr valueForKey:@"recipe_subcategory"];
            
            //self.recipe_namelbl.text = [arr_name objectAtIndex:0];
            
            recipeNamestr = [arr_name objectAtIndex:0];
            
            //For ingredients
            
            NSString *queryingredients=[ NSString stringWithFormat:@"Select recipe_ingredients from winter_tbl where recipe_name ='Celeriac' AND recipe_type ='Sensational' "];
            recipeIngredientsArr =[[NSMutableArray alloc]init];
            recipeIngredientsArr =[[database executeQuery:queryingredients]mutableCopy];
            
            
            NSMutableArray *arr_ingredients  = [recipeIngredientsArr valueForKey:@"recipe_ingredients"];
            NSLog(@"%@",arr_ingredients);
            
            //self.recipe_ingredientslbl.text = [arr_ingredients objectAtIndex:0];
            // [self.recipe_ingredientslbl sizeToFit];
            
            recipeIngredientsstr = [arr_ingredients objectAtIndex:0];
            
            //For method
            NSString *querymethod=[ NSString stringWithFormat:@"Select recipe_method from winter_tbl where recipe_name ='Celeriac' AND recipe_type ='Sensational' "];
            recipeMethodArr =[[NSMutableArray alloc]init];
            recipeMethodArr =[[database executeQuery:querymethod]mutableCopy];
            
            
            NSMutableArray *arr_method  = [recipeMethodArr valueForKey:@"recipe_method"];
            NSLog(@"%@",arr_method);
            
            //self.recipe_methodlbl.text = [arr_method objectAtIndex:0];
            //[self.recipe_methodlbl sizeToFit];
            recipeMethodstr = [arr_method objectAtIndex:0];
            
            
            
            [database close];
        }
        
        if([self.imageFile isEqualToString: @"Chocolate.jpg"])
        {
            [self databaseOpen];
            
            
            //For name
            
            NSString *queryname= [NSString stringWithFormat:@"Select recipe_subcategory,recipe_name,recipe_type from winter_tbl where recipe_name ='Chocolate' AND recipe_type ='Sensational' "];
            recipeNameArr =[[NSMutableArray alloc]init];
            recipeNameArr =[[database executeQuery:queryname]mutableCopy];
            
            NSMutableArray *arr_name = [recipeNameArr valueForKey:@"recipe_subcategory"];
            
            //self.recipe_namelbl.text = [arr_name objectAtIndex:0];
            
            recipeNamestr = [arr_name objectAtIndex:0];
            
            //For ingredients
            
            NSString *queryingredients=[ NSString stringWithFormat:@"Select recipe_ingredients from winter_tbl where recipe_name ='Chocolate' AND recipe_type ='Sensational' "];
            recipeIngredientsArr =[[NSMutableArray alloc]init];
            recipeIngredientsArr =[[database executeQuery:queryingredients]mutableCopy];
            
            
            NSMutableArray *arr_ingredients  = [recipeIngredientsArr valueForKey:@"recipe_ingredients"];
            NSLog(@"%@",arr_ingredients);
            
            //self.recipe_ingredientslbl.text = [arr_ingredients objectAtIndex:0];
            // [self.recipe_ingredientslbl sizeToFit];
            
            recipeIngredientsstr = [arr_ingredients objectAtIndex:0];
            
            //For method
            NSString *querymethod=[ NSString stringWithFormat:@"Select recipe_method from winter_tbl where recipe_name ='Chocolate' AND recipe_type ='Sensational' "];
            recipeMethodArr =[[NSMutableArray alloc]init];
            recipeMethodArr =[[database executeQuery:querymethod]mutableCopy];
            
            
            NSMutableArray *arr_method  = [recipeMethodArr valueForKey:@"recipe_method"];
            NSLog(@"%@",arr_method);
            
            //self.recipe_methodlbl.text = [arr_method objectAtIndex:0];
            //[self.recipe_methodlbl sizeToFit];
            recipeMethodstr = [arr_method objectAtIndex:0];
            
            
            
            [database close];
        }
        if([self.imageFile isEqualToString: @"Cinnamon.jpg"])
        {
            [self databaseOpen];
            
            
            //For name
            
            NSString *queryname= [NSString stringWithFormat:@"Select recipe_subcategory,recipe_name,recipe_type from winter_tbl where recipe_name ='Cinnamon' AND recipe_type ='Sensational' "];
            recipeNameArr =[[NSMutableArray alloc]init];
            recipeNameArr =[[database executeQuery:queryname]mutableCopy];
            
            NSMutableArray *arr_name = [recipeNameArr valueForKey:@"recipe_subcategory"];
            
            //self.recipe_namelbl.text = [arr_name objectAtIndex:0];
            
            recipeNamestr = [arr_name objectAtIndex:0];
            
            //For ingredients
            
            NSString *queryingredients=[ NSString stringWithFormat:@"Select recipe_ingredients from winter_tbl where recipe_name ='Cinnamon' AND recipe_type ='Sensational' "];
            recipeIngredientsArr =[[NSMutableArray alloc]init];
            recipeIngredientsArr =[[database executeQuery:queryingredients]mutableCopy];
            
            
            NSMutableArray *arr_ingredients  = [recipeIngredientsArr valueForKey:@"recipe_ingredients"];
            NSLog(@"%@",arr_ingredients);
            
            //self.recipe_ingredientslbl.text = [arr_ingredients objectAtIndex:0];
            // [self.recipe_ingredientslbl sizeToFit];
            
            recipeIngredientsstr = [arr_ingredients objectAtIndex:0];
            
            //For method
            NSString *querymethod=[ NSString stringWithFormat:@"Select recipe_method from winter_tbl where recipe_name ='Cinnamon' AND recipe_type ='Sensational' "];
            recipeMethodArr =[[NSMutableArray alloc]init];
            recipeMethodArr =[[database executeQuery:querymethod]mutableCopy];
            
            
            NSMutableArray *arr_method  = [recipeMethodArr valueForKey:@"recipe_method"];
            NSLog(@"%@",arr_method);
            
            //self.recipe_methodlbl.text = [arr_method objectAtIndex:0];
            //[self.recipe_methodlbl sizeToFit];
            recipeMethodstr = [arr_method objectAtIndex:0];
            
            
            
            [database close];
        }
        if([self.imageFile isEqualToString: @"Coconut.jpg"])
        {
            [self databaseOpen];
            
            
            //For name
            
            NSString *queryname= [NSString stringWithFormat:@"Select recipe_subcategory,recipe_name,recipe_type from winter_tbl where recipe_name ='Coconut' AND recipe_type ='Sensational' "];
            recipeNameArr =[[NSMutableArray alloc]init];
            recipeNameArr =[[database executeQuery:queryname]mutableCopy];
            
            NSMutableArray *arr_name = [recipeNameArr valueForKey:@"recipe_subcategory"];
            
            //self.recipe_namelbl.text = [arr_name objectAtIndex:0];
            
            recipeNamestr = [arr_name objectAtIndex:0];
            
            //For ingredients
            
            NSString *queryingredients=[ NSString stringWithFormat:@"Select recipe_ingredients from winter_tbl where recipe_name ='Coconut' AND recipe_type ='Sensational' "];
            recipeIngredientsArr =[[NSMutableArray alloc]init];
            recipeIngredientsArr =[[database executeQuery:queryingredients]mutableCopy];
            
            
            NSMutableArray *arr_ingredients  = [recipeIngredientsArr valueForKey:@"recipe_ingredients"];
            NSLog(@"%@",arr_ingredients);
            
            //self.recipe_ingredientslbl.text = [arr_ingredients objectAtIndex:0];
            // [self.recipe_ingredientslbl sizeToFit];
            
            recipeIngredientsstr = [arr_ingredients objectAtIndex:0];
            
            //For method
            NSString *querymethod=[ NSString stringWithFormat:@"Select recipe_method from winter_tbl where recipe_name ='Coconut' AND recipe_type ='Sensational' "];
            recipeMethodArr =[[NSMutableArray alloc]init];
            recipeMethodArr =[[database executeQuery:querymethod]mutableCopy];
            
            
            NSMutableArray *arr_method  = [recipeMethodArr valueForKey:@"recipe_method"];
            NSLog(@"%@",arr_method);
            
            //self.recipe_methodlbl.text = [arr_method objectAtIndex:0];
            //[self.recipe_methodlbl sizeToFit];
            recipeMethodstr = [arr_method objectAtIndex:0];
            
            
            
            [database close];
        }
        if([self.imageFile isEqualToString: @"Date.jpg"])
        {
            [self databaseOpen];
            
            
            //For name
            
            NSString *queryname= [NSString stringWithFormat:@"Select recipe_subcategory,recipe_name,recipe_type from winter_tbl where recipe_name ='Date' AND recipe_type ='Sensational' "];
            recipeNameArr =[[NSMutableArray alloc]init];
            recipeNameArr =[[database executeQuery:queryname]mutableCopy];
            
            NSMutableArray *arr_name = [recipeNameArr valueForKey:@"recipe_subcategory"];
            
            //self.recipe_namelbl.text = [arr_name objectAtIndex:0];
            
            recipeNamestr = [arr_name objectAtIndex:0];
            
            //For ingredients
            
            NSString *queryingredients=[ NSString stringWithFormat:@"Select recipe_ingredients from winter_tbl where recipe_name ='Date' AND recipe_type ='Sensational' "];
            recipeIngredientsArr =[[NSMutableArray alloc]init];
            recipeIngredientsArr =[[database executeQuery:queryingredients]mutableCopy];
            
            
            NSMutableArray *arr_ingredients  = [recipeIngredientsArr valueForKey:@"recipe_ingredients"];
            NSLog(@"%@",arr_ingredients);
            
            //self.recipe_ingredientslbl.text = [arr_ingredients objectAtIndex:0];
            // [self.recipe_ingredientslbl sizeToFit];
            
            recipeIngredientsstr = [arr_ingredients objectAtIndex:0];
            
            //For method
            NSString *querymethod=[ NSString stringWithFormat:@"Select recipe_method from winter_tbl where recipe_name ='Date' AND recipe_type ='Sensational' "];
            recipeMethodArr =[[NSMutableArray alloc]init];
            recipeMethodArr =[[database executeQuery:querymethod]mutableCopy];
            
            
            NSMutableArray *arr_method  = [recipeMethodArr valueForKey:@"recipe_method"];
            NSLog(@"%@",arr_method);
            
            //self.recipe_methodlbl.text = [arr_method objectAtIndex:0];
            //[self.recipe_methodlbl sizeToFit];
            recipeMethodstr = [arr_method objectAtIndex:0];
            
            
            
            [database close];
        }
        if([self.imageFile isEqualToString: @"Kale.jpg"])
        {
            [self databaseOpen];
            
            
            //For name
            
            NSString *queryname= [NSString stringWithFormat:@"Select recipe_subcategory,recipe_name,recipe_type from winter_tbl where recipe_name ='Kale' AND recipe_type ='Sensational' "];
            recipeNameArr =[[NSMutableArray alloc]init];
            recipeNameArr =[[database executeQuery:queryname]mutableCopy];
            
            NSMutableArray *arr_name = [recipeNameArr valueForKey:@"recipe_subcategory"];
            
            //self.recipe_namelbl.text = [arr_name objectAtIndex:0];
            
            recipeNamestr = [arr_name objectAtIndex:0];
            
            //For ingredients
            
            NSString *queryingredients=[ NSString stringWithFormat:@"Select recipe_ingredients from winter_tbl where recipe_name ='Kale' AND recipe_type ='Sensational' "];
            recipeIngredientsArr =[[NSMutableArray alloc]init];
            recipeIngredientsArr =[[database executeQuery:queryingredients]mutableCopy];
            
            
            NSMutableArray *arr_ingredients  = [recipeIngredientsArr valueForKey:@"recipe_ingredients"];
            NSLog(@"%@",arr_ingredients);
            
            //self.recipe_ingredientslbl.text = [arr_ingredients objectAtIndex:0];
            // [self.recipe_ingredientslbl sizeToFit];
            
            recipeIngredientsstr = [arr_ingredients objectAtIndex:0];
            
            //For method
            NSString *querymethod=[ NSString stringWithFormat:@"Select recipe_method from winter_tbl where recipe_name ='Kale' AND recipe_type ='Sensational' "];
            recipeMethodArr =[[NSMutableArray alloc]init];
            recipeMethodArr =[[database executeQuery:querymethod]mutableCopy];
            
            
            NSMutableArray *arr_method  = [recipeMethodArr valueForKey:@"recipe_method"];
            NSLog(@"%@",arr_method);
            
            //self.recipe_methodlbl.text = [arr_method objectAtIndex:0];
            //[self.recipe_methodlbl sizeToFit];
            recipeMethodstr = [arr_method objectAtIndex:0];
            
            
            
            [database close];
        }
        if([self.imageFile isEqualToString: @"Kiwi.jpg"])
        {
            [self databaseOpen];
            
            
            //For name
            
            NSString *queryname= [NSString stringWithFormat:@"Select recipe_subcategory,recipe_name,recipe_type from winter_tbl where recipe_name ='Kiwi' AND recipe_type ='Sensational' "];
            recipeNameArr =[[NSMutableArray alloc]init];
            recipeNameArr =[[database executeQuery:queryname]mutableCopy];
            
            NSMutableArray *arr_name = [recipeNameArr valueForKey:@"recipe_subcategory"];
            
            //self.recipe_namelbl.text = [arr_name objectAtIndex:0];
            
            recipeNamestr = [arr_name objectAtIndex:0];
            
            //For ingredients
            
            NSString *queryingredients=[ NSString stringWithFormat:@"Select recipe_ingredients from winter_tbl where recipe_name ='Kiwi' AND recipe_type ='Sensational' "];
            recipeIngredientsArr =[[NSMutableArray alloc]init];
            recipeIngredientsArr =[[database executeQuery:queryingredients]mutableCopy];
            
            
            NSMutableArray *arr_ingredients  = [recipeIngredientsArr valueForKey:@"recipe_ingredients"];
            NSLog(@"%@",arr_ingredients);
            
            //self.recipe_ingredientslbl.text = [arr_ingredients objectAtIndex:0];
            // [self.recipe_ingredientslbl sizeToFit];
            
            recipeIngredientsstr = [arr_ingredients objectAtIndex:0];
            
            //For method
            NSString *querymethod=[ NSString stringWithFormat:@"Select recipe_method from winter_tbl where recipe_name ='Kiwi' AND recipe_type ='Sensational' "];
            recipeMethodArr =[[NSMutableArray alloc]init];
            recipeMethodArr =[[database executeQuery:querymethod]mutableCopy];
            
            
            NSMutableArray *arr_method  = [recipeMethodArr valueForKey:@"recipe_method"];
            NSLog(@"%@",arr_method);
            
            //self.recipe_methodlbl.text = [arr_method objectAtIndex:0];
            //[self.recipe_methodlbl sizeToFit];
            recipeMethodstr = [arr_method objectAtIndex:0];
            
            
            
            [database close];
        }
        
        
        if([self.imageFile isEqualToString: @"Lentil.jpg"])
        {
            [self databaseOpen];
            
            
            //For name
            
            NSString *queryname= [NSString stringWithFormat:@"Select recipe_subcategory,recipe_name,recipe_type from winter_tbl where recipe_name ='Lentil' AND recipe_type ='Sensational' "];
            recipeNameArr =[[NSMutableArray alloc]init];
            recipeNameArr =[[database executeQuery:queryname]mutableCopy];
            
            NSMutableArray *arr_name = [recipeNameArr valueForKey:@"recipe_subcategory"];
            
            //self.recipe_namelbl.text = [arr_name objectAtIndex:0];
            
            recipeNamestr = [arr_name objectAtIndex:0];
            
            //For ingredients
            
            NSString *queryingredients=[ NSString stringWithFormat:@"Select recipe_ingredients from winter_tbl where recipe_name ='Lentil' AND recipe_type ='Sensational' "];
            recipeIngredientsArr =[[NSMutableArray alloc]init];
            recipeIngredientsArr =[[database executeQuery:queryingredients]mutableCopy];
            
            
            NSMutableArray *arr_ingredients  = [recipeIngredientsArr valueForKey:@"recipe_ingredients"];
            NSLog(@"%@",arr_ingredients);
            
            //self.recipe_ingredientslbl.text = [arr_ingredients objectAtIndex:0];
            // [self.recipe_ingredientslbl sizeToFit];
            
            recipeIngredientsstr = [arr_ingredients objectAtIndex:0];
            
            //For method
            NSString *querymethod=[ NSString stringWithFormat:@"Select recipe_method from winter_tbl where recipe_name ='Lentil' AND recipe_type ='Sensational' "];
            recipeMethodArr =[[NSMutableArray alloc]init];
            recipeMethodArr =[[database executeQuery:querymethod]mutableCopy];
            
            
            NSMutableArray *arr_method  = [recipeMethodArr valueForKey:@"recipe_method"];
            NSLog(@"%@",arr_method);
            
            //self.recipe_methodlbl.text = [arr_method objectAtIndex:0];
            //[self.recipe_methodlbl sizeToFit];
            recipeMethodstr = [arr_method objectAtIndex:0];
            
            
            
            [database close];
        }
        
        if([self.imageFile isEqualToString: @"Mango.jpg"])
        {
            [self databaseOpen];
            
            
            //For name
            
            NSString *queryname= [NSString stringWithFormat:@"Select recipe_subcategory,recipe_name,recipe_type from winter_tbl where recipe_name ='Mango' AND recipe_type ='Sensational' "];
            recipeNameArr =[[NSMutableArray alloc]init];
            recipeNameArr =[[database executeQuery:queryname]mutableCopy];
            
            NSMutableArray *arr_name = [recipeNameArr valueForKey:@"recipe_subcategory"];
            
            //self.recipe_namelbl.text = [arr_name objectAtIndex:0];
            
            recipeNamestr = [arr_name objectAtIndex:0];
            
            //For ingredients
            
            NSString *queryingredients=[ NSString stringWithFormat:@"Select recipe_ingredients from winter_tbl where recipe_name ='Mango' AND recipe_type ='Sensational' "];
            recipeIngredientsArr =[[NSMutableArray alloc]init];
            recipeIngredientsArr =[[database executeQuery:queryingredients]mutableCopy];
            
            
            NSMutableArray *arr_ingredients  = [recipeIngredientsArr valueForKey:@"recipe_ingredients"];
            NSLog(@"%@",arr_ingredients);
            
            //self.recipe_ingredientslbl.text = [arr_ingredients objectAtIndex:0];
            // [self.recipe_ingredientslbl sizeToFit];
            
            recipeIngredientsstr = [arr_ingredients objectAtIndex:0];
            
            //For method
            NSString *querymethod=[ NSString stringWithFormat:@"Select recipe_method from winter_tbl where recipe_name ='Mango' AND recipe_type ='Sensational' "];
            recipeMethodArr =[[NSMutableArray alloc]init];
            recipeMethodArr =[[database executeQuery:querymethod]mutableCopy];
            
            
            NSMutableArray *arr_method  = [recipeMethodArr valueForKey:@"recipe_method"];
            NSLog(@"%@",arr_method);
            
            //self.recipe_methodlbl.text = [arr_method objectAtIndex:0];
            //[self.recipe_methodlbl sizeToFit];
            recipeMethodstr = [arr_method objectAtIndex:0];
            
            
            
            [database close];
        }
        
        if([self.imageFile isEqualToString: @"Mushroom.jpg"])
        {
            [self databaseOpen];
            
            
            //For name
            
            NSString *queryname= [NSString stringWithFormat:@"Select recipe_subcategory,recipe_name,recipe_type from winter_tbl where recipe_name ='Mushroom' AND recipe_type ='Sensational' "];
            recipeNameArr =[[NSMutableArray alloc]init];
            recipeNameArr =[[database executeQuery:queryname]mutableCopy];
            
            NSMutableArray *arr_name = [recipeNameArr valueForKey:@"recipe_subcategory"];
            
            //self.recipe_namelbl.text = [arr_name objectAtIndex:0];
            
            recipeNamestr = [arr_name objectAtIndex:0];
            
            //For ingredients
            
            NSString *queryingredients=[ NSString stringWithFormat:@"Select recipe_ingredients from winter_tbl where recipe_name ='Mushroom' AND recipe_type ='Sensational' "];
            recipeIngredientsArr =[[NSMutableArray alloc]init];
            recipeIngredientsArr =[[database executeQuery:queryingredients]mutableCopy];
            
            
            NSMutableArray *arr_ingredients  = [recipeIngredientsArr valueForKey:@"recipe_ingredients"];
            NSLog(@"%@",arr_ingredients);
            
            //self.recipe_ingredientslbl.text = [arr_ingredients objectAtIndex:0];
            // [self.recipe_ingredientslbl sizeToFit];
            
            recipeIngredientsstr = [arr_ingredients objectAtIndex:0];
            
            //For method
            NSString *querymethod=[ NSString stringWithFormat:@"Select recipe_method from winter_tbl where recipe_name ='Mushroom' AND recipe_type ='Sensational' "];
            recipeMethodArr =[[NSMutableArray alloc]init];
            recipeMethodArr =[[database executeQuery:querymethod]mutableCopy];
            
            
            NSMutableArray *arr_method  = [recipeMethodArr valueForKey:@"recipe_method"];
            NSLog(@"%@",arr_method);
            
            //self.recipe_methodlbl.text = [arr_method objectAtIndex:0];
            //[self.recipe_methodlbl sizeToFit];
            recipeMethodstr = [arr_method objectAtIndex:0];
            
            
            
            [database close];
        }
        
        if([self.imageFile isEqualToString: @"Onion.jpg"])
        {
            [self databaseOpen];
            
            
            //For name
            
            NSString *queryname= [NSString stringWithFormat:@"Select recipe_subcategory,recipe_name,recipe_type from winter_tbl where recipe_name ='Onion' AND recipe_type ='Sensational' "];
            recipeNameArr =[[NSMutableArray alloc]init];
            recipeNameArr =[[database executeQuery:queryname]mutableCopy];
            
            NSMutableArray *arr_name = [recipeNameArr valueForKey:@"recipe_subcategory"];
            
            //self.recipe_namelbl.text = [arr_name objectAtIndex:0];
            
            recipeNamestr = [arr_name objectAtIndex:0];
            
            //For ingredients
            
            NSString *queryingredients=[ NSString stringWithFormat:@"Select recipe_ingredients from winter_tbl where recipe_name ='Onion' AND recipe_type ='Sensational' "];
            recipeIngredientsArr =[[NSMutableArray alloc]init];
            recipeIngredientsArr =[[database executeQuery:queryingredients]mutableCopy];
            
            
            NSMutableArray *arr_ingredients  = [recipeIngredientsArr valueForKey:@"recipe_ingredients"];
            NSLog(@"%@",arr_ingredients);
            
            //self.recipe_ingredientslbl.text = [arr_ingredients objectAtIndex:0];
            // [self.recipe_ingredientslbl sizeToFit];
            
            recipeIngredientsstr = [arr_ingredients objectAtIndex:0];
            
            //For method
            NSString *querymethod=[ NSString stringWithFormat:@"Select recipe_method from winter_tbl where recipe_name ='Onion' AND recipe_type ='Sensational' "];
            recipeMethodArr =[[NSMutableArray alloc]init];
            recipeMethodArr =[[database executeQuery:querymethod]mutableCopy];
            
            
            NSMutableArray *arr_method  = [recipeMethodArr valueForKey:@"recipe_method"];
            NSLog(@"%@",arr_method);
            
            //self.recipe_methodlbl.text = [arr_method objectAtIndex:0];
            //[self.recipe_methodlbl sizeToFit];
            recipeMethodstr = [arr_method objectAtIndex:0];
            
            
            
            [database close];
        }
        
        if([self.imageFile isEqualToString: @"Orange.jpg"])
        {
            [self databaseOpen];
            
            
            //For name
            
            NSString *queryname= [NSString stringWithFormat:@"Select recipe_subcategory,recipe_name,recipe_type from winter_tbl where recipe_name ='Orange' AND recipe_type ='Sensational' "];
            recipeNameArr =[[NSMutableArray alloc]init];
            recipeNameArr =[[database executeQuery:queryname]mutableCopy];
            
            NSMutableArray *arr_name = [recipeNameArr valueForKey:@"recipe_subcategory"];
            
            //self.recipe_namelbl.text = [arr_name objectAtIndex:0];
            
            recipeNamestr = [arr_name objectAtIndex:0];
            
            //For ingredients
            
            NSString *queryingredients=[ NSString stringWithFormat:@"Select recipe_ingredients from winter_tbl where recipe_name ='Orange' AND recipe_type ='Sensational' "];
            recipeIngredientsArr =[[NSMutableArray alloc]init];
            recipeIngredientsArr =[[database executeQuery:queryingredients]mutableCopy];
            
            
            NSMutableArray *arr_ingredients  = [recipeIngredientsArr valueForKey:@"recipe_ingredients"];
            NSLog(@"%@",arr_ingredients);
            
            //self.recipe_ingredientslbl.text = [arr_ingredients objectAtIndex:0];
            // [self.recipe_ingredientslbl sizeToFit];
            
            recipeIngredientsstr = [arr_ingredients objectAtIndex:0];
            
            //For method
            NSString *querymethod=[ NSString stringWithFormat:@"Select recipe_method from winter_tbl where recipe_name ='Orange' AND recipe_type ='Sensational' "];
            recipeMethodArr =[[NSMutableArray alloc]init];
            recipeMethodArr =[[database executeQuery:querymethod]mutableCopy];
            
            
            NSMutableArray *arr_method  = [recipeMethodArr valueForKey:@"recipe_method"];
            NSLog(@"%@",arr_method);
            
            //self.recipe_methodlbl.text = [arr_method objectAtIndex:0];
            //[self.recipe_methodlbl sizeToFit];
            recipeMethodstr = [arr_method objectAtIndex:0];
            
            
            
            [database close];
        }
        if([self.imageFile isEqualToString: @"Papaya.jpg"])
        {
            [self databaseOpen];
            
            
            //For name
            
            NSString *queryname= [NSString stringWithFormat:@"Select recipe_subcategory,recipe_name,recipe_type from winter_tbl where recipe_name ='Papaya' AND recipe_type ='Sensational' "];
            recipeNameArr =[[NSMutableArray alloc]init];
            recipeNameArr =[[database executeQuery:queryname]mutableCopy];
            
            NSMutableArray *arr_name = [recipeNameArr valueForKey:@"recipe_subcategory"];
            
            //self.recipe_namelbl.text = [arr_name objectAtIndex:0];
            
            recipeNamestr = [arr_name objectAtIndex:0];
            
            //For ingredients
            
            NSString *queryingredients=[ NSString stringWithFormat:@"Select recipe_ingredients from winter_tbl where recipe_name ='Papaya' AND recipe_type ='Sensational' "];
            recipeIngredientsArr =[[NSMutableArray alloc]init];
            recipeIngredientsArr =[[database executeQuery:queryingredients]mutableCopy];
            
            
            NSMutableArray *arr_ingredients  = [recipeIngredientsArr valueForKey:@"recipe_ingredients"];
            NSLog(@"%@",arr_ingredients);
            
            //self.recipe_ingredientslbl.text = [arr_ingredients objectAtIndex:0];
            // [self.recipe_ingredientslbl sizeToFit];
            
            recipeIngredientsstr = [arr_ingredients objectAtIndex:0];
            
            //For method
            NSString *querymethod=[ NSString stringWithFormat:@"Select recipe_method from winter_tbl where recipe_name ='Papaya' AND recipe_type ='Sensational' "];
            recipeMethodArr =[[NSMutableArray alloc]init];
            recipeMethodArr =[[database executeQuery:querymethod]mutableCopy];
            
            
            NSMutableArray *arr_method  = [recipeMethodArr valueForKey:@"recipe_method"];
            NSLog(@"%@",arr_method);
            
            //self.recipe_methodlbl.text = [arr_method objectAtIndex:0];
            //[self.recipe_methodlbl sizeToFit];
            recipeMethodstr = [arr_method objectAtIndex:0];
            
            
            
            [database close];
        }
        
        if([self.imageFile isEqualToString: @"Parsnip.jpg"])
        {
            [self databaseOpen];
            
            
            //For name
            
            NSString *queryname= [NSString stringWithFormat:@"Select recipe_subcategory,recipe_name,recipe_type from winter_tbl where recipe_name ='Parsnip' AND recipe_type ='Sensational' "];
            recipeNameArr =[[NSMutableArray alloc]init];
            recipeNameArr =[[database executeQuery:queryname]mutableCopy];
            
            NSMutableArray *arr_name = [recipeNameArr valueForKey:@"recipe_subcategory"];
            
            //self.recipe_namelbl.text = [arr_name objectAtIndex:0];
            
            recipeNamestr = [arr_name objectAtIndex:0];
            
            //For ingredients
            
            NSString *queryingredients=[ NSString stringWithFormat:@"Select recipe_ingredients from winter_tbl where recipe_name ='Parsnip' AND recipe_type ='Sensational' "];
            recipeIngredientsArr =[[NSMutableArray alloc]init];
            recipeIngredientsArr =[[database executeQuery:queryingredients]mutableCopy];
            
            
            NSMutableArray *arr_ingredients  = [recipeIngredientsArr valueForKey:@"recipe_ingredients"];
            NSLog(@"%@",arr_ingredients);
            
            //self.recipe_ingredientslbl.text = [arr_ingredients objectAtIndex:0];
            // [self.recipe_ingredientslbl sizeToFit];
            
            recipeIngredientsstr = [arr_ingredients objectAtIndex:0];
            
            //For method
            NSString *querymethod=[ NSString stringWithFormat:@"Select recipe_method from winter_tbl where recipe_name ='Parsnip' AND recipe_type ='Sensational' "];
            recipeMethodArr =[[NSMutableArray alloc]init];
            recipeMethodArr =[[database executeQuery:querymethod]mutableCopy];
            
            
            NSMutableArray *arr_method  = [recipeMethodArr valueForKey:@"recipe_method"];
            NSLog(@"%@",arr_method);
            
            //self.recipe_methodlbl.text = [arr_method objectAtIndex:0];
            //[self.recipe_methodlbl sizeToFit];
            recipeMethodstr = [arr_method objectAtIndex:0];
            
            
            
            [database close];
        }
        
        if([self.imageFile isEqualToString: @"Pear.jpg"])
        {
            [self databaseOpen];
            
            
            //For name
            
            NSString *queryname= [NSString stringWithFormat:@"Select recipe_subcategory,recipe_name,recipe_type from winter_tbl where recipe_name ='Pear' AND recipe_type ='Sensational' "];
            recipeNameArr =[[NSMutableArray alloc]init];
            recipeNameArr =[[database executeQuery:queryname]mutableCopy];
            
            NSMutableArray *arr_name = [recipeNameArr valueForKey:@"recipe_subcategory"];
            
            //self.recipe_namelbl.text = [arr_name objectAtIndex:0];
            
            recipeNamestr = [arr_name objectAtIndex:0];
            
            //For ingredients
            
            NSString *queryingredients=[ NSString stringWithFormat:@"Select recipe_ingredients from winter_tbl where recipe_name ='Pear' AND recipe_type ='Sensational' "];
            recipeIngredientsArr =[[NSMutableArray alloc]init];
            recipeIngredientsArr =[[database executeQuery:queryingredients]mutableCopy];
            
            
            NSMutableArray *arr_ingredients  = [recipeIngredientsArr valueForKey:@"recipe_ingredients"];
            NSLog(@"%@",arr_ingredients);
            
            //self.recipe_ingredientslbl.text = [arr_ingredients objectAtIndex:0];
            // [self.recipe_ingredientslbl sizeToFit];
            
            recipeIngredientsstr = [arr_ingredients objectAtIndex:0];
            
            //For method
            NSString *querymethod=[ NSString stringWithFormat:@"Select recipe_method from winter_tbl where recipe_name ='Pear' AND recipe_type ='Sensational' "];
            recipeMethodArr =[[NSMutableArray alloc]init];
            recipeMethodArr =[[database executeQuery:querymethod]mutableCopy];
            
            
            NSMutableArray *arr_method  = [recipeMethodArr valueForKey:@"recipe_method"];
            NSLog(@"%@",arr_method);
            
            //self.recipe_methodlbl.text = [arr_method objectAtIndex:0];
            //[self.recipe_methodlbl sizeToFit];
            recipeMethodstr = [arr_method objectAtIndex:0];
            
            
            
            [database close];
        }
        if([self.imageFile isEqualToString: @"Pineapple.jpg"])
        {
            [self databaseOpen];
            
            
            //For name
            
            NSString *queryname= [NSString stringWithFormat:@"Select recipe_subcategory,recipe_name,recipe_type from winter_tbl where recipe_name ='Pineapple' AND recipe_type ='Sensational' "];
            recipeNameArr =[[NSMutableArray alloc]init];
            recipeNameArr =[[database executeQuery:queryname]mutableCopy];
            
            NSMutableArray *arr_name = [recipeNameArr valueForKey:@"recipe_subcategory"];
            
            //self.recipe_namelbl.text = [arr_name objectAtIndex:0];
            
            recipeNamestr = [arr_name objectAtIndex:0];
            
            //For ingredients
            
            NSString *queryingredients=[ NSString stringWithFormat:@"Select recipe_ingredients from winter_tbl where recipe_name ='Pineapple' AND recipe_type ='Sensational' "];
            recipeIngredientsArr =[[NSMutableArray alloc]init];
            recipeIngredientsArr =[[database executeQuery:queryingredients]mutableCopy];
            
            
            NSMutableArray *arr_ingredients  = [recipeIngredientsArr valueForKey:@"recipe_ingredients"];
            NSLog(@"%@",arr_ingredients);
            
            //self.recipe_ingredientslbl.text = [arr_ingredients objectAtIndex:0];
            // [self.recipe_ingredientslbl sizeToFit];
            
            recipeIngredientsstr = [arr_ingredients objectAtIndex:0];
            
            //For method
            NSString *querymethod=[ NSString stringWithFormat:@"Select recipe_method from winter_tbl where recipe_name ='Pineapple' AND recipe_type ='Sensational' "];
            recipeMethodArr =[[NSMutableArray alloc]init];
            recipeMethodArr =[[database executeQuery:querymethod]mutableCopy];
            
            
            NSMutableArray *arr_method  = [recipeMethodArr valueForKey:@"recipe_method"];
            NSLog(@"%@",arr_method);
            
            //self.recipe_methodlbl.text = [arr_method objectAtIndex:0];
            //[self.recipe_methodlbl sizeToFit];
            recipeMethodstr = [arr_method objectAtIndex:0];
            
            
            
            [database close];
        }
        
        if([self.imageFile isEqualToString: @"Pomegranate.jpg"])
        {
            [self databaseOpen];
            
            
            //For name
            
            NSString *queryname= [NSString stringWithFormat:@"Select recipe_subcategory,recipe_name,recipe_type from winter_tbl where recipe_name ='Pomegranate' AND recipe_type ='Sensational' "];
            recipeNameArr =[[NSMutableArray alloc]init];
            recipeNameArr =[[database executeQuery:queryname]mutableCopy];
            
            NSMutableArray *arr_name = [recipeNameArr valueForKey:@"recipe_subcategory"];
            
            //self.recipe_namelbl.text = [arr_name objectAtIndex:0];
            
            recipeNamestr = [arr_name objectAtIndex:0];
            
            //For ingredients
            
            NSString *queryingredients=[ NSString stringWithFormat:@"Select recipe_ingredients from winter_tbl where recipe_name ='Pomegranate' AND recipe_type ='Sensational' "];
            recipeIngredientsArr =[[NSMutableArray alloc]init];
            recipeIngredientsArr =[[database executeQuery:queryingredients]mutableCopy];
            
            
            NSMutableArray *arr_ingredients  = [recipeIngredientsArr valueForKey:@"recipe_ingredients"];
            NSLog(@"%@",arr_ingredients);
            
            //self.recipe_ingredientslbl.text = [arr_ingredients objectAtIndex:0];
            // [self.recipe_ingredientslbl sizeToFit];
            
            recipeIngredientsstr = [arr_ingredients objectAtIndex:0];
            
            //For method
            NSString *querymethod=[ NSString stringWithFormat:@"Select recipe_method from winter_tbl where recipe_name ='Pomegranate' AND recipe_type ='Sensational' "];
            recipeMethodArr =[[NSMutableArray alloc]init];
            recipeMethodArr =[[database executeQuery:querymethod]mutableCopy];
            
            
            NSMutableArray *arr_method  = [recipeMethodArr valueForKey:@"recipe_method"];
            NSLog(@"%@",arr_method);
            
            //self.recipe_methodlbl.text = [arr_method objectAtIndex:0];
            //[self.recipe_methodlbl sizeToFit];
            recipeMethodstr = [arr_method objectAtIndex:0];
            
            
            
            [database close];
        }
        if([self.imageFile isEqualToString: @"Prune.jpg"])
        {
            [self databaseOpen];
            
            
            //For name
            
            NSString *queryname= [NSString stringWithFormat:@"Select recipe_subcategory,recipe_name,recipe_type from winter_tbl where recipe_name ='Prunes' AND recipe_type ='Sensational' "];
            recipeNameArr =[[NSMutableArray alloc]init];
            recipeNameArr =[[database executeQuery:queryname]mutableCopy];
            
            NSMutableArray *arr_name = [recipeNameArr valueForKey:@"recipe_subcategory"];
            
            //self.recipe_namelbl.text = [arr_name objectAtIndex:0];
            
            recipeNamestr = [arr_name objectAtIndex:0];
            
            //For ingredients
            
            NSString *queryingredients=[ NSString stringWithFormat:@"Select recipe_ingredients from winter_tbl where recipe_name ='Prunes' AND recipe_type ='Sensational' "];
            recipeIngredientsArr =[[NSMutableArray alloc]init];
            recipeIngredientsArr =[[database executeQuery:queryingredients]mutableCopy];
            
            
            NSMutableArray *arr_ingredients  = [recipeIngredientsArr valueForKey:@"recipe_ingredients"];
            NSLog(@"%@",arr_ingredients);
            
            //self.recipe_ingredientslbl.text = [arr_ingredients objectAtIndex:0];
            // [self.recipe_ingredientslbl sizeToFit];
            
            recipeIngredientsstr = [arr_ingredients objectAtIndex:0];
            
            //For method
            NSString *querymethod=[ NSString stringWithFormat:@"Select recipe_method from winter_tbl where recipe_name ='Prunes' AND recipe_type ='Sensational' "];
            recipeMethodArr =[[NSMutableArray alloc]init];
            recipeMethodArr =[[database executeQuery:querymethod]mutableCopy];
            
            
            NSMutableArray *arr_method  = [recipeMethodArr valueForKey:@"recipe_method"];
            NSLog(@"%@",arr_method);
            
            //self.recipe_methodlbl.text = [arr_method objectAtIndex:0];
            //[self.recipe_methodlbl sizeToFit];
            recipeMethodstr = [arr_method objectAtIndex:0];
            
            
            
            [database close];
        }
        if([self.imageFile isEqualToString: @"Rutabaga.jpg"])
        {
            [self databaseOpen];
            
            
            //For name
            
            NSString *queryname= [NSString stringWithFormat:@"Select recipe_subcategory,recipe_name,recipe_type from winter_tbl where recipe_name ='Rutabaga' AND recipe_type ='Sensational' "];
            recipeNameArr =[[NSMutableArray alloc]init];
            recipeNameArr =[[database executeQuery:queryname]mutableCopy];
            
            NSMutableArray *arr_name = [recipeNameArr valueForKey:@"recipe_subcategory"];
            
            //self.recipe_namelbl.text = [arr_name objectAtIndex:0];
            
            recipeNamestr = [arr_name objectAtIndex:0];
            
            //For ingredients
            
            NSString *queryingredients=[ NSString stringWithFormat:@"Select recipe_ingredients from winter_tbl where recipe_name ='Rutabaga' AND recipe_type ='Sensational' "];
            recipeIngredientsArr =[[NSMutableArray alloc]init];
            recipeIngredientsArr =[[database executeQuery:queryingredients]mutableCopy];
            
            
            NSMutableArray *arr_ingredients  = [recipeIngredientsArr valueForKey:@"recipe_ingredients"];
            NSLog(@"%@",arr_ingredients);
            
            //self.recipe_ingredientslbl.text = [arr_ingredients objectAtIndex:0];
            // [self.recipe_ingredientslbl sizeToFit];
            
            recipeIngredientsstr = [arr_ingredients objectAtIndex:0];
            
            //For method
            NSString *querymethod=[ NSString stringWithFormat:@"Select recipe_method from winter_tbl where recipe_name ='Rutabaga' AND recipe_type ='Sensational' "];
            recipeMethodArr =[[NSMutableArray alloc]init];
            recipeMethodArr =[[database executeQuery:querymethod]mutableCopy];
            
            
            NSMutableArray *arr_method  = [recipeMethodArr valueForKey:@"recipe_method"];
            NSLog(@"%@",arr_method);
            
            //self.recipe_methodlbl.text = [arr_method objectAtIndex:0];
            //[self.recipe_methodlbl sizeToFit];
            recipeMethodstr = [arr_method objectAtIndex:0];
            
            
            
            [database close];
        }
        
        if([self.imageFile isEqualToString: @"Sardines.jpg"])
        {
            [self databaseOpen];
            
            
            //For name
            
            NSString *queryname= [NSString stringWithFormat:@"Select recipe_subcategory,recipe_name,recipe_type from winter_tbl where recipe_name ='Sardine' AND recipe_type ='Sensational' "];
            recipeNameArr =[[NSMutableArray alloc]init];
            recipeNameArr =[[database executeQuery:queryname]mutableCopy];
            
            NSMutableArray *arr_name = [recipeNameArr valueForKey:@"recipe_subcategory"];
            
            //self.recipe_namelbl.text = [arr_name objectAtIndex:0];
            
            recipeNamestr = [arr_name objectAtIndex:0];
            
            //For ingredients
            
            NSString *queryingredients=[ NSString stringWithFormat:@"Select recipe_ingredients from winter_tbl where recipe_name ='Sardine' AND recipe_type ='Sensational' "];
            recipeIngredientsArr =[[NSMutableArray alloc]init];
            recipeIngredientsArr =[[database executeQuery:queryingredients]mutableCopy];
            
            
            NSMutableArray *arr_ingredients  = [recipeIngredientsArr valueForKey:@"recipe_ingredients"];
            NSLog(@"%@",arr_ingredients);
            
            //self.recipe_ingredientslbl.text = [arr_ingredients objectAtIndex:0];
            // [self.recipe_ingredientslbl sizeToFit];
            
            recipeIngredientsstr = [arr_ingredients objectAtIndex:0];
            
            //For method
            NSString *querymethod=[ NSString stringWithFormat:@"Select recipe_method from winter_tbl where recipe_name ='Sardine' AND recipe_type ='Sensational' "];
            recipeMethodArr =[[NSMutableArray alloc]init];
            recipeMethodArr =[[database executeQuery:querymethod]mutableCopy];
            
            
            NSMutableArray *arr_method  = [recipeMethodArr valueForKey:@"recipe_method"];
            NSLog(@"%@",arr_method);
            
            //self.recipe_methodlbl.text = [arr_method objectAtIndex:0];
            //[self.recipe_methodlbl sizeToFit];
            recipeMethodstr = [arr_method objectAtIndex:0];
            
            
            
            [database close];
        }
        
        if([self.imageFile isEqualToString: @"Walnut.jpg"])
        {
            [self databaseOpen];
            
            
            //For name
            
            NSString *queryname= [NSString stringWithFormat:@"Select recipe_subcategory,recipe_name,recipe_type from winter_tbl where recipe_name ='Walnut' AND recipe_type ='Sensational' "];
            recipeNameArr =[[NSMutableArray alloc]init];
            recipeNameArr =[[database executeQuery:queryname]mutableCopy];
            
            NSMutableArray *arr_name = [recipeNameArr valueForKey:@"recipe_subcategory"];
            
            //self.recipe_namelbl.text = [arr_name objectAtIndex:0];
            
            recipeNamestr = [arr_name objectAtIndex:0];
            
            //For ingredients
            
            NSString *queryingredients=[ NSString stringWithFormat:@"Select recipe_ingredients from winter_tbl where recipe_name ='Walnut' AND recipe_type ='Sensational' "];
            recipeIngredientsArr =[[NSMutableArray alloc]init];
            recipeIngredientsArr =[[database executeQuery:queryingredients]mutableCopy];
            
            
            NSMutableArray *arr_ingredients  = [recipeIngredientsArr valueForKey:@"recipe_ingredients"];
            NSLog(@"%@",arr_ingredients);
            
            //self.recipe_ingredientslbl.text = [arr_ingredients objectAtIndex:0];
            // [self.recipe_ingredientslbl sizeToFit];
            
            recipeIngredientsstr = [arr_ingredients objectAtIndex:0];
            
            //For method
            NSString *querymethod=[ NSString stringWithFormat:@"Select recipe_method from winter_tbl where recipe_name ='Walnut' AND recipe_type ='Sensational' "];
            recipeMethodArr =[[NSMutableArray alloc]init];
            recipeMethodArr =[[database executeQuery:querymethod]mutableCopy];
            
            
            NSMutableArray *arr_method  = [recipeMethodArr valueForKey:@"recipe_method"];
            NSLog(@"%@",arr_method);
            
            //self.recipe_methodlbl.text = [arr_method objectAtIndex:0];
            //[self.recipe_methodlbl sizeToFit];
            recipeMethodstr = [arr_method objectAtIndex:0];
            
            
            
            [database close];
        }
        if([self.imageFile isEqualToString: @"Yam.jpg"])
        {
            [self databaseOpen];
            
            
            //For name
            
            NSString *queryname= [NSString stringWithFormat:@"Select recipe_subcategory,recipe_name,recipe_type from winter_tbl where recipe_name ='Yam' AND recipe_type ='Sensational' "];
            recipeNameArr =[[NSMutableArray alloc]init];
            recipeNameArr =[[database executeQuery:queryname]mutableCopy];
            
            NSMutableArray *arr_name = [recipeNameArr valueForKey:@"recipe_subcategory"];
            
            //self.recipe_namelbl.text = [arr_name objectAtIndex:0];
            
            recipeNamestr = [arr_name objectAtIndex:0];
            
            //For ingredients
            
            NSString *queryingredients=[ NSString stringWithFormat:@"Select recipe_ingredients from winter_tbl where recipe_name ='Yam' AND recipe_type ='Sensational' "];
            recipeIngredientsArr =[[NSMutableArray alloc]init];
            recipeIngredientsArr =[[database executeQuery:queryingredients]mutableCopy];
            
            
            NSMutableArray *arr_ingredients  = [recipeIngredientsArr valueForKey:@"recipe_ingredients"];
            NSLog(@"%@",arr_ingredients);
            
            //self.recipe_ingredientslbl.text = [arr_ingredients objectAtIndex:0];
            // [self.recipe_ingredientslbl sizeToFit];
            
            recipeIngredientsstr = [arr_ingredients objectAtIndex:0];
            
            //For method
            NSString *querymethod=[ NSString stringWithFormat:@"Select recipe_method from winter_tbl where recipe_name ='Yam' AND recipe_type ='Sensational' "];
            recipeMethodArr =[[NSMutableArray alloc]init];
            recipeMethodArr =[[database executeQuery:querymethod]mutableCopy];
            
            
            NSMutableArray *arr_method  = [recipeMethodArr valueForKey:@"recipe_method"];
            NSLog(@"%@",arr_method);
            
            //self.recipe_methodlbl.text = [arr_method objectAtIndex:0];
            //[self.recipe_methodlbl sizeToFit];
            recipeMethodstr = [arr_method objectAtIndex:0];
            
            
            
            [database close];
        }
        
 [self performSegueWithIdentifier:@"sensationalsegue" sender:self];
    }
    
    else if ([season isEqualToString:@"summer"])
    {
        
        if([self.imageFile isEqualToString: @"Eggplant.jpg"])
        {
            [self databaseOpen];
            
            
            //For name
            
            NSString *queryname= [NSString stringWithFormat:@"Select recipe_subcategory,recipe_name,recipe_type from summer_tbl where recipe_name ='EGGPLANT' AND recipe_type ='Sensational' "];
            recipeNameArr =[[NSMutableArray alloc]init];
            recipeNameArr =[[database executeQuery:queryname]mutableCopy];
            
            NSMutableArray *arr_name = [recipeNameArr valueForKey:@"recipe_subcategory"];
            
            //self.recipe_namelbl.text = [arr_name objectAtIndex:0];
            
            recipeNamestr = [arr_name objectAtIndex:0];
            
            //For ingredients
            
            NSString *queryingredients=[ NSString stringWithFormat:@"Select recipe_ingredients from summer_tbl where recipe_name ='EGGPLANT' AND recipe_type ='Sensational' "];
            recipeIngredientsArr =[[NSMutableArray alloc]init];
            recipeIngredientsArr =[[database executeQuery:queryingredients]mutableCopy];
            
            
            NSMutableArray *arr_ingredients  = [recipeIngredientsArr valueForKey:@"recipe_ingredients"];
            NSLog(@"%@",arr_ingredients);
            
            //self.recipe_ingredientslbl.text = [arr_ingredients objectAtIndex:0];
            // [self.recipe_ingredientslbl sizeToFit];
            
            recipeIngredientsstr = [arr_ingredients objectAtIndex:0];
            
            //For method
            NSString *querymethod=[ NSString stringWithFormat:@"Select recipe_method from summer_tbl where recipe_name ='EGGPLANT' AND recipe_type ='Sensational' "];
            recipeMethodArr =[[NSMutableArray alloc]init];
            recipeMethodArr =[[database executeQuery:querymethod]mutableCopy];
            
            
            NSMutableArray *arr_method  = [recipeMethodArr valueForKey:@"recipe_method"];
            NSLog(@"%@",arr_method);
            
            //self.recipe_methodlbl.text = [arr_method objectAtIndex:0];
            //[self.recipe_methodlbl sizeToFit];
            recipeMethodstr = [arr_method objectAtIndex:0];
            
            
            
            [database close];
        }
        else if([self.imageFile isEqualToString: @"Frisee.jpg"])
        {
            [self databaseOpen];
            
            
            //For name
            
            NSString *queryname= [NSString stringWithFormat:@"Select recipe_subcategory,recipe_name,recipe_type from summer_tbl where recipe_name ='FRISEE' AND recipe_type ='Sensational' "];
            recipeNameArr =[[NSMutableArray alloc]init];
            recipeNameArr =[[database executeQuery:queryname]mutableCopy];
            
            NSMutableArray *arr_name = [recipeNameArr valueForKey:@"recipe_subcategory"];
            
            //self.recipe_namelbl.text = [arr_name objectAtIndex:0];
            
            recipeNamestr = [arr_name objectAtIndex:0];
            
            //For ingredients
            
            NSString *queryingredients=[ NSString stringWithFormat:@"Select recipe_ingredients from summer_tbl where recipe_name ='FRISEE' AND recipe_type ='Sensational' "];
            recipeIngredientsArr =[[NSMutableArray alloc]init];
            recipeIngredientsArr =[[database executeQuery:queryingredients]mutableCopy];
            
            
            NSMutableArray *arr_ingredients  = [recipeIngredientsArr valueForKey:@"recipe_ingredients"];
            NSLog(@"%@",arr_ingredients);
            
            //self.recipe_ingredientslbl.text = [arr_ingredients objectAtIndex:0];
            // [self.recipe_ingredientslbl sizeToFit];
            
            recipeIngredientsstr = [arr_ingredients objectAtIndex:0];
            
            //For method
            NSString *querymethod=[ NSString stringWithFormat:@"Select recipe_method from summer_tbl where recipe_name ='FRISEE' AND recipe_type ='Sensational' "];
            recipeMethodArr =[[NSMutableArray alloc]init];
            recipeMethodArr =[[database executeQuery:querymethod]mutableCopy];
            
            
            NSMutableArray *arr_method  = [recipeMethodArr valueForKey:@"recipe_method"];
            NSLog(@"%@",arr_method);
            
            //self.recipe_methodlbl.text = [arr_method objectAtIndex:0];
            //[self.recipe_methodlbl sizeToFit];
            recipeMethodstr = [arr_method objectAtIndex:0];
            
            
            
            [database close];
        }
        else if([self.imageFile isEqualToString: @"Shrimp.jpg"])
        {
            [self databaseOpen];
            
            
            //For name
            
            NSString *queryname= [NSString stringWithFormat:@"Select recipe_subcategory,recipe_name,recipe_type from summer_tbl where recipe_name ='SHRIMP' AND recipe_type ='Sensational' "];
            recipeNameArr =[[NSMutableArray alloc]init];
            recipeNameArr =[[database executeQuery:queryname]mutableCopy];
            
            NSMutableArray *arr_name = [recipeNameArr valueForKey:@"recipe_subcategory"];
            
            //self.recipe_namelbl.text = [arr_name objectAtIndex:0];
            
            recipeNamestr = [arr_name objectAtIndex:0];
            
            //For ingredients
            
            NSString *queryingredients=[ NSString stringWithFormat:@"Select recipe_ingredients from summer_tbl where recipe_name ='SHRIMP' AND recipe_type ='Sensational' "];
            recipeIngredientsArr =[[NSMutableArray alloc]init];
            recipeIngredientsArr =[[database executeQuery:queryingredients]mutableCopy];
            
            
            NSMutableArray *arr_ingredients  = [recipeIngredientsArr valueForKey:@"recipe_ingredients"];
            NSLog(@"%@",arr_ingredients);
            
            //self.recipe_ingredientslbl.text = [arr_ingredients objectAtIndex:0];
            // [self.recipe_ingredientslbl sizeToFit];
            
            recipeIngredientsstr = [arr_ingredients objectAtIndex:0];
            
            //For method
            NSString *querymethod=[ NSString stringWithFormat:@"Select recipe_method from summer_tbl where recipe_name ='SHRIMP' AND recipe_type ='Sensational' "];
            recipeMethodArr =[[NSMutableArray alloc]init];
            recipeMethodArr =[[database executeQuery:querymethod]mutableCopy];
            
            
            NSMutableArray *arr_method  = [recipeMethodArr valueForKey:@"recipe_method"];
            NSLog(@"%@",arr_method);
            
            //self.recipe_methodlbl.text = [arr_method objectAtIndex:0];
            //[self.recipe_methodlbl sizeToFit];
            recipeMethodstr = [arr_method objectAtIndex:0];
            
            
            
            [database close];
        }
        else if([self.imageFile isEqualToString: @"Avocado.jpg"])
        {
            [self databaseOpen];
            
            
            //For name
            
            NSString *queryname= [NSString stringWithFormat:@"Select recipe_subcategory,recipe_name,recipe_type from summer_tbl where recipe_name ='AVOCADO' AND recipe_type ='Sensational' "];
            recipeNameArr =[[NSMutableArray alloc]init];
            recipeNameArr =[[database executeQuery:queryname]mutableCopy];
            
            NSMutableArray *arr_name = [recipeNameArr valueForKey:@"recipe_subcategory"];
            
            //self.recipe_namelbl.text = [arr_name objectAtIndex:0];
            
            recipeNamestr = [arr_name objectAtIndex:0];
            
            //For ingredients
            
            NSString *queryingredients=[ NSString stringWithFormat:@"Select recipe_ingredients from summer_tbl where recipe_name ='AVOCADO' AND recipe_type ='Sensational' "];
            recipeIngredientsArr =[[NSMutableArray alloc]init];
            recipeIngredientsArr =[[database executeQuery:queryingredients]mutableCopy];
            
            
            NSMutableArray *arr_ingredients  = [recipeIngredientsArr valueForKey:@"recipe_ingredients"];
            NSLog(@"%@",arr_ingredients);
            
            //self.recipe_ingredientslbl.text = [arr_ingredients objectAtIndex:0];
            // [self.recipe_ingredientslbl sizeToFit];
            
            recipeIngredientsstr = [arr_ingredients objectAtIndex:0];
            
            //For method
            NSString *querymethod=[ NSString stringWithFormat:@"Select recipe_method from summer_tbl where recipe_name ='AVOCADO' AND recipe_type ='Sensational' "];
            recipeMethodArr =[[NSMutableArray alloc]init];
            recipeMethodArr =[[database executeQuery:querymethod]mutableCopy];
            
            
            NSMutableArray *arr_method  = [recipeMethodArr valueForKey:@"recipe_method"];
            NSLog(@"%@",arr_method);
            
            //self.recipe_methodlbl.text = [arr_method objectAtIndex:0];
            //[self.recipe_methodlbl sizeToFit];
            recipeMethodstr = [arr_method objectAtIndex:0];
            
            
            
            [database close];
        }
        else if([self.imageFile isEqualToString: @"Almond.jpg"])
        {
            [self databaseOpen];
            
            
            //For name
            
            NSString *queryname= [NSString stringWithFormat:@"Select recipe_subcategory,recipe_name,recipe_type from summer_tbl where recipe_name ='ALMOND' AND recipe_type ='Sensational' "];
            recipeNameArr =[[NSMutableArray alloc]init];
            recipeNameArr =[[database executeQuery:queryname]mutableCopy];
            
            NSMutableArray *arr_name = [recipeNameArr valueForKey:@"recipe_subcategory"];
            
            //self.recipe_namelbl.text = [arr_name objectAtIndex:0];
            
            recipeNamestr = [arr_name objectAtIndex:0];
            
            //For ingredients
            
            NSString *queryingredients=[ NSString stringWithFormat:@"Select recipe_ingredients from summer_tbl where recipe_name ='ALMOND' AND recipe_type ='Sensational' "];
            recipeIngredientsArr =[[NSMutableArray alloc]init];
            recipeIngredientsArr =[[database executeQuery:queryingredients]mutableCopy];
            
            
            NSMutableArray *arr_ingredients  = [recipeIngredientsArr valueForKey:@"recipe_ingredients"];
            NSLog(@"%@",arr_ingredients);
            
            //self.recipe_ingredientslbl.text = [arr_ingredients objectAtIndex:0];
            // [self.recipe_ingredientslbl sizeToFit];
            
            recipeIngredientsstr = [arr_ingredients objectAtIndex:0];
            
            //For method
            NSString *querymethod=[ NSString stringWithFormat:@"Select recipe_method from summer_tbl where recipe_name ='ALMOND' AND recipe_type ='Sensational' "];
            recipeMethodArr =[[NSMutableArray alloc]init];
            recipeMethodArr =[[database executeQuery:querymethod]mutableCopy];
            
            
            NSMutableArray *arr_method  = [recipeMethodArr valueForKey:@"recipe_method"];
            NSLog(@"%@",arr_method);
            
            //self.recipe_methodlbl.text = [arr_method objectAtIndex:0];
            //[self.recipe_methodlbl sizeToFit];
            recipeMethodstr = [arr_method objectAtIndex:0];
            
            
            
            [database close];
        }

       else if([self.imageFile isEqualToString: @"Apricots.jpg"])
        {
            [self databaseOpen];
            
            
            //For name
            
            NSString *queryname= [NSString stringWithFormat:@"Select recipe_subcategory,recipe_name,recipe_type from summer_tbl where recipe_name ='APRICOT' AND recipe_type ='Sensational' "];
            recipeNameArr =[[NSMutableArray alloc]init];
            recipeNameArr =[[database executeQuery:queryname]mutableCopy];
            
            NSMutableArray *arr_name = [recipeNameArr valueForKey:@"recipe_subcategory"];
            
            //self.recipe_namelbl.text = [arr_name objectAtIndex:0];
            
            recipeNamestr = [arr_name objectAtIndex:0];
            
            //For ingredients
            
            NSString *queryingredients=[ NSString stringWithFormat:@"Select recipe_ingredients from summer_tbl where recipe_name ='APRICOT' AND recipe_type ='Sensational' "];
            recipeIngredientsArr =[[NSMutableArray alloc]init];
            recipeIngredientsArr =[[database executeQuery:queryingredients]mutableCopy];
            
            
            NSMutableArray *arr_ingredients  = [recipeIngredientsArr valueForKey:@"recipe_ingredients"];
            NSLog(@"%@",arr_ingredients);
            
            //self.recipe_ingredientslbl.text = [arr_ingredients objectAtIndex:0];
            // [self.recipe_ingredientslbl sizeToFit];
            
            recipeIngredientsstr = [arr_ingredients objectAtIndex:0];
            
            //For method
            NSString *querymethod=[ NSString stringWithFormat:@"Select recipe_method from summer_tbl where recipe_name ='APRICOT' AND recipe_type ='Sensational' "];
            recipeMethodArr =[[NSMutableArray alloc]init];
            recipeMethodArr =[[database executeQuery:querymethod]mutableCopy];
            
            
            NSMutableArray *arr_method  = [recipeMethodArr valueForKey:@"recipe_method"];
            NSLog(@"%@",arr_method);
            
            //self.recipe_methodlbl.text = [arr_method objectAtIndex:0];
            //[self.recipe_methodlbl sizeToFit];
            recipeMethodstr = [arr_method objectAtIndex:0];
            
            
            
            [database close];
        }
        if([self.imageFile isEqualToString: @"Arugula.jpg"])
        {
            [self databaseOpen];
            
            
            //For name
            
            NSString *queryname= [NSString stringWithFormat:@"Select recipe_subcategory,recipe_name,recipe_type from summer_tbl where recipe_name ='ARUGULA' AND recipe_type ='Sensational' "];
            recipeNameArr =[[NSMutableArray alloc]init];
            recipeNameArr =[[database executeQuery:queryname]mutableCopy];
            
            NSMutableArray *arr_name = [recipeNameArr valueForKey:@"recipe_subcategory"];
            
            //self.recipe_namelbl.text = [arr_name objectAtIndex:0];
            
            recipeNamestr = [arr_name objectAtIndex:0];
            
            //For ingredients
            
            NSString *queryingredients=[ NSString stringWithFormat:@"Select recipe_ingredients from summer_tbl where recipe_name ='ARUGULA' AND recipe_type ='Sensational' "];
            recipeIngredientsArr =[[NSMutableArray alloc]init];
            recipeIngredientsArr =[[database executeQuery:queryingredients]mutableCopy];
            
            
            NSMutableArray *arr_ingredients  = [recipeIngredientsArr valueForKey:@"recipe_ingredients"];
            NSLog(@"%@",arr_ingredients);
            
            //self.recipe_ingredientslbl.text = [arr_ingredients objectAtIndex:0];
            // [self.recipe_ingredientslbl sizeToFit];
            
            recipeIngredientsstr = [arr_ingredients objectAtIndex:0];
            
            //For method
            NSString *querymethod=[ NSString stringWithFormat:@"Select recipe_method from summer_tbl where recipe_name ='ARUGULA' AND recipe_type ='Sensational' "];
            recipeMethodArr =[[NSMutableArray alloc]init];
            recipeMethodArr =[[database executeQuery:querymethod]mutableCopy];
            
            
            NSMutableArray *arr_method  = [recipeMethodArr valueForKey:@"recipe_method"];
            NSLog(@"%@",arr_method);
            
            //self.recipe_methodlbl.text = [arr_method objectAtIndex:0];
            //[self.recipe_methodlbl sizeToFit];
            recipeMethodstr = [arr_method objectAtIndex:0];
            
            
            
            [database close];
        }
        
        if([self.imageFile isEqualToString: @"Bell-Pepper.jpg"])
        {
            [self databaseOpen];
            
            
            //For name
            
            NSString *queryname= [NSString stringWithFormat:@"Select recipe_subcategory,recipe_name,recipe_type from summer_tbl where recipe_name ='BELL PEPPER' AND recipe_type ='Sensational' "];
            recipeNameArr =[[NSMutableArray alloc]init];
            recipeNameArr =[[database executeQuery:queryname]mutableCopy];
            
            NSMutableArray *arr_name = [recipeNameArr valueForKey:@"recipe_subcategory"];
            
            //self.recipe_namelbl.text = [arr_name objectAtIndex:0];
            
            recipeNamestr = [arr_name objectAtIndex:0];
            
            //For ingredients
            
            NSString *queryingredients=[ NSString stringWithFormat:@"Select recipe_ingredients from summer_tbl where recipe_name ='BELL PEPPER' AND recipe_type ='Sensational' "];
            recipeIngredientsArr =[[NSMutableArray alloc]init];
            recipeIngredientsArr =[[database executeQuery:queryingredients]mutableCopy];
            
            
            NSMutableArray *arr_ingredients  = [recipeIngredientsArr valueForKey:@"recipe_ingredients"];
            NSLog(@"%@",arr_ingredients);
            
            //self.recipe_ingredientslbl.text = [arr_ingredients objectAtIndex:0];
            // [self.recipe_ingredientslbl sizeToFit];
            
            recipeIngredientsstr = [arr_ingredients objectAtIndex:0];
            
            //For method
            NSString *querymethod=[ NSString stringWithFormat:@"Select recipe_method from  summer_tbl where recipe_name ='BELL PEPPER' AND recipe_type ='Sensational' "];
            recipeMethodArr =[[NSMutableArray alloc]init];
            recipeMethodArr =[[database executeQuery:querymethod]mutableCopy];
            
            
            NSMutableArray *arr_method  = [recipeMethodArr valueForKey:@"recipe_method"];
            NSLog(@"%@",arr_method);
            
            //self.recipe_methodlbl.text = [arr_method objectAtIndex:0];
            //[self.recipe_methodlbl sizeToFit];
            recipeMethodstr = [arr_method objectAtIndex:0];
            
            
            
            [database close];
        }
        if([self.imageFile isEqualToString: @"Blueberry.jpg"])
        {
            [self databaseOpen];
            
            
            //For name
            
            NSString *queryname= [NSString stringWithFormat:@"Select recipe_subcategory,recipe_name,recipe_type from  summer_tbl where recipe_name ='BLUEBERRY' AND recipe_type ='Sensational' "];
            recipeNameArr =[[NSMutableArray alloc]init];
            recipeNameArr =[[database executeQuery:queryname]mutableCopy];
            
            NSMutableArray *arr_name = [recipeNameArr valueForKey:@"recipe_subcategory"];
            
            //self.recipe_namelbl.text = [arr_name objectAtIndex:0];
            
            recipeNamestr = [arr_name objectAtIndex:0];
            
            //For ingredients
            
            NSString *queryingredients=[ NSString stringWithFormat:@"Select recipe_ingredients from  summer_tbl where recipe_name ='BLUEBERRY' AND recipe_type ='Sensational' "];
            recipeIngredientsArr =[[NSMutableArray alloc]init];
            recipeIngredientsArr =[[database executeQuery:queryingredients]mutableCopy];
            
            
            NSMutableArray *arr_ingredients  = [recipeIngredientsArr valueForKey:@"recipe_ingredients"];
            NSLog(@"%@",arr_ingredients);
            
            //self.recipe_ingredientslbl.text = [arr_ingredients objectAtIndex:0];
            // [self.recipe_ingredientslbl sizeToFit];
            
            recipeIngredientsstr = [arr_ingredients objectAtIndex:0];
            
            //For method
            NSString *querymethod=[ NSString stringWithFormat:@"Select recipe_method from  summer_tbl where recipe_name ='BLUEBERRY' AND recipe_type ='Sensational' "];
            recipeMethodArr =[[NSMutableArray alloc]init];
            recipeMethodArr =[[database executeQuery:querymethod]mutableCopy];
            
            
            NSMutableArray *arr_method  = [recipeMethodArr valueForKey:@"recipe_method"];
            NSLog(@"%@",arr_method);
            
            //self.recipe_methodlbl.text = [arr_method objectAtIndex:0];
            //[self.recipe_methodlbl sizeToFit];
            recipeMethodstr = [arr_method objectAtIndex:0];
            
            
            
            [database close];
        }
        
        if([self.imageFile isEqualToString: @"Bok-Choy.jpg"])
        {
            [self databaseOpen];
            
            
            //For name
            
            NSString *queryname= [NSString stringWithFormat:@"Select recipe_subcategory,recipe_name,recipe_type from  summer_tbl where recipe_name ='BOK CHOY' AND recipe_type ='Sensational' "];
            recipeNameArr =[[NSMutableArray alloc]init];
            recipeNameArr =[[database executeQuery:queryname]mutableCopy];
            
            NSMutableArray *arr_name = [recipeNameArr valueForKey:@"recipe_subcategory"];
            
            //self.recipe_namelbl.text = [arr_name objectAtIndex:0];
            
            recipeNamestr = [arr_name objectAtIndex:0];
            
            //For ingredients
            
            NSString *queryingredients=[ NSString stringWithFormat:@"Select recipe_ingredients from  summer_tbl where recipe_name ='BOK CHOY' AND recipe_type ='Sensational' "];
            recipeIngredientsArr =[[NSMutableArray alloc]init];
            recipeIngredientsArr =[[database executeQuery:queryingredients]mutableCopy];
            
            
            NSMutableArray *arr_ingredients  = [recipeIngredientsArr valueForKey:@"recipe_ingredients"];
            NSLog(@"%@",arr_ingredients);
            
            //self.recipe_ingredientslbl.text = [arr_ingredients objectAtIndex:0];
            // [self.recipe_ingredientslbl sizeToFit];
            
            recipeIngredientsstr = [arr_ingredients objectAtIndex:0];
            
            //For method
            NSString *querymethod=[ NSString stringWithFormat:@"Select recipe_method from  summer_tbl where recipe_name ='BOK CHOY' AND recipe_type ='Sensational' "];
            recipeMethodArr =[[NSMutableArray alloc]init];
            recipeMethodArr =[[database executeQuery:querymethod]mutableCopy];
            
            
            NSMutableArray *arr_method  = [recipeMethodArr valueForKey:@"recipe_method"];
            NSLog(@"%@",arr_method);
            
            //self.recipe_methodlbl.text = [arr_method objectAtIndex:0];
            //[self.recipe_methodlbl sizeToFit];
            recipeMethodstr = [arr_method objectAtIndex:0];
            
            
            
            [database close];
        }
        if([self.imageFile isEqualToString: @"Chicken.jpg"])
        {
            [self databaseOpen];
            
            
            //For name
            
            NSString *queryname= [NSString stringWithFormat:@"Select recipe_subcategory,recipe_name,recipe_type from  summer_tbl where recipe_name ='CHICKEN' AND recipe_type ='Sensational' "];
            recipeNameArr =[[NSMutableArray alloc]init];
            recipeNameArr =[[database executeQuery:queryname]mutableCopy];
            
            NSMutableArray *arr_name = [recipeNameArr valueForKey:@"recipe_subcategory"];
            
            //self.recipe_namelbl.text = [arr_name objectAtIndex:0];
            
            recipeNamestr = [arr_name objectAtIndex:0];
            
            //For ingredients
            
            NSString *queryingredients=[ NSString stringWithFormat:@"Select recipe_ingredients from  summer_tbl where recipe_name ='CHICKEN' AND recipe_type ='Sensational' "];
            recipeIngredientsArr =[[NSMutableArray alloc]init];
            recipeIngredientsArr =[[database executeQuery:queryingredients]mutableCopy];
            
            
            NSMutableArray *arr_ingredients  = [recipeIngredientsArr valueForKey:@"recipe_ingredients"];
            NSLog(@"%@",arr_ingredients);
            
            //self.recipe_ingredientslbl.text = [arr_ingredients objectAtIndex:0];
            // [self.recipe_ingredientslbl sizeToFit];
            
            recipeIngredientsstr = [arr_ingredients objectAtIndex:0];
            
            //For method
            NSString *querymethod=[ NSString stringWithFormat:@"Select recipe_method from  summer_tbl where recipe_name ='CHICKEN' AND recipe_type ='Sensational' "];
            recipeMethodArr =[[NSMutableArray alloc]init];
            recipeMethodArr =[[database executeQuery:querymethod]mutableCopy];
            
            
            NSMutableArray *arr_method  = [recipeMethodArr valueForKey:@"recipe_method"];
            NSLog(@"%@",arr_method);
            
            //self.recipe_methodlbl.text = [arr_method objectAtIndex:0];
            //[self.recipe_methodlbl sizeToFit];
            recipeMethodstr = [arr_method objectAtIndex:0];
            
            
            
            [database close];
        }
        
        if([self.imageFile isEqualToString: @"Cilantro.jpg"])
        {
            [self databaseOpen];
            
            
            //For name
            
            NSString *queryname= [NSString stringWithFormat:@"Select recipe_subcategory,recipe_name,recipe_type from  summer_tbl where recipe_name ='CILANTRO' AND recipe_type ='Sensational' "];
            recipeNameArr =[[NSMutableArray alloc]init];
            recipeNameArr =[[database executeQuery:queryname]mutableCopy];
            
            NSMutableArray *arr_name = [recipeNameArr valueForKey:@"recipe_subcategory"];
            
            //self.recipe_namelbl.text = [arr_name objectAtIndex:0];
            
            recipeNamestr = [arr_name objectAtIndex:0];
            
            //For ingredients
            
            NSString *queryingredients=[ NSString stringWithFormat:@"Select recipe_ingredients from  summer_tbl where recipe_name ='CILANTRO' AND recipe_type ='Sensational' "];
            recipeIngredientsArr =[[NSMutableArray alloc]init];
            recipeIngredientsArr =[[database executeQuery:queryingredients]mutableCopy];
            
            
            NSMutableArray *arr_ingredients  = [recipeIngredientsArr valueForKey:@"recipe_ingredients"];
            NSLog(@"%@",arr_ingredients);
            
            //self.recipe_ingredientslbl.text = [arr_ingredients objectAtIndex:0];
            // [self.recipe_ingredientslbl sizeToFit];
            
            recipeIngredientsstr = [arr_ingredients objectAtIndex:0];
            
            //For method
            NSString *querymethod=[ NSString stringWithFormat:@"Select recipe_method from  summer_tbl where recipe_name ='CILANTRO' AND recipe_type ='Sensational' "];
            recipeMethodArr =[[NSMutableArray alloc]init];
            recipeMethodArr =[[database executeQuery:querymethod]mutableCopy];
            
            
            NSMutableArray *arr_method  = [recipeMethodArr valueForKey:@"recipe_method"];
            NSLog(@"%@",arr_method);
            
            //self.recipe_methodlbl.text = [arr_method objectAtIndex:0];
            //[self.recipe_methodlbl sizeToFit];
            recipeMethodstr = [arr_method objectAtIndex:0];
            
            
            
            [database close];
        }
        if([self.imageFile isEqualToString: @"Corn.jpg"])
        {
            [self databaseOpen];
            
            
            //For name
            
            NSString *queryname= [NSString stringWithFormat:@"Select recipe_subcategory,recipe_name,recipe_type from  summer_tbl where recipe_name ='CORN' AND recipe_type ='Sensational' "];
            recipeNameArr =[[NSMutableArray alloc]init];
            recipeNameArr =[[database executeQuery:queryname]mutableCopy];
            
            NSMutableArray *arr_name = [recipeNameArr valueForKey:@"recipe_subcategory"];
            
            //self.recipe_namelbl.text = [arr_name objectAtIndex:0];
            
            recipeNamestr = [arr_name objectAtIndex:0];
            
            //For ingredients
            
            NSString *queryingredients=[ NSString stringWithFormat:@"Select recipe_ingredients from  summer_tbl where recipe_name ='CORN' AND recipe_type ='Sensational' "];
            recipeIngredientsArr =[[NSMutableArray alloc]init];
            recipeIngredientsArr =[[database executeQuery:queryingredients]mutableCopy];
            
            
            NSMutableArray *arr_ingredients  = [recipeIngredientsArr valueForKey:@"recipe_ingredients"];
            NSLog(@"%@",arr_ingredients);
            
            //self.recipe_ingredientslbl.text = [arr_ingredients objectAtIndex:0];
            // [self.recipe_ingredientslbl sizeToFit];
            
            recipeIngredientsstr = [arr_ingredients objectAtIndex:0];
            
            //For method
            NSString *querymethod=[ NSString stringWithFormat:@"Select recipe_method from  summer_tbl where recipe_name ='CORN' AND recipe_type ='Sensational' "];
            recipeMethodArr =[[NSMutableArray alloc]init];
            recipeMethodArr =[[database executeQuery:querymethod]mutableCopy];
            
            
            NSMutableArray *arr_method  = [recipeMethodArr valueForKey:@"recipe_method"];
            NSLog(@"%@",arr_method);
            
            //self.recipe_methodlbl.text = [arr_method objectAtIndex:0];
            //[self.recipe_methodlbl sizeToFit];
            recipeMethodstr = [arr_method objectAtIndex:0];
            
            
            
            [database close];
        }
        
        if([self.imageFile isEqualToString: @"Cucumber.jpg"])
        {
            [self databaseOpen];
            
            
            //For name
            
            NSString *queryname= [NSString stringWithFormat:@"Select recipe_subcategory,recipe_name,recipe_type from  summer_tbl where recipe_name ='CUCUMBER' AND recipe_type ='Sensational' "];
            recipeNameArr =[[NSMutableArray alloc]init];
            recipeNameArr =[[database executeQuery:queryname]mutableCopy];
            
            NSMutableArray *arr_name = [recipeNameArr valueForKey:@"recipe_subcategory"];
            
            //self.recipe_namelbl.text = [arr_name objectAtIndex:0];
            
            recipeNamestr = [arr_name objectAtIndex:0];
            
            //For ingredients
            
            NSString *queryingredients=[ NSString stringWithFormat:@"Select recipe_ingredients from  summer_tbl where recipe_name ='CUCUMBER' AND recipe_type ='Sensational' "];
            recipeIngredientsArr =[[NSMutableArray alloc]init];
            recipeIngredientsArr =[[database executeQuery:queryingredients]mutableCopy];
            
            
            NSMutableArray *arr_ingredients  = [recipeIngredientsArr valueForKey:@"recipe_ingredients"];
            NSLog(@"%@",arr_ingredients);
            
            //self.recipe_ingredientslbl.text = [arr_ingredients objectAtIndex:0];
            // [self.recipe_ingredientslbl sizeToFit];
            
            recipeIngredientsstr = [arr_ingredients objectAtIndex:0];
            
            //For method
            NSString *querymethod=[ NSString stringWithFormat:@"Select recipe_method from  summer_tbl where recipe_name ='CUCUMBER' AND recipe_type ='Sensational' "];
            recipeMethodArr =[[NSMutableArray alloc]init];
            recipeMethodArr =[[database executeQuery:querymethod]mutableCopy];
            
            
            NSMutableArray *arr_method  = [recipeMethodArr valueForKey:@"recipe_method"];
            NSLog(@"%@",arr_method);
            
            //self.recipe_methodlbl.text = [arr_method objectAtIndex:0];
            //[self.recipe_methodlbl sizeToFit];
            recipeMethodstr = [arr_method objectAtIndex:0];
            
            
            
            [database close];
        }
        if([self.imageFile isEqualToString: @"Endive.jpg"])
        {
            [self databaseOpen];
            
            
            //For name
            
            NSString *queryname= [NSString stringWithFormat:@"Select recipe_subcategory,recipe_name,recipe_type from  summer_tbl where recipe_name ='ENDIVE' AND recipe_type ='Sensational' "];
            recipeNameArr =[[NSMutableArray alloc]init];
            recipeNameArr =[[database executeQuery:queryname]mutableCopy];
            
            NSMutableArray *arr_name = [recipeNameArr valueForKey:@"recipe_subcategory"];
            
            //self.recipe_namelbl.text = [arr_name objectAtIndex:0];
            
            recipeNamestr = [arr_name objectAtIndex:0];
            
            //For ingredients
            
            NSString *queryingredients=[ NSString stringWithFormat:@"Select recipe_ingredients from  summer_tbl where recipe_name ='ENDIVE' AND recipe_type ='Sensational' "];
            recipeIngredientsArr =[[NSMutableArray alloc]init];
            recipeIngredientsArr =[[database executeQuery:queryingredients]mutableCopy];
            
            
            NSMutableArray *arr_ingredients  = [recipeIngredientsArr valueForKey:@"recipe_ingredients"];
            NSLog(@"%@",arr_ingredients);
            
            //self.recipe_ingredientslbl.text = [arr_ingredients objectAtIndex:0];
            // [self.recipe_ingredientslbl sizeToFit];
            
            recipeIngredientsstr = [arr_ingredients objectAtIndex:0];
            
            //For method
            NSString *querymethod=[ NSString stringWithFormat:@"Select recipe_method from  summer_tbl where recipe_name ='ENDIVE' AND recipe_type ='Sensational' "];
            recipeMethodArr =[[NSMutableArray alloc]init];
            recipeMethodArr =[[database executeQuery:querymethod]mutableCopy];
            
            
            NSMutableArray *arr_method  = [recipeMethodArr valueForKey:@"recipe_method"];
            NSLog(@"%@",arr_method);
            
            //self.recipe_methodlbl.text = [arr_method objectAtIndex:0];
            //[self.recipe_methodlbl sizeToFit];
            recipeMethodstr = [arr_method objectAtIndex:0];
            
            
            
            [database close];
        }
        if([self.imageFile isEqualToString: @"Green-Bean.jpg"])
        {
            [self databaseOpen];
            
            
            //For name
            
            NSString *queryname= [NSString stringWithFormat:@"Select recipe_subcategory,recipe_name,recipe_type from  summer_tbl where recipe_name ='GREEN BEAN' AND recipe_type ='Sensational' "];
            recipeNameArr =[[NSMutableArray alloc]init];
            recipeNameArr =[[database executeQuery:queryname]mutableCopy];
            
            NSMutableArray *arr_name = [recipeNameArr valueForKey:@"recipe_subcategory"];
            
            //self.recipe_namelbl.text = [arr_name objectAtIndex:0];
            
            recipeNamestr = [arr_name objectAtIndex:0];
            
            //For ingredients
            
            NSString *queryingredients=[ NSString stringWithFormat:@"Select recipe_ingredients from  summer_tbl where recipe_name ='GREEN BEAN' AND recipe_type ='Sensational' "];
            recipeIngredientsArr =[[NSMutableArray alloc]init];
            recipeIngredientsArr =[[database executeQuery:queryingredients]mutableCopy];
            
            
            NSMutableArray *arr_ingredients  = [recipeIngredientsArr valueForKey:@"recipe_ingredients"];
            NSLog(@"%@",arr_ingredients);
            
            //self.recipe_ingredientslbl.text = [arr_ingredients objectAtIndex:0];
            // [self.recipe_ingredientslbl sizeToFit];
            
            recipeIngredientsstr = [arr_ingredients objectAtIndex:0];
            
            //For method
            NSString *querymethod=[ NSString stringWithFormat:@"Select recipe_method from  summer_tbl where recipe_name ='GREEN BEAN' AND recipe_type ='Sensational' "];
            recipeMethodArr =[[NSMutableArray alloc]init];
            recipeMethodArr =[[database executeQuery:querymethod]mutableCopy];
            
            
            NSMutableArray *arr_method  = [recipeMethodArr valueForKey:@"recipe_method"];
            NSLog(@"%@",arr_method);
            
            //self.recipe_methodlbl.text = [arr_method objectAtIndex:0];
            //[self.recipe_methodlbl sizeToFit];
            recipeMethodstr = [arr_method objectAtIndex:0];
            
            
            
            [database close];
        }
        
        if([self.imageFile isEqualToString: @"Melons.jpg"])
        {
            [self databaseOpen];
            
            
            //For name
            
            NSString *queryname= [NSString stringWithFormat:@"Select recipe_subcategory,recipe_name,recipe_type from  summer_tbl where recipe_name ='MELON' AND recipe_type ='Sensational' "];
            recipeNameArr =[[NSMutableArray alloc]init];
            recipeNameArr =[[database executeQuery:queryname]mutableCopy];
            
            NSMutableArray *arr_name = [recipeNameArr valueForKey:@"recipe_subcategory"];
            
            //self.recipe_namelbl.text = [arr_name objectAtIndex:0];
            
            recipeNamestr = [arr_name objectAtIndex:0];
            
            //For ingredients
            
            NSString *queryingredients=[ NSString stringWithFormat:@"Select recipe_ingredients from  summer_tbl where recipe_name ='MELON' AND recipe_type ='Sensational' "];
            recipeIngredientsArr =[[NSMutableArray alloc]init];
            recipeIngredientsArr =[[database executeQuery:queryingredients]mutableCopy];
            
            
            NSMutableArray *arr_ingredients  = [recipeIngredientsArr valueForKey:@"recipe_ingredients"];
            NSLog(@"%@",arr_ingredients);
            
            //self.recipe_ingredientslbl.text = [arr_ingredients objectAtIndex:0];
            // [self.recipe_ingredientslbl sizeToFit];
            
            recipeIngredientsstr = [arr_ingredients objectAtIndex:0];
            
            //For method
            NSString *querymethod=[ NSString stringWithFormat:@"Select recipe_method from  summer_tbl where recipe_name ='MELON' AND recipe_type ='Sensational' "];
            recipeMethodArr =[[NSMutableArray alloc]init];
            recipeMethodArr =[[database executeQuery:querymethod]mutableCopy];
            
            
            NSMutableArray *arr_method  = [recipeMethodArr valueForKey:@"recipe_method"];
            NSLog(@"%@",arr_method);
            
            //self.recipe_methodlbl.text = [arr_method objectAtIndex:0];
            //[self.recipe_methodlbl sizeToFit];
            recipeMethodstr = [arr_method objectAtIndex:0];
            
            
            
            [database close];
        }
        
        if([self.imageFile isEqualToString: @"Peach.jpg"])
        {
            [self databaseOpen];
            
            
            //For name
            
            NSString *queryname= [NSString stringWithFormat:@"Select recipe_subcategory,recipe_name,recipe_type from  summer_tbl where recipe_name ='PEACH' AND recipe_type ='Sensational' "];
            recipeNameArr =[[NSMutableArray alloc]init];
            recipeNameArr =[[database executeQuery:queryname]mutableCopy];
            
            NSMutableArray *arr_name = [recipeNameArr valueForKey:@"recipe_subcategory"];
            
            //self.recipe_namelbl.text = [arr_name objectAtIndex:0];
            
            recipeNamestr = [arr_name objectAtIndex:0];
            
            //For ingredients
            
            NSString *queryingredients=[ NSString stringWithFormat:@"Select recipe_ingredients from  summer_tbl where recipe_name ='PEACH' AND recipe_type ='Sensational' "];
            recipeIngredientsArr =[[NSMutableArray alloc]init];
            recipeIngredientsArr =[[database executeQuery:queryingredients]mutableCopy];
            
            
            NSMutableArray *arr_ingredients  = [recipeIngredientsArr valueForKey:@"recipe_ingredients"];
            NSLog(@"%@",arr_ingredients);
            
            //self.recipe_ingredientslbl.text = [arr_ingredients objectAtIndex:0];
            // [self.recipe_ingredientslbl sizeToFit];
            
            recipeIngredientsstr = [arr_ingredients objectAtIndex:0];
            
            //For method
            NSString *querymethod=[ NSString stringWithFormat:@"Select recipe_method from  summer_tbl where recipe_name ='PEACH' AND recipe_type ='Sensational' "];
            recipeMethodArr =[[NSMutableArray alloc]init];
            recipeMethodArr =[[database executeQuery:querymethod]mutableCopy];
            
            
            NSMutableArray *arr_method  = [recipeMethodArr valueForKey:@"recipe_method"];
            NSLog(@"%@",arr_method);
            
            //self.recipe_methodlbl.text = [arr_method objectAtIndex:0];
            //[self.recipe_methodlbl sizeToFit];
            recipeMethodstr = [arr_method objectAtIndex:0];
            
            
            
            [database close];
        }
        
        if([self.imageFile isEqualToString: @"Radicchio.jpg"])
        {
            [self databaseOpen];
            
            
            //For name
            
            NSString *queryname= [NSString stringWithFormat:@"Select recipe_subcategory,recipe_name,recipe_type from  summer_tbl where recipe_name ='RADICCHIO' AND recipe_type ='Sensational' "];
            recipeNameArr =[[NSMutableArray alloc]init];
            recipeNameArr =[[database executeQuery:queryname]mutableCopy];
            
            NSMutableArray *arr_name = [recipeNameArr valueForKey:@"recipe_subcategory"];
            
            //self.recipe_namelbl.text = [arr_name objectAtIndex:0];
            
            recipeNamestr = [arr_name objectAtIndex:0];
            
            //For ingredients
            
            NSString *queryingredients=[ NSString stringWithFormat:@"Select recipe_ingredients from  summer_tbl where recipe_name ='RADICCHIO' AND recipe_type ='Sensational' "];
            recipeIngredientsArr =[[NSMutableArray alloc]init];
            recipeIngredientsArr =[[database executeQuery:queryingredients]mutableCopy];
            
            
            NSMutableArray *arr_ingredients  = [recipeIngredientsArr valueForKey:@"recipe_ingredients"];
            NSLog(@"%@",arr_ingredients);
            
            //self.recipe_ingredientslbl.text = [arr_ingredients objectAtIndex:0];
            // [self.recipe_ingredientslbl sizeToFit];
            
            recipeIngredientsstr = [arr_ingredients objectAtIndex:0];
            
            //For method
            NSString *querymethod=[ NSString stringWithFormat:@"Select recipe_method from  summer_tbl where recipe_name ='RADICCHIO' AND recipe_type ='Sensational' "];
            recipeMethodArr =[[NSMutableArray alloc]init];
            recipeMethodArr =[[database executeQuery:querymethod]mutableCopy];
            
            
            NSMutableArray *arr_method  = [recipeMethodArr valueForKey:@"recipe_method"];
            NSLog(@"%@",arr_method);
            
            //self.recipe_methodlbl.text = [arr_method objectAtIndex:0];
            //[self.recipe_methodlbl sizeToFit];
            recipeMethodstr = [arr_method objectAtIndex:0];
            
            
            
            [database close];
        }
        if([self.imageFile isEqualToString: @"Salmon.jpg"])
        {
            [self databaseOpen];
            
            
            //For name
            
            NSString *queryname= [NSString stringWithFormat:@"Select recipe_subcategory,recipe_name,recipe_type from  summer_tbl where recipe_name ='SALMON' AND recipe_type ='Sensational' "];
            recipeNameArr =[[NSMutableArray alloc]init];
            recipeNameArr =[[database executeQuery:queryname]mutableCopy];
            
            NSMutableArray *arr_name = [recipeNameArr valueForKey:@"recipe_subcategory"];
            
            //self.recipe_namelbl.text = [arr_name objectAtIndex:0];
            
            recipeNamestr = [arr_name objectAtIndex:0];
            
            //For ingredients
            
            NSString *queryingredients=[ NSString stringWithFormat:@"Select recipe_ingredients from  summer_tbl where recipe_name ='SALMON' AND recipe_type ='Sensational' "];
            recipeIngredientsArr =[[NSMutableArray alloc]init];
            recipeIngredientsArr =[[database executeQuery:queryingredients]mutableCopy];
            
            
            NSMutableArray *arr_ingredients  = [recipeIngredientsArr valueForKey:@"recipe_ingredients"];
            NSLog(@"%@",arr_ingredients);
            
            //self.recipe_ingredientslbl.text = [arr_ingredients objectAtIndex:0];
            // [self.recipe_ingredientslbl sizeToFit];
            
            recipeIngredientsstr = [arr_ingredients objectAtIndex:0];
            
            //For method
            NSString *querymethod=[ NSString stringWithFormat:@"Select recipe_method from  summer_tbl where recipe_name ='SALMON' AND recipe_type ='Sensational' "];
            recipeMethodArr =[[NSMutableArray alloc]init];
            recipeMethodArr =[[database executeQuery:querymethod]mutableCopy];
            
            
            NSMutableArray *arr_method  = [recipeMethodArr valueForKey:@"recipe_method"];
            NSLog(@"%@",arr_method);
            
            //self.recipe_methodlbl.text = [arr_method objectAtIndex:0];
            //[self.recipe_methodlbl sizeToFit];
            recipeMethodstr = [arr_method objectAtIndex:0];
            
            
            
            [database close];
        }
        
        if([self.imageFile isEqualToString: @"Sesame-Seeds.jpg"])
        {
            [self databaseOpen];
            
            
            //For name
            
            NSString *queryname= [NSString stringWithFormat:@"Select recipe_subcategory,recipe_name,recipe_type from  summer_tbl where recipe_name ='SESAME SEEDS' AND recipe_type ='Sensational' "];
            recipeNameArr =[[NSMutableArray alloc]init];
            recipeNameArr =[[database executeQuery:queryname]mutableCopy];
            
            NSMutableArray *arr_name = [recipeNameArr valueForKey:@"recipe_subcategory"];
            
            //self.recipe_namelbl.text = [arr_name objectAtIndex:0];
            
            recipeNamestr = [arr_name objectAtIndex:0];
            
            //For ingredients
            
            NSString *queryingredients=[ NSString stringWithFormat:@"Select recipe_ingredients from  summer_tbl where recipe_name ='SESAME SEEDS' AND recipe_type ='Sensational' "];
            recipeIngredientsArr =[[NSMutableArray alloc]init];
            recipeIngredientsArr =[[database executeQuery:queryingredients]mutableCopy];
            
            
            NSMutableArray *arr_ingredients  = [recipeIngredientsArr valueForKey:@"recipe_ingredients"];
            NSLog(@"%@",arr_ingredients);
            
            //self.recipe_ingredientslbl.text = [arr_ingredients objectAtIndex:0];
            // [self.recipe_ingredientslbl sizeToFit];
            
            recipeIngredientsstr = [arr_ingredients objectAtIndex:0];
            
            //For method
            NSString *querymethod=[ NSString stringWithFormat:@"Select recipe_method from  summer_tbl where recipe_name ='SESAME SEEDS' AND recipe_type ='Sensational' "];
            recipeMethodArr =[[NSMutableArray alloc]init];
            recipeMethodArr =[[database executeQuery:querymethod]mutableCopy];
            
            
            NSMutableArray *arr_method  = [recipeMethodArr valueForKey:@"recipe_method"];
            NSLog(@"%@",arr_method);
            
            //self.recipe_methodlbl.text = [arr_method objectAtIndex:0];
            //[self.recipe_methodlbl sizeToFit];
            recipeMethodstr = [arr_method objectAtIndex:0];
            
            
            
            [database close];
        }
        if([self.imageFile isEqualToString: @"Tomatillo.jpg"])
        {
            [self databaseOpen];
            
            
            //For name
            
            NSString *queryname= [NSString stringWithFormat:@"Select recipe_subcategory,recipe_name,recipe_type from  summer_tbl where recipe_name ='TOMATILLO' AND recipe_type ='Sensational' "];
            recipeNameArr =[[NSMutableArray alloc]init];
            recipeNameArr =[[database executeQuery:queryname]mutableCopy];
            
            NSMutableArray *arr_name = [recipeNameArr valueForKey:@"recipe_subcategory"];
            
            //self.recipe_namelbl.text = [arr_name objectAtIndex:0];
            
            recipeNamestr = [arr_name objectAtIndex:0];
            
            //For ingredients
            
            NSString *queryingredients=[ NSString stringWithFormat:@"Select recipe_ingredients from  summer_tbl where recipe_name ='TOMATILLO' AND recipe_type ='Sensational' "];
            recipeIngredientsArr =[[NSMutableArray alloc]init];
            recipeIngredientsArr =[[database executeQuery:queryingredients]mutableCopy];
            
            
            NSMutableArray *arr_ingredients  = [recipeIngredientsArr valueForKey:@"recipe_ingredients"];
            NSLog(@"%@",arr_ingredients);
            
            //self.recipe_ingredientslbl.text = [arr_ingredients objectAtIndex:0];
            // [self.recipe_ingredientslbl sizeToFit];
            
            recipeIngredientsstr = [arr_ingredients objectAtIndex:0];
            
            //For method
            NSString *querymethod=[ NSString stringWithFormat:@"Select recipe_method from  summer_tbl where recipe_name ='TOMATILLO' AND recipe_type ='Sensational' "];
            recipeMethodArr =[[NSMutableArray alloc]init];
            recipeMethodArr =[[database executeQuery:querymethod]mutableCopy];
            
            
            NSMutableArray *arr_method  = [recipeMethodArr valueForKey:@"recipe_method"];
            NSLog(@"%@",arr_method);
            
            //self.recipe_methodlbl.text = [arr_method objectAtIndex:0];
            //[self.recipe_methodlbl sizeToFit];
            recipeMethodstr = [arr_method objectAtIndex:0];
            
            
            
            [database close];
        }
        
        if([self.imageFile isEqualToString: @"Tomato.jpg"])
        {
            [self databaseOpen];
            
            
            //For name
            
            NSString *queryname= [NSString stringWithFormat:@"Select recipe_subcategory,recipe_name,recipe_type from  summer_tbl where recipe_name ='TOMATO' AND recipe_type ='Sensational' "];
            recipeNameArr =[[NSMutableArray alloc]init];
            recipeNameArr =[[database executeQuery:queryname]mutableCopy];
            
            NSMutableArray *arr_name = [recipeNameArr valueForKey:@"recipe_subcategory"];
            
            //self.recipe_namelbl.text = [arr_name objectAtIndex:0];
            
            recipeNamestr = [arr_name objectAtIndex:0];
            
            //For ingredients
            
            NSString *queryingredients=[ NSString stringWithFormat:@"Select recipe_ingredients from  summer_tbl where recipe_name ='TOMATO' AND recipe_type ='Sensational' "];
            recipeIngredientsArr =[[NSMutableArray alloc]init];
            recipeIngredientsArr =[[database executeQuery:queryingredients]mutableCopy];
            
            
            NSMutableArray *arr_ingredients  = [recipeIngredientsArr valueForKey:@"recipe_ingredients"];
            NSLog(@"%@",arr_ingredients);
            
            //self.recipe_ingredientslbl.text = [arr_ingredients objectAtIndex:0];
            // [self.recipe_ingredientslbl sizeToFit];
            
            recipeIngredientsstr = [arr_ingredients objectAtIndex:0];
            
            //For method
            NSString *querymethod=[ NSString stringWithFormat:@"Select recipe_method from  summer_tbl where recipe_name ='TOMATO' AND recipe_type ='Sensational' "];
            recipeMethodArr =[[NSMutableArray alloc]init];
            recipeMethodArr =[[database executeQuery:querymethod]mutableCopy];
            
            
            NSMutableArray *arr_method  = [recipeMethodArr valueForKey:@"recipe_method"];
            NSLog(@"%@",arr_method);
            
            //self.recipe_methodlbl.text = [arr_method objectAtIndex:0];
            //[self.recipe_methodlbl sizeToFit];
            recipeMethodstr = [arr_method objectAtIndex:0];
            
            
            
            [database close];
        }
        if([self.imageFile isEqualToString: @"Water.jpg"])
        {
            [self databaseOpen];
            
            
            //For name
            
            NSString *queryname= [NSString stringWithFormat:@"Select recipe_subcategory,recipe_name,recipe_type from  summer_tbl where recipe_name ='WATER' AND recipe_type ='Sensational' "];
            recipeNameArr =[[NSMutableArray alloc]init];
            recipeNameArr =[[database executeQuery:queryname]mutableCopy];
            
            NSMutableArray *arr_name = [recipeNameArr valueForKey:@"recipe_subcategory"];
            
            //self.recipe_namelbl.text = [arr_name objectAtIndex:0];
            
            recipeNamestr = [arr_name objectAtIndex:0];
            
            //For ingredients
            
            NSString *queryingredients=[ NSString stringWithFormat:@"Select recipe_ingredients from  summer_tbl where recipe_name ='WATER' AND recipe_type ='Sensational' "];
            recipeIngredientsArr =[[NSMutableArray alloc]init];
            recipeIngredientsArr =[[database executeQuery:queryingredients]mutableCopy];
            
            
            NSMutableArray *arr_ingredients  = [recipeIngredientsArr valueForKey:@"recipe_ingredients"];
            NSLog(@"%@",arr_ingredients);
            
            //self.recipe_ingredientslbl.text = [arr_ingredients objectAtIndex:0];
            // [self.recipe_ingredientslbl sizeToFit];
            
            recipeIngredientsstr = [arr_ingredients objectAtIndex:0];
            
            //For method
            NSString *querymethod=[ NSString stringWithFormat:@"Select recipe_method from  summer_tbl where recipe_name ='WATER' AND recipe_type ='Sensational' "];
            recipeMethodArr =[[NSMutableArray alloc]init];
            recipeMethodArr =[[database executeQuery:querymethod]mutableCopy];
            
            
            NSMutableArray *arr_method  = [recipeMethodArr valueForKey:@"recipe_method"];
            NSLog(@"%@",arr_method);
            
            //self.recipe_methodlbl.text = [arr_method objectAtIndex:0];
            //[self.recipe_methodlbl sizeToFit];
            recipeMethodstr = [arr_method objectAtIndex:0];
            
            
            
            [database close];
        }
        if([self.imageFile isEqualToString: @"Zucchini.jpg"])
        {
            [self databaseOpen];
            
            
            //For name
            
            NSString *queryname= [NSString stringWithFormat:@"Select recipe_subcategory,recipe_name,recipe_type from  summer_tbl where recipe_name ='ZUCCHINI' AND recipe_type ='Sensational' "];
            recipeNameArr =[[NSMutableArray alloc]init];
            recipeNameArr =[[database executeQuery:queryname]mutableCopy];
            
            NSMutableArray *arr_name = [recipeNameArr valueForKey:@"recipe_subcategory"];
            
            //self.recipe_namelbl.text = [arr_name objectAtIndex:0];
            
            recipeNamestr = [arr_name objectAtIndex:0];
            
            //For ingredients
            
            NSString *queryingredients=[ NSString stringWithFormat:@"Select recipe_ingredients from  summer_tbl where recipe_name ='ZUCCHINI' AND recipe_type ='Sensational' "];
            recipeIngredientsArr =[[NSMutableArray alloc]init];
            recipeIngredientsArr =[[database executeQuery:queryingredients]mutableCopy];
            
            
            NSMutableArray *arr_ingredients  = [recipeIngredientsArr valueForKey:@"recipe_ingredients"];
            NSLog(@"%@",arr_ingredients);
            
            //self.recipe_ingredientslbl.text = [arr_ingredients objectAtIndex:0];
            // [self.recipe_ingredientslbl sizeToFit];
            
            recipeIngredientsstr = [arr_ingredients objectAtIndex:0];
            
            //For method
            NSString *querymethod=[ NSString stringWithFormat:@"Select recipe_method from  summer_tbl where recipe_name ='ZUCCHINI' AND recipe_type ='Sensational' "];
            recipeMethodArr =[[NSMutableArray alloc]init];
            recipeMethodArr =[[database executeQuery:querymethod]mutableCopy];
            
            
            NSMutableArray *arr_method  = [recipeMethodArr valueForKey:@"recipe_method"];
            NSLog(@"%@",arr_method);
            
            //self.recipe_methodlbl.text = [arr_method objectAtIndex:0];
            //[self.recipe_methodlbl sizeToFit];
            recipeMethodstr = [arr_method objectAtIndex:0];
            
            
            
            [database close];
        }
        
        [self performSegueWithIdentifier:@"sensationalsegue" sender:self];

    }
    
else if ([season isEqualToString:@"fall"])
{
    
    //Apple.jpg
    
    if([self.imageFile isEqualToString: @"Apple.jpg"])
    {
        [self databaseOpen];
        
        
        //For name
        
        NSString *queryname= [NSString stringWithFormat:@"Select recipe_subcategory,recipe_name,recipe_type from fall_tbl where recipe_name = 'Apple' AND recipe_type = 'Sensational' "];
        recipeNameArr =[[NSMutableArray alloc]init];
        recipeNameArr =[[database executeQuery:queryname]mutableCopy];
        
        NSMutableArray *arr_name = [recipeNameArr valueForKey:@"recipe_subcategory"];
        
        //self.recipe_namelbl.text = [arr_name objectAtIndex:0];
        
        recipeNamestr = [arr_name objectAtIndex:0];
        
        //For ingredients
        
        NSString *queryingredients=[ NSString stringWithFormat:@"Select recipe_ingredients from fall_tbl where recipe_name = 'Apple' AND recipe_type = 'Sensational' "];
        recipeIngredientsArr =[[NSMutableArray alloc]init];
        recipeIngredientsArr =[[database executeQuery:queryingredients]mutableCopy];
        
        
        NSMutableArray *arr_ingredients  = [recipeIngredientsArr valueForKey:@"recipe_ingredients"];
        NSLog(@"%@",arr_ingredients);
        
        //self.recipe_ingredientslbl.text = [arr_ingredients objectAtIndex:0];
        // [self.recipe_ingredientslbl sizeToFit];
        
        recipeIngredientsstr = [arr_ingredients objectAtIndex:0];
        
        //For method
        NSString *querymethod=[ NSString stringWithFormat:@"Select recipe_method from fall_tbl where recipe_name = 'Apple' AND recipe_type = 'Sensational' "];
        recipeMethodArr =[[NSMutableArray alloc]init];
        recipeMethodArr =[[database executeQuery:querymethod]mutableCopy];
        
        
        NSMutableArray *arr_method  = [recipeMethodArr valueForKey:@"recipe_method"];
        NSLog(@"%@",arr_method);
        
        //self.recipe_methodlbl.text = [arr_method objectAtIndex:0];
        //[self.recipe_methodlbl sizeToFit];
        recipeMethodstr = [arr_method objectAtIndex:0];
        
        
        
        [database close];
    }
    
    
    
    
    //Beet.jpg
    
    
    if([self.imageFile isEqualToString: @"Beet.jpg"])
    {
        [self databaseOpen];
        
        
        //For name
        
        NSString *queryname= [NSString stringWithFormat:@"Select recipe_subcategory,recipe_name,recipe_type from fall_tbl where recipe_name = 'Beet' AND recipe_type = 'Sensational' "];
        recipeNameArr =[[NSMutableArray alloc]init];
        recipeNameArr =[[database executeQuery:queryname]mutableCopy];
        
        NSMutableArray *arr_name = [recipeNameArr valueForKey:@"recipe_subcategory"];
        
        //self.recipe_namelbl.text = [arr_name objectAtIndex:0];
        
        recipeNamestr = [arr_name objectAtIndex:0];
        
        //For ingredients
        
        NSString *queryingredients=[ NSString stringWithFormat:@"Select recipe_ingredients from fall_tbl where recipe_name = 'Beet' AND recipe_type = 'Sensational' "];
        recipeIngredientsArr =[[NSMutableArray alloc]init];
        recipeIngredientsArr =[[database executeQuery:queryingredients]mutableCopy];
        
        
        NSMutableArray *arr_ingredients  = [recipeIngredientsArr valueForKey:@"recipe_ingredients"];
        NSLog(@"%@",arr_ingredients);
        
        //self.recipe_ingredientslbl.text = [arr_ingredients objectAtIndex:0];
        // [self.recipe_ingredientslbl sizeToFit];
        
        recipeIngredientsstr = [arr_ingredients objectAtIndex:0];
        
        //For method
        NSString *querymethod=[ NSString stringWithFormat:@"Select recipe_method from fall_tbl where recipe_name = 'Beet' AND recipe_type = 'Sensational' "];
        recipeMethodArr =[[NSMutableArray alloc]init];
        recipeMethodArr =[[database executeQuery:querymethod]mutableCopy];
        
        
        NSMutableArray *arr_method  = [recipeMethodArr valueForKey:@"recipe_method"];
        NSLog(@"%@",arr_method);
        
        //self.recipe_methodlbl.text = [arr_method objectAtIndex:0];
        //[self.recipe_methodlbl sizeToFit];
        recipeMethodstr = [arr_method objectAtIndex:0];
        
        
        
        [database close];
    }
    
    
    
    // Brussels.jpg
    
    if([self.imageFile isEqualToString: @"Brussels.jpg"])
    {
        [self databaseOpen];
        
        
        //For name
        
        NSString *queryname= [NSString stringWithFormat:@"Select recipe_subcategory,recipe_name,recipe_type from fall_tbl where recipe_name = 'Brussel Sprout' AND recipe_type = 'Sensational' "];
        recipeNameArr =[[NSMutableArray alloc]init];
        recipeNameArr =[[database executeQuery:queryname]mutableCopy];
        
        NSMutableArray *arr_name = [recipeNameArr valueForKey:@"recipe_subcategory"];
        
        //self.recipe_namelbl.text = [arr_name objectAtIndex:0];
        
        recipeNamestr = [arr_name objectAtIndex:0];
        
        //For ingredients
        
        NSString *queryingredients=[ NSString stringWithFormat:@"Select recipe_ingredients from fall_tbl where recipe_name = 'Brussel Sprout' AND recipe_type = 'Sensational' "];
        recipeIngredientsArr =[[NSMutableArray alloc]init];
        recipeIngredientsArr =[[database executeQuery:queryingredients]mutableCopy];
        
        
        NSMutableArray *arr_ingredients  = [recipeIngredientsArr valueForKey:@"recipe_ingredients"];
        NSLog(@"%@",arr_ingredients);
        
        //self.recipe_ingredientslbl.text = [arr_ingredients objectAtIndex:0];
        // [self.recipe_ingredientslbl sizeToFit];
        
        recipeIngredientsstr = [arr_ingredients objectAtIndex:0];
        
        //For method
        NSString *querymethod=[ NSString stringWithFormat:@"Select recipe_method from fall_tbl where recipe_name = 'Brussel Sprout' AND recipe_type = 'Sensational' "];
        recipeMethodArr =[[NSMutableArray alloc]init];
        recipeMethodArr =[[database executeQuery:querymethod]mutableCopy];
        
        
        NSMutableArray *arr_method  = [recipeMethodArr valueForKey:@"recipe_method"];
        NSLog(@"%@",arr_method);
        
        //self.recipe_methodlbl.text = [arr_method objectAtIndex:0];
        //[self.recipe_methodlbl sizeToFit];
        recipeMethodstr = [arr_method objectAtIndex:0];
        
        
        
        [database close];
    }
    
    
    
    // Cabbage.jpg
    
    if([self.imageFile isEqualToString: @"Cabbage.jpg"])
    {
        [self databaseOpen];
        
        
        //For name
        
        NSString *queryname= [NSString stringWithFormat:@"Select recipe_subcategory,recipe_name,recipe_type from fall_tbl where recipe_name = 'Cabbage' AND recipe_type = 'Sensational' "];
        recipeNameArr =[[NSMutableArray alloc]init];
        recipeNameArr =[[database executeQuery:queryname]mutableCopy];
        
        NSMutableArray *arr_name = [recipeNameArr valueForKey:@"recipe_subcategory"];
        
        //self.recipe_namelbl.text = [arr_name objectAtIndex:0];
        
        recipeNamestr = [arr_name objectAtIndex:0];
        
        //For ingredients
        
        NSString *queryingredients=[ NSString stringWithFormat:@"Select recipe_ingredients from fall_tbl where recipe_name = 'Cabbage' AND recipe_type = 'Sensational' "];
        recipeIngredientsArr =[[NSMutableArray alloc]init];
        recipeIngredientsArr =[[database executeQuery:queryingredients]mutableCopy];
        
        
        NSMutableArray *arr_ingredients  = [recipeIngredientsArr valueForKey:@"recipe_ingredients"];
        NSLog(@"%@",arr_ingredients);
        
        //self.recipe_ingredientslbl.text = [arr_ingredients objectAtIndex:0];
        // [self.recipe_ingredientslbl sizeToFit];
        
        recipeIngredientsstr = [arr_ingredients objectAtIndex:0];
        
        //For method
        NSString *querymethod=[ NSString stringWithFormat:@"Select recipe_method from fall_tbl where recipe_name = 'Cabbage' AND recipe_type = 'Sensational' "];
        recipeMethodArr =[[NSMutableArray alloc]init];
        recipeMethodArr =[[database executeQuery:querymethod]mutableCopy];
        
        
        NSMutableArray *arr_method  = [recipeMethodArr valueForKey:@"recipe_method"];
        NSLog(@"%@",arr_method);
        
        //self.recipe_methodlbl.text = [arr_method objectAtIndex:0];
        //[self.recipe_methodlbl sizeToFit];
        recipeMethodstr = [arr_method objectAtIndex:0];
        
        
        
        [database close];
    }
    
    
    
    //  Carrot.jpg
    
    if([self.imageFile isEqualToString: @"Carrot.jpg"])
    {
        [self databaseOpen];
        
        
        //For name
        
        NSString *queryname= [NSString stringWithFormat:@"Select recipe_subcategory,recipe_name,recipe_type from fall_tbl where recipe_name = 'Carrot' AND recipe_type = 'Sensational' "];
        recipeNameArr =[[NSMutableArray alloc]init];
        recipeNameArr =[[database executeQuery:queryname]mutableCopy];
        
        NSMutableArray *arr_name = [recipeNameArr valueForKey:@"recipe_subcategory"];
        
        //self.recipe_namelbl.text = [arr_name objectAtIndex:0];
        
        recipeNamestr = [arr_name objectAtIndex:0];
        
        //For ingredients
        
        NSString *queryingredients=[ NSString stringWithFormat:@"Select recipe_ingredients from fall_tbl where recipe_name = 'Carrot' AND recipe_type = 'Sensational' "];
        recipeIngredientsArr =[[NSMutableArray alloc]init];
        recipeIngredientsArr =[[database executeQuery:queryingredients]mutableCopy];
        
        
        NSMutableArray *arr_ingredients  = [recipeIngredientsArr valueForKey:@"recipe_ingredients"];
        NSLog(@"%@",arr_ingredients);
        
        //self.recipe_ingredientslbl.text = [arr_ingredients objectAtIndex:0];
        // [self.recipe_ingredientslbl sizeToFit];
        
        recipeIngredientsstr = [arr_ingredients objectAtIndex:0];
        
        //For method
        NSString *querymethod=[ NSString stringWithFormat:@"Select recipe_method from fall_tbl where recipe_name = 'Carrot' AND recipe_type = 'Sensational' "];
        recipeMethodArr =[[NSMutableArray alloc]init];
        recipeMethodArr =[[database executeQuery:querymethod]mutableCopy];
        
        
        NSMutableArray *arr_method  = [recipeMethodArr valueForKey:@"recipe_method"];
        NSLog(@"%@",arr_method);
        
        //self.recipe_methodlbl.text = [arr_method objectAtIndex:0];
        //[self.recipe_methodlbl sizeToFit];
        recipeMethodstr = [arr_method objectAtIndex:0];
        
        
        
        [database close];
    }
    
    
    
    // Cauliflower.jpg
    
    if([self.imageFile isEqualToString: @"Cauliflower.jpg"])
    {
        [self databaseOpen];
        
        
        //For name
        
        NSString *queryname= [NSString stringWithFormat:@"Select recipe_subcategory,recipe_name,recipe_type from fall_tbl where recipe_name = 'Cauliflower' AND recipe_type = 'Sensational' "];
        recipeNameArr =[[NSMutableArray alloc]init];
        recipeNameArr =[[database executeQuery:queryname]mutableCopy];
        
        NSMutableArray *arr_name = [recipeNameArr valueForKey:@"recipe_subcategory"];
        
        //self.recipe_namelbl.text = [arr_name objectAtIndex:0];
        
        recipeNamestr = [arr_name objectAtIndex:0];
        
        //For ingredients
        
        NSString *queryingredients=[ NSString stringWithFormat:@"Select recipe_ingredients from fall_tbl where recipe_name = 'Cauliflower' AND recipe_type = 'Sensational' "];
        recipeIngredientsArr =[[NSMutableArray alloc]init];
        recipeIngredientsArr =[[database executeQuery:queryingredients]mutableCopy];
        
        
        NSMutableArray *arr_ingredients  = [recipeIngredientsArr valueForKey:@"recipe_ingredients"];
        NSLog(@"%@",arr_ingredients);
        
        //self.recipe_ingredientslbl.text = [arr_ingredients objectAtIndex:0];
        // [self.recipe_ingredientslbl sizeToFit];
        
        recipeIngredientsstr = [arr_ingredients objectAtIndex:0];
        
        //For method
        NSString *querymethod=[ NSString stringWithFormat:@"Select recipe_method from fall_tbl where recipe_name = 'Cauliflower' AND recipe_type = 'Sensational' "];
        recipeMethodArr =[[NSMutableArray alloc]init];
        recipeMethodArr =[[database executeQuery:querymethod]mutableCopy];
        
        
        NSMutableArray *arr_method  = [recipeMethodArr valueForKey:@"recipe_method"];
        NSLog(@"%@",arr_method);
        
        //self.recipe_methodlbl.text = [arr_method objectAtIndex:0];
        //[self.recipe_methodlbl sizeToFit];
        recipeMethodstr = [arr_method objectAtIndex:0];
        
        
        
        [database close];
    }
    
    
    
    // Celery.jpg
    
    if([self.imageFile isEqualToString: @"Celery.jpg"])
    {
        [self databaseOpen];
        
        
        //For name
        
        NSString *queryname= [NSString stringWithFormat:@"Select recipe_subcategory,recipe_name,recipe_type from fall_tbl where recipe_name = 'Celery' AND recipe_type = 'Sensational' "];
        recipeNameArr =[[NSMutableArray alloc]init];
        recipeNameArr =[[database executeQuery:queryname]mutableCopy];
        
        NSMutableArray *arr_name = [recipeNameArr valueForKey:@"recipe_subcategory"];
        
        //self.recipe_namelbl.text = [arr_name objectAtIndex:0];
        
        recipeNamestr = [arr_name objectAtIndex:0];
        
        //For ingredients
        
        NSString *queryingredients=[ NSString stringWithFormat:@"Select recipe_ingredients from fall_tbl where recipe_name = 'Celery' AND recipe_type = 'Sensational' "];
        recipeIngredientsArr =[[NSMutableArray alloc]init];
        recipeIngredientsArr =[[database executeQuery:queryingredients]mutableCopy];
        
        
        NSMutableArray *arr_ingredients  = [recipeIngredientsArr valueForKey:@"recipe_ingredients"];
        NSLog(@"%@",arr_ingredients);
        
        //self.recipe_ingredientslbl.text = [arr_ingredients objectAtIndex:0];
        // [self.recipe_ingredientslbl sizeToFit];
        
        recipeIngredientsstr = [arr_ingredients objectAtIndex:0];
        
        //For method
        NSString *querymethod=[ NSString stringWithFormat:@"Select recipe_method from fall_tbl where recipe_name = 'Celery' AND recipe_type = 'Sensational' "];
        recipeMethodArr =[[NSMutableArray alloc]init];
        recipeMethodArr =[[database executeQuery:querymethod]mutableCopy];
        
        
        NSMutableArray *arr_method  = [recipeMethodArr valueForKey:@"recipe_method"];
        NSLog(@"%@",arr_method);
        
        //self.recipe_methodlbl.text = [arr_method objectAtIndex:0];
        //[self.recipe_methodlbl sizeToFit];
        recipeMethodstr = [arr_method objectAtIndex:0];
        
        
        
        [database close];
    }
    
    
    
    //  Chard.jpg
    
    if([self.imageFile isEqualToString: @"Chard.jpg"])
    {
        [self databaseOpen];
        
        
        //For name
        
        NSString *queryname= [NSString stringWithFormat:@"Select recipe_subcategory,recipe_name,recipe_type from fall_tbl where recipe_name = 'Chard' AND recipe_type = 'Sensational' "];
        recipeNameArr =[[NSMutableArray alloc]init];
        recipeNameArr =[[database executeQuery:queryname]mutableCopy];
        
        NSMutableArray *arr_name = [recipeNameArr valueForKey:@"recipe_subcategory"];
        
        //self.recipe_namelbl.text = [arr_name objectAtIndex:0];
        
        recipeNamestr = [arr_name objectAtIndex:0];
        
        //For ingredients
        
        NSString *queryingredients=[ NSString stringWithFormat:@"Select recipe_ingredients from fall_tbl where recipe_name = 'Chard' AND recipe_type = 'Sensational' "];
        recipeIngredientsArr =[[NSMutableArray alloc]init];
        recipeIngredientsArr =[[database executeQuery:queryingredients]mutableCopy];
        
        
        NSMutableArray *arr_ingredients  = [recipeIngredientsArr valueForKey:@"recipe_ingredients"];
        NSLog(@"%@",arr_ingredients);
        
        //self.recipe_ingredientslbl.text = [arr_ingredients objectAtIndex:0];
        // [self.recipe_ingredientslbl sizeToFit];
        
        recipeIngredientsstr = [arr_ingredients objectAtIndex:0];
        
        //For method
        NSString *querymethod=[ NSString stringWithFormat:@"Select recipe_method from fall_tbl where recipe_name = 'Chard' AND recipe_type = 'Sensational' "];
        recipeMethodArr =[[NSMutableArray alloc]init];
        recipeMethodArr =[[database executeQuery:querymethod]mutableCopy];
        
        
        NSMutableArray *arr_method  = [recipeMethodArr valueForKey:@"recipe_method"];
        NSLog(@"%@",arr_method);
        
        //self.recipe_methodlbl.text = [arr_method objectAtIndex:0];
        //[self.recipe_methodlbl sizeToFit];
        recipeMethodstr = [arr_method objectAtIndex:0];
        
        
        
        [database close];
    }
    
    
    
    // Chile.jpg
    
    if([self.imageFile isEqualToString: @"Chile.jpg"])
    {
        [self databaseOpen];
        
        
        //For name
        
        NSString *queryname= [NSString stringWithFormat:@"Select recipe_subcategory,recipe_name,recipe_type from fall_tbl where recipe_name = 'Chile' AND recipe_type = 'Sensational' "];
        recipeNameArr =[[NSMutableArray alloc]init];
        recipeNameArr =[[database executeQuery:queryname]mutableCopy];
        
        NSMutableArray *arr_name = [recipeNameArr valueForKey:@"recipe_subcategory"];
        
        //self.recipe_namelbl.text = [arr_name objectAtIndex:0];
        
        recipeNamestr = [arr_name objectAtIndex:0];
        
        //For ingredients
        
        NSString *queryingredients=[ NSString stringWithFormat:@"Select recipe_ingredients from fall_tbl where recipe_name = 'Chile' AND recipe_type = 'Sensational' "];
        recipeIngredientsArr =[[NSMutableArray alloc]init];
        recipeIngredientsArr =[[database executeQuery:queryingredients]mutableCopy];
        
        
        NSMutableArray *arr_ingredients  = [recipeIngredientsArr valueForKey:@"recipe_ingredients"];
        NSLog(@"%@",arr_ingredients);
        
        //self.recipe_ingredientslbl.text = [arr_ingredients objectAtIndex:0];
        // [self.recipe_ingredientslbl sizeToFit];
        
        recipeIngredientsstr = [arr_ingredients objectAtIndex:0];
        
        //For method
        NSString *querymethod=[ NSString stringWithFormat:@"Select recipe_method from fall_tbl where recipe_name = 'Chile' AND recipe_type = 'Sensational' "];
        recipeMethodArr =[[NSMutableArray alloc]init];
        recipeMethodArr =[[database executeQuery:querymethod]mutableCopy];
        
        
        NSMutableArray *arr_method  = [recipeMethodArr valueForKey:@"recipe_method"];
        NSLog(@"%@",arr_method);
        
        //self.recipe_methodlbl.text = [arr_method objectAtIndex:0];
        //[self.recipe_methodlbl sizeToFit];
        recipeMethodstr = [arr_method objectAtIndex:0];
        
        
        
        [database close];
    }
    
    
    
    // Collard.jpg
    
    if([self.imageFile isEqualToString: @"Collard.jpg"])
    {
        [self databaseOpen];
        
        
        //For name
        
        NSString *queryname= [NSString stringWithFormat:@"Select recipe_subcategory,recipe_name,recipe_type from fall_tbl where recipe_name = 'Collard' AND recipe_type = 'Sensational' "];
        recipeNameArr =[[NSMutableArray alloc]init];
        recipeNameArr =[[database executeQuery:queryname]mutableCopy];
        
        NSMutableArray *arr_name = [recipeNameArr valueForKey:@"recipe_subcategory"];
        
        //self.recipe_namelbl.text = [arr_name objectAtIndex:0];
        
        recipeNamestr = [arr_name objectAtIndex:0];
        
        //For ingredients
        
        NSString *queryingredients=[ NSString stringWithFormat:@"Select recipe_ingredients from fall_tbl where recipe_name = 'Collard' AND recipe_type = 'Sensational' "];
        recipeIngredientsArr =[[NSMutableArray alloc]init];
        recipeIngredientsArr =[[database executeQuery:queryingredients]mutableCopy];
        
        
        NSMutableArray *arr_ingredients  = [recipeIngredientsArr valueForKey:@"recipe_ingredients"];
        NSLog(@"%@",arr_ingredients);
        
        //self.recipe_ingredientslbl.text = [arr_ingredients objectAtIndex:0];
        // [self.recipe_ingredientslbl sizeToFit];
        
        recipeIngredientsstr = [arr_ingredients objectAtIndex:0];
        
        //For method
        NSString *querymethod=[ NSString stringWithFormat:@"Select recipe_method from fall_tbl where recipe_name = 'Collard' AND recipe_type = 'Sensational' "];
        recipeMethodArr =[[NSMutableArray alloc]init];
        recipeMethodArr =[[database executeQuery:querymethod]mutableCopy];
        
        
        NSMutableArray *arr_method  = [recipeMethodArr valueForKey:@"recipe_method"];
        NSLog(@"%@",arr_method);
        
        //self.recipe_methodlbl.text = [arr_method objectAtIndex:0];
        //[self.recipe_methodlbl sizeToFit];
        recipeMethodstr = [arr_method objectAtIndex:0];
        
        
        
        [database close];
    }
    
    
    
    // Cranberry.jpg
    
    if([self.imageFile isEqualToString: @"Cranberry.jpg"])
    {
        [self databaseOpen];
        
        
        //For name
        
        NSString *queryname= [NSString stringWithFormat:@"Select recipe_subcategory,recipe_name,recipe_type from fall_tbl where recipe_name = 'Cranberry' AND recipe_type = 'Sensational' "];
        recipeNameArr =[[NSMutableArray alloc]init];
        recipeNameArr =[[database executeQuery:queryname]mutableCopy];
        
        NSMutableArray *arr_name = [recipeNameArr valueForKey:@"recipe_subcategory"];
        
        //self.recipe_namelbl.text = [arr_name objectAtIndex:0];
        
        recipeNamestr = [arr_name objectAtIndex:0];
        
        //For ingredients
        
        NSString *queryingredients=[ NSString stringWithFormat:@"Select recipe_ingredients from fall_tbl where recipe_name = 'Cranberry' AND recipe_type = 'Sensational' "];
        recipeIngredientsArr =[[NSMutableArray alloc]init];
        recipeIngredientsArr =[[database executeQuery:queryingredients]mutableCopy];
        
        
        NSMutableArray *arr_ingredients  = [recipeIngredientsArr valueForKey:@"recipe_ingredients"];
        NSLog(@"%@",arr_ingredients);
        
        //self.recipe_ingredientslbl.text = [arr_ingredients objectAtIndex:0];
        // [self.recipe_ingredientslbl sizeToFit];
        
        recipeIngredientsstr = [arr_ingredients objectAtIndex:0];
        
        //For method
        NSString *querymethod=[ NSString stringWithFormat:@"Select recipe_method from fall_tbl where recipe_name = 'Cranberry' AND recipe_type = 'Sensational' "];
        recipeMethodArr =[[NSMutableArray alloc]init];
        recipeMethodArr =[[database executeQuery:querymethod]mutableCopy];
        
        
        NSMutableArray *arr_method  = [recipeMethodArr valueForKey:@"recipe_method"];
        NSLog(@"%@",arr_method);
        
        //self.recipe_methodlbl.text = [arr_method objectAtIndex:0];
        //[self.recipe_methodlbl sizeToFit];
        recipeMethodstr = [arr_method objectAtIndex:0];
        
        
        
        [database close];
    }
    
    
    // Fig.jpg
    
    if([self.imageFile isEqualToString: @"Fig.jpg"])
    {
        [self databaseOpen];
        
        
        //For name
        
        NSString *queryname= [NSString stringWithFormat:@"Select recipe_subcategory,recipe_name,recipe_type from fall_tbl where recipe_name = 'Fig' AND recipe_type = 'Sensational' "];
        recipeNameArr =[[NSMutableArray alloc]init];
        recipeNameArr =[[database executeQuery:queryname]mutableCopy];
        
        NSMutableArray *arr_name = [recipeNameArr valueForKey:@"recipe_subcategory"];
        
        //self.recipe_namelbl.text = [arr_name objectAtIndex:0];
        
        recipeNamestr = [arr_name objectAtIndex:0];
        
        //For ingredients
        
        NSString *queryingredients=[ NSString stringWithFormat:@"Select recipe_ingredients from fall_tbl where recipe_name = 'Fig' AND recipe_type = 'Sensational' "];
        recipeIngredientsArr =[[NSMutableArray alloc]init];
        recipeIngredientsArr =[[database executeQuery:queryingredients]mutableCopy];
        
        
        NSMutableArray *arr_ingredients  = [recipeIngredientsArr valueForKey:@"recipe_ingredients"];
        NSLog(@"%@",arr_ingredients);
        
        //self.recipe_ingredientslbl.text = [arr_ingredients objectAtIndex:0];
        // [self.recipe_ingredientslbl sizeToFit];
        
        recipeIngredientsstr = [arr_ingredients objectAtIndex:0];
        
        //For method
        NSString *querymethod=[ NSString stringWithFormat:@"Select recipe_method from fall_tbl where recipe_name = 'Fig' AND recipe_type = 'Sensational' "];
        recipeMethodArr =[[NSMutableArray alloc]init];
        recipeMethodArr =[[database executeQuery:querymethod]mutableCopy];
        
        
        NSMutableArray *arr_method  = [recipeMethodArr valueForKey:@"recipe_method"];
        NSLog(@"%@",arr_method);
        
        //self.recipe_methodlbl.text = [arr_method objectAtIndex:0];
        //[self.recipe_methodlbl sizeToFit];
        recipeMethodstr = [arr_method objectAtIndex:0];
        
        
        
        [database close];
    }
    
    
    
    
    // Garlic.jpg
    
    if([self.imageFile isEqualToString: @"Garlic.jpg"])
    {
        [self databaseOpen];
        
        
        //For name
        
        NSString *queryname= [NSString stringWithFormat:@"Select recipe_subcategory,recipe_name,recipe_type from fall_tbl where recipe_name = 'Garlic' AND recipe_type = 'Sensational' "];
        recipeNameArr =[[NSMutableArray alloc]init];
        recipeNameArr =[[database executeQuery:queryname]mutableCopy];
        
        NSMutableArray *arr_name = [recipeNameArr valueForKey:@"recipe_subcategory"];
        
        //self.recipe_namelbl.text = [arr_name objectAtIndex:0];
        
        recipeNamestr = [arr_name objectAtIndex:0];
        
        //For ingredients
        
        NSString *queryingredients=[ NSString stringWithFormat:@"Select recipe_ingredients from fall_tbl where recipe_name = 'Garlic' AND recipe_type = 'Sensational' "];
        recipeIngredientsArr =[[NSMutableArray alloc]init];
        recipeIngredientsArr =[[database executeQuery:queryingredients]mutableCopy];
        
        
        NSMutableArray *arr_ingredients  = [recipeIngredientsArr valueForKey:@"recipe_ingredients"];
        NSLog(@"%@",arr_ingredients);
        
        //self.recipe_ingredientslbl.text = [arr_ingredients objectAtIndex:0];
        // [self.recipe_ingredientslbl sizeToFit];
        
        recipeIngredientsstr = [arr_ingredients objectAtIndex:0];
        
        //For method
        NSString *querymethod=[ NSString stringWithFormat:@"Select recipe_method from fall_tbl where recipe_name = 'Garlic' AND recipe_type = 'Sensational' "];
        recipeMethodArr =[[NSMutableArray alloc]init];
        recipeMethodArr =[[database executeQuery:querymethod]mutableCopy];
        
        
        NSMutableArray *arr_method  = [recipeMethodArr valueForKey:@"recipe_method"];
        NSLog(@"%@",arr_method);
        
        //self.recipe_methodlbl.text = [arr_method objectAtIndex:0];
        //[self.recipe_methodlbl sizeToFit];
        recipeMethodstr = [arr_method objectAtIndex:0];
        
        
        
        [database close];
    }
    
    
    
    
    // Grape.jpg
    
    if([self.imageFile isEqualToString: @"Grape.jpg"])
    {
        [self databaseOpen];
        
        
        //For name
        
        NSString *queryname= [NSString stringWithFormat:@"Select recipe_subcategory,recipe_name,recipe_type from fall_tbl where recipe_name = 'Grape' AND recipe_type = 'Sensational' "];
        recipeNameArr =[[NSMutableArray alloc]init];
        recipeNameArr =[[database executeQuery:queryname]mutableCopy];
        
        NSMutableArray *arr_name = [recipeNameArr valueForKey:@"recipe_subcategory"];
        
        //self.recipe_namelbl.text = [arr_name objectAtIndex:0];
        
        recipeNamestr = [arr_name objectAtIndex:0];
        
        //For ingredients
        
        NSString *queryingredients=[ NSString stringWithFormat:@"Select recipe_ingredients from fall_tbl where recipe_name = 'Grape' AND recipe_type = 'Sensational' "];
        recipeIngredientsArr =[[NSMutableArray alloc]init];
        recipeIngredientsArr =[[database executeQuery:queryingredients]mutableCopy];
        
        
        NSMutableArray *arr_ingredients  = [recipeIngredientsArr valueForKey:@"recipe_ingredients"];
        NSLog(@"%@",arr_ingredients);
        
        //self.recipe_ingredientslbl.text = [arr_ingredients objectAtIndex:0];
        // [self.recipe_ingredientslbl sizeToFit];
        
        recipeIngredientsstr = [arr_ingredients objectAtIndex:0];
        
        //For method
        NSString *querymethod=[ NSString stringWithFormat:@"Select recipe_method from fall_tbl where recipe_name = 'Grape' AND recipe_type = 'Sensational' "];
        recipeMethodArr =[[NSMutableArray alloc]init];
        recipeMethodArr =[[database executeQuery:querymethod]mutableCopy];
        
        
        NSMutableArray *arr_method  = [recipeMethodArr valueForKey:@"recipe_method"];
        NSLog(@"%@",arr_method);
        
        //self.recipe_methodlbl.text = [arr_method objectAtIndex:0];
        //[self.recipe_methodlbl sizeToFit];
        recipeMethodstr = [arr_method objectAtIndex:0];
        
        
        
        [database close];
    }
    
    
    
    
    // Oregano.jpg
    
    if([self.imageFile isEqualToString: @"Oregano.jpg"])
    {
        [self databaseOpen];
        
        
        //For name
        
        NSString *queryname= [NSString stringWithFormat:@"Select recipe_subcategory,recipe_name,recipe_type from fall_tbl where recipe_name = 'Oregano' AND recipe_type = 'Sensational' "];
        recipeNameArr =[[NSMutableArray alloc]init];
        recipeNameArr =[[database executeQuery:queryname]mutableCopy];
        
        NSMutableArray *arr_name = [recipeNameArr valueForKey:@"recipe_subcategory"];
        
        //self.recipe_namelbl.text = [arr_name objectAtIndex:0];
        
        recipeNamestr = [arr_name objectAtIndex:0];
        
        //For ingredients
        
        NSString *queryingredients=[ NSString stringWithFormat:@"Select recipe_ingredients from fall_tbl where recipe_name = 'Oregano' AND recipe_type = 'Sensational' "];
        recipeIngredientsArr =[[NSMutableArray alloc]init];
        recipeIngredientsArr =[[database executeQuery:queryingredients]mutableCopy];
        
        
        NSMutableArray *arr_ingredients  = [recipeIngredientsArr valueForKey:@"recipe_ingredients"];
        NSLog(@"%@",arr_ingredients);
        
        //self.recipe_ingredientslbl.text = [arr_ingredients objectAtIndex:0];
        // [self.recipe_ingredientslbl sizeToFit];
        
        recipeIngredientsstr = [arr_ingredients objectAtIndex:0];
        
        //For method
        NSString *querymethod=[ NSString stringWithFormat:@"Select recipe_method from fall_tbl where recipe_name = 'Oregano' AND recipe_type = 'Sensational' "];
        recipeMethodArr =[[NSMutableArray alloc]init];
        recipeMethodArr =[[database executeQuery:querymethod]mutableCopy];
        
        
        NSMutableArray *arr_method  = [recipeMethodArr valueForKey:@"recipe_method"];
        NSLog(@"%@",arr_method);
        
        //self.recipe_methodlbl.text = [arr_method objectAtIndex:0];
        //[self.recipe_methodlbl sizeToFit];
        recipeMethodstr = [arr_method objectAtIndex:0];
        
        
        
        [database close];
    }
    
    
    
    
    // Parsley.jpg
    
    if([self.imageFile isEqualToString: @"Parsley.jpg"])
    {
        [self databaseOpen];
        
        
        //For name
        
        NSString *queryname= [NSString stringWithFormat:@"Select recipe_subcategory,recipe_name,recipe_type from fall_tbl where recipe_name = 'Parsley' AND recipe_type = 'Sensational' "];
        recipeNameArr =[[NSMutableArray alloc]init];
        recipeNameArr =[[database executeQuery:queryname]mutableCopy];
        
        NSMutableArray *arr_name = [recipeNameArr valueForKey:@"recipe_subcategory"];
        
        //self.recipe_namelbl.text = [arr_name objectAtIndex:0];
        
        recipeNamestr = [arr_name objectAtIndex:0];
        
        //For ingredients
        
        NSString *queryingredients=[ NSString stringWithFormat:@"Select recipe_ingredients from fall_tbl where recipe_name = 'Parsley' AND recipe_type = 'Sensational' "];
        recipeIngredientsArr =[[NSMutableArray alloc]init];
        recipeIngredientsArr =[[database executeQuery:queryingredients]mutableCopy];
        
        
        NSMutableArray *arr_ingredients  = [recipeIngredientsArr valueForKey:@"recipe_ingredients"];
        NSLog(@"%@",arr_ingredients);
        
        //self.recipe_ingredientslbl.text = [arr_ingredients objectAtIndex:0];
        // [self.recipe_ingredientslbl sizeToFit];
        
        recipeIngredientsstr = [arr_ingredients objectAtIndex:0];
        
        //For method
        NSString *querymethod=[ NSString stringWithFormat:@"Select recipe_method from fall_tbl where recipe_name = 'Parsley' AND recipe_type = 'Sensational' "];
        recipeMethodArr =[[NSMutableArray alloc]init];
        recipeMethodArr =[[database executeQuery:querymethod]mutableCopy];
        
        
        NSMutableArray *arr_method  = [recipeMethodArr valueForKey:@"recipe_method"];
        NSLog(@"%@",arr_method);
        
        //self.recipe_methodlbl.text = [arr_method objectAtIndex:0];
        //[self.recipe_methodlbl sizeToFit];
        recipeMethodstr = [arr_method objectAtIndex:0];
        
        
        
        [database close];
    }
    
    
    
    
    // Pistachio.jpg
    
    if([self.imageFile isEqualToString: @"Pistachio.jpg"])
    {
        [self databaseOpen];
        
        
        //For name
        
        NSString *queryname= [NSString stringWithFormat:@"Select recipe_subcategory,recipe_name,recipe_type from fall_tbl where recipe_name = 'Pistachio' AND recipe_type = 'Sensational' "];
        recipeNameArr =[[NSMutableArray alloc]init];
        recipeNameArr =[[database executeQuery:queryname]mutableCopy];
        
        NSMutableArray *arr_name = [recipeNameArr valueForKey:@"recipe_subcategory"];
        
        //self.recipe_namelbl.text = [arr_name objectAtIndex:0];
        
        recipeNamestr = [arr_name objectAtIndex:0];
        
        //For ingredients
        
        NSString *queryingredients=[ NSString stringWithFormat:@"Select recipe_ingredients from fall_tbl where recipe_name = 'Pistachio' AND recipe_type = 'Sensational' "];
        recipeIngredientsArr =[[NSMutableArray alloc]init];
        recipeIngredientsArr =[[database executeQuery:queryingredients]mutableCopy];
        
        
        NSMutableArray *arr_ingredients  = [recipeIngredientsArr valueForKey:@"recipe_ingredients"];
        NSLog(@"%@",arr_ingredients);
        
        //self.recipe_ingredientslbl.text = [arr_ingredients objectAtIndex:0];
        // [self.recipe_ingredientslbl sizeToFit];
        
        recipeIngredientsstr = [arr_ingredients objectAtIndex:0];
        
        //For method
        NSString *querymethod=[ NSString stringWithFormat:@"Select recipe_method from fall_tbl where recipe_name = 'Pistachio' AND recipe_type = 'Sensational' "];
        recipeMethodArr =[[NSMutableArray alloc]init];
        recipeMethodArr =[[database executeQuery:querymethod]mutableCopy];
        
        
        NSMutableArray *arr_method  = [recipeMethodArr valueForKey:@"recipe_method"];
        NSLog(@"%@",arr_method);
        
        //self.recipe_methodlbl.text = [arr_method objectAtIndex:0];
        //[self.recipe_methodlbl sizeToFit];
        recipeMethodstr = [arr_method objectAtIndex:0];
        
        
        
        [database close];
    }
    
    
    
    
    // Pork.jpg
    
    if([self.imageFile isEqualToString: @"Pork.jpg"])
    {
        [self databaseOpen];
        
        
        //For name
        
        NSString *queryname= [NSString stringWithFormat:@"Select recipe_subcategory,recipe_name,recipe_type from fall_tbl where recipe_name = 'Pork' AND recipe_type = 'Sensational' "];
        recipeNameArr =[[NSMutableArray alloc]init];
        recipeNameArr =[[database executeQuery:queryname]mutableCopy];
        
        NSMutableArray *arr_name = [recipeNameArr valueForKey:@"recipe_subcategory"];
        
        //self.recipe_namelbl.text = [arr_name objectAtIndex:0];
        
        recipeNamestr = [arr_name objectAtIndex:0];
        
        //For ingredients
        
        NSString *queryingredients=[ NSString stringWithFormat:@"Select recipe_ingredients from fall_tbl where recipe_name = 'Pork' AND recipe_type = 'Sensational' "];
        recipeIngredientsArr =[[NSMutableArray alloc]init];
        recipeIngredientsArr =[[database executeQuery:queryingredients]mutableCopy];
        
        
        NSMutableArray *arr_ingredients  = [recipeIngredientsArr valueForKey:@"recipe_ingredients"];
        NSLog(@"%@",arr_ingredients);
        
        //self.recipe_ingredientslbl.text = [arr_ingredients objectAtIndex:0];
        // [self.recipe_ingredientslbl sizeToFit];
        
        recipeIngredientsstr = [arr_ingredients objectAtIndex:0];
        
        //For method
        NSString *querymethod=[ NSString stringWithFormat:@"Select recipe_method from fall_tbl where recipe_name = 'Pork' AND recipe_type = 'Sensational' "];
        recipeMethodArr =[[NSMutableArray alloc]init];
        recipeMethodArr =[[database executeQuery:querymethod]mutableCopy];
        
        
        NSMutableArray *arr_method  = [recipeMethodArr valueForKey:@"recipe_method"];
        NSLog(@"%@",arr_method);
        
        //self.recipe_methodlbl.text = [arr_method objectAtIndex:0];
        //[self.recipe_methodlbl sizeToFit];
        recipeMethodstr = [arr_method objectAtIndex:0];
        
        
        
        [database close];
    }
    
    
    
    
    // PorkAlternate.jpg
    
    if([self.imageFile isEqualToString: @"PorkAlternate.jpg"])
    {
        [self databaseOpen];
        
        
        //For name
        
        NSString *queryname= [NSString stringWithFormat:@"Select recipe_subcategory,recipe_name,recipe_type from fall_tbl where recipe_name = 'PorkAlternate' AND recipe_type = 'Sensational' "];
        recipeNameArr =[[NSMutableArray alloc]init];
        recipeNameArr =[[database executeQuery:queryname]mutableCopy];
        
        NSMutableArray *arr_name = [recipeNameArr valueForKey:@"recipe_subcategory"];
        
        //self.recipe_namelbl.text = [arr_name objectAtIndex:0];
        
        recipeNamestr = [arr_name objectAtIndex:0];
        
        //For ingredients
        
        NSString *queryingredients=[ NSString stringWithFormat:@"Select recipe_ingredients from fall_tbl where recipe_name = 'PorkAlternate' AND recipe_type = 'Sensational' "];
        recipeIngredientsArr =[[NSMutableArray alloc]init];
        recipeIngredientsArr =[[database executeQuery:queryingredients]mutableCopy];
        
        
        NSMutableArray *arr_ingredients  = [recipeIngredientsArr valueForKey:@"recipe_ingredients"];
        NSLog(@"%@",arr_ingredients);
        
        //self.recipe_ingredientslbl.text = [arr_ingredients objectAtIndex:0];
        // [self.recipe_ingredientslbl sizeToFit];
        
        recipeIngredientsstr = [arr_ingredients objectAtIndex:0];
        
        //For method
        NSString *querymethod=[ NSString stringWithFormat:@"Select recipe_method from fall_tbl where recipe_name = 'PorkAlternate' AND recipe_type = 'Sensational' "];
        recipeMethodArr =[[NSMutableArray alloc]init];
        recipeMethodArr =[[database executeQuery:querymethod]mutableCopy];
        
        
        NSMutableArray *arr_method  = [recipeMethodArr valueForKey:@"recipe_method"];
        NSLog(@"%@",arr_method);
        
        //self.recipe_methodlbl.text = [arr_method objectAtIndex:0];
        //[self.recipe_methodlbl sizeToFit];
        recipeMethodstr = [arr_method objectAtIndex:0];
        
        
        
        [database close];
    }
    
    
    
    
    // Pumpkin Seeds.jpg
    
    if([self.imageFile isEqualToString: @"Pumpkin Seeds.jpg"])
    {
        [self databaseOpen];
        
        
        //For name
        
        NSString *queryname= [NSString stringWithFormat:@"Select recipe_subcategory,recipe_name,recipe_type from fall_tbl where recipe_name = 'Pumpkin Seeds' AND recipe_type = 'Sensational' "];
        recipeNameArr =[[NSMutableArray alloc]init];
        recipeNameArr =[[database executeQuery:queryname]mutableCopy];
        
        NSMutableArray *arr_name = [recipeNameArr valueForKey:@"recipe_subcategory"];
        
        //self.recipe_namelbl.text = [arr_name objectAtIndex:0];
        
        recipeNamestr = [arr_name objectAtIndex:0];
        
        //For ingredients
        
        NSString *queryingredients=[ NSString stringWithFormat:@"Select recipe_ingredients from fall_tbl where recipe_name = 'Pumpkin Seeds' AND recipe_type = 'Sensational' "];
        recipeIngredientsArr =[[NSMutableArray alloc]init];
        recipeIngredientsArr =[[database executeQuery:queryingredients]mutableCopy];
        
        
        NSMutableArray *arr_ingredients  = [recipeIngredientsArr valueForKey:@"recipe_ingredients"];
        NSLog(@"%@",arr_ingredients);
        
        //self.recipe_ingredientslbl.text = [arr_ingredients objectAtIndex:0];
        // [self.recipe_ingredientslbl sizeToFit];
        
        recipeIngredientsstr = [arr_ingredients objectAtIndex:0];
        
        //For method
        NSString *querymethod=[ NSString stringWithFormat:@"Select recipe_method from fall_tbl where recipe_name = 'Pumpkin Seeds' AND recipe_type = 'Sensational' "];
        recipeMethodArr =[[NSMutableArray alloc]init];
        recipeMethodArr =[[database executeQuery:querymethod]mutableCopy];
        
        
        NSMutableArray *arr_method  = [recipeMethodArr valueForKey:@"recipe_method"];
        NSLog(@"%@",arr_method);
        
        //self.recipe_methodlbl.text = [arr_method objectAtIndex:0];
        //[self.recipe_methodlbl sizeToFit];
        recipeMethodstr = [arr_method objectAtIndex:0];
        
        
        
        [database close];
    }
    
    
    
    
    // Pumpkin.jpg
    
    if([self.imageFile isEqualToString: @"Pumpkin.jpg"])
    {
        [self databaseOpen];
        
        
        //For name
        
        NSString *queryname= [NSString stringWithFormat:@"Select recipe_subcategory,recipe_name,recipe_type from fall_tbl where recipe_name = 'Pumpkin' AND recipe_type = 'Sensational' "];
        recipeNameArr =[[NSMutableArray alloc]init];
        recipeNameArr =[[database executeQuery:queryname]mutableCopy];
        
        NSMutableArray *arr_name = [recipeNameArr valueForKey:@"recipe_subcategory"];
        
        //self.recipe_namelbl.text = [arr_name objectAtIndex:0];
        
        recipeNamestr = [arr_name objectAtIndex:0];
        
        //For ingredients
        
        NSString *queryingredients=[ NSString stringWithFormat:@"Select recipe_ingredients from fall_tbl where recipe_name = 'Pumpkin' AND recipe_type = 'Sensational' "];
        recipeIngredientsArr =[[NSMutableArray alloc]init];
        recipeIngredientsArr =[[database executeQuery:queryingredients]mutableCopy];
        
        
        NSMutableArray *arr_ingredients  = [recipeIngredientsArr valueForKey:@"recipe_ingredients"];
        NSLog(@"%@",arr_ingredients);
        
        //self.recipe_ingredientslbl.text = [arr_ingredients objectAtIndex:0];
        // [self.recipe_ingredientslbl sizeToFit];
        
        recipeIngredientsstr = [arr_ingredients objectAtIndex:0];
        
        //For method
        NSString *querymethod=[ NSString stringWithFormat:@"Select recipe_method from fall_tbl where recipe_name = 'Pumpkin' AND recipe_type = 'Sensational' "];
        recipeMethodArr =[[NSMutableArray alloc]init];
        recipeMethodArr =[[database executeQuery:querymethod]mutableCopy];
        
        
        NSMutableArray *arr_method  = [recipeMethodArr valueForKey:@"recipe_method"];
        NSLog(@"%@",arr_method);
        
        //self.recipe_methodlbl.text = [arr_method objectAtIndex:0];
        //[self.recipe_methodlbl sizeToFit];
        recipeMethodstr = [arr_method objectAtIndex:0];
        
        
        
        [database close];
    }
    
    
    // Raspberry.jpg
    
    if([self.imageFile isEqualToString: @"Raspberry.jpg"])
    {
        [self databaseOpen];
        
        
        //For name
        
        NSString *queryname= [NSString stringWithFormat:@"Select recipe_subcategory,recipe_name,recipe_type from fall_tbl where recipe_name = 'Raspberry' AND recipe_type = 'Sensational' "];
        recipeNameArr =[[NSMutableArray alloc]init];
        recipeNameArr =[[database executeQuery:queryname]mutableCopy];
        
        NSMutableArray *arr_name = [recipeNameArr valueForKey:@"recipe_subcategory"];
        
        //self.recipe_namelbl.text = [arr_name objectAtIndex:0];
        
        recipeNamestr = [arr_name objectAtIndex:0];
        
        //For ingredients
        
        NSString *queryingredients=[ NSString stringWithFormat:@"Select recipe_ingredients from fall_tbl where recipe_name = 'Raspberry' AND recipe_type = 'Sensational' "];
        recipeIngredientsArr =[[NSMutableArray alloc]init];
        recipeIngredientsArr =[[database executeQuery:queryingredients]mutableCopy];
        
        
        NSMutableArray *arr_ingredients  = [recipeIngredientsArr valueForKey:@"recipe_ingredients"];
        NSLog(@"%@",arr_ingredients);
        
        //self.recipe_ingredientslbl.text = [arr_ingredients objectAtIndex:0];
        // [self.recipe_ingredientslbl sizeToFit];
        
        recipeIngredientsstr = [arr_ingredients objectAtIndex:0];
        
        //For method
        NSString *querymethod=[ NSString stringWithFormat:@"Select recipe_method from fall_tbl where recipe_name = 'Raspberry' AND recipe_type = 'Sensational' "];
        recipeMethodArr =[[NSMutableArray alloc]init];
        recipeMethodArr =[[database executeQuery:querymethod]mutableCopy];
        
        
        NSMutableArray *arr_method  = [recipeMethodArr valueForKey:@"recipe_method"];
        NSLog(@"%@",arr_method);
        
        //self.recipe_methodlbl.text = [arr_method objectAtIndex:0];
        //[self.recipe_methodlbl sizeToFit];
        recipeMethodstr = [arr_method objectAtIndex:0];
        
        
        
        [database close];
    }
    
    
    
    // Shallot.jpg
    
    if([self.imageFile isEqualToString: @"Shallot.jpg"])
    {
        [self databaseOpen];
        
        
        //For name
        
        NSString *queryname= [NSString stringWithFormat:@"Select recipe_subcategory,recipe_name,recipe_type from fall_tbl where recipe_name = 'Shallot' AND recipe_type = 'Sensational' "];
        recipeNameArr =[[NSMutableArray alloc]init];
        recipeNameArr =[[database executeQuery:queryname]mutableCopy];
        
        NSMutableArray *arr_name = [recipeNameArr valueForKey:@"recipe_subcategory"];
        
        //self.recipe_namelbl.text = [arr_name objectAtIndex:0];
        
        recipeNamestr = [arr_name objectAtIndex:0];
        
        //For ingredients
        
        NSString *queryingredients=[ NSString stringWithFormat:@"Select recipe_ingredients from fall_tbl where recipe_name = 'Shallot' AND recipe_type = 'Sensational' "];
        recipeIngredientsArr =[[NSMutableArray alloc]init];
        recipeIngredientsArr =[[database executeQuery:queryingredients]mutableCopy];
        
        
        NSMutableArray *arr_ingredients  = [recipeIngredientsArr valueForKey:@"recipe_ingredients"];
        NSLog(@"%@",arr_ingredients);
        
        //self.recipe_ingredientslbl.text = [arr_ingredients objectAtIndex:0];
        // [self.recipe_ingredientslbl sizeToFit];
        
        recipeIngredientsstr = [arr_ingredients objectAtIndex:0];
        
        //For method
        NSString *querymethod=[ NSString stringWithFormat:@"Select recipe_method from fall_tbl where recipe_name = 'Shallot' AND recipe_type = 'Sensational' "];
        recipeMethodArr =[[NSMutableArray alloc]init];
        recipeMethodArr =[[database executeQuery:querymethod]mutableCopy];
        
        
        NSMutableArray *arr_method  = [recipeMethodArr valueForKey:@"recipe_method"];
        NSLog(@"%@",arr_method);
        
        //self.recipe_methodlbl.text = [arr_method objectAtIndex:0];
        //[self.recipe_methodlbl sizeToFit];
        recipeMethodstr = [arr_method objectAtIndex:0];
        
        
        
        [database close];
    }
    
    
    
    // Squash.jpg
    
    if([self.imageFile isEqualToString: @"Squash.jpg"])
    {
        [self databaseOpen];
        
        
        //For name
        
        NSString *queryname= [NSString stringWithFormat:@"Select recipe_subcategory,recipe_name,recipe_type from fall_tbl where recipe_name = 'Squash' AND recipe_type = 'Sensational' "];
        recipeNameArr =[[NSMutableArray alloc]init];
        recipeNameArr =[[database executeQuery:queryname]mutableCopy];
        
        NSMutableArray *arr_name = [recipeNameArr valueForKey:@"recipe_subcategory"];
        
        //self.recipe_namelbl.text = [arr_name objectAtIndex:0];
        
        recipeNamestr = [arr_name objectAtIndex:0];
        
        //For ingredients
        
        NSString *queryingredients=[ NSString stringWithFormat:@"Select recipe_ingredients from fall_tbl where recipe_name = 'Squash' AND recipe_type = 'Sensational' "];
        recipeIngredientsArr =[[NSMutableArray alloc]init];
        recipeIngredientsArr =[[database executeQuery:queryingredients]mutableCopy];
        
        
        NSMutableArray *arr_ingredients  = [recipeIngredientsArr valueForKey:@"recipe_ingredients"];
        NSLog(@"%@",arr_ingredients);
        
        //self.recipe_ingredientslbl.text = [arr_ingredients objectAtIndex:0];
        // [self.recipe_ingredientslbl sizeToFit];
        
        recipeIngredientsstr = [arr_ingredients objectAtIndex:0];
        
        //For method
        NSString *querymethod=[ NSString stringWithFormat:@"Select recipe_method from fall_tbl where recipe_name = 'Squash' AND recipe_type = 'Sensational' "];
        recipeMethodArr =[[NSMutableArray alloc]init];
        recipeMethodArr =[[database executeQuery:querymethod]mutableCopy];
        
        
        NSMutableArray *arr_method  = [recipeMethodArr valueForKey:@"recipe_method"];
        NSLog(@"%@",arr_method);
        
        //self.recipe_methodlbl.text = [arr_method objectAtIndex:0];
        //[self.recipe_methodlbl sizeToFit];
        recipeMethodstr = [arr_method objectAtIndex:0];
        
        
        
        [database close];
    }
    
    
    
    // Turkey.jpg
    
    if([self.imageFile isEqualToString: @"Turkey.jpg"])
    {
        [self databaseOpen];
        
        
        //For name
        
        NSString *queryname= [NSString stringWithFormat:@"Select recipe_subcategory,recipe_name,recipe_type from fall_tbl where recipe_name = 'Turkey' AND recipe_type = 'Sensational' "];
        recipeNameArr =[[NSMutableArray alloc]init];
        recipeNameArr =[[database executeQuery:queryname]mutableCopy];
        
        NSMutableArray *arr_name = [recipeNameArr valueForKey:@"recipe_subcategory"];
        
        //self.recipe_namelbl.text = [arr_name objectAtIndex:0];
        
        recipeNamestr = [arr_name objectAtIndex:0];
        
        //For ingredients
        
        NSString *queryingredients=[ NSString stringWithFormat:@"Select recipe_ingredients from fall_tbl where recipe_name = 'Turkey' AND recipe_type = 'Sensational' "];
        recipeIngredientsArr =[[NSMutableArray alloc]init];
        recipeIngredientsArr =[[database executeQuery:queryingredients]mutableCopy];
        
        
        NSMutableArray *arr_ingredients  = [recipeIngredientsArr valueForKey:@"recipe_ingredients"];
        NSLog(@"%@",arr_ingredients);
        
        //self.recipe_ingredientslbl.text = [arr_ingredients objectAtIndex:0];
        // [self.recipe_ingredientslbl sizeToFit];
        
        recipeIngredientsstr = [arr_ingredients objectAtIndex:0];
        
        //For method
        NSString *querymethod=[ NSString stringWithFormat:@"Select recipe_method from fall_tbl where recipe_name = 'Turkey' AND recipe_type = 'Sensational' "];
        recipeMethodArr =[[NSMutableArray alloc]init];
        recipeMethodArr =[[database executeQuery:querymethod]mutableCopy];
        
        
        NSMutableArray *arr_method  = [recipeMethodArr valueForKey:@"recipe_method"];
        NSLog(@"%@",arr_method);
        
        //self.recipe_methodlbl.text = [arr_method objectAtIndex:0];
        //[self.recipe_methodlbl sizeToFit];
        recipeMethodstr = [arr_method objectAtIndex:0];
        
        
        
        [database close];
    }
    
    
    
    // Venison.jpg
    
    if([self.imageFile isEqualToString: @"Venison.jpg"])
    {
        [self databaseOpen];
        
        
        //For name
        
        NSString *queryname= [NSString stringWithFormat:@"Select recipe_subcategory,recipe_name,recipe_type from fall_tbl where recipe_name = 'Venison' AND recipe_type = 'Sensational' "];
        recipeNameArr =[[NSMutableArray alloc]init];
        recipeNameArr =[[database executeQuery:queryname]mutableCopy];
        
        NSMutableArray *arr_name = [recipeNameArr valueForKey:@"recipe_subcategory"];
        
        //self.recipe_namelbl.text = [arr_name objectAtIndex:0];
        
        recipeNamestr = [arr_name objectAtIndex:0];
        
        //For ingredients
        
        NSString *queryingredients=[ NSString stringWithFormat:@"Select recipe_ingredients from fall_tbl where recipe_name = 'Venison' AND recipe_type = 'Sensational' "];
        recipeIngredientsArr =[[NSMutableArray alloc]init];
        recipeIngredientsArr =[[database executeQuery:queryingredients]mutableCopy];
        
        
        NSMutableArray *arr_ingredients  = [recipeIngredientsArr valueForKey:@"recipe_ingredients"];
        NSLog(@"%@",arr_ingredients);
        
        //self.recipe_ingredientslbl.text = [arr_ingredients objectAtIndex:0];
        // [self.recipe_ingredientslbl sizeToFit];
        
        recipeIngredientsstr = [arr_ingredients objectAtIndex:0];
        
        //For method
        NSString *querymethod=[ NSString stringWithFormat:@"Select recipe_method from fall_tbl where recipe_name = 'Venison' AND recipe_type = 'Sensational' "];
        recipeMethodArr =[[NSMutableArray alloc]init];
        recipeMethodArr =[[database executeQuery:querymethod]mutableCopy];
        
        
        NSMutableArray *arr_method  = [recipeMethodArr valueForKey:@"recipe_method"];
        NSLog(@"%@",arr_method);
        
        //self.recipe_methodlbl.text = [arr_method objectAtIndex:0];
        //[self.recipe_methodlbl sizeToFit];
        recipeMethodstr = [arr_method objectAtIndex:0];
        
        
        
        [database close];
    }
    
    
}
    NSMutableArray *arr_recipe = [recipeNameArr valueForKey:@"recipe_name"];
    recipestr = [arr_recipe objectAtIndex:0];
    
    NSMutableArray *arr_recipetype = [recipeNameArr valueForKey:@"recipe_type"];
    recipeTypestr = [arr_recipetype objectAtIndex:0];
    
    [[NSUserDefaults standardUserDefaults]setValue:recipestr forKey:@"recipeName"];
    [[NSUserDefaults standardUserDefaults]setValue:recipeTypestr forKey:@"recipeType"];
    
}

#pragma mark - Segue Methods
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    RecipeViewController *recipeVC;
    
    [[NSUserDefaults standardUserDefaults]setValue:@"no" forKey:@"fromfavorite"];

    if ([[segue identifier] isEqualToString:@"cinchsegue"])
    {
        recipeVC = [segue destinationViewController];
        NSLog(@"name:%@",recipeNamestr);
        if(([recipeNamestr isEqual:[NSNull null]] || recipeNamestr == nil) )
        {
        recipeNamestr = @"";
        }
        if(([recipeIngredientsstr isEqual:[NSNull null]] || recipeIngredientsstr == nil))
        {
            recipeIngredientsstr = @"";
        }
        if(([recipeMethodstr isEqual:[NSNull null]] || recipeMethodstr == nil))
        {
            recipeMethodstr = @"";
        }
        recipeVC.recipe_namestr = recipeNamestr;
        recipeVC.recipe_ingredientsstr = recipeIngredientsstr;
        recipeVC.recipe_methodstr = recipeMethodstr;
    }
    
    else if([[segue identifier] isEqualToString:@"simplesegue"])
    {
       
        recipeVC = [segue destinationViewController];
        if(([recipeNamestr isEqual:[NSNull null]] || recipeNamestr == nil) )
        {
            recipeNamestr = @"";
        }
        if(([recipeIngredientsstr isEqual:[NSNull null]] || recipeIngredientsstr == nil))
        {
            recipeIngredientsstr = @"";
        }
        if(([recipeMethodstr isEqual:[NSNull null]] || recipeMethodstr == nil))
        {
            recipeMethodstr = @"";
        }
        recipeVC.recipe_namestr = recipeNamestr;
        recipeVC.recipe_ingredientsstr = recipeIngredientsstr;
        recipeVC.recipe_methodstr = recipeMethodstr;
        
    }
    
    else if ([[segue identifier] isEqualToString:@"sensationalsegue"])
    {
        
        recipeVC = [segue destinationViewController];
        if(([recipeNamestr isEqual:[NSNull null]] || recipeNamestr == nil) )
        {
            recipeNamestr = @"";
        }
        if(([recipeIngredientsstr isEqual:[NSNull null]] || recipeIngredientsstr == nil))
        {
            recipeIngredientsstr = @"";
        }
        if(([recipeMethodstr isEqual:[NSNull null]] || recipeMethodstr == nil))
        {
            recipeMethodstr = @"";
        }
        recipeVC.recipe_namestr = recipeNamestr;
        recipeVC.recipe_ingredientsstr = recipeIngredientsstr;
        recipeVC.recipe_methodstr = recipeMethodstr;

    }
    
    
    
}

- (BOOL)shouldPerformSegueWithIdentifier:(NSString *)identifier sender:(id)sender
{
    if(recipeNamestr ==nil && recipeIngredientsstr == nil && recipeMethodstr == nil)
    return NO;
    else
    return YES;
    
    
}

#pragma mark - InAppView Gesture

-(void)handleSingleTap
{
    [self performSegueWithIdentifier:@"goToUpgrade" sender:nil];
}

//#pragma mark - SlideViews
//
//-(IBAction)slideViews:(id)sender
//{
//   
//    [[NSNotificationCenter defaultCenter]postNotificationName:@"slide" object:nil];
//    
//}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
