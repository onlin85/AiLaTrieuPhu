//
//  NDKHighScore.m
//  AiLaTrieuPhu
//
//  Created by duykien on 8/4/13.
//  Copyright (c) 2013 D&K. All rights reserved.
//

#import "NDKHighScore.h"

@implementation NDKHighScore

-(void)dealloc{
    self.username=nil;
    [super dealloc];
}
-(id)initWithHighScores:(int)score userName1:(NSString *)username{
    self=[super init];
    if(self){
        self.username=username;
        self.score=score;
    }
    return self;
}
@end


