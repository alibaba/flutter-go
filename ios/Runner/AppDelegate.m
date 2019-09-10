#include "AppDelegate.h"
#include "GeneratedPluginRegistrant.h"
#include "FlutterJPushPlugin.h"

@import Firebase;//增加 firebase 支持

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application
    didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {

    [FIRApp configure];//增加 firebase 支持

  [self startupJPush:launchOptions appKey:@"62eb07d227d1f11dd7fa6239" channel:@"jpush" isProduction:FALSE];

  [GeneratedPluginRegistrant registerWithRegistry:self];
  // Override point for customization after application launch.
    [NSThread sleepForTimeInterval:2];
  return [super application:application didFinishLaunchingWithOptions:launchOptions];
}

@end
