//
//  LCQQShare.m
//  Pods
//
//  Created by MengLingChao on 2018/8/13.
//

#import "LCQQShare.h"
#import <TencentOpenAPI/TencentOAuth.h>

static LCQQShare *Instance;
static dispatch_once_t OnceToken;

@interface LCQQShare()<TencentSessionDelegate>

@property (nonatomic, strong)TencentOAuth *tencentOAuth;

@property (nonatomic, strong)NSArray *permissions;

@end

@implementation LCQQShare

+ (instancetype)sharedInstance {
    dispatch_once(&OnceToken, ^{
        Instance = [[self alloc] init];
    });
    return Instance;
}
- (instancetype)init {
    self = [super init];
    if (self) {
        _tencentOAuth = [[TencentOAuth alloc] initWithAppId:LCQQAppKey
                                                  andDelegate:self];
        NSString *cachedToken = [_tencentOAuth getCachedToken];
        NSString *cachedOpenID = [_tencentOAuth getCachedOpenID];
        NSDate *cachedExpirationDate = [_tencentOAuth getCachedExpirationDate];
        BOOL isCachedTokenValid = [_tencentOAuth isCachedTokenValid];
    }
    return self;
}
#pragma mark -
- (void)login {
    BOOL isCachedTokenValid = [_tencentOAuth isCachedTokenValid];
    if (isCachedTokenValid) {
        return;
    }
    _permissions = @[kOPEN_PERMISSION_GET_USER_INFO,
                     kOPEN_PERMISSION_GET_SIMPLE_USER_INFO,
                     kOPEN_PERMISSION_ADD_ALBUM,
                     //                           kOPEN_PERMISSION_ADD_IDOL,
                     kOPEN_PERMISSION_ADD_ONE_BLOG,
                     //                           kOPEN_PERMISSION_ADD_PIC_T,
                     kOPEN_PERMISSION_ADD_SHARE,
                     kOPEN_PERMISSION_ADD_TOPIC,
                     kOPEN_PERMISSION_CHECK_PAGE_FANS,
                     //                           kOPEN_PERMISSION_DEL_IDOL,
                     //                           kOPEN_PERMISSION_DEL_T,
                     //                           kOPEN_PERMISSION_GET_FANSLIST,
                     //                           kOPEN_PERMISSION_GET_IDOLLIST,
                     kOPEN_PERMISSION_GET_INFO,
                     kOPEN_PERMISSION_GET_OTHER_INFO,
                     //                           kOPEN_PERMISSION_GET_REPOST_LIST,
                     kOPEN_PERMISSION_LIST_ALBUM,
                     kOPEN_PERMISSION_UPLOAD_PIC,
                     kOPEN_PERMISSION_GET_VIP_INFO,
                     kOPEN_PERMISSION_GET_VIP_RICH_INFO,
                     //                           kOPEN_PERMISSION_GET_INTIMATE_FRIENDS_WEIBO,
                     //                           kOPEN_PERMISSION_MATCH_NICK_TIPS_WEIBO
                     ];
    [self.tencentOAuth authorize:self.permissions inSafari:NO];
}
#pragma mark - LCShareProtocol
+ (void)login {
    [[self sharedInstance]login];
}
#pragma mark - TencentSessionDelegate
- (void)tencentDidLogin {
    // 登录成功
    //_labelTitle.text = @"登录完成";
    if (_tencentOAuth.accessToken.length){
//        User *user = [User new];
//        user.username = _tencentOAuth.openId;
//        user.accessToken = _tencentOAuth.accessToken;
        _tencentOAuth.expirationDate;
        [_tencentOAuth getUserInfo];
    }else{
//        if (_resultBlock) {
//            _resultBlock(NO);
//        }
    }
}
- (void)getUserInfoResponse:(APIResponse*) response {
    if (response.retCode == URLREQUEST_SUCCEED) {
//        User *user = [User new];
//        user.nickname = response.jsonResponse[@"nickname"];
//        user.soureType = UserSourceTypeQQ;
//        if (_resultBlock) {
//            _resultBlock(YES);
//        }
    } else {
//        if (_resultBlock) {
//            _resultBlock(NO);
//        }
    }
}
- (void)tencentDidNotLogin:(BOOL)cancelled {
    if (cancelled){
        //        _labelTitle.text = @"用户取消登录";
    }
    else {
        //        _labelTitle.text = @"登录失败";
    }
}
-(void)tencentDidNotNetWork{
}

@end
