#import "Converter.h"

// Do not change
NSString *KeyPhoneNumber = @"phoneNumber";
NSString *KeyCountry = @"country";

@implementation PNConverter
- (NSDictionary*)converToPhoneNumberNextString:(NSString*)string; {
    
    if ([[string substringWithRange:NSMakeRange(0, 1)] isEqualToString:@"7"]) {
        if (string.length > 1 && [[string substringWithRange:NSMakeRange(1, 1)] isEqualToString:@"7"]) {
               return [self ten_digits_converter:string code:@"7" country:@"KZ"];
           } else {
               return [self ten_digits_converter:string code:@"7" country:@"RU"];
           }
    }
    
    if (string.length < 3) {
         return [self incorrect_number:string];
    }
    
    if ([[string substringWithRange:NSMakeRange(0, 3)] isEqualToString:@"375"]) {
        return [self nine_digits_converter:string code:@"375" country:@"BY"];
    }
    
    if ([[string substringWithRange:NSMakeRange(0, 3)] isEqualToString:@"380"]) {
        return [self nine_digits_converter:string code:@"380" country:@"UA"];
    }
    
    if ([[string substringWithRange:NSMakeRange(0, 3)] isEqualToString:@"992"]) {
        return [self nine_digits_converter:string code:@"992" country:@"TJ"];
    }
    
    if ([[string substringWithRange:NSMakeRange(0, 3)] isEqualToString:@"994"]) {
       return [self nine_digits_converter:string code:@"994" country:@"AZ"];
    }
    
    if ([[string substringWithRange:NSMakeRange(0, 3)] isEqualToString:@"996"]) {
        return [self nine_digits_converter:string code:@"996" country:@"KG"];
    }
    
    if ([[string substringWithRange:NSMakeRange(0, 3)] isEqualToString:@"998"]) {
        return [self nine_digits_converter:string code:@"998" country:@"UZ"];
    }
    
    if ([[string substringWithRange:NSMakeRange(0, 3)] isEqualToString:@"373"]) {
        return [self eight_digits_converter:string code:@"373" country:@"MD"];
    }
    
    if ([[string substringWithRange:NSMakeRange(0, 3)] isEqualToString:@"374"]) {
        return [self eight_digits_converter:string code:@"374" country:@"AM"];
    }
    
    if ([[string substringWithRange:NSMakeRange(0, 3)] isEqualToString:@"993"]) {
        return [self eight_digits_converter:string code:@"993" country:@"TM"];
    }

    if (string.length > 12) {
        return [self more_than_twelve_digits_converter:string];
    }
    
    
    return @{KeyPhoneNumber: @"",
             KeyCountry: @""};
}

- (NSDictionary *)eight_digits_converter:(NSString *)string code:(NSString *)code country:(NSString *)country {
    NSMutableString *resultNumber = [NSMutableString new];
    NSMutableString *resultCountry = [NSMutableString new];
    
    [resultNumber appendFormat:@"+"];
    [resultNumber appendFormat:@"%@", code];
    [resultCountry appendFormat:@"%@", country];
    int i = 3;
    while (i < string.length) {
        NSString* temp = [string substringWithRange:NSMakeRange(i, 1)];
        
        if (i == 3) {
            [resultNumber appendFormat:@" "];
            [resultNumber appendFormat:@"("];
            [resultNumber appendFormat:@"%@", temp];
        }
        if (i == 4) {
            [resultNumber appendFormat:@"%@", temp];
            if (string.length > 5) {
                [resultNumber appendFormat:@")"];
                [resultNumber appendFormat:@" "];
            }
        }
        if (i <= 7 && i > 4) {
            [resultNumber appendFormat:@"%@", temp];
            if (string.length > 8 && i == 7) {
                [resultNumber appendFormat:@"-"];
            }
        }
        if (i <= 10 && i > 7) {
            [resultNumber appendFormat:@"%@", temp];
        }
        i += 1;
    }
    
    
    return @{KeyPhoneNumber: resultNumber,
                KeyCountry: resultCountry};
}

- (NSDictionary *)nine_digits_converter:(NSString *)string code:(NSString *)code country:(NSString *)country {
    NSMutableString *resultNumber = [NSMutableString new];
    NSMutableString *resultCountry = [NSMutableString new];
    
    [resultNumber appendFormat:@"+"];
    [resultNumber appendFormat:@"%@", code];
    [resultCountry appendFormat:@"%@", country];
    int i = 3;
    while (i < string.length) {
        NSString* temp = [string substringWithRange:NSMakeRange(i, 1)];
        
        if (i == 3) {
            [resultNumber appendFormat:@" "];
            [resultNumber appendFormat:@"("];
            [resultNumber appendFormat:@"%@", temp];
        }
        if (i == 4) {
            [resultNumber appendFormat:@"%@", temp];
            if (string.length > 5) {
                [resultNumber appendFormat:@")"];
                [resultNumber appendFormat:@" "];
            }
        }
        if (i <= 7 && i > 4) {
            [resultNumber appendFormat:@"%@", temp];
            if (string.length > 8 && i == 7) {
                [resultNumber appendFormat:@"-"];
            }
        }
        if (i <= 9 && i > 7) {
            [resultNumber appendFormat:@"%@", temp];
            if (string.length > 10 && i == 9) {
                [resultNumber appendFormat:@"-"];
            }
        }
        if (i <= 11 && i > 9) {
            [resultNumber appendFormat:@"%@", temp];
        }
        i += 1;
    }
    
    
    return @{KeyPhoneNumber: resultNumber,
                KeyCountry: resultCountry};
}

- (NSDictionary *)ten_digits_converter:(NSString *)string code:(NSString *)code country:(NSString *)country {
    NSMutableString *resultNumber = [NSMutableString new];
    NSMutableString *resultCountry = [NSMutableString new];
    
    [resultNumber appendFormat:@"+"];
    [resultNumber appendFormat:@"%@", code];
    [resultCountry appendFormat:@"%@", country];
    int i = 1;
    while (i < string.length) {
        NSString* temp = [string substringWithRange:NSMakeRange(i, 1)];
        
        if (i == 1) {
            [resultNumber appendFormat:@" "];
            [resultNumber appendFormat:@"("];
            [resultNumber appendFormat:@"%@", temp];
        }
        if (i <= 3 && i > 1) {
            [resultNumber appendFormat:@"%@", temp];
            if (string.length > 4 && i == 3) {
                [resultNumber appendFormat:@")"];
                [resultNumber appendFormat:@" "];
            }
        }
        if (i <= 6 && i > 3) {
            [resultNumber appendFormat:@"%@", temp];
            if (string.length > 7 && i == 6) {
                [resultNumber appendFormat:@"-"];
            }
        }
        if (i <= 8 && i > 6) {
            [resultNumber appendFormat:@"%@", temp];
            if (string.length > 9 && i == 8) {
                [resultNumber appendFormat:@"-"];
            }
        }
        if (i <= 10 && i > 8) {
            [resultNumber appendFormat:@"%@", temp];
        }
        i += 1;
    }
    
    
    return @{KeyPhoneNumber: resultNumber,
                KeyCountry: resultCountry};
}

- (NSDictionary *)incorrect_number:(NSString *)string {
    NSMutableString *resultNumber = [NSMutableString new];
    
    [resultNumber appendFormat:@"+"];
    [resultNumber appendFormat:@"%@", string];
    return @{KeyPhoneNumber: resultNumber,
                   KeyCountry: @""};
}

- (NSDictionary *)more_than_twelve_digits_converter:(NSString *)string {
    NSMutableString *resultNumber = [NSMutableString new];
    NSString *tmp = [string substringWithRange:NSMakeRange(0, 12)];
    [resultNumber appendFormat:@"+"];
    [resultNumber appendFormat:@"%@", tmp];
    return @{KeyPhoneNumber: resultNumber,
             KeyCountry: @""};
}
@end
