//
//  AppInfoModel.h
//  KIMREE
//
//  Created by JIRUI on 14-4-16.
//  Copyright (c) 2014年 ___FULLUSERNAME___. All rights reserved.
//

#import "JRModel.h"

@interface AppInfoModel : JRModel
@property(nonatomic,strong) NSString *appVer;
@property(nonatomic,strong) NSString *forwardexFlag;
@property(nonatomic,strong) NSString *standardexFlag;
@property(nonatomic,strong) NSString *infolistFlag;
@property(nonatomic,strong) NSNumber *updateFlag;
@property(nonatomic,strong) NSString *updateText;
@property(nonatomic,strong) NSString *updateUrl;
@property(nonatomic,strong) NSString *rateUrl;
@property(nonatomic,strong) NSString *qqGrounp;
@end
