//
//  LCWechatShare.m
//  Pods
//
//  Created by MengLingChao on 2018/8/13.
//

#import "LCWechatShare.h"
#import "AFNetworking.h"

static LCWechatShare *Instance;
static dispatch_once_t OnceToken;

@interface LCWechatShare ()

@end

@implementation LCWechatShare

+ (instancetype)sharedInstance {
    dispatch_once(&OnceToken, ^{
        Instance = [[self alloc] init];
    });
    return Instance;
}
- (instancetype)init {
    self = [super init];
    if (self) {
        [WXApi registerApp:LCWechatAppKey];
    }
    return self;
}
+ (void)login {
    [[self sharedInstance]login];
}
- (void)login {
    SendAuthReq* req = [[SendAuthReq alloc] init];
    req.scope = @"snsapi_userinfo" ;
    //    req.state = @"xxx";
    //    req.openID = @"0c806938e2413ce73eef92cc3";
    UIViewController *rootViewController = [UIApplication sharedApplication].delegate.window.rootViewController;
    [WXApi sendAuthReq:req viewController:rootViewController delegate:self];
}
#pragma mark - WXApiDelegate
-(void) onResp:(BaseResp*)resp {
    if([resp isKindOfClass:[SendMessageToWXResp class]]){
        //        NSString *strTitle = [NSString stringWithFormat:@"发送媒体消息结果"];
        //        NSString *strMsg = [NSString stringWithFormat:@"errcode:%d", resp.errCode];
        
    } else if ([resp isKindOfClass:[SendAuthResp class]]){
        SendAuthResp *temp = (SendAuthResp*)resp;
        if (!temp.code.length) {
            return;
        }
        NSDictionary *dic = @{@"code":temp.code,
                              @"appid": LCWechatAppKey,
                              @"secret":@"88668cdbcaffc20f706954482d439ab6",
                              @"grant_type":@"authorization_code"};
        
//        MKNetworkOperation *op = [self operationWithPath:@"sns/oauth2/access_token" params:dic httpMethod:@"GET" ssl:YES];
//        _engine = [[WechaEngine alloc]init];
//        MKNetworkOperation *op = [_engine getAccessTokenWithCode:temp.code resultBlock:^(NSDictionary *idFlag) {
//            MKNetworkOperation *op = [_engine getUserinfoWithAccessToken:idFlag[@"access_token"] openid:idFlag[@"openid"] resultBlock:^(NSDictionary *infoDic) {
//                User *user = [User new];
//                user.username = infoDic[@"openid"];
//                user.nickname = infoDic[@"nickname"];
//                user.soureType = UserSourceTypeWeichat;
//                if (_resultBlock) {
//                    _resultBlock(user.username.length && user.nickname.length);
//                }
//            }];
//            [_engine enqueueOperation:op];
//        }];
//        [_engine enqueueOperation:op];
    } else if ([resp isKindOfClass:[AddCardToWXCardPackageResp class]]){
        //        AddCardToWXCardPackageResp* temp = (AddCardToWXCardPackageResp*)resp;
        //        NSMutableString* cardStr = [[NSMutableString alloc] init];
        //        for (WXCardItem* cardItem in temp.cardAry) {
        //            [cardStr appendString:[NSString stringWithFormat:@"cardid:%@ cardext:%@ cardstate:%lu\n",cardItem.cardId,cardItem.extMsg,cardItem.cardState]];
        //        }
    }
}

@end
