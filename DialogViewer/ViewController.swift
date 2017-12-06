//
//  ViewController.swift
//  DialogViewer
//
//  Created by Victor Smirnov on 04/12/2017.
//  Copyright © 2017 Victor Smirnov. All rights reserved.
//

import UIKit

class ViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
  
  private var sections = [
    ["header": "First Witch", "content": "Hey, when will the tree of us meen up letter?"],
    ["header": "Second Witch", "content": "When everything's streightened out."],
    ["header": "Third Witch", "content": "Thet'll be just befor suset."],
    ["header": "First Witch", "content": "Where?"],
    ["header": "Second Witch", "content": "The dirt patch."],
    ["header": "Third Witch", "content": "I guess we'll see Mac there."],
  ]
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
    self.collectionView?.register(ContentCell.self, forCellWithReuseIdentifier: "CONTENT")
    
    var contentInset = collectionView!.contentInset
    contentInset.top = 20
    collectionView!.contentInset = contentInset
    
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  func wordsInSection(section: Int) -> [String] {
    let content = sections[section]["content"]
    let words = content?.components(separatedBy: .whitespacesAndNewlines)
    return words!
  }
  
  //  MARK: Collection View
  
  override func numberOfSections(in collectionView: UICollectionView) -> Int {
    return sections.count
  }
  
  override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    let words = wordsInSection(section: section)
    return words.count
  }
  
  override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let words = wordsInSection(section: indexPath.section)
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CONTENT", for: indexPath) as! ContentCell
    cell.maxWidth = collectionView.bounds.size.width
    cell.text = words[indexPath.row]
    return cell
  }
  
  //  MARK: Collection View Flow Layout Delegate
  
  
  
}

