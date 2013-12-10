//
//  Hasher.m
//  AlgoTests
//
//  Created by Mark Jones on 12/7/13.
//  Copyright (c) 2013 Mark Jones. All rights reserved.
//

#import "Hasher.h"

@implementation Hasher

+(NSInteger)simpleHash:(NSString *)str
{
    NSInteger sum = 0;
    
    for (int i = 0; i < str.length; i++)
    {
        int asciiCode = [str characterAtIndex:i];
        NSLog(@"asciiCode for %@ is %d",[str substringWithRange:NSMakeRange(i, 1)],asciiCode);
        sum += asciiCode;
    }
    
    return sum;
}

+(NSInteger)getTriangleType:(int)a b:(int)b c:(int)c
{
    //check that 2 sides add to be greater than 3rd
    if ((a + b <= c) || (b + c <= a) || (c + a <= b)) {
        return -1;
    }
    
    
    if ((a == b) && (b == c))
    {
        return 0;
    }
    else if (a == b || a == c || b == c)
    {
        return 1;
    }
    else
        return 2;
}

+(void)pythagorean:(int)a b:(int)b c:(int)c
{

    for (int c  = 10; c > 0; c--)
    {
        for (int b = c -1; b > 0; b--)
        {
            int a = (int)sqrt(c*c - b*b);
            if (a >= b)
                break;
            
            if ((a*a + b*b) == (c*c)) {
                NSLog(@"a:%d b:%d c:%d",a,b,c);
            }
        }
    }
    
    
//    if (1 < a < b < c < ) {
//        ;
//    }

}


@end
