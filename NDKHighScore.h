//
//  NDKHighScore.h
//  AiLaTrieuPhu
//
//  Created by duykien on 8/4/13.
//  Copyright (c) 2013 D&K. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NDKHighScore : NSObject
@property (nonatomic,retain)NSString*username;
@property (nonatomic,assign)int score;
-(id)initWithHighScores:(int)score userName1:(NSString*)username ;
@end
