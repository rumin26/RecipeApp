//
//  RecipeViewController.m
//  Food Truth
//
//  Created by admin on 1/12/15.
//  Copyright (c) 2015 TaxSmart Technologies Pvt. Ltd. All rights reserved.
//

#import "RecipeViewController.h"

@interface RecipeViewController ()

@end

@implementation RecipeViewController
@synthesize recipe_namestr, recipe_ingredientsstr,recipe_methodstr;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.recipe_namelbl.text = recipe_namestr;
    self.recipe_ingredientslbl.text = recipe_ingredientsstr;
    [self.recipe_ingredientslbl setNumberOfLines:0];
    
    [self.recipe_ingredientslbl sizeToFit];
    
    float X_Co = (self.view.frame.size.width - self.recipe_ingredientslbl.frame.size.width)/2;
    [self.recipe_ingredientslbl setFrame:CGRectMake(X_Co, 88, self.recipe_ingredientslbl.frame.size.width, self.recipe_ingredientslbl.frame.size.height)];
   // [self.recipe_ingredientslbl sizeToFit];
    
    self.recipe_methodlbl.text = recipe_methodstr;
    [self.recipe_methodlbl sizeToFit];
    [self.recipe_methodlbl setNumberOfLines:0];
    
   NSInteger scrollHeight = self.recipe_methodlbl.frame.size.height + self.recipe_namelbl.frame.size.height + self.recipe_ingredientslbl.frame.size.height;
    
    
    
    self.scrollview.contentSize = CGSizeMake(320, scrollHeight + 75);
    
    CGRect screenrect = [[UIScreen mainScreen]bounds];
    
    if(screenrect.size.height ==480)
    {
        self.recipeBackground.image = [UIImage imageNamed:@"iphone4_recipeBackground.jpg"];
        
    }
    else if (screenrect.size.height == 568)
    {
        self.recipeBackground.image = [UIImage imageNamed:@"iphone5_recipeBackground.jpg"];
    }
    else if (screenrect.size.width == 375)
    {
        self.recipeBackground.image = [UIImage imageNamed:@"iphone6_recipeBackground.jpg"];
    }
    else if (screenrect.size.width == 414)
    {
        self.recipeBackground.image = [UIImage imageNamed:@"iphone6plus_recipeBackground.jpg"];
    }
    else
    {
        self.recipeBackground.image = [UIImage imageNamed:@"ipad_recipeBackground.png"];
    }
    
    dispatch_async(dispatch_get_main_queue(), ^{
        
        [self getCorrectData];
        
    });
    
    if([[[NSUserDefaults standardUserDefaults]valueForKey:@"fromfavorite"] isEqualToString:@"yes"])
    
        self.favoritebtn.hidden = YES;
    
    
    else
        [self.favoritebtn setImage:[UIImage imageNamed:@"favorite.png"] forState:UIControlStateNormal];
    
    
}
-(void)viewWillAppear:(BOOL)animated
{

  
    
    
//    if([self.recipe_namelbl.text isEqualToString:@""] && ![self.recipe_ingredientslbl.text isEqualToString:@""] && ![self.recipe_methodlbl.text isEqualToString:@""])
//    {
//        
//        UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, self.recipe_methodlbl.frame.size.width, self.recipe_methodlbl.frame.size.height + self.recipe_ingredientslbl.frame.size.height+50)];
//        
//        [self.view addSubview:view];
//        
//        [view addSubview:self.recipe_ingredientslbl];
//        [view addSubview:self.recipe_methodlbl];
//        
//        float X_Co = (view.frame.size.width - self.recipe_methodlbl.frame.size.width)/2;
//        [self.recipe_methodlbl setFrame:CGRectMake(X_Co, 95, self.recipe_methodlbl.frame.size.width, self.recipe_methodlbl.frame.size.height)];
//        
//        float X_Co1 = (view.frame.size.width - self.recipe_ingredientslbl.frame.size.width)/2;
//        [self.recipe_ingredientslbl setFrame:CGRectMake(X_Co1, 10, self.recipe_ingredientslbl.frame.size.width, self.recipe_ingredientslbl.frame.size.height)];
//        
//        view.center = self.view.center;
//        
//    }

}

-(void)getCorrectData
{
    NSString *name = recipe_namestr;
    
    name = [name stringByReplacingOccurrencesOfString:@"EÃÅ"
                                           withString:@"É"];
    name = [name stringByReplacingOccurrencesOfString:@"1‚ÅÑ2" withString:@"1/2"];
    
    name = [name stringByReplacingOccurrencesOfString:@"11/2" withString:@"1.5"];
    
    name = [name stringByReplacingOccurrencesOfString:@"1‚ÅÑ4" withString:@"1/4"];
    name = [name stringByReplacingOccurrencesOfString:@"¬∞" withString:@"\u00B0"];
    name = [name stringByReplacingOccurrencesOfString:@"√©" withString:@"É"];
    name = [name stringByReplacingOccurrencesOfString:@"‚Äù" withString:@"\""];
    name = [name stringByReplacingOccurrencesOfString:@"‚Äú" withString:@"\""];
    name = [name stringByReplacingOccurrencesOfString:@"‚Äì" withString:@"-"];
    name = [name stringByReplacingOccurrencesOfString:@"EÔøΩ" withString:@"EÉ"];
    name = [name stringByReplacingOccurrencesOfString:@"ÔøΩE" withString:@"ÉE"];
    
    name = [name stringByReplacingOccurrencesOfString:@"ÔøΩ" withString:@"1/2"];
    name = [name stringByReplacingOccurrencesOfString:@"T1/2" withString:@"TÉ"];
    name = [name stringByReplacingOccurrencesOfString:@"1/2F" withString:@"\u00B0F"];
    name = [name stringByReplacingOccurrencesOfString:@"jalape1/2o" withString:@"jalapeño"];
    name = [name stringByReplacingOccurrencesOfString:@"1/2coins.1/2" withString:@"\"coins.\""];
    name = [name stringByReplacingOccurrencesOfString:@"1/2fries.1/2" withString:@"\"fries.\""];
    name = [name stringByReplacingOccurrencesOfString:@"1/2Miso-Cup1/2" withString:@"\"Miso-Cup\""];
    name = [name stringByReplacingOccurrencesOfString:@"1/2SIN-A-MON1/2" withString:@"\"SIN-A-MON\""];
    name = [name stringByReplacingOccurrencesOfString:@"A1/2OLI" withString:@"AÏOLI"];
    name = [name stringByReplacingOccurrencesOfString:@"A1/2LLADE" withString:@"AÏLLADE"];
    
    self.recipe_namelbl.text = name;
    NSLog(@"name:%@",recipe_namestr);
    
    //é
    NSString *ingredients = recipe_ingredientsstr;
    ingredients = [ingredients stringByReplacingOccurrencesOfString:@"eÃÅ"
                                                         withString:@"é"];
    ingredients = [ingredients stringByReplacingOccurrencesOfString:@"eÃÄ" withString:@"é"];
    
    ingredients = [ingredients stringByReplacingOccurrencesOfString:@"1‚ÅÑ2" withString:@"1/2"];
    
    ingredients = [ingredients stringByReplacingOccurrencesOfString:@"11/2" withString:@"1.5"];
    
    ingredients = [ingredients stringByReplacingOccurrencesOfString:@"1‚ÅÑ4" withString:@"1/4"];
    ingredients = [ingredients stringByReplacingOccurrencesOfString:@"¬∞" withString:@"\u00B0"];
    ingredients = [ingredients stringByReplacingOccurrencesOfString:@"√©" withString:@"é"];
    ingredients = [ingredients stringByReplacingOccurrencesOfString:@"‚Äù" withString:@"\""];
    ingredients = [ingredients stringByReplacingOccurrencesOfString:@"‚Äú" withString:@"\""];
    ingredients = [ingredients stringByReplacingOccurrencesOfString:@"‚Äì" withString:@"-"];
    ingredients = [ingredients stringByReplacingOccurrencesOfString:@"ÔøΩe" withString:@"ée"];
    ingredients = [ingredients stringByReplacingOccurrencesOfString:@"ÔøΩ" withString:@"1/2"];
    ingredients = [ingredients stringByReplacingOccurrencesOfString:@"t1/2" withString:@"té"];
    ingredients = [ingredients stringByReplacingOccurrencesOfString:@"1/2F" withString:@"\u00B0F"];
    ingredients = [ingredients stringByReplacingOccurrencesOfString:@"Jalape1/2o" withString:@"Jalapeño"];
    ingredients = [ingredients stringByReplacingOccurrencesOfString:@"1/2coins.1/2" withString:@"\"coins.\""];
    ingredients = [ingredients stringByReplacingOccurrencesOfString:@"1/2fries.1/2" withString:@"\"fries.\""];
    ingredients = [ingredients stringByReplacingOccurrencesOfString:@"1/2Miso-Cup1/2" withString:@"\"Miso-Cup\""];
    ingredients = [ingredients stringByReplacingOccurrencesOfString:@"FraiÃÇche" withString:@"Fraîche"];
    
    ingredients = [ingredients stringByReplacingOccurrencesOfString:@"JalapenÃÉo" withString:@"Jalapeño"];
    
    ingredients = [ingredients stringByReplacingOccurrencesOfString:@"Gruyere" withString:@"Gruyère"];
    ingredients = [ingredients stringByReplacingOccurrencesOfString:@"√®" withString:@"è"];
    ingredients = [ingredients stringByReplacingOccurrencesOfString:@"Jalape√±o" withString:@"Jalapeño"];
    
    self.recipe_ingredientslbl.text = ingredients;
    
    NSLog(@"ingredients:%@",recipe_ingredientsstr);
    
    NSLog(@"method:%@",recipe_methodstr);
    
    NSString *method = recipe_methodstr;
    
    
    method = [method stringByReplacingOccurrencesOfString:@"eÃÅ" withString:@"é"];
    method = [method stringByReplacingOccurrencesOfString:@"eÃÄ" withString:@"é"];
    method = [method stringByReplacingOccurrencesOfString:@"1‚ÅÑ2" withString:@"1/2"];
    method = [method stringByReplacingOccurrencesOfString:@"11/2" withString:@"1.5"];
    method = [method stringByReplacingOccurrencesOfString:@"1‚ÅÑ4" withString:@"1/4"];
    method = [method stringByReplacingOccurrencesOfString:@"¬∞" withString:@"\u00B0"];
    method = [method stringByReplacingOccurrencesOfString:@"√©" withString:@"é"];
    method = [method stringByReplacingOccurrencesOfString:@"‚Äù" withString:@"\""];
    method = [method stringByReplacingOccurrencesOfString:@"‚Äú" withString:@"\""];
    method = [method stringByReplacingOccurrencesOfString:@"‚Äì" withString:@"-"];
    method = [method stringByReplacingOccurrencesOfString:@"ÔøΩe" withString:@"ée"];
    method = [method stringByReplacingOccurrencesOfString:@"ÔøΩ" withString:@"1/2"];
    method = [method stringByReplacingOccurrencesOfString:@"t1/2" withString:@"té"];
    method = [method stringByReplacingOccurrencesOfString:@"1/2F" withString:@"\u00B0F"];
    method = [method stringByReplacingOccurrencesOfString:@"jalape1/2o" withString:@"jalapeño"];
    method = [method stringByReplacingOccurrencesOfString:@"1/2coins.1/2" withString:@"\"coins.\""];
    method = [method stringByReplacingOccurrencesOfString:@"1/2fries.1/2" withString:@"\"fries.\""];
    method = [method stringByReplacingOccurrencesOfString:@"1/2Miso-Cup1/2" withString:@"\"Miso-Cup\""];
    method = [method stringByReplacingOccurrencesOfString:@"1/2balls1/2" withString:@"\"balls\""];
    method = [method stringByReplacingOccurrencesOfString:@"fraiÃÇche" withString:@"fraîche"];
    method = [method stringByReplacingOccurrencesOfString:@"350 F" withString:@"350\u00B0F"];
    method = [method stringByReplacingOccurrencesOfString:@"375 F" withString:@"375\u00B0F"];
    method = [method stringByReplacingOccurrencesOfString:@"425 F" withString:@"425\u00B0F"];
    method = [method stringByReplacingOccurrencesOfString:@"400 s" withString:@"400\u00B0F"];
    method = [method stringByReplacingOccurrencesOfString:@"jalapenÃÉo" withString:@"jalapeño"];
    
    method = [method stringByReplacingOccurrencesOfString:@"canap1/2" withString:@"canapé"];
    method = [method stringByReplacingOccurrencesOfString:@"souffl1/2" withString:@"soufflé"];
    method = [method stringByReplacingOccurrencesOfString:@"gruy1/2re" withString:@"gruyère"];
    
    method = [method stringByReplacingOccurrencesOfString:@"gruyére" withString:@"gruyre"];
    method = [method stringByReplacingOccurrencesOfString:@"√®" withString:@"è"];
    method = [method stringByReplacingOccurrencesOfString:@"jalape√±o" withString:@"jalapeño"];

    
    
    
    //method = [method stringByReplacingOccurrencesOfString:@"PureÃÅe" withString:@"Purée"];
    
    if([self.recipe_namelbl.text isEqualToString:@""] && [self.recipe_ingredientslbl.text isEqualToString:@""])
    {
        NSLog(@"name:null");
        self.recipe_methodlbl.center = self.view.center;
        self.recipe_methodlbl.text = method;
        
        
    }
    else
    {
        self.recipe_methodlbl.text = method;
        [self.recipe_methodlbl sizeToFit];
        [self.recipe_methodlbl setNumberOfLines:0];
        
        
        
        float X_Co = (self.view.frame.size.width - self.recipe_methodlbl.frame.size.width)/2;
        
        self.recipe_methodlbl.frame = CGRectMake(X_Co, self.recipe_ingredientslbl.frame.origin.y + self.recipe_ingredientslbl.frame.size.height + 40, self.recipe_methodlbl.frame.size.width, self.recipe_methodlbl.frame.size.height);
        
        
    }
    NSLog(@"nameLbL:%@",_recipe_namelbl.text);
    CGSize size =  [self.recipe_namelbl.text sizeWithAttributes:@{NSFontAttributeName : self.recipe_namelbl.font}];
    
    if (size.width > self.recipe_namelbl.bounds.size.width)
        
    {
        NSLog(@"helloo..text truncated");
        self.recipe_namelbl.font = [UIFont fontWithName:@"Verdana" size:22.0f];
        
    }
    
    if(![self.recipe_namelbl.text isEqualToString:@""] && [self.recipe_ingredientslbl.text isEqualToString:@""])
    {
        
        UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, self.recipe_methodlbl.frame.size.width, self.recipe_methodlbl.frame.size.height + self.recipe_namelbl.frame.size.height+50)];
        
        [self.view addSubview:view];
        
        [view addSubview:self.recipe_namelbl];
        [view addSubview:self.recipe_methodlbl];
        
        float X_Co = (view.frame.size.width - self.recipe_methodlbl.frame.size.width)/2;
        [self.recipe_methodlbl setFrame:CGRectMake(X_Co, 95, self.recipe_methodlbl.frame.size.width, self.recipe_methodlbl.frame.size.height)];
        
        float X_Co1 = (view.frame.size.width - self.recipe_namelbl.frame.size.width)/2;
        [self.recipe_namelbl setFrame:CGRectMake(X_Co1, 10, self.recipe_namelbl.frame.size.width, self.recipe_namelbl.frame.size.height)];
        
        view.center = self.view.center;
        
    }
 
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Database Method

-(void)databaseOpen

{
    NSArray *paths=NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory=[paths objectAtIndex:0];
    NSString *myDBnew=[documentsDirectory stringByAppendingPathComponent:@"foodtruth_db.sqlite"];
    
    database =[[Sqlite alloc]init];
    [database open:myDBnew];
    NSLog(@"path: %@", myDBnew);
    
    NSLog(@"Database opened");
    
}

#pragma mark - Done Button

-(IBAction)donePressed:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - Favourite Button

-(IBAction)favouritePressed:(id)sender
{
    [self databaseOpen];
    
    NSString *recipe_name = [[NSUserDefaults standardUserDefaults]valueForKey:@"recipeName"];
    NSString *recipe_type = [[NSUserDefaults standardUserDefaults]valueForKey:@"recipeType"];
    NSString *query=[ NSString stringWithFormat:@"SELECT recipe_name, recipe_subcategory, recipe_type FROM favourite_recipes_tbl WHERE recipe_subcategory = '%@' AND recipe_name ='%@' AND recipe_type = '%@'",self.recipe_namelbl.text,recipe_name,recipe_type];
    
    
    NSMutableArray *arr =[[NSMutableArray alloc]init];
    arr =[[database executeQuery:query]mutableCopy];
    
    
    
    
    if(arr.count > 0)
    {
        
        MODropAlertView *alertView = [[MODropAlertView alloc]initDropAlertWithTitle:@"Already Saved!" description:@"Recipe has already been marked as Favorite. Check out all your saved recipes by going to Seasons -> Favorite Recipes :D" okButtonTitle:@"Ok"];
        
        //alertView.delegate = self;
        [alertView show];
    }
    
    else
    {
    
    NSString *season = [[NSUserDefaults standardUserDefaults]valueForKey:@"recipe"];
    NSString *recipeName = [[NSUserDefaults standardUserDefaults]valueForKey:@"recipeName"];
    
    NSString *recipeType = [[NSUserDefaults standardUserDefaults]valueForKey:@"recipeType"];

    
   NSString *query_user=[NSString stringWithFormat:@"Insert into favourite_recipes_tbl(recipe_season,recipe_name,recipe_type,recipe_subcategory, recipe_ingredients, recipe_method) values('%@','%@','%@','%@','%@','%@')",season,recipeName,recipeType,self.recipe_namelbl.text,self.recipe_ingredientslbl.text,self.recipe_methodlbl.text];
    
    NSLog(@"recipeMethod:%@",self.recipe_methodlbl.text);
    NSLog(@"recipeMethod:%@",self.recipe_ingredientslbl.text);

    
    [database executeNonQuery:query_user];
    [database close];
    
    MODropAlertView *alertView = [[MODropAlertView alloc]initDropAlertWithTitle:@"Nice!" description:@"This recipe must be extra special! Check out all your saved recipes by going to Seasons -> Favorite Recipes :D " okButtonTitle:@"Ok"];

    //alertView.delegate = self;
    [alertView show];
        
    }

    
    
    
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
