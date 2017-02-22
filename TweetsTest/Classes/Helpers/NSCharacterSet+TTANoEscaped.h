//
//  NSCharacterSet+TTANoEscaped.h
//  TweetsTest
//
//  Created by a.protko on 11.02.17.
//  Copyright © 2017 a.protko. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSCharacterSet (TTANoEscaped)

/**
 Возврщает множество символов, не требующих эскейпинга в запросе к Twitter
 
 @brief https://dev.twitter.com/oauth/overview/percent-encoding-parameters

 @return множество символов, не требующих эскейпинга
 */
+ (NSCharacterSet *)tta_noEscapedCharacterSet;

@end
