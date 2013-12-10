//
//  Graph.m
//  AlgoTests
//
//  Created by Mark Jones on 12/5/13.
//  Copyright (c) 2013 Mark Jones. All rights reserved.
//
//  "a" -> "b","c"
//  "b" -> "a"
//  "c" -> "a"
//


#import "Graph.h"

@interface Graph ()

@property (nonatomic, strong) NSMutableDictionary *adjacencyList;

@end

@implementation Graph

- (id)init
{
    self = [super init];
    if (self) {
        _adjacencyList = [NSMutableDictionary dictionary];
    }
    return self;
}

-(NSSet *)adjacencySetForVertex:(NSString *)vertex
{
    return [self.adjacencyList objectForKey:vertex];
}

- (void)incrementVertex
{
    self.vertexCount++;
}

- (void)incrementEdges
{
    self.edgeCount++;
}

- (NSMutableSet *)findOrCreateVertex:(NSString *)vertex
{
    NSMutableSet *set = [self.adjacencyList objectForKey:vertex];
    if (!set) {
        set = [NSMutableSet set];
        [self.adjacencyList setObject:set forKey:vertex];
        [self incrementVertex];
    }
    return set;
}


-(void)addEdgeFrom:(NSString *)vertex toVertex:(NSString *)otherVertex
{
    NSMutableSet *set1 = [self findOrCreateVertex:vertex];
    NSMutableSet *set2 = [self findOrCreateVertex:otherVertex];

    if (![set1 containsObject:otherVertex])
    {
        [set1 addObject:otherVertex];
        [set2 addObject:vertex];
        [self incrementEdges];
    }
}


@end
