//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import Foundation

struct ASFAppInfo: ASFAppInfoBehavior {

    var name: String? {
        Bundle.main.bundleIdentifier
    }

    var targetSDK: String {
        #if os(iOS) || os(tvOS) || os(watchOS)
        // Matches __IPHONE_OS_VERSION_MIN_REQUIRED semantics
        let min = Bundle.main.object(forInfoDictionaryKey: "MinimumOSVersion") as? String ?? ""
        return min
        #elseif os(macOS)
        // Matches __MAC_OS_X_VERSION_MIN_REQUIRED semantics
        let min = Bundle.main.object(forInfoDictionaryKey: "LSMinimumSystemVersion") as? String ?? ""
        return min
        #else
        return "Unknown"
        #endif
    }

    var version: String {
        let bundle = Bundle.main
        let buildVersion = bundle.object(forInfoDictionaryKey: kCFBundleVersionKey as String) ?? ""
        let bundleVersion = bundle.object(forInfoDictionaryKey: "CFBundleShortVersionString") ?? ""
        return "\(bundleVersion)-\(buildVersion)"
    }

}
