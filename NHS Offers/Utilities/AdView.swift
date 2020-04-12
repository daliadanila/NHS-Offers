//
//  AdVC.swift
//  NHS Offers
//
//  Created by Dalia on 10/04/2020.
//  Copyright © 2020 Artemis Simple Solutions Ltd. All rights reserved.
//

import SwiftUI
import GoogleMobileAds
import UIKit

struct AdView : UIViewRepresentable
{

    func makeCoordinator() -> Coordinator
    {
        Coordinator(self)
    }

    func makeUIView(context: UIViewRepresentableContext<AdView>) -> GADBannerView
    {
        let banner = GADBannerView(adSize: kGADAdSizeBanner)
        banner.adUnitID = UIApplication.appUnitID
        banner.rootViewController = UIApplication.shared.windows.first?.rootViewController
        banner.load(GADRequest())
        banner.delegate = context.coordinator
        return banner
    }

    func updateUIView(_ uiView: GADBannerView, context: UIViewRepresentableContext<AdView>){}

    class Coordinator: NSObject, GADBannerViewDelegate
    {
        var parent: AdView

        init(_ parent: AdView)
        {
            self.parent = parent
        }

        func adViewDidReceiveAd(_ bannerView: GADBannerView)
        {
            bannerView.alpha = 0
            UIView.animate(withDuration: 1, animations: {
              bannerView.alpha = 1
            })
        }

        func adView(_ bannerView: GADBannerView, didFailToReceiveAdWithError error: GADRequestError)
        {

        }
    }
}

//struct AdVC_Previews: PreviewProvider {
//    static var previews: some View {
//        AdView()
//    }
//}
