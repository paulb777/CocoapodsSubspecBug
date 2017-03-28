# CocoapodsSubspecBug

## Introduction

This project demonstrates a failure of Cocoapods to create the correct framework header paths when merging subspecs in an Xcode workspace generated from two podspecs. Reported in https://github.com/CocoaPods/CocoaPods/issues/6584.

## Reproduction

1. `git clone git@github.com:paulb777/CocoapodsSubspecBug.git`
1. `cd CocoapodsSubspecBug/Example/`
1. `pod update`
1. `open CocoapodsSubspecBug.xcworkspace/`
1. Command-B to run the CocoapodsSubspecBug-Example scheme. Note that it succeeds.
1. Change the scheme to Root-Example. Command-B and note success.
1. Change the scheme back to CocoapodsSubspecBug-Example
1. Shift-Command-K to clean
1. Command-B and note compiler failure:

`/Users/paulbeusterien/demo/CocoapodsSubspecBug/CocoapodsSubspecBug/Classes/ReplaceMe.m:2:9: fatal error: 'GoogleToolboxForMac/GTMNSDictionary+URLArguments.h' file not found
#import <GoogleToolboxForMac/GTMNSDictionary+URLArguments.h>
        ^
1 error generated.`

## Analysis

Look at the CompileC command for ReplaceMe.m. Note that the build command contains `-F/Users/paulbeusterien/Library/Developer/Xcode/DerivedData/CocoapodsSubspecBug-aunbyqesijzafqbkozlvtxnfesnu/Build/Products/Debug-iphonesimulator/GoogleToolboxForMac-Defines-NSData+zlib -F/Users/paulbeusterien/Library/Developer/Xcode/DerivedData/CocoapodsSubspecBug-aunbyqesijzafqbkozlvtxnfesnu/Build/Products/Debug-iphonesimulator/GoogleToolboxForMac-f0850809`. When the build fails, both of these paths contain a version of the GoogleToolboxForMac framework. clang chooses to use the first, which doesn't have all of the headers and the compile fails. The first path was left over from the build of the Root-Example scheme and should not be included in the CocoapodsSubspecBug-Example scheme build.

~/demo/CocoapodsSubspecBug/Example (master) $ ls /Users/paulbeusterien/Library/Developer/Xcode/DerivedData/CocoapodsSubspecBug-aunbyqesijzafqbkozlvtxnfesnu/Build/Products/Debug-iphonesimulator/GoogleToolboxForMac-Defines-NSData+zlib/GoogleToolboxForMac.framework/Headers/

GTMDefines.h						GoogleToolboxForMac-Defines-NSData+zlib-umbrella.h
GTMNSData+zlib.h

~/demo/CocoapodsSubspecBug/Example (master) $ ls /Users/paulbeusterien/Library/Developer/Xcode/DerivedData/CocoapodsSubspecBug-aunbyqesijzafqbkozlvtxnfesnu/Build/Products/Debug-iphonesimulator/GoogleToolboxForMac-f0850809/GoogleToolboxForMac.framework/Headers/

GTMDebugSelectorValidation.h		GTMDefines.h				GTMNSData+zlib.h			GTMNSString+URLArguments.h
GTMDebugThreadValidation.h		GTMMethodCheck.h			GTMNSDictionary+URLArguments.h		GoogleToolboxForMac-f0850809-umbrella.h

## Author

Paul Beusterien

## License

CocoapodsSubspecBug is available under the MIT license. See the LICENSE file for more info.
