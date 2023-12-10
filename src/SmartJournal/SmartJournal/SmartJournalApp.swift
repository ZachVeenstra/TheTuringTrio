//
//  SmartJournalApp.swift
//  SmartJournal
//
//  Created by Zach Veenstra on 11/6/23.
//

/** Learned how to use EnvironmentObjects to control authentication state here: https://paulallies.medium.com/login-logout-flow-swiftui-and-environmentobject-48ea084c5b6e */

import SwiftUI
import FirebaseCore
import FirebaseAuth
import FirebaseFirestore


class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    FirebaseApp.configure()

    return true
  }
}

@main
struct SmartJournalApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    
    @StateObject var authenticationState = UserAuthenticationState()
    
    var body: some Scene {
        WindowGroup {
            NavigationStack {
                AuthenticationSwitcher()
            }
            .environmentObject(authenticationState)
        }
    }
}

struct AuthenticationSwitcher: View {
    @EnvironmentObject var authenticationState: UserAuthenticationState
    
    var body: some View {
        if (authenticationState.isSignedIn) {
            HomeView()
        } else {
            AuthenticationView()
     }
    }
}
