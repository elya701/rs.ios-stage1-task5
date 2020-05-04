#import <Foundation/Foundation.h>

extern NSString *KeyPhoneNumber;
extern NSString *KeyCountry;

@interface PNConverter : NSObject
- (NSDictionary*)converToPhoneNumberNextString:(NSString*)string;
- (NSDictionary*)eight_digits_converter:(NSString*)string code:(NSString*)code country:(NSString*)country;
- (NSDictionary*)nine_digits_converter:(NSString*)string code:(NSString*)code country:(NSString*)country;
- (NSDictionary*)ten_digits_converter:(NSString*)string code:(NSString*)code country:(NSString*)country;
- (NSDictionary*)more_than_twelve_digits_converter:(NSString*)string;
- (NSDictionary*)incorrect_number:(NSString*)string;
@end


