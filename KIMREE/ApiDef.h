//
//  ApiDef.h
//  Smoking
//
//  Created by JIRUI on 14-4-1.
//  Copyright (c) 2014年 ___FULLUSERNAME___. All rights reserved.
//

#ifndef haitaotong_ApiDef_h
#define haitaotong_ApiDef_h

// 服务器地址
//#define API_SERVER_URL @"http://42.121.59.189/api" //v1.8
#define API_SERVER_URL @"http://httapi.hai0.com/" //v2.0
// 接口版本
#define API_VER 3
//
// APP
//
// 注册，第一次打开App客户端，请求用户uid
#define API_CMD_APP_REGISTER @"register"
// 获取基本信息
#define API_CMD_APP_INFO @"get.baseinfo"
// 上传token
#define API_CMD_APP_UPLOAD_TOKEN @"report.pushid"
// 意见反馈
#define API_CMD_APP_FEEDBACK @"add.feedback"
//
// 快递跟踪模块
//
// 新建运单，获取orderId
#define API_CMD_ORDER_CREATE @"order.create"
// 更新运单
#define API_CMD_ORDER_UPDATE @"order.update"
// 删除运单
#define API_CMD_ORDER_DELETE @"order.delete"
// 运单列表
#define API_CMD_ORDER_LIST @"order.list"
// 运单详情
#define API_CMD_ORDER_DETAIL @"order.detail"
// 提交评分
#define API_CMD_RATE_SCORE @"rate.score"
// 拉取评分
#define API_CMD_RATE_DETAIL @"rate.detail"
// 手动设置运单完成
#define API_CMD_ORDER_SET_COMPLETE @"order.complete"
//
// 海淘历程
//
#define API_CMD_HISTORY_INFO @"history.tj_detail"
#define API_CMD_HISTORY_LIST @"history.list"
#define API_CMD_HISTORY_DETAIL @"history.detail"
#define API_CMD_HISTORY_DELETE @"history.delete"
#define API_CMD_HISTORY_ORDER_LIST @"history.order_list"
#define API_CMD_HISTORY_UPDATE @"history.update"
#define API_CMD_MERCHANT_SEARCH @"merchant.list"
#define API_CMD_CURRENCY_LIST @"money.list"
//
// 转运大全
//
// 快递公司列表
#define API_CMD_EXPRESS_LIST @"ex.list"
// 推荐快递公司列
#define API_CMD_RECOMMEND_EXPRESS_LIST @"ex.list"
// 查询转运公司列表
#define API_CMD_EXPRESS_FORWARDEX_LIST @"query.forwardex.list"
// 查询国内、国外快递列表
#define API_CMD_EXPRESS_STANDARDEX_LIST @"query.standardex.list"
// 智能匹配
#define API_CMD_EXPRESS_MATCH_REGEX @"express.match_regex"
//
// 更多
//
// 获取广告信息
#define API_CMD_ADVERT_LIST @"get.ad"
// 获取优惠商品列表
#define API_CMD_GOODS_LIST @"goods.list"
// 获取用户收藏的商品列表
#define API_CMD_GOODS_LIST_COLLECTED @"my.collectlist"
// 商品详情
#define API_CMD_GOODS_DETAIL @"goods.detail"
// 商品更新检测
#define API_CMD_GOODS_UPDATECOUNT @"goods.updatecount"
// 收藏商品
#define API_CMD_GOODS_COLLECT @"goods.collect"
// 取消收藏商品
#define API_CMD_GOODS_UNCOLLECT @"goods.uncollect"
// 转运优惠
#define API_CMD_COUPON_LIST @"expromot.list"
// 转运优惠更新检测
#define API_CMD_COUPON_UPDATECOUNT @"expromot.updatecount"
// 用户使用第三方账号登录
#define API_CMD_USER_CHECKTOKEN @"user.checktoken"
// 用户使用海淘通账号登录
#define API_CMD_USER_LOGIN @"user.login"
// 完善用户信息
#define API_CMD_USER_COMPLETE @"user.complete"
// 用户退出登录
#define API_CMD_USER_LOGOUT @"user.logout"
// 用户注册海淘通账号
#define API_CMD_USER_REGISTER @"user.register"
// 获取用户资料
#define API_CMD_USER_INFO @"user.info"

#endif




















