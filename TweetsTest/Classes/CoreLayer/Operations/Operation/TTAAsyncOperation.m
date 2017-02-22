//
//  TTAAsyncOperation.m
//  TweetsTest
//
//  Created by a.protko on 16.02.17.
//  Copyright © 2017 a.protko. All rights reserved.
//

#import "TTAAsyncOperation.h"

@interface TTAAsyncOperation ()

@property (nonatomic, assign, getter=isExecuting) BOOL executing;
@property (nonatomic, assign, getter=isFinished) BOOL finished;

@end

@implementation TTAAsyncOperation

@synthesize executing = _executing, finished = _finished;

- (instancetype)init {
    self = [super init];
    if (self) {
        _executing = NO;
        _finished = NO;
    }
    return self;
}

- (BOOL)isAsynchronous {
    return YES;
}

- (void)setExecuting:(BOOL)value
{
    if (!!_executing != !!value) {
        [self willChangeValueForKey:@"isExecuting"];
        _executing = value;
        [self didChangeValueForKey:@"isExecuting"];
    }
}

- (void)setFinished:(BOOL)value
{
    if (!!_finished != !!value) {
        [self willChangeValueForKey:@"isFinished"];
        _finished = value;
        [self didChangeValueForKey:@"isFinished"];
    }
}

#pragma mark - Приватные методы

- (void)start {
    if (self.isCancelled)
    {
        self.finished = YES;
        return;
    }
    
    self.executing = YES;
    [self main];
    // [NSThread detachNewThreadSelector:@selector(main) toTarget:self withObject:nil];
}

- (void)main {
    [NSException raise:NSInternalInconsistencyException
                format:@"Метод не реализован."];
}

- (void)complete {
    self.executing = NO;
    self.finished = YES;
}


@end
