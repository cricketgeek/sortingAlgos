//
//  Graph.h
//  AlgoTests
//
//  Created by Mark Jones on 12/5/13.
//  Copyright (c) 2013 Mark Jones. All rights reserved.
//

@interface Graph : NSObject

@property (nonatomic, assign) NSInteger vertexCount;
@property (nonatomic, assign) NSInteger edgeCount;

-(NSSet *)adjacencySetForVertex:(NSString *)vertex;
-(void)addEdgeFrom:(NSString *)vertex toVertex:(NSString *)otherVertex;

@end
