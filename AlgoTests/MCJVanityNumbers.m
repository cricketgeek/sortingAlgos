//
//  MCJVanityNumbers.m
//  AlgoTests
//
//  Created by Mark Jones on 10/9/13.
//  Copyright (c) 2013 Mark Jones. All rights reserved.
//

#import "MCJVanityNumbers.h"

@interface MCJVanityNumbers ()

@property (nonatomic, strong) NSMutableDictionary *numberLookup;

@end

@implementation MCJVanityNumbers

- (void)buildLookup
{
    self.numberLookup = [NSMutableDictionary dictionaryWithCapacity:10];
    self.numberLookup[@"0"] = @[@"0"];
    self.numberLookup[@"1"] = @[@"1"];
    self.numberLookup[@"2"] = @[@"A",@"B",@"C"];
    self.numberLookup[@"3"] = @[@"D",@"E",@"F"];
    self.numberLookup[@"4"] = @[@"G",@"H",@"I"];
    self.numberLookup[@"5"] = @[@"J",@"K",@"L"];
    self.numberLookup[@"6"] = @[@"M",@"N",@"O"];
    self.numberLookup[@"7"] = @[@"P",@"R",@"S"];
    self.numberLookup[@"8"] = @[@"T",@"U",@"V"];
    self.numberLookup[@"9"] = @[@"W",@"X",@"Y",@"Z"];
    
}

- (id)init
{
    self = [super init];
    if (self) {
        [self buildLookup];
    }
    return self;
}

- (NSString *)getCharKeyFor:(NSNumber *)lookup index:(NSInteger)index
{
    NSArray *keys = self.numberLookup[[NSString stringWithFormat:@"%@",lookup]];
    if (keys.count)
    {
        return (NSString *)keys[index];
    }
    else
        return nil;
}

- (void)printVanityPlateForNumbers:(NSArray *)phoneNumber
{
    NSMutableArray *result = [NSMutableArray arrayWithCapacity:phoneNumber.count];
    [self getNextCombination:phoneNumber currentDigit:0 result:result];
    
}

- (void)getNextCombination:(NSArray *)phoneNumber currentDigit:(NSInteger)currentDigit result:(NSMutableArray *)result
{
    
    //base case
    if (currentDigit == phoneNumber.count) {
        NSLog(@"%@\n",[result componentsJoinedByString:@""]);
        return;
    }
    
    NSArray *keys = self.numberLookup[[NSString stringWithFormat:@"%@",phoneNumber[currentDigit]]];
    NSInteger loopCount = keys.count;
    
    for (int i = 0; i < loopCount; i++) {
        NSString *nextKeyValue = [self getCharKeyFor:phoneNumber[currentDigit] index:i];
        
        if (nextKeyValue) {
            result[currentDigit] = nextKeyValue;
        }

        [self getNextCombination:phoneNumber currentDigit:(currentDigit + 1) result:result];
    }
}

@end
