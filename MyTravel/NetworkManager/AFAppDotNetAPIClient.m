// AFAppDotNetAPIClient.h
//
// Copyright (c) 2012 Mattt Thompson (http://mattt.me/)
// 
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
// 
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
// 
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.

#import "AFAppDotNetAPIClient.h"

// DOTestURL DOBaseURL

static NSString *const AFAppDotNetAPIBaseURLString = @"http://open.qyer.com/" ;

@implementation AFAppDotNetAPIClient

+ (NSString *)getBaseHost {
    return AFAppDotNetAPIBaseURLString;
}

+ (instancetype)sharedClient {
    static AFAppDotNetAPIClient *_sharedClient = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedClient = [[AFAppDotNetAPIClient alloc] initWithBaseURL:[NSURL URLWithString:AFAppDotNetAPIBaseURLString]];
        _sharedClient.securityPolicy = [AFSecurityPolicy policyWithPinningMode:AFSSLPinningModeNone];
//        数据下载完成，数据为JSON
        _sharedClient.responseSerializer = [AFJSONResponseSerializer serializer];
//        数据为XML
//        <NSXMLParser: 0x7f9ef5a4d240>
//        _sharedClient.responseSerializer = [AFHTTPResponseSerializer serializer];
//        数据为PLIST
//        _sharedClient.responseSerializer = [AFPropertyListResponseSerializer serializer];
//        _sharedClient.responseSerializer = [AFXMLDocumentResponseSerializer serializer];
        
        
//        AFHTTPResponseSerializer 返回原生的数据
//        AFJSONResponseSerializer 数组或者是字典
//        AFXMLParserResponseSerializer  NSXMLParser对象
        _sharedClient.responseSerializer.acceptableContentTypes=[NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript",@"text/html",@"text/plain", nil];
    });
    
    return _sharedClient;
}

@end







