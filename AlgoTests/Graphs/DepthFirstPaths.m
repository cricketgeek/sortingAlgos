//
//  DepthFirstPaths.m
//  AlgoTests
//
//  Created by Mark Jones on 12/9/13.
//  Copyright (c) 2013 Mark Jones. All rights reserved.
//

#import "DepthFirstPaths.h"

@implementation DepthFirstPaths

- (id)initWithVertexRoot:(NSString *)rootKey graph:(Graph *)graph
{
    self = [super init];
    if (self) {
        self.graph = graph;
        self.rootVertexKey = rootKey;
        [self dfsForVertex:self.rootVertexKey];
    }
    return self;
}

- (void)dfsForVertex:(NSString *)vertex
{
    
    [self.marked setObject:[NSNumber numberWithBool:YES] forKey:vertex];
    
    NSSet *adjVertices = [self.graph adjacencySetForVertex:vertex];
    
    for (NSString *vertexKey in adjVertices)
    {
        if (![[self.marked objectForKey:vertexKey] boolValue])
        {
            [self dfsForVertex:vertexKey];
            [self.edgeTo setObject:vertex forKey:vertexKey];
        }
    }
}

- (BOOL)hasPathTo:(NSString *)vertex
{
    return [[self.marked objectForKey:vertex] boolValue];
}

- (void)findPathToVertex:(NSString *)vertex
{
    NSLog(@"Finding path to vertex %@ from %@\n",vertex,self.rootVertexKey);
    [self pathToVertex:vertex];
    NSLog(@"\n");
}

- (void)pathToVertex:(NSString *)vertex
{
    if (![self hasPathTo:vertex])
    {
        NSLog(@"No path for vertex %@ from %@",vertex,self.rootVertexKey);
    }

    NSString *nextVertex = nil;
    if (![vertex isEqualToString:self.rootVertexKey])
    {
        nextVertex = [self.edgeTo objectForKey:vertex];
        if (nextVertex)
        {
            [self pathToVertex:nextVertex];
        }
    }

    NSLog(@" to %@",vertex);
}

@end
