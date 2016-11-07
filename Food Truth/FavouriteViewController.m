//
//  FavouriteViewController.m
//  Food Truth
//
//  Created by admin on 3/4/15.
//  Copyright (c) 2015 TaxSmart Technologies Pvt. Ltd. All rights reserved.
//

#import "FavouriteViewController.h"
#import "RecipeViewController.h"

@interface FavouriteViewController ()

@end

@implementation FavouriteViewController

@synthesize favoriteRecipes_arr;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    dispatch_async(dispatch_get_main_queue(), ^{
        
        [self fetchRecipeData];
        
    });
    
    [self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"favoritecell"];
    
    UILongPressGestureRecognizer *lpgr
    = [[UILongPressGestureRecognizer alloc]
       initWithTarget:self action:@selector(handleLongPress:)];
    lpgr.minimumPressDuration = .3; //seconds
    lpgr.delegate = self;
    [self.collectionView addGestureRecognizer:lpgr];
    
    lpgr.delaysTouchesBegan = YES;
    
    
}

-(void)fetchRecipeData
{
    [self databaseOpen];
    
    NSString *query=[ NSString stringWithFormat:@"Select * from favourite_recipes_tbl ORDER BY rowid DESC"];
    NSMutableArray *arr =[[NSMutableArray alloc]init];
    arr =[[database executeQuery:query]mutableCopy];
    
    
    favoriteRecipes_arr  = [arr valueForKey:@"recipe_subcategory"];
    NSLog(@"%@",favoriteRecipes_arr);
    
    recipeNamearr = [arr valueForKey:@"recipe_subcategory"];
    
    NSLog(@"%@",recipeNamearr);

    recipeIngredientsArr = [arr valueForKey:@"recipe_ingredients"];
    recipeMethodarr = [arr valueForKey:@"recipe_method"];
    foodarr = [arr valueForKey:@"recipe_name"];
    

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
#pragma mark - Cancel Button

-(IBAction)cancelPressed:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
    
}

//#pragma mark - UITableView
//
//-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
//{
////    if ([[favoriteRecipes_arr objectAtIndex:indexPath.row] isEqualToString:@""])
////        return 0;
////    
////    else
//    
//        return 44;
//    
//}
//
//- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
//    return favoriteRecipes_arr.count;
//    
//}
//- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
//    static NSString *cellIdentifier = @"Cell";
//    
//    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
//    if (cell == nil)
//        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
//    
//    //cell.backgroundView = [[UIView alloc] init];
//    // [cell.backgroundView setBackgroundColor:[UIColor clearColor]];
//    //[[[cell contentView] subviews] makeObjectsPerformSelector:@selector(removeFromSuperview)];
//    tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
//    //[tableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
//    tableView.backgroundColor = [UIColor clearColor];
//    
//    cell.textLabel.textColor = [UIColor blackColor];
//    
//    NSString *name = [favoriteRecipes_arr objectAtIndex:indexPath.row];
//    
//    name = [name stringByReplacingOccurrencesOfString:@"EÃÅ"
//                                           withString:@"É"];
//    name = [name stringByReplacingOccurrencesOfString:@"1‚ÅÑ2" withString:@"1/2"];
//    
//    name = [name stringByReplacingOccurrencesOfString:@"11/2" withString:@"1.5"];
//    
//    name = [name stringByReplacingOccurrencesOfString:@"1‚ÅÑ4" withString:@"1/4"];
//    name = [name stringByReplacingOccurrencesOfString:@"¬∞" withString:@"\u00B0"];
//    name = [name stringByReplacingOccurrencesOfString:@"√©" withString:@"É"];
//    name = [name stringByReplacingOccurrencesOfString:@"‚Äù" withString:@"\""];
//    name = [name stringByReplacingOccurrencesOfString:@"‚Äú" withString:@"\""];
//    name = [name stringByReplacingOccurrencesOfString:@"‚Äì" withString:@"-"];
//    name = [name stringByReplacingOccurrencesOfString:@"EÔøΩ" withString:@"EÉ"];
//    name = [name stringByReplacingOccurrencesOfString:@"ÔøΩE" withString:@"ÉE"];
//    
//    name = [name stringByReplacingOccurrencesOfString:@"ÔøΩ" withString:@"1/2"];
//    name = [name stringByReplacingOccurrencesOfString:@"T1/2" withString:@"TÉ"];
//    name = [name stringByReplacingOccurrencesOfString:@"1/2F" withString:@"\u00B0F"];
//    name = [name stringByReplacingOccurrencesOfString:@"jalape1/2o" withString:@"jalapeño"];
//    name = [name stringByReplacingOccurrencesOfString:@"1/2coins.1/2" withString:@"\"coins.\""];
//    name = [name stringByReplacingOccurrencesOfString:@"1/2fries.1/2" withString:@"\"fries.\""];
//    name = [name stringByReplacingOccurrencesOfString:@"1/2Miso-Cup1/2" withString:@"\"Miso-Cup\""];
//    name = [name stringByReplacingOccurrencesOfString:@"1/2SIN-A-MON1/2" withString:@"\"SIN-A-MON\""];
//    name = [name stringByReplacingOccurrencesOfString:@"A1/2OLI" withString:@"AÏOLI"];
//    name = [name stringByReplacingOccurrencesOfString:@"A1/2LLADE" withString:@"AÏLLADE"];
//    
//    cell.textLabel.text = name;
//    
//    
//    cell.backgroundColor = [UIColor clearColor];
//    cell.selectionStyle = UITableViewCellSelectionStyleNone;
//    
//    
//    return cell;
//}
//- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    recipeNamestr = [recipeNamearr objectAtIndex:indexPath.row];
//    recipeIngredientsstr = [recipeIngredientsArr objectAtIndex:indexPath.row];
//    recipeMethodstr = [recipeMethodarr objectAtIndex:indexPath.row];
//    
//    NSLog(@"namearr:%@",recipeNamearr);
//    
//    
//    [self performSegueWithIdentifier:@"showrecipe" sender:self];
//    
//    
//    
//}

#pragma mark - Segue Method

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    RecipeViewController *recipeVC;
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

#pragma mark - Collection View

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    
    
    [self databaseOpen];
    
    NSString *query=[ NSString stringWithFormat:@"Select * from favourite_recipes_tbl ORDER BY rowid DESC"];
    NSMutableArray *arr =[[NSMutableArray alloc]init];
    arr =[[database executeQuery:query]mutableCopy];
    
    
    favoriteRecipes_arr  = [arr valueForKey:@"recipe_subcategory"];
    //NSLog(@"%@",favoriteRecipes_arr);
    
    recipeNamearr = [arr valueForKey:@"recipe_subcategory"];
    
    //NSLog(@"%@",recipeNamearr);
    
    recipeIngredientsArr = [arr valueForKey:@"recipe_ingredients"];
    recipeMethodarr = [arr valueForKey:@"recipe_method"];
    foodarr = [arr valueForKey:@"recipe_name"];

    if(favoriteRecipes_arr.count > 0)
        return favoriteRecipes_arr.count;
    else
        return 0;
    
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"favoritecell" forIndexPath:indexPath];
   // UIImageView *img=[[UIImageView alloc]init];

    cell.backgroundColor = [UIColor colorWithRed:251.0/255.0 green:144.0/255.0 blue:13.0/255.0 alpha:1.0];
    

    //img.image = [UIImage imageNamed:@""];
    
    NSLog(@"%d",indexPath.row);
    
    
    NSString *name = [favoriteRecipes_arr objectAtIndex:indexPath.row];
    
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
    
    UILabel *lbl = [[UILabel alloc]init];
    lbl.numberOfLines = 0;
    lbl.textAlignment = NSTextAlignmentCenter;
    
    lbl.textColor = [UIColor whiteColor];
    
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
        lbl.font = [UIFont fontWithName:@"Nexa Bold" size:24.0f];
    
    else
        lbl.font = [UIFont fontWithName:@"Nexa Bold" size:18.0f];
        
    
    if([name isEqualToString:@""])
    {
        NSString *food = [foodarr objectAtIndex:indexPath.row];
        
        lbl.text = [[food stringByAppendingString:@" Cinch"] capitalizedString];
        
    }
    else
    {
        lbl.text = [name capitalizedString];
    }
//    [img addSubview:lbl];
//    [img bringSubviewToFront:lbl];
 
    //_deleteButton.hidden = YES;

    [cell setBackgroundView:lbl];
    
   
    
    //251, 144 , 13
    
    
    return cell;
    
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    recipeNamestr = [recipeNamearr objectAtIndex:indexPath.row];
    recipeIngredientsstr = [recipeIngredientsArr objectAtIndex:indexPath.row];
    recipeMethodstr = [recipeMethodarr objectAtIndex:indexPath.row];
    
    NSLog(@"namearr:%@",recipeNamearr);
    
    [[NSUserDefaults standardUserDefaults]setValue:@"yes" forKey:@"fromfavorite"];

    if([[[NSUserDefaults standardUserDefaults]valueForKey:@"longPressed"] isEqualToString:@"yes"])
    {
        UICollectionViewCell* cell =
        [self.collectionView cellForItemAtIndexPath:indexPath];
        NSIndexPath *indexPath1 = [self.collectionView indexPathForItemAtPoint:p];
        UICollectionViewCell* cell1 =
        [self.collectionView cellForItemAtIndexPath:indexPath1];
        [cell.layer removeAllAnimations];
        [cell1.layer removeAllAnimations];
        
        [[NSUserDefaults standardUserDefaults]setValue:@"no" forKey:@"longPressed"];
        [_deleteButton removeFromSuperview];
        
    }
    else
    {
        [self performSegueWithIdentifier:@"showrecipe" sender:self];
    }
    
}

- (CGSize)collectionView:(UICollectionView *)collectionView
                  layout:(UICollectionViewLayout *)collectionViewLayout
  sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    CGRect screenrect = [[UIScreen mainScreen]bounds];
    
    if(screenrect.size.width == 414)
    {
        collectionView.contentInset = UIEdgeInsetsMake(0, 20, 20, 20);
        
        return CGSizeMake(150.f, 210.f);
    }
    if(screenrect.size.width == 375)
    {
        collectionView.contentInset = UIEdgeInsetsMake(0, 20, 20, 20);
        
        return CGSizeMake(140.f, 210.f);
    }
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
    {
        return CGSizeMake(200.f, 300.f);
        
    }
    // Adjust cell size for orientation
        return CGSizeMake(130.f, 180.f);
}

#pragma mark - UILongPressGesture Method

-(void)handleLongPress:(UILongPressGestureRecognizer *)gestureRecognizer
{
    if (gestureRecognizer.state != UIGestureRecognizerStateEnded) {
        return;
    }
    p = [gestureRecognizer locationInView:self.collectionView];
    
    NSIndexPath *indexPath = [self.collectionView indexPathForItemAtPoint:p];
    if (indexPath == nil){
        NSLog(@"couldn't find index path");
    } else {
        // get the cell at indexPath (the one you long pressed)
        UICollectionViewCell* cell =
        [self.collectionView cellForItemAtIndexPath:indexPath];
        // do stuff with the cell
        
        CABasicAnimation* anim = [CABasicAnimation animationWithKeyPath:@"transform.rotation"];
        [anim setToValue:[NSNumber numberWithFloat:0.0f]];
        [anim setFromValue:[NSNumber numberWithDouble:M_PI/64]];
        [anim setDuration:0.1];
        [anim setRepeatCount:NSUIntegerMax];
        [anim setAutoreverses:YES];
        cell.layer.shouldRasterize = YES;
        [cell.layer addAnimation:anim forKey:@"SpringboardShake"];
        //_mainImage.userInteractionEnabled = NO;
        //[cell bringSubviewToFront:_deleteButton];
        
        CGFloat delButtonSize = 75;
        
        _deleteButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, delButtonSize, delButtonSize)];
        _deleteButton.center = CGPointMake(0, 0);
        _deleteButton.backgroundColor = [UIColor clearColor];
        
        [_deleteButton setImage: [UIImage imageNamed:@"delete.png"] forState:UIControlStateNormal];
        [cell addSubview:_deleteButton];

        
        [_deleteButton addTarget:self action:@selector(deleteRecipe) forControlEvents:UIControlEventTouchUpInside];
        
        [[NSUserDefaults standardUserDefaults]setValue:@"yes" forKey:@"longPressed"];
      
    }
}

-(void)deleteRecipe
{
    MODropAlertView *alertView = [[MODropAlertView alloc]initDropAlertWithTitle:@"Delete?" description:@"This recipe will be deleted from your favorite recipes." okButtonTitle:@"Yes" cancelButtonTitle:@"No"];
    [alertView show];
    alertView.delegate = self;
    
 
}

#pragma mark - DropAlert Method

- (void)alertViewPressButton:(MODropAlertView *)alertView buttonType:(DropAlertButtonType)buttonType

{
    if(buttonType == DropAlertButtonOK)
    {
        NSIndexPath *indexPath = [self.collectionView indexPathForItemAtPoint:p];
        //UICollectionViewCell* cell = [self.collectionView cellForItemAtIndexPath:indexPath];
        //[self.collectionView deleteItemsAtIndexPaths:indexPath];
        //NSArray *array = [mutableArray copy];
        
        NSString *name = [favoriteRecipes_arr objectAtIndex:indexPath.row];
        NSString *method = [recipeMethodarr objectAtIndex:indexPath.row];
        
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
        NSLog(@"index:%@",name);
        
        
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
        NSLog(@"deleteMethod:%@", method);
        
        
        [self databaseOpen];
        if([name isEqualToString:@""])
        {
        NSString *query=[ NSString stringWithFormat:@"Delete from favourite_recipes_tbl WHERE recipe_subcategory = '%@' AND recipe_method = '%@'", name,method];
            
            
        [database executeNonQuery:query];
            
        }
        
        else
        {
            NSString *query=[ NSString stringWithFormat:@"Delete from favourite_recipes_tbl WHERE recipe_subcategory = '%@' ", name];
            
            [database executeNonQuery:query];
        }
        
        
        [database close];
        [_deleteButton removeFromSuperview];
        [self.collectionView reloadData];
        
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
