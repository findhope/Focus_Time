//
//  ZHYGroupItem.h
//  Focus_Time
//
//  Created by MitnickKevin on 16/4/13.
//  Copyright © 2016年 SWUST. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZHYGroupItem : NSObject

/** items */
@property (strong, nonatomic) NSArray *items;
/** headerString */
@property (strong, nonatomic) NSString *headerString;
/** footerString */
@property (strong, nonatomic) NSString *footerString;

+ (instancetype)groupWithItems:(NSArray *)items;

@end
