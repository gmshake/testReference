//
//  main.m
//  testReference
//
//  Created by Zhenlei Huang on 5/11/13.
//  Copyright (c) 2013 Zhenlei Huang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TENode.h"

NSArray* makeNodes(int count);
int getRand(int base);

int main(int argc, const char * argv[])
{

    srandomdev();

    while (true) {
        @autoreleasepool {
            NSArray *arr = [makeNodes(1000000) retain];
            sleep(1);
            // insert code here...
            [arr release];
            NSLog(@"released after 1 second!");

        }
    }
    return 0;
}

NSArray* makeNodes(int count) {
    NSMutableArray *arr = [NSMutableArray arrayWithCapacity:count];

    for (int i = 0; i < count; i++) {
        [arr setObject:[[[TENode alloc] init] autorelease] atIndexedSubscript:i];
    }

    for (id o in arr) {
        ((TENode *)o).left = [arr objectAtIndex:getRand(count)];
        ((TENode *)o).right = [arr objectAtIndex:getRand(count)];
    }

    return arr;
}

int getRand(int base) {
    return random() % base;
}