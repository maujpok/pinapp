// Autogenerated from Pigeon (v19.0.2), do not edit directly.
// See also: https://pub.dev/packages/pigeon

#import <Foundation/Foundation.h>

@protocol FlutterBinaryMessenger;
@protocol FlutterMessageCodec;
@class FlutterError;
@class FlutterStandardTypedData;

NS_ASSUME_NONNULL_BEGIN

@class CommentModel;

@interface CommentModel : NSObject
/// `init` unavailable to enforce nonnull fields, see the `make` class method.
- (instancetype)init NS_UNAVAILABLE;
+ (instancetype)makeWithPostId:(NSInteger )postId
    id:(NSInteger )id
    name:(NSString *)name
    email:(NSString *)email
    body:(NSString *)body;
@property(nonatomic, assign) NSInteger  postId;
@property(nonatomic, assign) NSInteger  id;
@property(nonatomic, copy) NSString * name;
@property(nonatomic, copy) NSString * email;
@property(nonatomic, copy) NSString * body;
@end

/// The codec used by CommentsApi.
NSObject<FlutterMessageCodec> *CommentsApiGetCodec(void);

@protocol CommentsApi
- (void)fetchCommentsPostId:(NSInteger)postId completion:(void (^)(NSArray<CommentModel *> *_Nullable, FlutterError *_Nullable))completion;
@end

extern void SetUpCommentsApi(id<FlutterBinaryMessenger> binaryMessenger, NSObject<CommentsApi> *_Nullable api);

extern void SetUpCommentsApiWithSuffix(id<FlutterBinaryMessenger> binaryMessenger, NSObject<CommentsApi> *_Nullable api, NSString *messageChannelSuffix);

NS_ASSUME_NONNULL_END