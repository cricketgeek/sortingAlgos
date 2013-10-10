//
//  TestModel.h
//  AlgoTests
//
//  Created by Mark Jones on 9/29/13.
//  Copyright (c) 2013 Mark Jones. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TestModel : NSObject

@property (nonatomic, copy) NSString *name;

- (NSDictionary *)toDictionary;

@end
