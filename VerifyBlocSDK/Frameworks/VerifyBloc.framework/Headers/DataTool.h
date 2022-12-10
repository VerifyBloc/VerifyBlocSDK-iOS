//
//  NSData_SHA1.h
//  SwiftyRSA
//
//  Created by Paul Wilkinson on 19/04/2016.
//  Copyright © 2016 Scoop. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DataTool : NSObject

+ (nonnull NSData*)SwiftyRSASHA1:(NSData *)data;
+ (nonnull NSData*)SwiftyRSASHA224:(NSData *)data;
+ (nonnull NSData*)SwiftyRSASHA256:(NSData *)data;
+ (nonnull NSData*)SwiftyRSASHA384:(NSData *)data;
+ (nonnull NSData*)SwiftyRSASHA512:(NSData *)data;

@end
