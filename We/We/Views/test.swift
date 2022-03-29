//
//  test.swift
//  We
//
//  Created by Yang Jianqi on 2022/3/24.
//

import SwiftUI

struct ToolsEditorView: View {
    var body: some View {
        Text(date2string(Datestr: Date()))
    }
}

struct test_Previews: PreviewProvider {
    static var previews: some View {
        ToolsEditorView()
    }
}
