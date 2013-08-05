//
//  NDKQuestionObject.h
//  AiLaTrieuPhu
//
//  Created by duykien on 8/4/13.
//  Copyright (c) 2013 D&K. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NDKQuestionObject : NSObject
@property (nonatomic,assign)int*position;
@property (nonatomic,copy)NSString*question;
@property (nonatomic,copy)NSString*answertrue;
@property (nonatomic,copy)NSString*answerS1;
@property (nonatomic,copy)NSString*answerS2;
@property (nonatomic,copy)NSString*answerS3;
@property (nonatomic,copy)NSString *difficult;

-(id) initWithPosition:(int)position question:(NSString*)question answerTrue:(NSString*)answerTrue answerS1:(NSString*)answer1 answer2:(NSString*)answerS2 answer3:(NSString*)answerS3 difficult:(NSString*)difficult;
@end
