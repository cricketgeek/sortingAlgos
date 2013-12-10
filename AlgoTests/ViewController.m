//
//  ViewController.m
//  AlgoTests
//
//  Created by Mark Jones on 9/20/13.
//  Copyright (c) 2013 Mark Jones. All rights reserved.
//

#import "ViewController.h"

#import "NSString+Sorting.h"
#import "MCJSorter.h"
#import "MCJVanityNumbers.h"
#import "Hasher.h"

#import "TestModel.h"

@interface ViewController ()
@property (nonatomic, strong) NSArray *wordsArray;
@property (nonatomic, strong) NSArray *unsortedArray;
@property (nonatomic, strong) NSDictionary *wordsDictionary;
@property (nonatomic, strong) MCJSorter *sorter;
@end


@implementation ViewController

- (void)awakeFromNib
{
    _wordsArray = @[@"dog",@"map",@"god",@"pam",@"top",@"pot",@"lap",@"pal"];
    _wordsDictionary = [self preProcessWords:_wordsArray];
    
    _sorter = [MCJSorter createSorter];
    
    _unsortedArray = @[@12,@65,@88,@9,@17,@18,@190,@89,@204,@55,@42,@2,@8,@101,@42];
    
    NSString *testString = @"SEATTLE";
    NSLog(@"%@ = %d",testString,[Hasher simpleHash:testString]);
    
}


- (NSDictionary *)preProcessWords:(NSArray *)words
{
    NSMutableDictionary *dict = [NSMutableDictionary dictionaryWithCapacity:words.count];
    
    for (NSString *word in words)
    {
        NSString *sortedWord = [[word sorted] lowercaseString];
        
        if (!dict[sortedWord])
        {
            NSMutableDictionary *subDict = [NSMutableDictionary dictionary];
            subDict[word] = word;
            dict[sortedWord] = subDict;
        }
        else
        {
            if (!dict[sortedWord][word])
            {
                dict[sortedWord][word] = word;
            }
        }
    }
    
    return [dict copy];
}

- (BOOL)isAnagram:(NSString *)word otherWord:(NSString *)otherWord
{
    BOOL isAnagram = NO;
    NSString *sortedWord1 = [[word sorted] lowercaseString];
    NSString *sortedWord2 = [[otherWord sorted] lowercaseString];
    
    if  (self.wordsDictionary[sortedWord1] && self.wordsDictionary[sortedWord2])
    {
        isAnagram = [sortedWord1 isEqualToString:sortedWord2];
    }
    
    
    return isAnagram;
}

- (IBAction)testAnagrams:(id)sender
{
    [self isAnagram:@"top" otherWord:@"Pot"] ? NSLog(@"YES! Anagram!") : NSLog(@"No way dude!");
}

- (IBAction)testVanityNumbers:(id)sender
{
    MCJVanityNumbers *vanity = [[MCJVanityNumbers alloc] init];
    [vanity printVanityPlateForNumbers:@[@4,@9,@0,@5,@2,@2,@5]];
}

- (IBAction)testSorting:(id)sender
{
    
    NSMutableArray *names = [@[@"Greg",@"Anthony",@"William",@"William",@"Hunter",@"Hunter",@"Tucker",@"Hunter",@"Tanner",@"Amanda"] mutableCopy];

    NSMutableArray *models = [NSMutableArray array];
    
    NSMutableArray *objectsForJSON = [NSMutableArray array];
    
    for (NSString *name in names) {
        TestModel *model = [[TestModel alloc] init];
        model.name = name;
        [models addObject:model];
        
        [objectsForJSON addObject:[model toDictionary]];
    }
    
    if (models[0] == models[1])
    {
        NSLog(@"models equal");
    }
    
    
    NSArray *sortedArray = [self.sorter sort:self.unsortedArray];
    for (NSNumber *num in sortedArray) {
        NSLog(@"%@\t",num);
    }
    
    
    
    NSError *aError = nil;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:objectsForJSON options:NSJSONWritingPrettyPrinted error:&aError];
    
    NSLog(@"json is %@",[[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding]);
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

@end
