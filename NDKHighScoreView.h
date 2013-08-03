//
//  NDKHighScoreView.h
//  AiLaTrieuPhu_KienND3_V01
//
//  Created by duykien on 7/30/13.
//  Copyright (c) 2013 D&K. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NDKEmptyCell.h"
@interface NDKHighScoreView : UIViewController<UITableViewDataSource, UITableViewDelegate>{
    NDKEmptyCell *emptyCell;
}
@property (retain, nonatomic) IBOutlet UITableView *tableView1;

@end
