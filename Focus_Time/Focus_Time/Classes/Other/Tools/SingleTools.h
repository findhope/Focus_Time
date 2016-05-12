//
//  SingleTools.h
//  Focus_Time
//
//  Created by MitnickKevin on 16/4/21.
//  Copyright © 2016年 SWUST. All rights reserved.
//

#define SingleInterface(name) +(instancetype)share##name

#if __has_feature(objc_arc)
// ARC
#define SingleImplementation(name)  +(instancetype)share##name \
{ \
return [[self alloc] init]; \
} \
+ (instancetype)allocWithZone:(struct _NSZone *)zone \
{ \
static id instance; \
static dispatch_once_t onceToken; \
dispatch_once(&onceToken, ^{ \
instance = [super allocWithZone:zone]; \
}); \
return instance; \
} \
- (id)copyWithZone:(NSZone *)zone \
{ \
return self; \
} \
- (id)mutableCopyWithZone:(NSZone *)zone \
{ \
return self; \
}
#else
// MRC
#define SingleImplementation(name)  +(instancetype)share##name \
{ \
return [[self alloc] init]; \
} \
+ (instancetype)allocWithZone:(struct _NSZone *)zone \
{ \
static id instance; \
static dispatch_once_t onceToken; \
dispatch_once(&onceToken, ^{ \
instance = [super allocWithZone:zone]; \
}); \
return instance; \
} \
- (id)copyWithZone:(NSZone *)zone \
{ \
return self; \
} \
- (id)mutableCopyWithZone:(NSZone *)zone \
{ \
return self; \
} \
- (oneway void)release \
{} \
- (instancetype)retain \
{ \
return self; \
} \
- (NSUInteger)retainCount \
{ \
return MAXFLOAT; \
}
#endif
