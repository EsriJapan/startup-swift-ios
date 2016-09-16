//
//  ViewController.swift
//  sample
//
//  Created by esrij on 2015/06/05.
//  Copyright (c) 2015年 esrij. All rights reserved.
//

import UIKit
import ArcGIS

class ViewController: UIViewController, AGSMapViewLayerDelegate {

    @IBOutlet var mapView: AGSMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //ベースマップの追加
        let tiledLayer = AGSTiledMapServiceLayer(url: URL(string:"https://server.arcgisonline.com/ArcGIS/rest/services/World_Street_Map/MapServer"))
        mapView.addMapLayer(tiledLayer, withName:"Tiled Layer")
        
        //主題図の追加
        let dynamicLayer = AGSDynamicMapServiceLayer(url: URL(string:"https://sampleserver1.arcgisonline.com/ArcGIS/rest/services/Specialty/ESRI_StateCityHighway_USA/MapServer"))
        //レイヤの表示設定
        dynamicLayer?.visibleLayers = [2]
        mapView.addMapLayer(dynamicLayer, withName:"Dynamic Layer")
        
        //初期表示範囲の設定
        let envelope = AGSEnvelope(xmin:-15000000, ymin:200000, xmax:-7000000, ymax:8000000,  spatialReference: self.mapView.spatialReference)
        mapView.zoom(to: envelope, animated:false)
        
        //デリゲートの設定
        mapView.layerDelegate = self

    }
    
    func mapViewDidLoad(_ mapView: AGSMapView!) {
        
        //デバイスの位置情報サービスとの連携
        mapView.locationDisplay.autoPanMode = .navigation
        mapView.locationDisplay.startDataSource()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

