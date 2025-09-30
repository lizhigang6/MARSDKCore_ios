//
//  MARKeychainUtils.h
//  ADVERT
//
//  Created by 李志刚 on 2022/12/20.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface MARKeychainUtils : NSObject

+ (NSString *)getPasswordForUsername:(NSString *)username
                      andServiceName:(NSString *)serviceName
                               error:(NSError **)error;
+ (BOOL)storeUsername:(NSString *)username
          andPassword:(NSString *)password
       forServiceName:(NSString *)serviceName
       updateExisting:(BOOL)updateExisting
                error:(NSError **)error;
+ (BOOL)deleteItemForUsername:(NSString *)username andServiceName:(NSString *)serviceName error:(NSError **)error;

@end

NS_ASSUME_NONNULL_END
