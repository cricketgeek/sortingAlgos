//
//  DepthFirstPaths.h
//  AlgoTests
//
//  Created by Mark Jones on 12/9/13.
//  Copyright (c) 2013 Mark Jones. All rights reserved.
//

#import "Graph.h"

@interface DepthFirstPaths : NSObject

@property (nonatomic, strong) Graph *graph;
@property (nonatomic, strong) NSMutableDictionary *marked;
@property (nonatomic, strong) NSMutableDictionary *edgeTo;
@property (nonatomic, copy) NSString *rootVertexKey;

- (BOOL)hasPathTo:(NSString *)vertex;
- (void)findPathToVertex:(NSString *)vertex;

@end
