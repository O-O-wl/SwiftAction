//
//  SwiftAction.swift
//  SwiftAction
//
//  Created by 이동영 on 2019/12/23.
//  Copyright © 2019 이동영. All rights reserved.
//

import UIKit


extension UIControl.Event: Hashable {}

typealias EventHandlers = [UIControl.Event: [(UIControl) -> Void]]

// MARK: - TargetAction

fileprivate struct TargetAction {
    static var allActions: [UIControl: EventHandlers] = [:]
}

// MARK: - UIControl

extension UIControl {
    
    public func add(for event: UIControl.Event, action: @escaping (UIControl) -> Void) {
        if TargetAction.allActions[self] == nil {
            TargetAction.allActions[self] = [:]
        }
        
        if TargetAction.allActions[self]?[event] == nil {
            TargetAction.allActions[self]?[event] = []
        }
        
        var handlers = TargetAction.allActions[self]?[event] ?? []
        handlers.append(action)
        TargetAction.allActions[self]?[event] = handlers
        
        for event in UIControl.Event.all {
            addTarget(self, action: Selector(event.description), for: event)
        }
    }
    
    public func remove(for event: UIControl.Event) {
        TargetAction.allActions[self]?[event] = []
    }
    
    // MARK: - Event
    
    @objc
    private func touchDown() {
        guard let eventHandlers = TargetAction.allActions[self],
            let handlers = eventHandlers[.touchDown]
            else { return }
        
        handlers.forEach { $0(self) }
    }
    
    @objc
    private func touchDownRepeat() {
        guard let eventHandlers = TargetAction.allActions[self],
            let handlers = eventHandlers[.touchDownRepeat]
            else { return }
        
        handlers.forEach { $0(self) }
    }
    
    @objc
    private func touchDragInside() {
        guard let eventHandlers = TargetAction.allActions[self],
            let handlers = eventHandlers[.touchDragInside]
            else { return }
        
        handlers.forEach { $0(self) }
    }
    
    @objc
    private func touchDragOutside() {
        guard let eventHandlers = TargetAction.allActions[self],
            let handlers = eventHandlers[.touchDragOutside]
            else { return }
        
        handlers.forEach { $0(self) }
    }
    
    @objc
    private func touchDragEnter() {
        guard let eventHandlers = TargetAction.allActions[self],
            let handlers = eventHandlers[.touchDragEnter]
            else { return }
        
        handlers.forEach { $0(self) }
    }
    
    @objc
    private func touchDragExit() {
        guard let eventHandlers = TargetAction.allActions[self],
            let handlers = eventHandlers[.touchDragExit]
            else { return }
        
        handlers.forEach { $0(self) }
    }
    
    @objc
    private func touchUpInside() {
        guard let eventHandlers = TargetAction.allActions[self],
            let handlers = eventHandlers[.touchUpInside]
            else { return }
        
        handlers.forEach { $0(self) }
    }
    
    @objc
    private func touchUpOutside() {
        guard let eventHandlers = TargetAction.allActions[self],
            let handlers = eventHandlers[.touchUpOutside]
            else { return }
        
        handlers.forEach { $0(self) }
    }
    
    @objc
    private func touchCancel() {
        guard let eventHandlers = TargetAction.allActions[self],
            let handlers = eventHandlers[.touchCancel]
            else { return }
        
        handlers.forEach { $0(self) }
    }
    
    @objc
    private func valueChanged() {
        guard let eventHandlers = TargetAction.allActions[self],
            let handlers = eventHandlers[.valueChanged]
            else { return }
        
        handlers.forEach { $0(self) }
    }
    
    @available(iOS 9.0, *)
    @objc
    private func primaryActionTriggered() {
        
        guard let eventHandlers = TargetAction.allActions[self],
            let handlers = eventHandlers[.primaryActionTriggered]
            else { return }
        
        handlers.forEach { $0(self) }
        
    }
    
    @objc
    private func editingDidBegin() {
        guard let eventHandlers = TargetAction.allActions[self],
            let handlers = eventHandlers[.editingDidBegin]
            else { return }
        
        handlers.forEach { $0(self) }
    }
    
    @objc
    private func editingChanged() {
        guard let eventHandlers = TargetAction.allActions[self],
            let handlers = eventHandlers[.editingChanged]
            else { return }
        
        handlers.forEach { $0(self) }
    }
    
    @objc
    private func editingDidEnd() {
        guard let eventHandlers = TargetAction.allActions[self],
            let handlers = eventHandlers[.editingDidEnd]
            else { return }
        
        handlers.forEach { $0(self) }
    }
    
    @objc
    private func editingDidEndOnExit() {
        guard let eventHandlers = TargetAction.allActions[self],
            let handlers = eventHandlers[.editingDidEndOnExit]
            else { return }
        
        handlers.forEach { $0(self) }
    }
    
    @objc
    private func allTouchEvents() {
        guard let eventHandlers = TargetAction.allActions[self],
            let handlers = eventHandlers[.allTouchEvents]
            else { return }
        
        handlers.forEach { $0(self) }
    }
    
    @objc
    private func allEditingEvents() {
        guard let eventHandlers = TargetAction.allActions[self],
            let handlers = eventHandlers[.allEditingEvents]
            else { return }
        
        handlers.forEach { $0(self) }
    }
    
    @objc
    private func applicationReserved() {
        guard let eventHandlers = TargetAction.allActions[self],
            let handlers = eventHandlers[.applicationReserved]
            else { return }
        
        handlers.forEach { $0(self) }
    }
    
    @objc
    private func systemReserved() {
        guard let eventHandlers = TargetAction.allActions[self],
            let handlers = eventHandlers[.systemReserved]
            else { return }
        
        handlers.forEach { $0(self) }
    }
    
    @objc
    private func allEvents() {
        guard let eventHandlers = TargetAction.allActions[self],
            let handlers = eventHandlers[.allEvents]
            else { return }
        
        handlers.forEach { $0(self) }
    }
}


extension UIControl.Event {
    
    static var all: [Self] {
        if #available(iOS 9.0, *) {
            return [.touchDown,
                    .touchDownRepeat,
                    .touchDragInside,
                    .touchDragOutside,
                    .touchDragEnter,
                    .touchDragExit,
                    .touchUpInside,
                    .touchUpOutside,
                    .touchCancel,
                    .valueChanged,
                    .primaryActionTriggered,
                    .editingDidBegin,
                    .editingChanged,
                    .editingDidEnd,
                    .editingDidEndOnExit,
                    .allTouchEvents,
                    .allEditingEvents,
                    .applicationReserved,
                    .systemReserved,
                    .allEvents]
        } else {
            return [.touchDown,
                    .touchDownRepeat,
                    .touchDragInside,
                    .touchDragOutside,
                    .touchDragEnter,
                    .touchDragExit,
                    .touchUpInside,
                    .touchUpOutside,
                    .touchCancel,
                    .valueChanged,
                    .editingDidBegin,
                    .editingChanged,
                    .editingDidEnd,
                    .editingDidEndOnExit,
                    .allTouchEvents,
                    .allEditingEvents,
                    .applicationReserved,
                    .systemReserved,
                    .allEvents]
        }
    }
}

extension UIControl.Event: CustomStringConvertible {
    public var description: String {
        if #available(iOS 9.0, *) {
            switch self {
            case .touchDown: return "touchDown"
            case .touchDownRepeat: return "touchDownRepeat"
            case .touchDragInside: return "touchDragInside"
            case .touchDragOutside: return "touchDragOutside"
            case .touchDragEnter: return "touchDragEnter"
            case .touchDragExit: return "touchDragExit"
            case .touchUpInside: return "touchUpInside"
            case .touchUpOutside: return "touchUpOutside"
            case .touchCancel: return "touchCancel"
            case .valueChanged: return "valueChanged"
            case .primaryActionTriggered: return "primaryActionTriggered"
            case .editingDidBegin: return "editingDidBegin"
            case .editingChanged: return "editingChanged"
            case .editingDidEnd: return "editingDidEnd"
            case .editingDidEndOnExit: return "editingDidEndOnExit"
            case .allTouchEvents: return "allTouchEvents"
            case .allEditingEvents: return "allEditingEvents"
            case .applicationReserved: return "applicationReserved"
            case .systemReserved: return "systemReserved"
            case .allEvents: return "allEvents"
            default: return "unknown"
            }
        } else {
            switch self {
            case .touchDown: return "touchDown"
            case .touchDownRepeat: return "touchDownRepeat"
            case .touchDragInside: return "touchDragInside"
            case .touchDragOutside: return "touchDragOutside"
            case .touchDragEnter: return "touchDragEnter"
            case .touchDragExit: return "touchDragExit"
            case .touchUpInside: return "touchUpInside"
            case .touchUpOutside: return "touchUpOutside"
            case .touchCancel: return "touchCancel"
            case .valueChanged: return "valueChanged"
            case .editingDidBegin: return "editingDidBegin"
            case .editingChanged: return "editingChanged"
            case .editingDidEnd: return "editingDidEnd"
            case .editingDidEndOnExit: return "editingDidEndOnExit"
            case .allTouchEvents: return "allTouchEvents"
            case .allEditingEvents: return "allEditingEvents"
            case .applicationReserved: return "applicationReserved"
            case .systemReserved: return "systemReserved"
            case .allEvents: return "allEvents"
            default: return "unknown"
            }
        }
    }
}

