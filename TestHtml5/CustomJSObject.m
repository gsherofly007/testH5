

#import "CustomJSObject.h"
@interface CustomJSObject()
/**
 *  成功的block
 **/
@property (nonatomic,copy) JSObjectBlock successBlock;

/**
 *  失败的block
 **/
@property (nonatomic,copy) JSObjectBlock failBlock;


/**
 *  操作数组
 **/
@property (nonatomic,strong) NSMutableArray *actionsArray;



@end

@implementation CustomJSObject
- (id)initWithSuccessCallback:(JSObjectBlock)success faileCallback:(JSObjectBlock)fail
{
    self = [super init];
    
    if (self) {
        
        self.successBlock = success;
        self.failBlock = fail;
        self.actionsArray = [NSMutableArray array];
    }
    
    return self;
}
- (void)addToTimerAction:(NSString *)action {
    
    [self.actionsArray addObject:action];
    
    __block NSInteger seconds = 0;
    dispatch_queue_t queue = dispatch_get_main_queue();
    __block dispatch_source_t timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, queue);
    dispatch_time_t start = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0 * NSEC_PER_SEC));
    uint64_t interval = (uint64_t)(1 * NSEC_PER_SEC);
    dispatch_source_set_timer(timer, start, interval, 0);
    dispatch_source_set_event_handler(timer, ^{
        seconds++;
        if (seconds == 1) {
            dispatch_cancel(timer);
            [self.actionsArray removeObject:action];
        }
    });
    // 启动定时器
    dispatch_resume(timer);
}

- (BOOL)isRuningInActionsArray:(NSString *)action {
    
    return [self.actionsArray containsObject:action];
}


-(void)helloWQL
{
    if (![self isRuningInActionsArray:@"helloWQL"]) {
        [self addToTimerAction:@"helloWQL"];
        
        dispatch_async(dispatch_get_main_queue(), ^{
           
            if (self.successBlock) {
                self.successBlock(@{@"helloWQL":@""});
            }
            
        });
    }
}

- (void)sendValueFromHtmlToOCWithValue:(NSString*)value
{
    if (![self isRuningInActionsArray:@"sendValueFromHtmlToOCWithValue"]) {
        [self addToTimerAction:@"sendValueFromHtmlToOCWithValue"];
        
        dispatch_async(dispatch_get_main_queue(), ^{
            
            if (self.successBlock) {
                NSMutableDictionary *valueDic = [NSMutableDictionary dictionary];
                [valueDic setValue:value forKey:@"valueOne"];
                self.successBlock(@{@"sendValueFromHtmlToOCWithValue":valueDic});
            }
            
        });
    }

}

- (void)sendValueFromHtmlToOCWithValue:(NSString*)value WithValueTwo:(NSString*)valueTwo
{
    if (![self isRuningInActionsArray:@"sendValueFromHtmlToOCWithValuewithValueTwo"]) {
        [self addToTimerAction:@"sendValueFromHtmlToOCWithValuewithValueTwo"];
        
        dispatch_async(dispatch_get_main_queue(), ^{
            
            if (self.successBlock) {
                NSMutableDictionary *valueDic = [NSMutableDictionary dictionary];
                [valueDic setValue:value forKey:@"valueOne"];
                [valueDic setValue:valueTwo forKey:@"valueTwo"];
                self.successBlock(@{@"sendValueFromHtmlToOCWithValueWithValueTwo":valueDic});
            }
            
        });
    }
}
//从html传值给OC
- (void)login:(NSString*)value{
    if (![self isRuningInActionsArray:@"login"]) {
         [self addToTimerAction:@"login"];
         
         dispatch_async(dispatch_get_main_queue(), ^{
             
             if (self.successBlock) {
                 NSMutableDictionary *valueDic = [NSMutableDictionary dictionary];
                 [valueDic setValue:value forKey:@"valueOne"];
//                 [valueDic setValue:valueTwo forKey:@"valueTwo"];
                 self.successBlock(@{@"login":valueDic});
             }
             
         });
     }
}
//从html传值给OC
- (void)login:(NSString*)value WithValueTwo:(NSString*)valueTwo{
    if (![self isRuningInActionsArray:@"login"]) {
         [self addToTimerAction:@"login"];
         
         dispatch_async(dispatch_get_main_queue(), ^{
             
             if (self.successBlock) {
                 NSMutableDictionary *valueDic = [NSMutableDictionary dictionary];
                 [valueDic setValue:value forKey:@"valueOne"];
                 [valueDic setValue:valueTwo forKey:@"valueTwo"];
                 self.successBlock(@{@"login":valueDic});
             }
             
         });
     }
}
- (void)sendValueToHtml
{
    if (![self isRuningInActionsArray:@"sendValueToHtml"]) {
        [self addToTimerAction:@"sendValueToHtml"];
        
        dispatch_async(dispatch_get_main_queue(), ^{
            
            if (self.successBlock) {
                self.successBlock(@{@"sendValueToHtml":@""});
            }
            
        });
    }

}
- (void)deviceInfo
{
    if (![self isRuningInActionsArray:@"deviceInfo"]) {
        [self addToTimerAction:@"deviceInfo"];
        
        dispatch_async(dispatch_get_main_queue(), ^{
            
            if (self.successBlock) {
                self.successBlock(@{@"deviceInfo":@""});
            }
            
        });
    }

}


@end
