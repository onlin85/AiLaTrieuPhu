//
//  NDKHighScoreView.m
//  AiLaTrieuPhu_KienND3_V01
//
//  Created by duykien on 7/30/13.
//  Copyright (c) 2013 D&K. All rights reserved.
//

#import "NDKHighScoreView.h"
#import "NDKEmptyCell.h"
#import "NDKDatabaseQuestion.h"
#import "NDKHighScore.h"
@interface NDKHighScoreView ()

@end

@implementation NDKHighScoreView
static NSArray * listHighScore;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self.navigationController setNavigationBarHidden:NO];
    self.navigationItem.title=@"HighScore";
    listHighScore = [[NDKDatabaseQuestion sharedDatabase]getHighScores];
    NSLog(@"Num HighScore %d",[listHighScore count]);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc {
    [_tableView1 release];
    [super dealloc];
}

#pragma TableData Source
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    listHighScore = [[NDKDatabaseQuestion sharedDatabase]getHighScores];
    return [listHighScore count];
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    //NSArray *object=[[NSBundle mainBundle]loadNibNamed:@"NDKEmptyCell" owner:self options:nil];
   // NDKEmptyCell *cell=[[NDKEmptyCell alloc]init];
   // cell=(NDKEmptyCell*)[object objectAtIndex:0];
  //  cell.mainTitle.text=[data objectAtIndex:indexPath.row];
    
   // return cell;
    UITableViewCell *cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:nil];
    listHighScore = [[NDKDatabaseQuestion sharedDatabase]getHighScores];
    NDKHighScore * detail = [listHighScore objectAtIndex:0];
    cell.textLabel.text= detail.username;
    NSString *scoreStr = [NSString stringWithFormat:@"%d", detail.score];

    cell.detailTextLabel.text=scoreStr;
    return cell;

}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 50;
}
@end
