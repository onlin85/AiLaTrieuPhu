//
//  NDKQuestionObject.m
//  AiLaTrieuPhu
//
//  Created by duykien on 8/4/13.
//  Copyright (c) 2013 D&K. All rights reserved.
//

#import "NDKQuestionObject.h"

@implementation NDKQuestionObject

-(void)dealloc{
    self.position=nil;
    self.difficult=nil;
    self.answerS1=nil;
    self.answerS2 = nil;
    self.answerS3=nil;
    self.answertrue=nil;
    [super dealloc];
}
-(id)initWithPosition:(int)position question:(NSString *)question answerTrue:(NSString *)answerTrue answerS1:(NSString *)answer1 answer2:(NSString *)answerS2 answer3:(NSString *)answerS3 difficult:(NSString *)difficult{
    self=[super init];
    if(self){
        self.position = &(position);
        self.question=question;
        self.answertrue=answerTrue;
        self.answerS1=answer1;
        self.answerS2=answerS2;
        self.answerS3=answerS3;
        self.difficult=difficult;
    }
    return self;
}

@end
