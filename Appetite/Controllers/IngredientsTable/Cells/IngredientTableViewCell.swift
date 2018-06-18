//
//  IngredientTableViewCell.swift
//  Appetite
//
//  Created by Adrian on 11/30/16.
//  Copyright © 2016 Kuguar. All rights reserved.
//

import UIKit

class IngredientTableViewCell: UITableViewCell {

  var quantity : UILabel!
  var unit : UILabel!
  var name : UILabel!
  var isOptional : UILabel!
  var delegate: TableViewCellDelegate?
  var elementId: String?
  
  override func awakeFromNib() {
    super.awakeFromNib()
    // Initialization code
  }
  
  override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    self.quantity = buildLabel()
    self.unit = buildLabel()
    self.name = buildLabel()
    self.isOptional = buildLabel()
  }
  
  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    self.quantity = buildLabel()
    self.unit = buildLabel()
    self.name = buildLabel()
    self.isOptional = buildLabel()
  }
  
  override func layoutSubviews() {
    super.layoutSubviews()
    // Quantity
    self.quantity.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 8).isActive = true
    // Unit
    self.quantity.textAlignment = .right
    self.unit.textAlignment = .left
    self.name.textAlignment = .left
    self.unit.widthAnchor.constraint(equalToConstant: 48).isActive = true
    self.unit.centerXAnchor.constraint(equalTo: self.contentView.centerXAnchor, constant: 0).isActive = true
    self.unit.leadingAnchor.constraint(equalTo: self.quantity.trailingAnchor, constant: 16).isActive = true
    self.unit.trailingAnchor.constraint(equalTo: self.name.leadingAnchor, constant: -16).isActive = true
    // Name
    self.name.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -8).isActive = true
  }

  override func setSelected(_ selected: Bool, animated: Bool) {
    super.setSelected(selected, animated: animated)

    // Configure the view for the selected state
  }
  
  func buildLabel() -> UILabel {
    let label = UILabel()
    self.contentView.addSubview(label)
    label.translatesAutoresizingMaskIntoConstraints = false
    // Color
    label.backgroundColor = UIColor.white
    label.textColor = UIColor.black
    label.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 8).isActive = true
    label.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -8).isActive = true
    return label
  }

  @IBAction  func touchUpInsides() {
    if let delegate = self.delegate {
      delegate.touchUpInside(id: self.elementId!)
    }
  }
  
}
