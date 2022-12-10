//
//  ViewController.swift
//  VerifyBlocSDK
//
//  Created by 修齐 on 12/10/2022.
//  Copyright (c) 2022 修齐. All rights reserved.
//
import VerifyBloc
import SnapKit

class ViewController: UIViewController {
    
    private var standerdResultDisplay: Bool = true
    private var gradeColor: UIColor?
    
    private lazy var colorField: UITextField = {
        let field = UITextField(frame: .zero)
        field.delegate = self
        field.borderStyle = .roundedRect
        field.placeholder = "#FFFFFF"
        return field
    }()
    
    private lazy var userField: UITextField = {
        let field = UITextField(frame: .zero)
        field.delegate = self
        field.borderStyle = .roundedRect
        field.placeholder = "必填"
        return field
    }()
    
    // 圆角值设置
    private lazy var bncornerField: UITextField = {
        let field = UITextField(frame: .zero)
        field.delegate = self
        field.borderStyle = .roundedRect
        field.placeholder = "按钮圆角值"
        return field
    }()
    
    // 按钮背景颜色
    private lazy var bnColorField: UITextField = {
        let field = UITextField(frame: .zero)
        field.delegate = self
        field.borderStyle = .roundedRect
        field.placeholder = "#FFFFFF 单色调"
        field.text = "1E90FF"
        return field
    }()
    
    private lazy var grade1Bn: UIButton = {
        let button = UIButton(frame: .zero)
        button.tag = 1024
        button.backgroundColor = UIColor(patternImage: UIImage(named: "grade_1_bg")!)
        button.addTarget(self, action: #selector(gradeAction(_:)), for: .touchUpInside)
        return button
    }()
    
    private lazy var grade2Bn: UIButton = {
        let button = UIButton(frame: .zero)
        button.backgroundColor = UIColor(patternImage: UIImage(named: "grade_2_bg")!)
        button.addTarget(self, action: #selector(gradeAction(_:)), for: .touchUpInside)
        button.tag = 1025
        return button
    }()
    
    // 按钮字体颜色
    private lazy var bnTitleColorField: UITextField = {
        let field = UITextField(frame: .zero)
        field.delegate = self
        field.borderStyle = .roundedRect
        field.placeholder = "#FFFFFF 单色调"
        field.text = "FFFFFF"
        return field
    }()
    
    // dark
    private lazy var darkBn: UIButton = {
        let bn = UIButton(frame: .zero)
        bn.setTitle("Dark模式", for: .normal)
        bn.setTitleColor(UIColor(hexString: "#39DC97"), for: .selected)
        bn.setTitleColor(.black, for: .normal)
        bn.titleEdgeInsets = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
        bn.titleLabel?.font = .systemFont(ofSize: 15)
        bn.addTarget(self, action: #selector(darkAction), for: .touchUpInside)
        bn.backgroundColor = UIColor(hexString: "F6F6F6")
        return bn
    }()
    
    // light
    private lazy var lightBn: UIButton = {
        let bn = UIButton(frame: .zero)
        bn.setTitle("Light模式", for: .normal)
        bn.titleEdgeInsets = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
        bn.setTitleColor(UIColor(hexString: "#39DC97"), for: .selected)
        bn.setTitleColor(.black, for: .normal)
        bn.titleLabel?.font = .systemFont(ofSize: 15)
        bn.addTarget(self, action: #selector(lightAction), for: .touchUpInside)
        bn.backgroundColor = UIColor(hexString: "F6F6F6")
        return bn
    }()
    
    private lazy var textView: UITextView = {
        let view = UITextView(frame: .zero)
        view.isEditable = false
        return view
    }()
    
    @objc private func darkAction() {
        lightBn.isSelected = false
        darkBn.isSelected = true
        VerifyBlocManager.changeStyle(.dark)
    }
    
    @objc private func lightAction() {
        lightBn.isSelected = true
        darkBn.isSelected = false
        VerifyBlocManager.changeStyle(.light)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        configView()
    }
    
    private func configView() {
        
        let colorHintLb = UILabel(frame: .zero)
        colorHintLb.font = .systemFont(ofSize: 15)
        colorHintLb.text = "主题色:"
        view.addSubview(colorHintLb)
        colorHintLb.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(64)
            make.left.equalToSuperview().offset(16)
            make.width.equalTo(65)
        }
        
        view.addSubview(colorField)
        colorField.snp.makeConstraints { make in
            make.centerY.equalTo(colorHintLb.snp.centerY)
            make.left.equalTo(colorHintLb.snp.right).offset(5)
            make.right.equalToSuperview().offset(-16)
            make.height.equalTo(30)
        }
        
        let userHintLb = UILabel(frame: .zero)
        userHintLb.text = "UserId:"
        userHintLb.font = .systemFont(ofSize: 15)
        view.addSubview(userHintLb)
        userHintLb.snp.makeConstraints { make in
            make.top.equalTo(colorHintLb.snp.bottom).offset(25)
            make.left.equalToSuperview().offset(16)
            make.width.equalTo(65)
        }
        
        view.addSubview(userField)
        userField.snp.makeConstraints { make in
            make.centerY.equalTo(userHintLb.snp.centerY)
            make.left.equalTo(userHintLb.snp.right).offset(5)
            make.right.equalToSuperview().offset(-16)
            make.height.equalTo(30)
        }
        
        let cornerHintLb = UILabel(frame: .zero)
        cornerHintLb.text = "按钮圆角："
        cornerHintLb.font = .systemFont(ofSize: 15)
        view.addSubview(cornerHintLb)
        cornerHintLb.snp.makeConstraints { make in
            make.top.equalTo(userHintLb.snp.bottom).offset(25)
            make.left.equalToSuperview().offset(16)
            make.width.equalTo(90)
        }
        
        view.addSubview(bncornerField)
        bncornerField.snp.makeConstraints { make in
            make.centerY.equalTo(cornerHintLb.snp.centerY)
            make.left.equalTo(cornerHintLb.snp.right).offset(5)
            make.right.equalToSuperview().offset(-16)
            make.height.equalTo(30)
        }
        
        let bnColorLb = UILabel(frame: .zero)
        bnColorLb.text = "按钮背景："
        bnColorLb.font = .systemFont(ofSize: 15)
        view.addSubview(bnColorLb)
        bnColorLb.snp.makeConstraints { make in
            make.top.equalTo(cornerHintLb.snp.bottom).offset(25)
            make.left.equalToSuperview().offset(16)
            make.width.equalTo(90)
        }
        
        view.addSubview(bnColorField)
        bnColorField.snp.makeConstraints { make in
            make.centerY.equalTo(bnColorLb.snp.centerY)
            make.left.equalTo(bnColorLb.snp.right).offset(5)
            make.right.equalToSuperview().offset(-16)
            make.height.equalTo(30)
        }
        
        view.addSubview(grade1Bn)
        grade1Bn.snp.makeConstraints { make in
            make.top.equalTo(bnColorField.snp.bottom).offset(25)
            make.left.equalToSuperview().offset(16)
            make.height.equalTo(40)
            make.width.equalTo(150)
        }
        
        view.addSubview(grade2Bn)
        grade2Bn.snp.makeConstraints { make in
            make.top.equalTo(bnColorField.snp.bottom).offset(25)
            make.left.equalTo(grade1Bn.snp.right).offset(16)
            make.height.equalTo(40)
            make.width.equalTo(150)
        }
        
        let bnTitleColorLb = UILabel(frame: .zero)
        bnTitleColorLb.text = "按钮字体："
        bnTitleColorLb.font = .systemFont(ofSize: 15)
        view.addSubview(bnTitleColorLb)
        bnTitleColorLb.snp.makeConstraints { make in
            make.top.equalTo(grade2Bn.snp.bottom).offset(25)
            make.left.equalToSuperview().offset(16)
            make.width.equalTo(90)
        }
        
        view.addSubview(bnTitleColorField)
        bnTitleColorField.snp.makeConstraints { make in
            make.centerY.equalTo(bnTitleColorLb.snp.centerY)
            make.left.equalTo(bnTitleColorLb.snp.right).offset(5)
            make.right.equalToSuperview().offset(-16)
            make.height.equalTo(30)
        }
        
        view.addSubview(darkBn)
        darkBn.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(16)
            make.top.equalTo(bnTitleColorField.snp.bottom).offset(15)
            make.height.equalTo(40)
            make.width.equalTo(100)
        }
        
        view.addSubview(lightBn)
        lightBn.snp.makeConstraints { make in
            make.left.equalTo(darkBn.snp.right).offset(16)
            make.centerY.equalTo(darkBn.snp.centerY)
            make.height.equalTo(40)
            make.width.equalTo(100)
        }
        
        let testBn = UIButton(frame: .zero)
        testBn.setTitle("开测", for: .normal)
        testBn.backgroundColor = UIColor.black
        testBn.addTarget(self, action: #selector(addInfo), for: .touchUpInside)
        view.addSubview(testBn)
        testBn.snp.makeConstraints { make in
            make.top.equalTo(lightBn.snp.bottom).offset(10)
            make.left.equalToSuperview().offset(16)
            make.right.equalToSuperview().offset(-16)
            make.height.equalTo(44)
        }
        
        view.addSubview(textView)
        textView.snp.makeConstraints { make in
            make.top.equalTo(testBn.snp.bottom).offset(15)
            make.left.right.bottom.equalToSuperview()
        }
    }
    
    @objc private func addInfo() {
        textView.text = ""

        var color = colorField.text?.trimSpace ??  ""
        if color.isEmpty {
            color = "#39DC97"
        }

        let user = userField.text?.trimSpace ?? ""
        if user.isEmpty {
            return
        }

        let userId: String = user
        let appId: String = "Your Real Data AppId"
        let parterId: String = "Your Real Data ParterId"
        let secret: String = "Your Real Data secret"
        
        let themeColor: UIColor =  UIColor(hexString: color)
        
        // 按钮圆角
        let corner = Float(bncornerField.text?.trimSpace ?? "") ?? 4
        // 按钮背景
        let bnBgColor = bnColorField.text?.trimSpace ?? ""
        var bgColor = UIColor(hexString: "#3EAEFF")
        if !bnBgColor.isEmpty {
            bgColor = UIColor(hexString: bnBgColor)
        }
        if let gradeColor = gradeColor {
            bgColor = gradeColor
        }
        
        // 按钮字体颜色
        let bnTitleColor = bnTitleColorField.text?.trimSpace ?? ""
        var titleColor = UIColor.white
        if !bnTitleColor.isEmpty {
            titleColor = UIColor(hexString: bnTitleColor)
        }
        
        let bnSetting = ButtonSetting(bgColor: bgColor, circle: CGFloat(corner), color: titleColor)
        VerifyBlocManager.shared.buttonSetting = bnSetting // 可不设置，默认值处理
        VerifyBlocManager.shared.themeColor = themeColor // 可不设置，默认值处理
        if appId != "Your Real Data AppId" {
            VerifyBlocManager.config(appId: appId, parterId: parterId, secret: secret)
            VerifyBlocManager.verify(userId: userId, presentingController: self) { [weak self] flowId, status in
                self?.dealBlock(flowId: flowId, status)
            }
        } else {
            print("麻烦替换你自己的真实AppId ParterId以及Secret信息")
        }
        
    }
    
    private func dealBlock(flowId: String, _ status: String) {
        var text = textView.text ?? ""
        if !text.isEmpty {
            text += "\n"
        }
        text += "flowId: \(flowId), status: \(status)"
        print("text = \(text)")
        textView.text = text
    }
    
    @objc private func gradeAction(_ sender: UIButton) {
        if sender.tag == 1024 {
            gradeColor = UIColor(patternImage: UIImage(named: "grade_1_bg")!)
        } else if sender.tag == 1025 {
            gradeColor = UIColor(patternImage: UIImage(named: "grade_2_bg")!)
        }
    }
}

extension ViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}

extension UIColor {
    convenience init(hexString: String) {
        let hex = hexString.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int = UInt32()
        
        Scanner(string: hex).scanHexInt32(&int)
        let a, r, g, b: UInt32
        
        switch hex.count {
            case 3: // RGB (12-bit)
                (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
            case 6: // RGB (24-bit)
                (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
            case 8: // ARGB (32-bit)
                (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
            default:
                (a, r, g, b) = (255, 0, 0, 0)
        }
        self.init(red: CGFloat(r) / 255, green: CGFloat(g) / 255, blue: CGFloat(b) / 255, alpha: CGFloat(a) / 255)
    }
}

extension String {
    var trimSpace:String {
        let whitespace = NSCharacterSet.whitespaces
        return self.trimmingCharacters(in: whitespace)
    }
}
