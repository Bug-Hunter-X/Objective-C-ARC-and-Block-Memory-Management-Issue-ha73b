The solution involves using `__weak` and `__strong` in order to properly manage the lifetime of the referenced object:

```objectivec
@interface MyClass : NSObject
@property (strong, nonatomic) NSString *myString;
@end

@implementation MyClass
- (void)someMethod {
    __weak MyClass *weakSelf = self;
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{ 
        MyClass *strongSelf = weakSelf;
        if (strongSelf) {
            NSLog(@"My string: %@
", strongSelf.myString);
        }
    });
}
@end
```

By declaring `weakSelf` as a weak reference, the block doesn't retain the object.  The inner block creates a strong reference `strongSelf` only if the weak reference is not nil, ensuring the object isn't accessed after deallocation. This safe approach prevents crashes and maintains data integrity.