//
//  LocalOAuthClient.m
//  DConnectSDK
//
//  Copyright (c) 2014 NTT DOCOMO,INC.
//  Released under the MIT license
//  http://opensource.org/licenses/mit-license.php
//

#import "LocalOAuthClient.h"


NSString *const PROPERTY_APPLICATION_NAME = @"application_name";

NSString *const PROPERTY_DESCRIPTION = @"description";

NSString *const PROPERTY_SUPPORTED_FLOWS = @"supported_flows";


NSString *const STRING_CLIENT_TYPE_CONFIDENTIAL = @"CONFIDENTIAL";
NSString *const STRING_CLIENT_TYPE_PUBLIC = @"PUBLIC";

@implementation LocalOAuthClientTypeUtil

+ (NSString *) toString: (LocalOAuthClientType)clientType {
    if (clientType == CLIENT_TYPE_CONFIDENTIAL) {
        return STRING_CLIENT_TYPE_CONFIDENTIAL;
    } else if (clientType == CLIENT_TYPE_PUBLIC) {
        return STRING_CLIENT_TYPE_PUBLIC;
    }
    @throw @"Invalid value.(clientType)";
}

+ (LocalOAuthClientType) toValue: (NSString *)clientTypeString {
    if ([clientTypeString isEqual: STRING_CLIENT_TYPE_CONFIDENTIAL]) {
        return CLIENT_TYPE_CONFIDENTIAL;
    } else if ([clientTypeString isEqual: STRING_CLIENT_TYPE_PUBLIC]) {
            return CLIENT_TYPE_PUBLIC;
    }
    @throw @"Invalid value.(clientTypeNumber)";
}

@end


@implementation LocalOAuthClient
@synthesize delegate = _delegate;

- (LocalOAuthPackageInfo *) packageInfo {
	LocalOAuthPackageInfo *packageInfo_ = [_delegate packageInfo];
    return packageInfo_;
}

- (NSString *) clientId {
    NSString *clientId_ = [_delegate clientId];
    return clientId_;
}

- (NSArray *) redirectURIs {
    NSArray *redirectURIs_ = [_delegate redirectURIs];
    return redirectURIs_;
}

- (NSArray *) properties {
    NSArray *properties_ = [_delegate properties];
    return properties_;
}


- (BOOL) isResponseTypeAllowed: (LocalOAuthResponseType)responseType {
    return [_delegate isResponseTypeAllowed: responseType];
}

- (LocalOAuthClientType) clientType {
    return [_delegate clientType];
}
@end