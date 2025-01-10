To fix this, ensure that any changes to the `NSManagedObjectContext` are saved on the main thread. You can achieve this by using `performBlockAndWait:` or using a background context in conjunction with a parent context on the main thread.  Here's an example using `performBlockAndWait:`:

```objectivec
// ... fetch and update objects in background thread ...

[managedObjectContext performBlockAndWait:^{ 
    NSError *error = nil;
    if (![managedObjectContext save:&error]) {
        NSLog(@