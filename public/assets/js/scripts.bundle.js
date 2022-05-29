"use strict";
var KTBlockUI = function(e, t) {
    var n = this;
    if (null != e) {
        var i = { zIndex: !1, overlayClass: "", overflow: "hidden", message: '<span class="spinner-border text-primary"></span>' };
        KTUtil.data(e).has("blockui") ? n = KTUtil.data(e).get("blockui") : (n.options = KTUtil.deepExtend({}, i, t), n.element = e, n.overlayElement = null, n.blocked = !1, n.positionChanged = !1, n.overflowChanged = !1, KTUtil.data(n.element).set("blockui", n)), n.block = function() {
            ! function() {
                if (!1 !== KTEventHandler.trigger(n.element, "kt.blockui.block", n)) {
                    var e = "BODY" === n.element.tagName,
                        t = KTUtil.css(n.element, "position"),
                        i = KTUtil.css(n.element, "overflow"),
                        r = e ? 1e4 : 1;
                    n.options.zIndex > 0 ? r = n.options.zIndex : "auto" != KTUtil.css(n.element, "z-index") && (r = KTUtil.css(n.element, "z-index")), n.element.classList.add("blockui"), "absolute" !== t && "relative" !== t && "fixed" !== t || (KTUtil.css(n.element, "position", "relative"), n.positionChanged = !0), "hidden" === n.options.overflow && "visible" === i && (KTUtil.css(n.element, "overflow", "hidden"), n.overflowChanged = !0), n.overlayElement = document.createElement("DIV"), n.overlayElement.setAttribute("class", "blockui-overlay " + n.options.overlayClass), n.overlayElement.innerHTML = n.options.message, KTUtil.css(n.overlayElement, "z-index", r), n.element.append(n.overlayElement), n.blocked = !0, KTEventHandler.trigger(n.element, "kt.blockui.after.blocked", n)
                }
            }()
        }, n.release = function() {!1 !== KTEventHandler.trigger(n.element, "kt.blockui.release", n) && (n.element.classList.add("blockui"), n.positionChanged && KTUtil.css(n.element, "position", ""), n.overflowChanged && KTUtil.css(n.element, "overflow", ""), n.overlayElement && KTUtil.remove(n.overlayElement), n.blocked = !1, KTEventHandler.trigger(n.element, "kt.blockui.released", n)) }, n.isBlocked = function() { return n.blocked }, n.destroy = function() { KTUtil.data(n.element).remove("blockui") }, n.on = function(e, t) { return KTEventHandler.on(n.element, e, t) }, n.one = function(e, t) { return KTEventHandler.one(n.element, e, t) }, n.off = function(e) { return KTEventHandler.off(n.element, e) }, n.trigger = function(e, t) { return KTEventHandler.trigger(n.element, e, t, n, t) }
    }
};
KTBlockUI.getInstance = function(e) { return null !== e && KTUtil.data(e).has("blockui") ? KTUtil.data(e).get("blockui") : null }, "undefined" != typeof module && void 0 !== module.exports && (module.exports = KTBlockUI);
var KTCookie = {
    get: function(e) { var t = document.cookie.match(new RegExp("(?:^|; )" + e.replace(/([\.$?*|{}\(\)\[\]\\\/\+^])/g, "\\$1") + "=([^;]*)")); return t ? decodeURIComponent(t[1]) : null },
    set: function(e, t, n) {
        null == n && (n = {}), (n = Object.assign({}, { path: "/" }, n)).expires instanceof Date && (n.expires = n.expires.toUTCString());
        var i = encodeURIComponent(e) + "=" + encodeURIComponent(t);
        for (var r in n)
            if (!1 !== n.hasOwnProperty(r)) { i += "; " + r; var o = n[r];!0 !== o && (i += "=" + o) }
        document.cookie = i
    },
    remove: function(e) { this.set(e, "", { "max-age": -1 }) }
};
"undefined" != typeof module && void 0 !== module.exports && (module.exports = KTCookie);
var KTDialer = function(e, t) {
    var n = this;
    if (e) {
        var i = { min: null, max: null, step: 1, decimals: 0, prefix: "", suffix: "" },
            r = function() { KTUtil.addEvent(n.incElement, "click", function(e) { e.preventDefault(), o() }), KTUtil.addEvent(n.decElement, "click", function(e) { e.preventDefault(), a() }), KTUtil.addEvent(n.inputElement, "input", function(e) { e.preventDefault(), l() }) },
            o = function() { return KTEventHandler.trigger(n.element, "kt.dialer.increase", n), n.inputElement.value = n.value + n.options.step, l(), KTEventHandler.trigger(n.element, "kt.dialer.increased", n), n },
            a = function() { return KTEventHandler.trigger(n.element, "kt.dialer.decrease", n), n.inputElement.value = n.value - n.options.step, l(), KTEventHandler.trigger(n.element, "kt.dialer.decreased", n), n },
            l = function(e) { KTEventHandler.trigger(n.element, "kt.dialer.change", n), n.value = void 0 !== e ? e : s(n.inputElement.value), null !== n.options.min && n.value < n.options.min && (n.value = n.options.min), null !== n.options.max && n.value > n.options.max && (n.value = n.options.max), n.inputElement.value = u(n.value), n.inputElement.dispatchEvent(new Event("change")), KTEventHandler.trigger(n.element, "kt.dialer.changed", n) },
            s = function(e) { return e = e.replace(/[^0-9.-]/g, "").replace(/(\..*)\./g, "$1").replace(/(?!^)-/g, "").replace(/^0+(\d)/gm, "$1"), e = parseFloat(e), isNaN(e) && (e = 0), e },
            u = function(e) { return n.options.prefix + parseFloat(e).toFixed(n.options.decimals) + n.options.suffix },
            d = function(e) { return !0 === n.element.hasAttribute("data-kt-dialer-" + e) ? n.element.getAttribute("data-kt-dialer-" + e) : null };
        !0 === KTUtil.data(e).has("dialer") ? n = KTUtil.data(e).get("dialer") : (n.options = KTUtil.deepExtend({}, i, t), n.element = e, n.incElement = n.element.querySelector('[data-kt-dialer-control="increase"]'), n.decElement = n.element.querySelector('[data-kt-dialer-control="decrease"]'), n.inputElement = n.element.querySelector("input[type]"), d("decimals") && (n.options.decimals = parseInt(d("decimals"))), d("prefix") && (n.options.prefix = d("prefix")), d("suffix") && (n.options.suffix = d("suffix")), d("step") && (n.options.step = parseFloat(d("step"))), d("min") && (n.options.min = parseFloat(d("min"))), d("max") && (n.options.max = parseFloat(d("max"))), n.value = parseFloat(n.inputElement.value.replace(/[^\d.]/g, "")), l(), r(), KTUtil.data(n.element).set("dialer", n)), n.setMinValue = function(e) { n.options.min = e }, n.setMaxValue = function(e) { n.options.max = e }, n.setValue = function(e) { l(e) }, n.getValue = function() { return n.inputElement.value }, n.update = function() { l() }, n.increase = function() { return o() }, n.decrease = function() { return a() }, n.getElement = function() { return n.element }, n.destroy = function() { KTUtil.data(n.element).remove("dialer") }, n.on = function(e, t) { return KTEventHandler.on(n.element, e, t) }, n.one = function(e, t) { return KTEventHandler.one(n.element, e, t) }, n.off = function(e) { return KTEventHandler.off(n.element, e) }, n.trigger = function(e, t) { return KTEventHandler.trigger(n.element, e, t, n, t) }
    }
};
KTDialer.getInstance = function(e) { return null !== e && KTUtil.data(e).has("dialer") ? KTUtil.data(e).get("dialer") : null }, KTDialer.createInstances = function(e = '[data-kt-dialer="true"]') {
    var t = document.body.querySelectorAll(e);
    if (t && t.length > 0)
        for (var n = 0, i = t.length; n < i; n++) new KTDialer(t[n])
}, KTDialer.init = function() { KTDialer.createInstances() }, "loading" === document.readyState ? document.addEventListener("DOMContentLoaded", KTDialer.init) : KTDialer.init(), "undefined" != typeof module && void 0 !== module.exports && (module.exports = KTDialer);
var KTDrawer = function(e, t) {
    var n = this,
        i = document.getElementsByTagName("BODY")[0];
    if (null != e) {
        var r = { overlay: !0, direction: "end", baseClass: "drawer", overlayClass: "drawer-overlay" },
            o = function() {
                var e = m("toggle"),
                    t = m("close");
                null !== e && e.length > 0 && KTUtil.on(i, e, "click", function(e) { e.preventDefault(), n.toggleElement = this, a() }), null !== t && t.length > 0 && KTUtil.on(i, t, "click", function(e) { e.preventDefault(), n.closeElement = this, l() })
            },
            a = function() {!1 !== KTEventHandler.trigger(n.element, "kt.drawer.toggle", n) && (!0 === n.shown ? l() : s(), KTEventHandler.trigger(n.element, "kt.drawer.toggled", n)) },
            l = function() {!1 !== KTEventHandler.trigger(n.element, "kt.drawer.hide", n) && (n.shown = !1, c(), i.removeAttribute("data-kt-drawer-" + n.name, "on"), i.removeAttribute("data-kt-drawer"), KTUtil.removeClass(n.element, n.options.baseClass + "-on"), null !== n.toggleElement && KTUtil.removeClass(n.toggleElement, "active"), KTEventHandler.trigger(n.element, "kt.drawer.after.hidden", n)) },
            s = function() {!1 !== KTEventHandler.trigger(n.element, "kt.drawer.show", n) && (n.shown = !0, d(), i.setAttribute("data-kt-drawer-" + n.name, "on"), i.setAttribute("data-kt-drawer", "on"), KTUtil.addClass(n.element, n.options.baseClass + "-on"), null !== n.toggleElement && KTUtil.addClass(n.toggleElement, "active"), KTEventHandler.trigger(n.element, "kt.drawer.shown", n)) },
            u = function() {
                var e = f(),
                    t = m("direction");
                !0 === KTUtil.hasClass(n.element, n.options.baseClass + "-on") && "on" === String(i.getAttribute("data-kt-drawer-" + n.name + "-")) ? n.shown = !0 : n.shown = !1, !0 === m("activate") ? (KTUtil.addClass(n.element, n.options.baseClass), KTUtil.addClass(n.element, n.options.baseClass + "-" + t), KTUtil.css(n.element, "width", e, !0), n.lastWidth = e) : (KTUtil.css(n.element, "width", ""), KTUtil.removeClass(n.element, n.options.baseClass), KTUtil.removeClass(n.element, n.options.baseClass + "-" + t), l())
            },
            d = function() {!0 === m("overlay") && (n.overlayElement = document.createElement("DIV"), KTUtil.css(n.overlayElement, "z-index", KTUtil.css(n.element, "z-index") - 1), i.append(n.overlayElement), KTUtil.addClass(n.overlayElement, m("overlay-class")), KTUtil.addEvent(n.overlayElement, "click", function(e) { e.preventDefault(), l() })) },
            c = function() { null !== n.overlayElement && KTUtil.remove(n.overlayElement) },
            m = function(e) {
                if (!0 === n.element.hasAttribute("data-kt-drawer-" + e)) {
                    var t = n.element.getAttribute("data-kt-drawer-" + e),
                        i = KTUtil.getResponsiveValue(t);
                    return null !== i && "true" === String(i) ? i = !0 : null !== i && "false" === String(i) && (i = !1), i
                }
                var r = KTUtil.snakeToCamel(e);
                return n.options[r] ? KTUtil.getResponsiveValue(n.options[r]) : null
            },
            f = function() { var e = m("width"); return "auto" === e && (e = KTUtil.css(n.element, "width")), e };
        KTUtil.data(e).has("drawer") ? n = KTUtil.data(e).get("drawer") : (n.options = KTUtil.deepExtend({}, r, t), n.uid = KTUtil.getUniqueId("drawer"), n.element = e, n.overlayElement = null, n.name = n.element.getAttribute("data-kt-drawer-name"), n.shown = !1, n.lastWidth, n.toggleElement = null, n.element.setAttribute("data-kt-drawer", "true"), o(), u(), KTUtil.data(n.element).set("drawer", n)), n.toggle = function() { return a() }, n.show = function() { return s() }, n.hide = function() { return l() }, n.isShown = function() { return n.shown }, n.update = function() { u() }, n.goElement = function() { return n.element }, n.destroy = function() { KTUtil.data(n.element).remove("drawer") }, n.on = function(e, t) { return KTEventHandler.on(n.element, e, t) }, n.one = function(e, t) { return KTEventHandler.one(n.element, e, t) }, n.off = function(e) { return KTEventHandler.off(n.element, e) }, n.trigger = function(e, t) { return KTEventHandler.trigger(n.element, e, t, n, t) }
    }
};
KTDrawer.getInstance = function(e) { return null !== e && KTUtil.data(e).has("drawer") ? KTUtil.data(e).get("drawer") : null }, KTDrawer.hideAll = function(e = null, t = '[data-kt-drawer="true"]') {
    var n = document.querySelectorAll(t);
    if (n && n.length > 0)
        for (var i = 0, r = n.length; i < r; i++) {
            var o = n[i],
                a = KTDrawer.getInstance(o);
            a && (e ? o !== e && a.hide() : a.hide())
        }
}, KTDrawer.updateAll = function(e = '[data-kt-drawer="true"]') {
    var t = document.querySelectorAll(e);
    if (t && t.length > 0)
        for (var n = 0, i = t.length; n < i; n++) {
            var r = t[n],
                o = KTDrawer.getInstance(r);
            o && o.update()
        }
}, KTDrawer.createInstances = function(e = '[data-kt-drawer="true"]') {
    var t = document.getElementsByTagName("BODY")[0].querySelectorAll(e);
    if (t && t.length > 0)
        for (var n = 0, i = t.length; n < i; n++) new KTDrawer(t[n])
}, KTDrawer.handleShow = function() {
    KTUtil.on(document.body, '[data-kt-drawer-show="true"][data-kt-drawer-target]', "click", function(e) {
        var t = document.querySelector(this.getAttribute("data-kt-drawer-target"));
        t && KTDrawer.getInstance(t).show()
    })
}, KTDrawer.handleDismiss = function() {
    KTUtil.on(document.body, '[data-kt-drawer-dismiss="true"]', "click", function(e) {
        var t = this.closest('[data-kt-drawer="true"]');
        if (t) {
            var n = KTDrawer.getInstance(t);
            n.isShown() && n.hide()
        }
    })
}, window.addEventListener("resize", function() {
    var e = document.getElementsByTagName("BODY")[0];
    KTUtil.throttle(void 0, function() {
        var t = e.querySelectorAll('[data-kt-drawer="true"]');
        if (t && t.length > 0)
            for (var n = 0, i = t.length; n < i; n++) {
                var r = KTDrawer.getInstance(t[n]);
                r && r.update()
            }
    }, 200)
}), KTDrawer.init = function() { KTDrawer.createInstances(), KTDrawer.handleShow(), KTDrawer.handleDismiss() }, "loading" === document.readyState ? document.addEventListener("DOMContentLoaded", KTDrawer.init) : KTDrawer.init(), "undefined" != typeof module && void 0 !== module.exports && (module.exports = KTDrawer);
var KTEventHandler = function() {
    var e = {},
        t = function(t, n, i, r) {
            var o = KTUtil.getUniqueId("event");
            KTUtil.data(t).set(n, o), e[n] || (e[n] = {}), e[n][o] = { name: n, callback: i, one: r, fired: !1 }
        };
    return {
        trigger: function(t, n, i, r) { return function(t, n, i, r) { if (!0 === KTUtil.data(t).has(n)) { var o = KTUtil.data(t).get(n); if (e[n] && e[n][o]) { var a = e[n][o]; if (a.name === n) { if (1 != a.one) return a.callback.call(this, i, r); if (0 == a.fired) return e[n][o].fired = !0, a.callback.call(this, i, r) } } } return null }(t, n, i, r) },
        on: function(e, n, i) { return t(e, n, i) },
        one: function(e, n, i) { return t(e, n, i, !0) },
        off: function(t, n) {
            return function(t, n) {
                var i = KTUtil.data(t).get(n);
                e[n] && e[n][i] && delete e[n][i]
            }(t, n)
        },
        debug: function() { for (var t in e) e.hasOwnProperty(t) && console.log(t) }
    }
}();
"undefined" != typeof module && void 0 !== module.exports && (module.exports = KTEventHandler);
var KTFeedback = function(e) {
    var t = this,
        n = document.getElementsByTagName("BODY")[0],
        i = { width: 100, placement: "top-center", content: "", type: "popup" },
        r = function() { KTUtil.addEvent(t.element, "click", function(e) { e.preventDefault(), _go() }) },
        o = function() {
            var e = KTUtil.getResponsiveValue(t.options.width),
                n = KTUtil.css(t.element, "height");
            KTUtil.addClass(t.element, "feedback-top-center"), KTUtil.css(t.element, "width", e), KTUtil.css(t.element, "left", "50%"), KTUtil.css(t.element, "top", "-" + n)
        };
    t.options = KTUtil.deepExtend({}, i, e), t.uid = KTUtil.getUniqueId("feedback"), t.element, t.shown = !1, r(), KTUtil.data(t.element).set("feedback", t), t.show = function() { return function() { if (!1 !== KTEventHandler.trigger(t.element, "kt.feedback.show", t)) return "popup" === t.options.type && (t.element = document.createElement("DIV"), KTUtil.addClass(t.element, "feedback feedback-popup"), KTUtil.setHTML(t.element, t.options.content), "top-center" == t.options.placement && o(), n.appendChild(t.element), KTUtil.addClass(t.element, "feedback-shown"), t.shown = !0), KTEventHandler.trigger(t.element, "kt.feedback.shown", t), t }() }, t.hide = function() { return function() { if (!1 !== KTEventHandler.trigger(t.element, "kt.feedback.hide", t)) return "popup" === t.options.type && t.element.remove(), t.shown = !1, KTEventHandler.trigger(t.element, "kt.feedback.hidden", t), t }() }, t.isShown = function() { return t.shown }, t.getElement = function() { return t.element }, t.destroy = function() { KTUtil.data(t.element).remove("feedback") }, t.on = function(e, n) { return KTEventHandler.on(t.element, e, n) }, t.one = function(e, n) { return KTEventHandler.one(t.element, e, n) }, t.off = function(e) { return KTEventHandler.off(t.element, e) }, t.trigger = function(e, n) { return KTEventHandler.trigger(t.element, e, n, t, n) }
};
"undefined" != typeof module && void 0 !== module.exports && (module.exports = KTFeedback);
var KTImageInput = function(e, t) {
    var n = this;
    if (null != e) {
        var i = {},
            r = function() { KTUtil.addEvent(n.inputElement, "change", o), KTUtil.addEvent(n.cancelElement, "click", a), KTUtil.addEvent(n.removeElement, "click", l) },
            o = function(e) {
                if (e.preventDefault(), null !== n.inputElement && n.inputElement.files && n.inputElement.files[0]) {
                    if (!1 === KTEventHandler.trigger(n.element, "kt.imageinput.change", n)) return;
                    var t = new FileReader;
                    t.onload = function(e) { KTUtil.css(n.wrapperElement, "background-image", "url(" + e.target.result + ")") }, t.readAsDataURL(n.inputElement.files[0]), n.element.classList.add("image-input-changed"), n.element.classList.remove("image-input-empty"), KTEventHandler.trigger(n.element, "kt.imageinput.changed", n)
                }
            },
            a = function(e) { e.preventDefault(), !1 !== KTEventHandler.trigger(n.element, "kt.imageinput.cancel", n) && (n.element.classList.remove("image-input-changed"), n.element.classList.remove("image-input-empty"), "none" === n.src ? (KTUtil.css(n.wrapperElement, "background-image", ""), n.element.classList.add("image-input-empty")) : KTUtil.css(n.wrapperElement, "background-image", n.src), n.inputElement.value = "", null !== n.hiddenElement && (n.hiddenElement.value = "0"), KTEventHandler.trigger(n.element, "kt.imageinput.canceled", n)) },
            l = function(e) { e.preventDefault(), !1 !== KTEventHandler.trigger(n.element, "kt.imageinput.remove", n) && (n.element.classList.remove("image-input-changed"), n.element.classList.add("image-input-empty"), KTUtil.css(n.wrapperElement, "background-image", "none"), n.inputElement.value = "", null !== n.hiddenElement && (n.hiddenElement.value = "1"), KTEventHandler.trigger(n.element, "kt.imageinput.removed", n)) };
        !0 === KTUtil.data(e).has("image-input") ? n = KTUtil.data(e).get("image-input") : (n.options = KTUtil.deepExtend({}, i, t), n.uid = KTUtil.getUniqueId("image-input"), n.element = e, n.inputElement = KTUtil.find(e, 'input[type="file"]'), n.wrapperElement = KTUtil.find(e, ".image-input-wrapper"), n.cancelElement = KTUtil.find(e, '[data-kt-image-input-action="cancel"]'), n.removeElement = KTUtil.find(e, '[data-kt-image-input-action="remove"]'), n.hiddenElement = KTUtil.find(e, 'input[type="hidden"]'), n.src = KTUtil.css(n.wrapperElement, "backgroundImage"), n.element.setAttribute("data-kt-image-input", "true"), r(), KTUtil.data(n.element).set("image-input", n)), n.getInputElement = function() { return n.inputElement }, n.goElement = function() { return n.element }, n.destroy = function() { KTUtil.data(n.element).remove("image-input") }, n.on = function(e, t) { return KTEventHandler.on(n.element, e, t) }, n.one = function(e, t) { return KTEventHandler.one(n.element, e, t) }, n.off = function(e) { return KTEventHandler.off(n.element, e) }, n.trigger = function(e, t) { return KTEventHandler.trigger(n.element, e, t, n, t) }
    }
};
KTImageInput.getInstance = function(e) { return null !== e && KTUtil.data(e).has("image-input") ? KTUtil.data(e).get("image-input") : null }, KTImageInput.createInstances = function(e = "[data-kt-image-input]") {
    var t = document.querySelectorAll(e);
    if (t && t.length > 0)
        for (var n = 0, i = t.length; n < i; n++) new KTImageInput(t[n])
}, KTImageInput.init = function() { KTImageInput.createInstances() }, "loading" === document.readyState ? document.addEventListener("DOMContentLoaded", KTImageInput.init) : KTImageInput.init(), "undefined" != typeof module && void 0 !== module.exports && (module.exports = KTImageInput);
var KTMenu = function(e, t) {
    var n = this;
    if (null != e) {
        var i = { dropdown: { hoverTimeout: 200, zindex: 105 }, accordion: { slideSpeed: 250, expand: !1 } },
            r = function(e) { e || (e = n.triggerElement), !0 === c(e) ? a(e) : o(e) },
            o = function(e) { e || (e = n.triggerElement), !0 !== c(e) && ("dropdown" === g(e) ? K(e) : "accordion" === g(e) && k(e), KTUtil.data(e).set("type", g(e))) },
            a = function(e) { e || (e = n.triggerElement), !1 !== c(e) && ("dropdown" === g(e) ? U(e) : "accordion" === g(e) && y(e)) },
            l = function(e) {
                if (!1 !== m(e)) {
                    var t = p(e);
                    KTUtil.data(e).has("type") && KTUtil.data(e).get("type") !== g(e) && (KTUtil.removeClass(e, "hover"), KTUtil.removeClass(e, "show"), KTUtil.removeClass(t, "show"))
                }
            },
            s = function() {
                var e = n.element.querySelectorAll(".menu-item[data-kt-menu-trigger]");
                if (e && e.length > 0)
                    for (var t = 0, i = e.length; t < i; t++) l(e[t])
            },
            u = function() {
                var e = document.querySelector('[data-kt-menu-target="# ' + n.element.getAttribute("id") + '"]');
                null !== e ? n.triggerElement = e : n.element.closest("[data-kt-menu-trigger]") ? n.triggerElement = n.element.closest("[data-kt-menu-trigger]") : n.element.parentNode && KTUtil.child(n.element.parentNode, "[data-kt-menu-trigger]") && (n.triggerElement = KTUtil.child(n.element.parentNode, "[data-kt-menu-trigger]")), n.triggerElement && KTUtil.data(n.triggerElement).set("menu", n)
            },
            d = function(e) { return n.triggerElement === e },
            c = function(e) { var t = p(e); return null !== t && ("dropdown" === g(e) ? !0 === KTUtil.hasClass(t, "show") && !0 === t.hasAttribute("data-popper-placement") : KTUtil.hasClass(e, "show")) },
            m = function(e) { return KTUtil.hasClass(e, "menu-item") && e.hasAttribute("data-kt-menu-trigger") },
            f = function(e) { return KTUtil.child(e, ".menu-link") },
            p = function(e) { return !0 === d(e) ? n.element : !0 === e.classList.contains("menu-sub") ? e : KTUtil.data(e).has("sub") ? KTUtil.data(e).get("sub") : KTUtil.child(e, ".menu-sub") },
            g = function(e) { var t = p(e); return t && parseInt(KTUtil.css(t, "z-index")) > 0 ? "dropdown" : "accordion" },
            v = function(e) { var t, n; return d(e) || e.hasAttribute("data-kt-menu-trigger") ? e : KTUtil.data(e).has("item") ? KTUtil.data(e).get("item") : (t = e.closest(".menu-item[data-kt-menu-trigger]")) ? t : (n = e.closest(".menu-sub")) && !0 === KTUtil.data(n).has("item") ? KTUtil.data(n).get("item") : void 0 },
            T = function(e) { var t, n = e.closest(".menu-sub"); return KTUtil.data(n).has("item") ? KTUtil.data(n).get("item") : n && (t = n.closest(".menu-item[data-kt-menu-trigger]")) ? t : null },
            h = function(e) { var t = e; return KTUtil.data(e).get("sub") && (t = KTUtil.data(e).get("sub")), null !== t && t.querySelector(".menu-item[data-kt-menu-trigger]") || null },
            K = function(e) {
                if (!1 !== KTEventHandler.trigger(n.element, "kt.menu.dropdown.show", e)) {
                    KTMenu.hideDropdowns(e), d(e) || f(e);
                    var t = p(e),
                        i = A(e, "width"),
                        r = A(e, "height"),
                        o = n.options.dropdown.zindex,
                        a = KTUtil.getHighestZindex(e);
                    null !== a && a >= o && (o = a + 1), o > 0 && KTUtil.css(t, "z-index", o), null !== i && KTUtil.css(t, "width", i), null !== r && KTUtil.css(t, "height", r), KTUtil.css(t, "display", ""), KTUtil.css(t, "overflow", ""), E(e, t), KTUtil.addClass(e, "show"), KTUtil.addClass(e, "menu-dropdown"), KTUtil.addClass(t, "show"), !0 === A(e, "overflow") ? (document.body.appendChild(t), KTUtil.data(e).set("sub", t), KTUtil.data(t).set("item", e), KTUtil.data(t).set("menu", n)) : KTUtil.data(t).set("item", e), KTEventHandler.trigger(n.element, "kt.menu.dropdown.shown", e)
                }
            },
            U = function(e) {
                if (!1 !== KTEventHandler.trigger(n.element, "kt.menu.dropdown.hide", e)) {
                    var t = p(e);
                    KTUtil.css(t, "z-index", ""), KTUtil.css(t, "width", ""), KTUtil.css(t, "height", ""), KTUtil.removeClass(e, "show"), KTUtil.removeClass(e, "menu-dropdown"), KTUtil.removeClass(t, "show"), !0 === A(e, "overflow") && (e.classList.contains("menu-item") ? e.appendChild(t) : KTUtil.insertAfter(n.element, e), KTUtil.data(e).remove("sub"), KTUtil.data(t).remove("item"), KTUtil.data(t).remove("menu")), w(e), KTEventHandler.trigger(n.element, "kt.menu.dropdown.hidden", e)
                }
            },
            E = function(e, t) {
                var n, i = A(e, "attach");
                n = i ? "parent" === i ? e.parentNode : document.querySelector(i) : e;
                var r = Popper.createPopper(n, t, b(e));
                KTUtil.data(e).set("popper", r)
            },
            w = function(e) {!0 === KTUtil.data(e).has("popper") && (KTUtil.data(e).get("popper").destroy(), KTUtil.data(e).remove("popper")) },
            b = function(e) {
                var t = A(e, "placement");
                t || (t = "right");
                var n = A(e, "offset"),
                    i = n ? n.split(",") : [];
                return { placement: t, strategy: !0 === A(e, "overflow") ? "absolute" : "fixed", modifiers: [{ name: "offset", options: { offset: i } }, { name: "preventOverflow", options: { altAxis: !1 !== A(e, "flip") } }, { name: "flip", options: { flipVariations: !1 } }] }
            },
            k = function(e) {
                if (!1 !== KTEventHandler.trigger(n.element, "kt.menu.accordion.show", e)) {
                    var t = p(e),
                        i = n.options.accordion.expand;
                    !0 === A(e, "expand") ? i = !0 : !1 === A(e, "expand") ? i = !1 : !0 === A(n.element, "expand") && (i = !0), !1 === i && S(e), !0 === KTUtil.data(e).has("popper") && U(e), KTUtil.addClass(e, "hover"), KTUtil.addClass(e, "showing"), KTUtil.slideDown(t, n.options.accordion.slideSpeed, function() { KTUtil.removeClass(e, "showing"), KTUtil.addClass(e, "show"), KTUtil.addClass(t, "show"), KTEventHandler.trigger(n.element, "kt.menu.accordion.shown", e) })
                }
            },
            y = function(e) {
                if (!1 !== KTEventHandler.trigger(n.element, "kt.menu.accordion.hide", e)) {
                    var t = p(e);
                    KTUtil.addClass(e, "hiding"), KTUtil.slideUp(t, n.options.accordion.slideSpeed, function() { KTUtil.removeClass(e, "hiding"), KTUtil.removeClass(e, "show"), KTUtil.removeClass(t, "show"), KTUtil.removeClass(e, "hover"), KTEventHandler.trigger(n.element, "kt.menu.accordion.hidden", e) })
                }
            },
            S = function(e) {
                var t, i = KTUtil.findAll(n.element, ".show[data-kt-menu-trigger]");
                if (i && i.length > 0)
                    for (var r = 0, o = i.length; r < o; r++) t = i[r], "accordion" === g(t) && t !== e && !1 === e.contains(t) && !1 === t.contains(e) && y(t)
            },
            A = function(e, t) { var n, i = null; return e && e.hasAttribute("data-kt-menu-" + t) && (n = e.getAttribute("data-kt-menu-" + t), null !== (i = KTUtil.getResponsiveValue(n)) && "true" === String(i) ? i = !0 : null !== i && "false" === String(i) && (i = !1)), i };
        !0 === KTUtil.data(e).has("menu") ? n = KTUtil.data(e).get("menu") : (n.options = KTUtil.deepExtend({}, i, t), n.uid = KTUtil.getUniqueId("menu"), n.element = e, n.triggerElement, n.element.setAttribute("data-kt-menu", "true"), u(), s(), KTUtil.data(n.element).set("menu", n)), n.click = function(e, t) { return function(e, t) { t.preventDefault(); var n = v(e); "click" === A(n, "trigger") && (!1 === A(n, "toggle") ? o(n) : r(n)) }(e, t) }, n.link = function(e, t) {!1 !== KTEventHandler.trigger(n.element, "kt.menu.link.click", n) && (KTMenu.hideDropdowns(), KTEventHandler.trigger(n.element, "kt.menu.link.clicked", n)) }, n.dismiss = function(e, t) {
            return function(e, t) {
                var n = v(e),
                    i = function(e) {
                        var t, n = [],
                            i = 0;
                        do {
                            (t = h(e)) && (n.push(t), e = t), i++
                        } while (null !== t && i < 20);
                        return n
                    }(n);
                if (null !== n && "dropdown" === g(n) && (a(n), i.length > 0))
                    for (var r = 0, o = i.length; r < o; r++) null !== i[r] && "dropdown" === g(i[r]) && a(tems[r])
            }(e)
        }, n.mouseover = function(e, t) {
            return function(e, t) {
                var n = v(e);
                null !== n && "hover" === A(n, "trigger") && ("1" === KTUtil.data(n).get("hover") && (clearTimeout(KTUtil.data(n).get("timeout")), KTUtil.data(n).remove("hover"), KTUtil.data(n).remove("timeout")), o(n))
            }(e)
        }, n.mouseout = function(e, t) {
            return function(e, t) {
                var i = v(e);
                if (null !== i && "hover" === A(i, "trigger")) {
                    var r = setTimeout(function() { "1" === KTUtil.data(i).get("hover") && a(i) }, n.options.dropdown.hoverTimeout);
                    KTUtil.data(i).set("hover", "1"), KTUtil.data(i).set("timeout", r)
                }
            }(e)
        }, n.getItemTriggerType = function(e) { return A(e, "trigger") }, n.getItemSubType = function(e) { return g(e) }, n.show = function(e) { return o(e) }, n.hide = function(e) { return a(e) }, n.reset = function(e) { return l(e) }, n.update = function() { return s() }, n.getElement = function() { return n.element }, n.getItemLinkElement = function(e) { return f(e) }, n.getItemToggleElement = function(e) { return function(e) { return n.triggerElement ? n.triggerElement : f(e) }(e) }, n.getItemSubElement = function(e) { return p(e) }, n.getItemParentElements = function(e) {
            return function(e) {
                var t, i = [],
                    r = 0;
                do {
                    (t = T(e)) && (i.push(t), e = t), r++
                } while (null !== t && r < 20);
                return n.triggerElement && i.unshift(n.triggerElement), i
            }(e)
        }, n.isItemSubShown = function(e) { return c(e) }, n.isItemParentShown = function(e) { return function(e) { return KTUtil.parents(e, ".menu-item.show").length > 0 }(e) }, n.getTriggerElement = function() { return n.triggerElement }, n.isItemDropdownPermanent = function(e) { return function(e) { return !0 === A(e, "permanent") }(e) }, n.destroy = function() { KTUtil.data(n.element).remove("menu") }, n.hideAccordions = function(e) { return S(e) }, n.on = function(e, t) { return KTEventHandler.on(n.element, e, t) }, n.one = function(e, t) { return KTEventHandler.one(n.element, e, t) }, n.off = function(e) { return KTEventHandler.off(n.element, e) }
    }
};
KTMenu.getInstance = function(e) { var t; if (KTUtil.data(e).has("menu")) return KTUtil.data(e).get("menu"); if ((t = e.closest(".menu")) && KTUtil.data(t).has("menu")) return KTUtil.data(t).get("menu"); if (KTUtil.hasClass(e, "menu-link")) { var n = e.closest(".menu-sub"); if (KTUtil.data(n).has("menu")) return KTUtil.data(n).get("menu") } return null }, KTMenu.hideDropdowns = function(e) {
    var t = document.querySelectorAll(".show.menu-dropdown[data-kt-menu-trigger]");
    if (t && t.length > 0)
        for (var n = 0, i = t.length; n < i; n++) {
            var r = t[n],
                o = KTMenu.getInstance(r);
            o && "dropdown" === o.getItemSubType(r) && (e ? !1 === o.getItemSubElement(r).contains(e) && !1 === r.contains(e) && r !== e && o.hide(r) : o.hide(r))
        }
}, KTMenu.updateDropdowns = function() {
    var e = document.querySelectorAll(".show.menu-dropdown[data-kt-menu-trigger]");
    if (e && e.length > 0)
        for (var t = 0, n = e.length; t < n; t++) {
            var i = e[t];
            KTUtil.data(i).has("popper") && KTUtil.data(i).get("popper").forceUpdate()
        }
}, KTMenu.initGlobalHandlers = function() {
    document.addEventListener("click", function(e) {
        var t, n, i, r = document.querySelectorAll(".show.menu-dropdown[data-kt-menu-trigger]");
        if (r && r.length > 0)
            for (var o = 0, a = r.length; o < a; o++)
                if (t = r[o], (i = KTMenu.getInstance(t)) && "dropdown" === i.getItemSubType(t)) {
                    if (i.getElement(), n = i.getItemSubElement(t), t === e.target || t.contains(e.target)) continue;
                    if (n === e.target || n.contains(e.target)) continue;
                    i.hide(t)
                }
    }), KTUtil.on(document.body, '.menu-item[data-kt-menu-trigger] > .menu-link, [data-kt-menu-trigger]:not(.menu-item):not([data-kt-menu-trigger="auto"])', "click", function(e) { var t = KTMenu.getInstance(this); if (null !== t) return t.click(this, e) }), KTUtil.on(document.body, ".menu-item:not([data-kt-menu-trigger]) > .menu-link", "click", function(e) { var t = KTMenu.getInstance(this); if (null !== t) return t.link(this, e) }), KTUtil.on(document.body, '[data-kt-menu-dismiss="true"]', "click", function(e) { var t = KTMenu.getInstance(this); if (null !== t) return t.dismiss(this, e) }), KTUtil.on(document.body, "[data-kt-menu-trigger], .menu-sub", "mouseover", function(e) { var t = KTMenu.getInstance(this); if (null !== t && "dropdown" === t.getItemSubType(this)) return t.mouseover(this, e) }), KTUtil.on(document.body, "[data-kt-menu-trigger], .menu-sub", "mouseout", function(e) { var t = KTMenu.getInstance(this); if (null !== t && "dropdown" === t.getItemSubType(this)) return t.mouseout(this, e) }), window.addEventListener("resize", function() {
        var e;
        KTUtil.throttle(void 0, function() {
            var t = document.querySelectorAll('[data-kt-menu="true"]');
            if (t && t.length > 0)
                for (var n = 0, i = t.length; n < i; n++)(e = KTMenu.getInstance(t[n])) && e.update()
        }, 200)
    })
}, KTMenu.createInstances = function(e = '[data-kt-menu="true"]') {
    var t = document.querySelectorAll(e);
    if (t && t.length > 0)
        for (var n = 0, i = t.length; n < i; n++) new KTMenu(t[n])
}, KTMenu.init = function() { KTMenu.initGlobalHandlers(), KTMenu.createInstances() }, "loading" === document.readyState ? document.addEventListener("DOMContentLoaded", KTMenu.init) : KTMenu.init(), "undefined" != typeof module && void 0 !== module.exports && (module.exports = KTMenu);
var KTPasswordMeter = function(e, t) {
    var n = this;
    if (e) {
        var i = { minLength: 8, checkUppercase: !0, checkLowercase: !0, checkDigit: !0, checkChar: !0, scoreHighlightClass: "active" },
            r = function() { n.inputElement.addEventListener("input", function() { o() }), n.visibilityElement && n.visibilityElement.addEventListener("click", function() { f() }) },
            o = function() {
                var e = 0,
                    t = c();
                !0 === a() && (e += t), !0 === n.options.checkUppercase && !0 === l() && (e += t), !0 === n.options.checkLowercase && !0 === s() && (e += t), !0 === n.options.checkDigit && !0 === u() && (e += t), !0 === n.options.checkChar && !0 === d() && (e += t), n.score = e, m()
            },
            a = function() { return n.inputElement.value.length >= n.options.minLength },
            l = function() { return /[a-z]/.test(n.inputElement.value) },
            s = function() { return /[A-Z]/.test(n.inputElement.value) },
            u = function() { return /[0-9]/.test(n.inputElement.value) },
            d = function() { return /[~`!#$%\^&*+=\-\[\]\\';,/{}|\\":<>\?]/g.test(n.inputElement.value) },
            c = function() { var e = 1; return !0 === n.options.checkUppercase && e++, !0 === n.options.checkLowercase && e++, !0 === n.options.checkDigit && e++, !0 === n.options.checkChar && e++, n.checkSteps = e, 100 / n.checkSteps },
            m = function() {
                var e = [].slice.call(n.highlightElement.querySelectorAll("div")),
                    t = e.length,
                    i = 0,
                    r = c(),
                    o = p();
                e.map(function(e) { r * ++i * (n.checkSteps / t) <= o ? e.classList.add("active") : e.classList.remove("active") })
            },
            f = function() {
                var e = n.visibilityElement.querySelector("i:not(.d-none), .svg-icon:not(.d-none)"),
                    t = n.visibilityElement.querySelector("i.d-none, .svg-icon.d-none");
                "password" === n.inputElement.getAttribute("type").toLowerCase() ? n.inputElement.setAttribute("type", "text") : n.inputElement.setAttribute("type", "password"), e.classList.add("d-none"), t.classList.remove("d-none"), n.inputElement.focus()
            },
            p = function() { return n.score };
        !0 === KTUtil.data(e).has("password-meter") ? n = KTUtil.data(e).get("password-meter") : (n.options = KTUtil.deepExtend({}, i, t), n.score = 0, n.checkSteps = 5, n.element = e, n.inputElement = n.element.querySelector("input[type]"), n.visibilityElement = n.element.querySelector('[data-kt-password-meter-control="visibility"]'), n.highlightElement = n.element.querySelector('[data-kt-password-meter-control="highlight"]'), n.element.setAttribute("data-kt-password-meter", "true"), r(), KTUtil.data(n.element).set("password-meter", n)), n.check = function() { return o() }, n.getScore = function() { return p() }, n.reset = function() { return n.score = 0, void m() }, n.destroy = function() { KTUtil.data(n.element).remove("password-meter") }
    }
};
KTPasswordMeter.getInstance = function(e) { return null !== e && KTUtil.data(e).has("password-meter") ? KTUtil.data(e).get("password-meter") : null }, KTPasswordMeter.createInstances = function(e = "[data-kt-password-meter]") {
    var t = document.body.querySelectorAll(e);
    if (t && t.length > 0)
        for (var n = 0, i = t.length; n < i; n++) new KTPasswordMeter(t[n])
}, KTPasswordMeter.init = function() { KTPasswordMeter.createInstances() }, "loading" === document.readyState ? document.addEventListener("DOMContentLoaded", KTPasswordMeter.init) : KTPasswordMeter.init(), "undefined" != typeof module && void 0 !== module.exports && (module.exports = KTPasswordMeter);
var KTScroll = function(e, t) {
    var n = this;
    if (document.getElementsByTagName("BODY")[0], e) {
        var i = { saveState: !0 },
            r = function() { KTCookie.set(n.id + "st", n.element.scrollTop) },
            o = function() {
                var e, t;
                !0 === c("activate") || !1 === n.element.hasAttribute("data-kt-scroll-activate") ? (e = m(), null !== (t = l()) && t.length > 0 ? KTUtil.css(n.element, e, t) : KTUtil.css(n.element, e, ""), a(), !0 === c("save-state") && void 0 !== KTCookie && n.id ? n.element.addEventListener("scroll", r) : n.element.removeEventListener("scroll", r), function() {
                    if (!0 === c("save-state") && void 0 !== KTCookie && n.id && KTCookie.get(n.id + "st")) {
                        var e = parseInt(KTCookie.get(n.id + "st"));
                        e > 0 && (n.element.scrollTop = e)
                    }
                }()) : (KTUtil.css(n.element, m(), ""), n.element.removeEventListener("scroll", r))
            },
            a = function() {
                var e = c("stretch");
                if (null !== e) {
                    var t = document.querySelectorAll(e);
                    if (t && 2 == t.length) {
                        var i = t[0],
                            r = t[1],
                            o = u(r) - u(i);
                        if (o > 0) {
                            var a = parseInt(KTUtil.css(n.element, m())) + o;
                            KTUtil.css(n.element, m(), String(a) + "px")
                        }
                    }
                }
            },
            l = function() { var e = c(m()); return e instanceof Function ? e.call() : null !== e && "string" == typeof e && "auto" === e.toLowerCase() ? s() : e },
            s = function() {
                var e, t = KTUtil.getViewPort().height,
                    i = c("dependencies"),
                    r = c("wrappers"),
                    o = c("offset");
                if (t -= d(n.element), null !== i && (e = document.querySelectorAll(i)) && e.length > 0)
                    for (var a = 0, l = e.length; a < l; a++) !1 !== KTUtil.visible(e[a]) && (t -= u(e[a]));
                if (null !== r && (e = document.querySelectorAll(r)) && e.length > 0)
                    for (a = 0, l = e.length; a < l; a++) !1 !== KTUtil.visible(e[a]) && (t -= d(e[a]));
                return null !== o && "object" != typeof o && (t -= parseInt(o)), String(t) + "px"
            },
            u = function(e) { var t = 0; return null !== e && (t += parseInt(KTUtil.css(e, "height")), t += parseInt(KTUtil.css(e, "margin-top")), t += parseInt(KTUtil.css(e, "margin-bottom")), KTUtil.css(e, "border-top") && (t += parseInt(KTUtil.css(e, "border-top"))), KTUtil.css(e, "border-bottom") && (t += parseInt(KTUtil.css(e, "border-bottom")))), t },
            d = function(e) { var t = 0; return null !== e && (t += parseInt(KTUtil.css(e, "margin-top")), t += parseInt(KTUtil.css(e, "margin-bottom")), t += parseInt(KTUtil.css(e, "padding-top")), t += parseInt(KTUtil.css(e, "padding-bottom")), KTUtil.css(e, "border-top") && (t += parseInt(KTUtil.css(e, "border-top"))), KTUtil.css(e, "border-bottom") && (t += parseInt(KTUtil.css(e, "border-bottom")))), t },
            c = function(e) {
                if (!0 === n.element.hasAttribute("data-kt-scroll-" + e)) {
                    var t = n.element.getAttribute("data-kt-scroll-" + e),
                        i = KTUtil.getResponsiveValue(t);
                    return null !== i && "true" === String(i) ? i = !0 : null !== i && "false" === String(i) && (i = !1), i
                }
                var r = KTUtil.snakeToCamel(e);
                return n.options[r] ? KTUtil.getResponsiveValue(n.options[r]) : null
            },
            m = function() { return c("height") ? "height" : c("min-height") ? "min-height" : c("max-height") ? "max-height" : void 0 };
        KTUtil.data(e).has("scroll") ? n = KTUtil.data(e).get("scroll") : (n.options = KTUtil.deepExtend({}, i, t), n.element = e, n.id = n.element.getAttribute("id"), n.element.setAttribute("data-kt-scroll", "true"), o(), KTUtil.data(n.element).set("scroll", n)), n.update = function() { return o() }, n.getHeight = function() { return l() }, n.getElement = function() { return n.element }, n.destroy = function() { KTUtil.data(n.element).remove("scroll") }
    }
};
KTScroll.getInstance = function(e) { return null !== e && KTUtil.data(e).has("scroll") ? KTUtil.data(e).get("scroll") : null }, KTScroll.createInstances = function(e = '[data-kt-scroll="true"]') {
    var t = document.getElementsByTagName("BODY")[0].querySelectorAll(e);
    if (t && t.length > 0)
        for (var n = 0, i = t.length; n < i; n++) new KTScroll(t[n])
}, window.addEventListener("resize", function() {
    var e = document.getElementsByTagName("BODY")[0];
    KTUtil.throttle(void 0, function() {
        var t = e.querySelectorAll('[data-kt-scroll="true"]');
        if (t && t.length > 0)
            for (var n = 0, i = t.length; n < i; n++) {
                var r = KTScroll.getInstance(t[n]);
                r && r.update()
            }
    }, 200)
}), KTScroll.init = function() { KTScroll.createInstances() }, "loading" === document.readyState ? document.addEventListener("DOMContentLoaded", KTScroll.init) : KTScroll.init(), "undefined" != typeof module && void 0 !== module.exports && (module.exports = KTScroll);
var KTScrolltop = function(e, t) {
    var n = this,
        i = document.getElementsByTagName("BODY")[0];
    if (null != e) {
        var r = { offset: 300, speed: 600 },
            o = function() { window.addEventListener("scroll", function() { KTUtil.throttle(void 0, function() { a() }, 200) }), KTUtil.addEvent(n.element, "click", function(e) { e.preventDefault(), l() }) },
            a = function() {
                var e = parseInt(s("offset"));
                KTUtil.getScrollTop() > e ? !1 === i.hasAttribute("data-kt-scrolltop") && i.setAttribute("data-kt-scrolltop", "on") : !0 === i.hasAttribute("data-kt-scrolltop") && i.removeAttribute("data-kt-scrolltop")
            },
            l = function() {
                var e = parseInt(s("speed"));
                KTUtil.scrollTop(0, e)
            },
            s = function(e) {
                if (!0 === n.element.hasAttribute("data-kt-scrolltop-" + e)) {
                    var t = n.element.getAttribute("data-kt-scrolltop-" + e),
                        i = KTUtil.getResponsiveValue(t);
                    return null !== i && "true" === String(i) ? i = !0 : null !== i && "false" === String(i) && (i = !1), i
                }
                var r = KTUtil.snakeToCamel(e);
                return n.options[r] ? KTUtil.getResponsiveValue(n.options[r]) : null
            };
        KTUtil.data(e).has("scrolltop") ? n = KTUtil.data(e).get("scrolltop") : (n.options = KTUtil.deepExtend({}, r, t), n.uid = KTUtil.getUniqueId("scrolltop"), n.element = e, n.element.setAttribute("data-kt-scrolltop", "true"), o(), KTUtil.data(n.element).set("scrolltop", n)), n.go = function() { return l() }, n.getElement = function() { return n.element }, n.destroy = function() { KTUtil.data(n.element).remove("scrolltop") }
    }
};
KTScrolltop.getInstance = function(e) { return e && KTUtil.data(e).has("scrolltop") ? KTUtil.data(e).get("scrolltop") : null }, KTScrolltop.createInstances = function(e = '[data-kt-scrolltop="true"]') {
    var t = document.getElementsByTagName("BODY")[0].querySelectorAll(e);
    if (t && t.length > 0)
        for (var n = 0, i = t.length; n < i; n++) new KTScrolltop(t[n])
}, KTScrolltop.init = function() { KTScrolltop.createInstances() }, "loading" === document.readyState ? document.addEventListener("DOMContentLoaded", KTScrolltop.init) : KTScrolltop.init(), "undefined" != typeof module && void 0 !== module.exports && (module.exports = KTScrolltop);
var KTSearch = function(e, t) {
    var n = this;
    if (e) {
        var i = { minLength: 2, keypress: !0, enter: !0, layout: "menu", responsive: null, showOnFocus: !0 },
            r = function() { n.inputElement.addEventListener("focus", o), n.inputElement.addEventListener("blur", a), !0 === p("keypress") && n.inputElement.addEventListener("input", s), n.submitElement && n.submitElement.addEventListener("click", u), !0 === p("enter") && n.inputElement.addEventListener("keypress", l), n.clearElement && n.clearElement.addEventListener("click", d), n.menuObject && (n.toggleElement && (n.toggleElement.addEventListener("click", m), n.menuObject.on("kt.menu.dropdown.show", function(e) { KTUtil.visible(n.toggleElement) && (n.toggleElement.classList.add("active"), n.toggleElement.classList.add("show")) }), n.menuObject.on("kt.menu.dropdown.hide", function(e) { KTUtil.visible(n.toggleElement) && (n.toggleElement.classList.remove("active"), n.toggleElement.classList.remove("show")) })), n.menuObject.on("kt.menu.dropdown.shown", function() { n.inputElement.focus() })), window.addEventListener("resize", function() { KTUtil.throttle(void 0, function() { c() }, 200) }) },
            o = function() { n.element.classList.add("focus"), (!0 === p("show-on-focus") || n.inputElement.value.length >= minLength) && m() },
            a = function() { n.element.classList.remove("focus") },
            l = function(e) { 13 == (e.charCode || e.keyCode || 0) && (e.preventDefault(), u()) },
            s = function() {
                if (p("min-length")) {
                    var e = parseInt(p("min-length"));
                    n.inputElement.value.length >= e ? u() : 0 === n.inputElement.value.length && d()
                }
            },
            u = function() {!1 === n.processing && (n.spinnerElement && n.spinnerElement.classList.remove("d-none"), n.clearElement && n.clearElement.classList.add("d-none"), n.toolbarElement && n.formElement.contains(n.toolbarElement) && n.toolbarElement.classList.add("d-none"), n.inputElement.focus(), n.processing = !0, KTEventHandler.trigger(n.element, "kt.search.process", n)) },
            d = function() {!1 !== KTEventHandler.trigger(n.element, "kt.search.clear", n) && (n.inputElement.value = "", n.inputElement.focus(), n.clearElement && n.clearElement.classList.add("d-none"), n.toolbarElement && n.formElement.contains(n.toolbarElement) && n.toolbarElement.classList.remove("d-none"), !1 === p("show-on-focus") && f(), KTEventHandler.trigger(n.element, "kt.search.cleared", n)) },
            c = function() { if ("menu" === n.layout) { var e = v(); "on" === e && !1 === n.contentElement.contains(n.formElement) ? (n.contentElement.prepend(n.formElement), n.formElement.classList.remove("d-none")) : "off" === e && !0 === n.contentElement.contains(n.formElement) && (n.element.prepend(n.formElement), n.formElement.classList.add("d-none")) } },
            m = function() { n.menuObject && (c(), n.menuObject.show(n.element)) },
            f = function() { n.menuObject && (c(), n.menuObject.hide(n.element)) },
            p = function(e) {
                if (!0 === n.element.hasAttribute("data-kt-search-" + e)) {
                    var t = n.element.getAttribute("data-kt-search-" + e),
                        i = KTUtil.getResponsiveValue(t);
                    return null !== i && "true" === String(i) ? i = !0 : null !== i && "false" === String(i) && (i = !1), i
                }
                var r = KTUtil.snakeToCamel(e);
                return n.options[r] ? KTUtil.getResponsiveValue(n.options[r]) : null
            },
            g = function(e) { return n.element.querySelector('[data-kt-search-element="' + e + '"]') },
            v = function() {
                var e = p("responsive"),
                    t = KTUtil.getViewPort().width;
                if (!e) return null;
                var n = KTUtil.getBreakpoint(e);
                return n || (n = parseInt(e)), t < n ? "on" : "off"
            };
        !0 === KTUtil.data(e).has("search") ? n = KTUtil.data(e).get("search") : (n.options = KTUtil.deepExtend({}, i, t), n.processing = !1, n.element = e, n.contentElement = g("content"), n.formElement = g("form"), n.inputElement = g("input"), n.spinnerElement = g("spinner"), n.clearElement = g("clear"), n.toggleElement = g("toggle"), n.submitElement = g("submit"), n.toolbarElement = g("toolbar"), n.resultsElement = g("results"), n.suggestionElement = g("suggestion"), n.emptyElement = g("empty"), n.element.setAttribute("data-kt-search", "true"), n.layout = p("layout"), "menu" === n.layout ? n.menuObject = new KTMenu(n.contentElement) : n.menuObject = null, c(), r(), KTUtil.data(n.element).set("search", n)), n.show = function() { return m() }, n.hide = function() { return f() }, n.update = function() { return c() }, n.search = function() { return u() }, n.complete = function() { return n.spinnerElement && n.spinnerElement.classList.add("d-none"), n.clearElement && n.clearElement.classList.remove("d-none"), 0 === n.inputElement.value.length && d(), n.inputElement.focus(), m(), void(n.processing = !1) }, n.clear = function() { return d() }, n.isProcessing = function() { return n.processing }, n.getQuery = function() { return n.inputElement.value }, n.getMenu = function() { return n.menuObject }, n.getFormElement = function() { return n.formElement }, n.getInputElement = function() { return n.inputElement }, n.getContentElement = function() { return n.contentElement }, n.getElement = function() { return n.element }, n.destroy = function() { KTUtil.data(n.element).remove("search") }, n.on = function(e, t) { return KTEventHandler.on(n.element, e, t) }, n.one = function(e, t) { return KTEventHandler.one(n.element, e, t) }, n.off = function(e) { return KTEventHandler.off(n.element, e) }
    }
};
KTSearch.getInstance = function(e) { return null !== e && KTUtil.data(e).has("search") ? KTUtil.data(e).get("search") : null }, "undefined" != typeof module && void 0 !== module.exports && (module.exports = KTSearch);
var KTStepper = function(e, t) {
    var n = this;
    if (document.getElementsByTagName("BODY")[0], null != e) {
        var i = { startIndex: 1, animation: !1, animationSpeed: "0.3s", animationNextClass: "animate__animated animate__slideInRight animate__fast", animationPreviousClass: "animate__animated animate__slideInLeft animate__fast" },
            r = function(e) { if (KTEventHandler.trigger(n.element, "kt.stepper.change", n), !(e === n.currentStepIndex || e > n.totalStepsNumber || e < 0)) return e = parseInt(e), n.passedStepIndex = n.currentStepIndex, n.currentStepIndex = e, o(), KTEventHandler.trigger(n.element, "kt.stepper.changed", n), n },
            o = function() {
                var e;
                e = a() ? "last" : l() ? "first" : "between", KTUtil.removeClass(n.element, "last"), KTUtil.removeClass(n.element, "first"), KTUtil.removeClass(n.element, "between"), KTUtil.addClass(n.element, e);
                var t = KTUtil.findAll(n.element, '[data-kt-stepper-element="nav"], [data-kt-stepper-element="content"], [data-kt-stepper-element="info"]');
                if (t && t.length > 0)
                    for (var i = 0, r = t.length; i < r; i++) {
                        var o = t[i],
                            u = KTUtil.index(o) + 1;
                        if (KTUtil.removeClass(o, "current"), KTUtil.removeClass(o, "completed"), KTUtil.removeClass(o, "pending"), u == n.currentStepIndex) {
                            if (KTUtil.addClass(o, "current"), !1 !== n.options.animation && "content" == o.getAttribute("data-kt-stepper-element")) {
                                KTUtil.css(o, "animationDuration", n.options.animationSpeed);
                                var d = "previous" === s(n.passedStepIndex) ? n.options.animationPreviousClass : n.options.animationNextClass;
                                KTUtil.animateClass(o, d)
                            }
                        } else u < n.currentStepIndex ? KTUtil.addClass(o, "completed") : KTUtil.addClass(o, "pending")
                    }
            },
            a = function() { return n.currentStepIndex === n.totalStepsNumber },
            l = function() { return 1 === n.currentStepIndex },
            s = function(e) { return e > n.currentStepIndex ? "next" : "previous" };
        !0 === KTUtil.data(e).has("stepper") ? n = KTUtil.data(e).get("stepper") : (n.options = KTUtil.deepExtend({}, i, t), n.uid = KTUtil.getUniqueId("stepper"), n.element = e, n.element.setAttribute("data-kt-stepper", "true"), n.steps = KTUtil.findAll(n.element, '[data-kt-stepper-element="nav"]'), n.btnNext = KTUtil.find(n.element, '[data-kt-stepper-action="next"]'), n.btnPrevious = KTUtil.find(n.element, '[data-kt-stepper-action="previous"]'), n.btnSubmit = KTUtil.find(n.element, '[data-kt-stepper-action="submit"]'), n.totalStepsNumber = n.steps.length, n.passedStepIndex = 0, n.currentStepIndex = 1, n.clickedStepIndex = 0, n.options.startIndex > 1 && r(n.options.startIndex), KTUtil.addEvent(n.btnNext, "click", function(e) { e.preventDefault(), KTEventHandler.trigger(n.element, "kt.stepper.next", n) }), KTUtil.addEvent(n.btnPrevious, "click", function(e) { e.preventDefault(), KTEventHandler.trigger(n.element, "kt.stepper.previous", n) }), KTUtil.on(n.element, '[data-kt-stepper-action="step"]', "click", function(e) {
            if (e.preventDefault(), n.steps && n.steps.length > 0)
                for (var t = 0, i = n.steps.length; t < i; t++)
                    if (n.steps[t] === this) return n.clickedStepIndex = t + 1, void KTEventHandler.trigger(n.element, "kt.stepper.click", n)
        }), KTUtil.data(n.element).set("stepper", n)), n.getElement = function(e) { return n.element }, n.goTo = function(e) { return r(e) }, n.goPrevious = function() { return r(n.currentStepIndex - 1 > 1 ? n.currentStepIndex - 1 : 1) }, n.goNext = function() { return r(n.totalStepsNumber >= n.currentStepIndex + 1 ? n.currentStepIndex + 1 : n.totalStepsNumber) }, n.goFirst = function() { return r(1) }, n.goLast = function() { return r(n.totalStepsNumber) }, n.getCurrentStepIndex = function() { return n.currentStepIndex }, n.getNextStepIndex = function() { return n.nextStepIndex }, n.getPassedStepIndex = function() { return n.passedStepIndex }, n.getClickedStepIndex = function() { return n.clickedStepIndex }, n.getPreviousStepIndex = function() { return n.PreviousStepIndex }, n.destroy = function() { KTUtil.data(n.element).remove("stepper") }, n.on = function(e, t) { return KTEventHandler.on(n.element, e, t) }, n.one = function(e, t) { return KTEventHandler.one(n.element, e, t) }, n.off = function(e) { return KTEventHandler.off(n.element, e) }, n.trigger = function(e, t) { return KTEventHandler.trigger(n.element, e, t, n, t) }
    }
};
KTStepper.getInstance = function(e) { return null !== e && KTUtil.data(e).has("stepper") ? KTUtil.data(e).get("stepper") : null }, "undefined" != typeof module && void 0 !== module.exports && (module.exports = KTStepper);
var KTSticky = function(e, t) {
    var n = this,
        i = document.getElementsByTagName("BODY")[0];
    if (null != e) {
        var r = { offset: 200, releaseOffset: 0, reverse: !1, animation: !0, animationSpeed: "0.3s", animationClass: "animation-slide-in-down" },
            o = function(e) {
                var t, r, o = u("offset"),
                    s = u("release-offset"),
                    d = u("reverse");
                !1 !== o && (o = parseInt(o), s = s ? parseInt(s) : 0, t = KTUtil.getScrollTop(), r = document.documentElement.scrollHeight - window.innerHeight - KTUtil.getScrollTop(), !0 === d ? (t > o && (0 === s || s < r) ? (!1 === i.hasAttribute(n.attributeName) && (a(), i.setAttribute(n.attributeName, "on")), !0 === n.eventTriggerState && (KTEventHandler.trigger(n.element, "kt.sticky.on", n), KTEventHandler.trigger(n.element, "kt.sticky.change", n), n.eventTriggerState = !1)) : (!0 === i.hasAttribute(n.attributeName) && (l(), i.removeAttribute(n.attributeName)), !1 === n.eventTriggerState && (KTEventHandler.trigger(n.element, "kt.sticky.off", n), KTEventHandler.trigger(n.element, "kt.sticky.change", n), n.eventTriggerState = !0)), n.lastScrollTop = t) : t > o && (0 === s || s < r) ? (!1 === i.hasAttribute(n.attributeName) && (a(), i.setAttribute(n.attributeName, "on")), !0 === n.eventTriggerState && (KTEventHandler.trigger(n.element, "kt.sticky.on", n), KTEventHandler.trigger(n.element, "kt.sticky.change", n), n.eventTriggerState = !1)) : (!0 === i.hasAttribute(n.attributeName) && (l(), i.removeAttribute(n.attributeName)), !1 === n.eventTriggerState && (KTEventHandler.trigger(n.element, "kt.sticky.off", n), KTEventHandler.trigger(n.element, "kt.sticky.change", n), n.eventTriggerState = !0)), s > 0 && (r < s ? n.element.setAttribute("data-kt-sticky-released", "true") : n.element.removeAttribute("data-kt-sticky-released")))
            },
            a = function(e) {
                var t = u("top"),
                    i = u("left"),
                    r = u("right"),
                    o = u("width"),
                    a = u("zindex"),
                    l = u("dependencies"),
                    d = u("class"),
                    c = s();
                if (!0 !== e && !0 === u("animation") && (KTUtil.css(n.element, "animationDuration", u("animationSpeed")), KTUtil.animateClass(n.element, "animation " + u("animationClass"))), null !== d && KTUtil.addClass(n.element, d), null !== a && (KTUtil.css(n.element, "z-index", a), KTUtil.css(n.element, "position", "fixed")), null !== t && KTUtil.css(n.element, "top", t), null !== o) {
                    if (o.target) {
                        var m = document.querySelector(o.target);
                        m && (o = KTUtil.css(m, "width"))
                    }
                    KTUtil.css(n.element, "width", o)
                }
                if (null !== i)
                    if ("auto" === String(i).toLowerCase()) {
                        var f = KTUtil.offset(n.element).left;
                        f > 0 && KTUtil.css(n.element, "left", String(f) + "px")
                    } else KTUtil.css(n.element, "left", i);
                if (null !== r && KTUtil.css(n.element, "right", r), null !== l) {
                    var p = document.querySelectorAll(l);
                    if (p && p.length > 0)
                        for (var g = 0, v = p.length; g < v; g++) KTUtil.css(p[g], "padding-top", String(c) + "px")
                }
            },
            l = function() {
                KTUtil.css(n.element, "top", ""), KTUtil.css(n.element, "width", ""), KTUtil.css(n.element, "left", ""), KTUtil.css(n.element, "right", ""), KTUtil.css(n.element, "z-index", ""), KTUtil.css(n.element, "position", "");
                var e = u("dependencies"),
                    t = u("class");
                if (null !== t && KTUtil.removeClass(n.element, t), null !== e) {
                    var i = document.querySelectorAll(e);
                    if (i && i.length > 0)
                        for (var r = 0, o = i.length; r < o; r++) KTUtil.css(i[r], "padding-top", "")
                }
            },
            s = function() { var t = parseFloat(KTUtil.css(n.element, "height")); return t += parseFloat(KTUtil.css(n.element, "margin-top")), t += parseFloat(KTUtil.css(n.element, "margin-bottom")), KTUtil.css(e, "border-top") && (t += parseFloat(KTUtil.css(n.element, "border-top"))), KTUtil.css(e, "border-bottom") && (t += parseFloat(KTUtil.css(n.element, "border-bottom"))), t },
            u = function(e) {
                if (!0 === n.element.hasAttribute("data-kt-sticky-" + e)) {
                    var t = n.element.getAttribute("data-kt-sticky-" + e),
                        i = KTUtil.getResponsiveValue(t);
                    return null !== i && "true" === String(i) ? i = !0 : null !== i && "false" === String(i) && (i = !1), i
                }
                var r = KTUtil.snakeToCamel(e);
                return n.options[r] ? KTUtil.getResponsiveValue(n.options[r]) : null
            };
        !0 === KTUtil.data(e).has("sticky") ? n = KTUtil.data(e).get("sticky") : (n.element = e, n.options = KTUtil.deepExtend({}, r, t), n.uid = KTUtil.getUniqueId("sticky"), n.name = n.element.getAttribute("data-kt-sticky-name"), n.attributeName = "data-kt-sticky-" + n.name, n.eventTriggerState = !0, n.lastScrollTop = 0, n.scrollHandler, n.element.setAttribute("data-kt-sticky", "true"), window.addEventListener("scroll", o), o(), KTUtil.data(n.element).set("sticky", n)), n.update = function() {!0 === i.hasAttribute(n.attributeName) && (l(), i.removeAttribute(n.attributeName), a(!0), i.setAttribute(n.attributeName, "on")) }, n.destroy = function() { return window.removeEventListener("scroll", o), void KTUtil.data(n.element).remove("sticky") }, n.on = function(e, t) { return KTEventHandler.on(n.element, e, t) }, n.one = function(e, t) { return KTEventHandler.one(n.element, e, t) }, n.off = function(e) { return KTEventHandler.off(n.element, e) }, n.trigger = function(e, t) { return KTEventHandler.trigger(n.element, e, t, n, t) }
    }
};
KTSticky.getInstance = function(e) { return null !== e && KTUtil.data(e).has("sticky") ? KTUtil.data(e).get("sticky") : null }, KTSticky.createInstances = function(e = '[data-kt-sticky="true"]') {
    var t = document.getElementsByTagName("BODY")[0].querySelectorAll(e);
    if (t && t.length > 0)
        for (var n = 0, i = t.length; n < i; n++) new KTSticky(t[n])
}, window.addEventListener("resize", function() {
    var e = document.getElementsByTagName("BODY")[0];
    KTUtil.throttle(void 0, function() {
        var t = e.querySelectorAll('[data-kt-sticky="true"]');
        if (t && t.length > 0)
            for (var n = 0, i = t.length; n < i; n++) {
                var r = KTSticky.getInstance(t[n]);
                r && r.update()
            }
    }, 200)
}), KTSticky.init = function() { KTSticky.createInstances() }, "loading" === document.readyState ? document.addEventListener("DOMContentLoaded", KTSticky.init) : KTSticky.init(), "undefined" != typeof module && void 0 !== module.exports && (module.exports = KTSticky);
var KTSwapper = function(e, t) {
    var n = this;
    if (null != e) {
        var i = { mode: "append" },
            r = function(t) {
                var n = o("parent"),
                    i = o("mode"),
                    r = n ? document.querySelector(n) : null;
                r && e.parentNode !== r && ("prepend" === i ? r.prepend(e) : "append" === i && r.append(e))
            },
            o = function(e) {
                if (!0 === n.element.hasAttribute("data-kt-swapper-" + e)) {
                    var t = n.element.getAttribute("data-kt-swapper-" + e),
                        i = KTUtil.getResponsiveValue(t);
                    return null !== i && "true" === String(i) ? i = !0 : null !== i && "false" === String(i) && (i = !1), i
                }
                var r = KTUtil.snakeToCamel(e);
                return n.options[r] ? KTUtil.getResponsiveValue(n.options[r]) : null
            };
        !0 === KTUtil.data(e).has("swapper") ? n = KTUtil.data(e).get("swapper") : (n.element = e, n.options = KTUtil.deepExtend({}, i, t), n.element.setAttribute("data-kt-swapper", "true"), r(), KTUtil.data(n.element).set("swapper", n)), n.update = function() { r() }, n.destroy = function() { KTUtil.data(n.element).remove("swapper") }, n.on = function(e, t) { return KTEventHandler.on(n.element, e, t) }, n.one = function(e, t) { return KTEventHandler.one(n.element, e, t) }, n.off = function(e) { return KTEventHandler.off(n.element, e) }, n.trigger = function(e, t) { return KTEventHandler.trigger(n.element, e, t, n, t) }
    }
};
KTSwapper.getInstance = function(e) { return null !== e && KTUtil.data(e).has("swapper") ? KTUtil.data(e).get("swapper") : null }, KTSwapper.createInstances = function(e = '[data-kt-swapper="true"]') {
    var t = document.querySelectorAll(e);
    if (t && t.length > 0)
        for (var n = 0, i = t.length; n < i; n++) new KTSwapper(t[n])
}, window.addEventListener("resize", function() {
    KTUtil.throttle(void 0, function() {
        var e = document.querySelectorAll('[data-kt-swapper="true"]');
        if (e && e.length > 0)
            for (var t = 0, n = e.length; t < n; t++) {
                var i = KTSwapper.getInstance(e[t]);
                i && i.update()
            }
    }, 200)
}), KTSwapper.init = function() { KTSwapper.createInstances() }, "loading" === document.readyState ? document.addEventListener("DOMContentLoaded", KTSwapper.init) : KTSwapper.init(), "undefined" != typeof module && void 0 !== module.exports && (module.exports = KTSwapper);
var KTToggle = function(e, t) {
    var n = this;
    if (document.getElementsByTagName("BODY")[0], e) {
        var i = { saveState: !0 },
            r = function() { KTUtil.addEvent(n.element, "click", function(e) { e.preventDefault(), o() }) },
            o = function() { return KTEventHandler.trigger(n.element, "kt.toggle.change", n), s() ? l() : a(), KTEventHandler.trigger(n.element, "kt.toggle.changed", n), n },
            a = function() { if (!0 !== s()) return KTEventHandler.trigger(n.element, "kt.toggle.enable", n), n.target.setAttribute(n.attribute, "on"), n.state.length > 0 && n.element.classList.add(n.state), void 0 !== KTCookie && !0 === n.options.saveState && KTCookie.set(n.attribute, "on"), KTEventHandler.trigger(n.element, "kt.toggle.enabled", n), n },
            l = function() { if (!1 !== s()) return KTEventHandler.trigger(n.element, "kt.toggle.disable", n), n.target.removeAttribute(n.attribute), n.state.length > 0 && n.element.classList.remove(n.state), void 0 !== KTCookie && !0 === n.options.saveState && KTCookie.remove(n.attribute), KTEventHandler.trigger(n.element, "kt.toggle.disabled", n), n },
            s = function() { return "on" === String(n.target.getAttribute(n.attribute)).toLowerCase() };
        !0 === KTUtil.data(e).has("toggle") ? n = KTUtil.data(e).get("toggle") : (n.options = KTUtil.deepExtend({}, i, t), n.uid = KTUtil.getUniqueId("toggle"), n.element = e, n.target = document.querySelector(n.element.getAttribute("data-kt-toggle-target")) ? document.querySelector(n.element.getAttribute("data-kt-toggle-target")) : n.element, n.state = n.element.hasAttribute("data-kt-toggle-state") ? n.element.getAttribute("data-kt-toggle-state") : "", n.attribute = "data-kt-" + n.element.getAttribute("data-kt-toggle-name"), r(), KTUtil.data(n.element).set("toggle", n)), n.toggle = function() { return o() }, n.enable = function() { return a() }, n.disable = function() { return l() }, n.isEnabled = function() { return s() }, n.goElement = function() { return n.element }, n.destroy = function() { KTUtil.data(n.element).remove("toggle") }, n.on = function(e, t) { return KTEventHandler.on(n.element, e, t) }, n.one = function(e, t) { return KTEventHandler.one(n.element, e, t) }, n.off = function(e) { return KTEventHandler.off(n.element, e) }, n.trigger = function(e, t) { return KTEventHandler.trigger(n.element, e, t, n, t) }
    }
};
KTToggle.getInstance = function(e) { return null !== e && KTUtil.data(e).has("toggle") ? KTUtil.data(e).get("toggle") : null }, KTToggle.createInstances = function(e = "[data-kt-toggle]") {
        var t = document.getElementsByTagName("BODY")[0].querySelectorAll(e);
        if (t && t.length > 0)
            for (var n = 0, i = t.length; n < i; n++) new KTToggle(t[n])
    }, KTToggle.init = function() { KTToggle.createInstances() }, "loading" === document.readyState ? document.addEventListener("DOMContentLoaded", KTToggle.init) : KTToggle.init(), "undefined" != typeof module && void 0 !== module.exports && (module.exports = KTToggle), Element.prototype.matches || (Element.prototype.matches = function(e) { for (var t = (this.document || this.ownerDocument).querySelectorAll(e), n = t.length; --n >= 0 && t.item(n) !== this;); return n > -1 }), Element.prototype.closest || (Element.prototype.closest = function(e) {
        var t = this;
        if (!document.documentElement.contains(this)) return null;
        do {
            if (t.matches(e)) return t;
            t = t.parentElement
        } while (null !== t);
        return null
    }),
    function(e) { for (var t = 0; t < e.length; t++) window[e[t]] && !("remove" in window[e[t]].prototype) && (window[e[t]].prototype.remove = function() { this.parentNode.removeChild(this) }) }(["Element", "CharacterData", "DocumentType"]),
    function() {
        for (var e = 0, t = ["webkit", "moz"], n = 0; n < t.length && !window.requestAnimationFrame; ++n) window.requestAnimationFrame = window[t[n] + "RequestAnimationFrame"], window.cancelAnimationFrame = window[t[n] + "CancelAnimationFrame"] || window[t[n] + "CancelRequestAnimationFrame"];
        window.requestAnimationFrame || (window.requestAnimationFrame = function(t) {
            var n = (new Date).getTime(),
                i = Math.max(0, 16 - (n - e)),
                r = window.setTimeout(function() { t(n + i) }, i);
            return e = n + i, r
        }), window.cancelAnimationFrame || (window.cancelAnimationFrame = function(e) { clearTimeout(e) })
    }(), [Element.prototype, Document.prototype, DocumentFragment.prototype].forEach(function(e) {
        e.hasOwnProperty("prepend") || Object.defineProperty(e, "prepend", {
            configurable: !0,
            enumerable: !0,
            writable: !0,
            value: function() {
                var e = Array.prototype.slice.call(arguments),
                    t = document.createDocumentFragment();
                e.forEach(function(e) {
                    var n = e instanceof Node;
                    t.appendChild(n ? e : document.createTextNode(String(e)))
                }), this.insertBefore(t, this.firstChild)
            }
        })
    }), null == Element.prototype.getAttributeNames && (Element.prototype.getAttributeNames = function() { for (var e = this.attributes, t = e.length, n = new Array(t), i = 0; i < t; i++) n[i] = e[i].name; return n }), window.KTUtilElementDataStore = {}, window.KTUtilElementDataStoreID = 0, window.KTUtilDelegatedEventHandlers = {};
var KTUtil = function() {
    var e = [],
        t = function() { window.addEventListener("resize", function() { KTUtil.throttle(void 0, function() {! function() { for (var t = 0; t < e.length; t++) e[t].call() }() }, 200) }) };
    return {
        init: function(e) { t() },
        addResizeHandler: function(t) { e.push(t) },
        removeResizeHandler: function(t) { for (var n = 0; n < e.length; n++) t === e[n] && delete e[n] },
        runResizeHandlers: function() { _runResizeHandlers() },
        resize: function() {
            if ("function" == typeof Event) window.dispatchEvent(new Event("resize"));
            else {
                var e = window.document.createEvent("UIEvents");
                e.initUIEvent("resize", !0, !1, window, 0), window.dispatchEvent(e)
            }
        },
        getURLParam: function(e) {
            var t, n, i = window.location.search.substring(1).split("&");
            for (t = 0; t < i.length; t++)
                if ((n = i[t].split("="))[0] == e) return unescape(n[1]);
            return null
        },
        isMobileDevice: function() { var e = this.getViewPort().width < this.getBreakpoint("lg"); return !1 === e && (e = null != navigator.userAgent.match(/iPad/i)), e },
        isDesktopDevice: function() { return !KTUtil.isMobileDevice() },
        getViewPort: function() {
            var e = window,
                t = "inner";
            return "innerWidth" in window || (t = "client", e = document.documentElement || document.body), { width: e[t + "Width"], height: e[t + "Height"] }
        },
        isBreakpointUp: function(e) { return this.getViewPort().width >= this.getBreakpoint(e) },
        isBreakpointDown: function(e) { return this.getViewPort().width < this.getBreakpoint(e) },
        getViewportWidth: function() { return this.getViewPort().width },
        getUniqueId: function(e) { return e + Math.floor(Math.random() * (new Date).getTime()) },
        getBreakpoint: function(e) { var t = this.getCssVariableValue("--bs-" + e); return t && (t = parseInt(t.trim())), t },
        isset: function(e, t) {
            var n;
            if (-1 !== (t = t || "").indexOf("[")) throw new Error("Unsupported object path notation.");
            t = t.split(".");
            do {
                if (void 0 === e) return !1;
                if (n = t.shift(), !e.hasOwnProperty(n)) return !1;
                e = e[n]
            } while (t.length);
            return !0
        },
        getHighestZindex: function(e) {
            for (var t, n; e && e !== document;) {
                if (("absolute" === (t = KTUtil.css(e, "position")) || "relative" === t || "fixed" === t) && (n = parseInt(KTUtil.css(e, "z-index")), !isNaN(n) && 0 !== n)) return n;
                e = e.parentNode
            }
            return 1
        },
        hasFixedPositionedParent: function(e) {
            for (; e && e !== document;) {
                if ("fixed" === KTUtil.css(e, "position")) return !0;
                e = e.parentNode
            }
            return !1
        },
        sleep: function(e) { for (var t = (new Date).getTime(), n = 0; n < 1e7 && !((new Date).getTime() - t > e); n++); },
        getRandomInt: function(e, t) { return Math.floor(Math.random() * (t - e + 1)) + e },
        isAngularVersion: function() { return void 0 !== window.Zone },
        deepExtend: function(e) {
            e = e || {};
            for (var t = 1; t < arguments.length; t++) {
                var n = arguments[t];
                if (n)
                    for (var i in n) n.hasOwnProperty(i) && ("[object Object]" !== Object.prototype.toString.call(n[i]) ? e[i] = n[i] : e[i] = KTUtil.deepExtend(e[i], n[i]))
            }
            return e
        },
        extend: function(e) {
            e = e || {};
            for (var t = 1; t < arguments.length; t++)
                if (arguments[t])
                    for (var n in arguments[t]) arguments[t].hasOwnProperty(n) && (e[n] = arguments[t][n]);
            return e
        },
        getBody: function() { return document.getElementsByTagName("body")[0] },
        hasClasses: function(e, t) {
            if (e) {
                for (var n = t.split(" "), i = 0; i < n.length; i++)
                    if (0 == KTUtil.hasClass(e, KTUtil.trim(n[i]))) return !1;
                return !0
            }
        },
        hasClass: function(e, t) { if (e) return e.classList ? e.classList.contains(t) : new RegExp("\\b" + t + "\\b").test(e.className) },
        addClass: function(e, t) {
            if (e && void 0 !== t) {
                var n = t.split(" ");
                if (e.classList)
                    for (var i = 0; i < n.length; i++) n[i] && n[i].length > 0 && e.classList.add(KTUtil.trim(n[i]));
                else if (!KTUtil.hasClass(e, t))
                    for (var r = 0; r < n.length; r++) e.className += " " + KTUtil.trim(n[r])
            }
        },
        removeClass: function(e, t) {
            if (e && void 0 !== t) {
                var n = t.split(" ");
                if (e.classList)
                    for (var i = 0; i < n.length; i++) e.classList.remove(KTUtil.trim(n[i]));
                else if (KTUtil.hasClass(e, t))
                    for (var r = 0; r < n.length; r++) e.className = e.className.replace(new RegExp("\\b" + KTUtil.trim(n[r]) + "\\b", "g"), "")
            }
        },
        triggerCustomEvent: function(e, t, n) {
            var i;
            window.CustomEvent ? i = new CustomEvent(t, { detail: n }) : (i = document.createEvent("CustomEvent")).initCustomEvent(t, !0, !0, n), e.dispatchEvent(i)
        },
        triggerEvent: function(e, t) {
            var n;
            if (e.ownerDocument) n = e.ownerDocument;
            else {
                if (9 != e.nodeType) throw new Error("Invalid node passed to fireEvent: " + e.id);
                n = e
            }
            if (e.dispatchEvent) {
                var i = "";
                switch (t) {
                    case "click":
                    case "mouseenter":
                    case "mouseleave":
                    case "mousedown":
                    case "mouseup":
                        i = "MouseEvents";
                        break;
                    case "focus":
                    case "change":
                    case "blur":
                    case "select":
                        i = "HTMLEvents";
                        break;
                    default:
                        throw "fireEvent: Couldn't find an event class for event '" + t + "'."
                }
                var r = "change" != t;
                (o = n.createEvent(i)).initEvent(t, r, !0), o.synthetic = !0, e.dispatchEvent(o, !0)
            } else if (e.fireEvent) {
                var o;
                (o = n.createEventObject()).synthetic = !0, e.fireEvent("on" + t, o)
            }
        },
        index: function(e) {
            for (var t = e.parentNode.children, n = 0; n < t.length; n++)
                if (t[n] == e) return n
        },
        trim: function(e) { return e.trim() },
        eventTriggered: function(e) { return !!e.currentTarget.dataset.triggered || (e.currentTarget.dataset.triggered = !0, !1) },
        remove: function(e) { e && e.parentNode && e.parentNode.removeChild(e) },
        find: function(e, t) { return null !== e ? e.querySelector(t) : null },
        findAll: function(e, t) { return null !== e ? e.querySelectorAll(t) : null },
        insertAfter: function(e, t) { return t.parentNode.insertBefore(e, t.nextSibling) },
        parents: function(e, t) { for (var n = []; e && e !== document; e = e.parentNode) t ? e.matches(t) && n.push(e) : n.push(e); return n },
        children: function(e, t, n) { if (!e || !e.childNodes) return null; for (var i = [], r = 0, o = e.childNodes.length; r < o; ++r) 1 == e.childNodes[r].nodeType && KTUtil.matches(e.childNodes[r], t, n) && i.push(e.childNodes[r]); return i },
        child: function(e, t, n) { var i = KTUtil.children(e, t, n); return i ? i[0] : null },
        matches: function(e, t, n) {
            var i = Element.prototype,
                r = i.matches || i.webkitMatchesSelector || i.mozMatchesSelector || i.msMatchesSelector || function(e) { return -1 !== [].indexOf.call(document.querySelectorAll(e), this) };
            return !(!e || !e.tagName) && r.call(e, t)
        },
        data: function(e) { return { set: function(t, n) { e && (void 0 === e.customDataTag && (window.KTUtilElementDataStoreID++, e.customDataTag = window.KTUtilElementDataStoreID), void 0 === window.KTUtilElementDataStore[e.customDataTag] && (window.KTUtilElementDataStore[e.customDataTag] = {}), window.KTUtilElementDataStore[e.customDataTag][t] = n) }, get: function(t) { if (e) return void 0 === e.customDataTag ? null : this.has(t) ? window.KTUtilElementDataStore[e.customDataTag][t] : null }, has: function(t) { return !!e && void 0 !== e.customDataTag && !(!window.KTUtilElementDataStore[e.customDataTag] || !window.KTUtilElementDataStore[e.customDataTag][t]) }, remove: function(t) { e && this.has(t) && delete window.KTUtilElementDataStore[e.customDataTag][t] } } },
        outerWidth: function(e, t) { var n; return !0 === t ? (n = parseFloat(e.offsetWidth), n += parseFloat(KTUtil.css(e, "margin-left")) + parseFloat(KTUtil.css(e, "margin-right")), parseFloat(n)) : n = parseFloat(e.offsetWidth) },
        offset: function(e) { var t, n; if (e) return e.getClientRects().length ? (t = e.getBoundingClientRect(), n = e.ownerDocument.defaultView, { top: t.top + n.pageYOffset, left: t.left + n.pageXOffset, right: window.innerWidth - (e.offsetLeft + e.offsetWidth) }) : { top: 0, left: 0 } },
        height: function(e) { return KTUtil.css(e, "height") },
        outerHeight: function(e, t) { var n, i = e.offsetHeight; return void 0 !== t && !0 === t ? (n = getComputedStyle(e), i += parseInt(n.marginTop) + parseInt(n.marginBottom)) : i },
        visible: function(e) { return !(0 === e.offsetWidth && 0 === e.offsetHeight) },
        attr: function(e, t, n) { if (null != e) return void 0 === n ? e.getAttribute(t) : void e.setAttribute(t, n) },
        hasAttr: function(e, t) { if (null != e) return !!e.getAttribute(t) },
        removeAttr: function(e, t) { null != e && e.removeAttribute(t) },
        animate: function(e, t, n, i, r, o) {
            var a = { linear: function(e, t, n, i) { return n * e / i + t } };
            if (r = a.linear, "number" == typeof e && "number" == typeof t && "number" == typeof n && "function" == typeof i) {
                "function" != typeof o && (o = function() {});
                var l = window.requestAnimationFrame || function(e) { window.setTimeout(e, 20) },
                    s = t - e;
                i(e);
                var u = window.performance && window.performance.now ? window.performance.now() : +new Date;
                l(function a(d) {
                    var c = (d || +new Date) - u;
                    c >= 0 && i(r(c, e, s, n)), c >= 0 && c >= n ? (i(t), o()) : l(a)
                })
            }
        },
        actualCss: function(e, t, n) { var i, r = ""; if (e instanceof HTMLElement != 0) return e.getAttribute("kt-hidden-" + t) && !1 !== n ? parseFloat(e.getAttribute("kt-hidden-" + t)) : (r = e.style.cssText, e.style.cssText = "position: absolute; visibility: hidden; display: block;", "width" == t ? i = e.offsetWidth : "height" == t && (i = e.offsetHeight), e.style.cssText = r, e.setAttribute("kt-hidden-" + t, i), parseFloat(i)) },
        actualHeight: function(e, t) { return KTUtil.actualCss(e, "height", t) },
        actualWidth: function(e, t) { return KTUtil.actualCss(e, "width", t) },
        getScroll: function(e, t) { return t = "scroll" + t, e == window || e == document ? self["scrollTop" == t ? "pageYOffset" : "pageXOffset"] || browserSupportsBoxModel && document.documentElement[t] || document.body[t] : e[t] },
        css: function(e, t, n, i) {
            if (e)
                if (void 0 !== n) !0 === i ? e.style.setProperty(t, n, "important") : e.style[t] = n;
                else {
                    var r = (e.ownerDocument || document).defaultView;
                    if (r && r.getComputedStyle) return t = t.replace(/([A-Z])/g, "-$1").toLowerCase(), r.getComputedStyle(e, null).getPropertyValue(t);
                    if (e.currentStyle) return t = t.replace(/\-(\w)/g, function(e, t) { return t.toUpperCase() }), n = e.currentStyle[t], /^\d+(em|pt|%|ex)?$/i.test(n) ? function(t) {
                        var n = e.style.left,
                            i = e.runtimeStyle.left;
                        return e.runtimeStyle.left = e.currentStyle.left, e.style.left = t || 0, t = e.style.pixelLeft + "px", e.style.left = n, e.runtimeStyle.left = i, t
                    }(n) : n
                }
        },
        slide: function(e, t, n, i, r) {
            if (!(!e || "up" == t && !1 === KTUtil.visible(e) || "down" == t && !0 === KTUtil.visible(e))) {
                n = n || 600;
                var o = KTUtil.actualHeight(e),
                    a = !1,
                    l = !1;
                KTUtil.css(e, "padding-top") && !0 !== KTUtil.data(e).has("slide-padding-top") && KTUtil.data(e).set("slide-padding-top", KTUtil.css(e, "padding-top")), KTUtil.css(e, "padding-bottom") && !0 !== KTUtil.data(e).has("slide-padding-bottom") && KTUtil.data(e).set("slide-padding-bottom", KTUtil.css(e, "padding-bottom")), KTUtil.data(e).has("slide-padding-top") && (a = parseInt(KTUtil.data(e).get("slide-padding-top"))), KTUtil.data(e).has("slide-padding-bottom") && (l = parseInt(KTUtil.data(e).get("slide-padding-bottom"))), "up" == t ? (e.style.cssText = "display: block; overflow: hidden;", a && KTUtil.animate(0, a, n, function(t) { e.style.paddingTop = a - t + "px" }, "linear"), l && KTUtil.animate(0, l, n, function(t) { e.style.paddingBottom = l - t + "px" }, "linear"), KTUtil.animate(0, o, n, function(t) { e.style.height = o - t + "px" }, "linear", function() { e.style.height = "", e.style.display = "none", "function" == typeof i && i() })) : "down" == t && (e.style.cssText = "display: block; overflow: hidden;", a && KTUtil.animate(0, a, n, function(t) { e.style.paddingTop = t + "px" }, "linear", function() { e.style.paddingTop = "" }), l && KTUtil.animate(0, l, n, function(t) { e.style.paddingBottom = t + "px" }, "linear", function() { e.style.paddingBottom = "" }), KTUtil.animate(0, o, n, function(t) { e.style.height = t + "px" }, "linear", function() { e.style.height = "", e.style.display = "", e.style.overflow = "", "function" == typeof i && i() }))
            }
        },
        slideUp: function(e, t, n) { KTUtil.slide(e, "up", t, n) },
        slideDown: function(e, t, n) { KTUtil.slide(e, "down", t, n) },
        show: function(e, t) { void 0 !== e && (e.style.display = t || "block") },
        hide: function(e) { void 0 !== e && (e.style.display = "none") },
        addEvent: function(e, t, n, i) { null != e && e.addEventListener(t, n) },
        removeEvent: function(e, t, n) { null !== e && e.removeEventListener(t, n) },
        on: function(e, t, n, i) {
            if (null !== e) {
                var r = KTUtil.getUniqueId("event");
                return window.KTUtilDelegatedEventHandlers[r] = function(n) {
                    for (var r = e.querySelectorAll(t), o = n.target; o && o !== e;) {
                        for (var a = 0, l = r.length; a < l; a++) o === r[a] && i.call(o, n);
                        o = o.parentNode
                    }
                }, KTUtil.addEvent(e, n, window.KTUtilDelegatedEventHandlers[r]), r
            }
        },
        off: function(e, t, n) { e && window.KTUtilDelegatedEventHandlers[n] && (KTUtil.removeEvent(e, t, window.KTUtilDelegatedEventHandlers[n]), delete window.KTUtilDelegatedEventHandlers[n]) },
        one: function(e, t, n) { e.addEventListener(t, function t(i) { return i.target && i.target.removeEventListener && i.target.removeEventListener(i.type, t), e && e.removeEventListener && i.currentTarget.removeEventListener(i.type, t), n(i) }) },
        hash: function(e) { var t, n = 0; if (0 === e.length) return n; for (t = 0; t < e.length; t++) n = (n << 5) - n + e.charCodeAt(t), n |= 0; return n },
        animateClass: function(e, t, n) {
            var i, r = { animation: "animationend", OAnimation: "oAnimationEnd", MozAnimation: "mozAnimationEnd", WebkitAnimation: "webkitAnimationEnd", msAnimation: "msAnimationEnd" };
            for (var o in r) void 0 !== e.style[o] && (i = r[o]);
            KTUtil.addClass(e, t), KTUtil.one(e, i, function() { KTUtil.removeClass(e, t) }), n && KTUtil.one(e, i, n)
        },
        transitionEnd: function(e, t) {
            var n, i = { transition: "transitionend", OTransition: "oTransitionEnd", MozTransition: "mozTransitionEnd", WebkitTransition: "webkitTransitionEnd", msTransition: "msTransitionEnd" };
            for (var r in i) void 0 !== e.style[r] && (n = i[r]);
            KTUtil.one(e, n, t)
        },
        animationEnd: function(e, t) {
            var n, i = { animation: "animationend", OAnimation: "oAnimationEnd", MozAnimation: "mozAnimationEnd", WebkitAnimation: "webkitAnimationEnd", msAnimation: "msAnimationEnd" };
            for (var r in i) void 0 !== e.style[r] && (n = i[r]);
            KTUtil.one(e, n, t)
        },
        animateDelay: function(e, t) { for (var n = ["webkit-", "moz-", "ms-", "o-", ""], i = 0; i < n.length; i++) KTUtil.css(e, n[i] + "animation-delay", t) },
        animateDuration: function(e, t) { for (var n = ["webkit-", "moz-", "ms-", "o-", ""], i = 0; i < n.length; i++) KTUtil.css(e, n[i] + "animation-duration", t) },
        scrollTo: function(e, t, n) {
            n = n || 500;
            var i, r, o = e ? KTUtil.offset(e).top : 0;
            t && (o -= t), i = window.pageYOffset || document.documentElement.scrollTop || document.body.scrollTop || 0, r = o, KTUtil.animate(i, r, n, function(e) { document.documentElement.scrollTop = e, document.body.parentNode.scrollTop = e, document.body.scrollTop = e })
        },
        scrollTop: function(e, t) { KTUtil.scrollTo(null, e, t) },
        isArray: function(e) { return e && Array.isArray(e) },
        isEmpty: function(e) {
            for (var t in e)
                if (e.hasOwnProperty(t)) return !1;
            return !0
        },
        numberString: function(e) { for (var t = (e += "").split("."), n = t[0], i = t.length > 1 ? "." + t[1] : "", r = /(\d+)(\d{3})/; r.test(n);) n = n.replace(r, "$1,$2"); return n + i },
        isRTL: function() { return "rtl" === document.querySelector("html").getAttribute("direction") },
        snakeToCamel: function(e) { return e.replace(/(\-\w)/g, function(e) { return e[1].toUpperCase() }) },
        filterBoolean: function(e) { return !0 === e || "true" === e || !1 !== e && "false" !== e && e },
        setHTML: function(e, t) { e.innerHTML = t },
        getHTML: function(e) { if (e) return e.innerHTML },
        getDocumentHeight: function() {
            var e = document.body,
                t = document.documentElement;
            return Math.max(e.scrollHeight, e.offsetHeight, t.clientHeight, t.scrollHeight, t.offsetHeight)
        },
        getScrollTop: function() { return (document.scrollingElement || document.documentElement).scrollTop },
        colorLighten: function(e, t) {
            const n = function(e, t) {
                let n = parseInt(e, 16) + t,
                    i = n > 255 ? 255 : n;
                return i = i.toString(16).length > 1 ? i.toString(16) : `0${i.toString(16)}`
            };
            return e = e.indexOf("#") >= 0 ? e.substring(1, e.length) : e, t = parseInt(255 * t / 100), `#${n(e.substring(0,2),t)}${n(e.substring(2,4),t)}${n(e.substring(4,6),t)}`
        },
        colorDarken: function(e, t) {
            const n = function(e, t) {
                let n = parseInt(e, 16) - t,
                    i = n < 0 ? 0 : n;
                return i = i.toString(16).length > 1 ? i.toString(16) : `0${i.toString(16)}`
            };
            return e = e.indexOf("#") >= 0 ? e.substring(1, e.length) : e, t = parseInt(255 * t / 100), `#${n(e.substring(0,2),t)}${n(e.substring(2,4),t)}${n(e.substring(4,6),t)}`
        },
        throttle: function(e, t, n) { e || (e = setTimeout(function() { t(), e = void 0 }, n)) },
        debounce: function(e, t, n) { clearTimeout(e), e = setTimeout(t, n) },
        parseJson: function(e) { if ("string" == typeof e) { var t = (e = e.replace(/'/g, '"')).replace(/(\w+:)|(\w+ :)/g, function(e) { return '"' + e.substring(0, e.length - 1) + '":' }); try { e = JSON.parse(t) } catch (e) {} } return e },
        getResponsiveValue: function(e, t) {
            var n, i = this.getViewPort().width;
            if ("object" == typeof(e = KTUtil.parseJson(e))) {
                var r, o, a = -1;
                for (var l in e)(o = "default" === l ? 0 : this.getBreakpoint(l) ? this.getBreakpoint(l) : parseInt(l)) <= i && o > a && (r = l, a = o);
                n = r ? e[r] : e
            } else n = e;
            return n
        },
        each: function(e, t) { return [].slice.call(e).map(t) },
        getSelectorMatchValue: function(e) {
            var t = null;
            if ("object" == typeof(e = KTUtil.parseJson(e))) {
                if (void 0 !== e.match) {
                    var n = Object.keys(e.match)[0];
                    e = Object.values(e.match)[0], null !== document.querySelector(n) && (t = e)
                }
            } else t = e;
            return t
        },
        getConditionalValue: function(e) { e = KTUtil.parseJson(e); var t = KTUtil.getResponsiveValue(e); return null !== t && void 0 !== t.match && (t = KTUtil.getSelectorMatchValue(t)), null === t && null !== e && void 0 !== e.default && (t = e.default), t },
        getCssVariableValue: function(e) { var t = getComputedStyle(document.documentElement).getPropertyValue(e); return t && t.length > 0 && (t = t.trim()), t },
        isInViewport: function(e) { var t = e.getBoundingClientRect(); return t.top >= 0 && t.left >= 0 && t.bottom <= (window.innerHeight || document.documentElement.clientHeight) && t.right <= (window.innerWidth || document.documentElement.clientWidth) },
        onDOMContentLoaded: function(e) { "loading" === document.readyState ? document.addEventListener("DOMContentLoaded", e) : e() },
        inIframe: function() { try { return window.self !== window.top } catch (e) { return !0 } },
        isHexColor: e => /^#[0-9A-F]{6}$/i.test(e)
    }
}();
"undefined" != typeof module && void 0 !== module.exports && (module.exports = KTUtil);
var KTApp = function() {
    var e = !1,
        t = function(e, t) {
            var n = {};
            e.hasAttribute("data-bs-delay-hide") && (n.hide = e.getAttribute("data-bs-delay-hide")), e.hasAttribute("data-bs-delay-show") && (n.show = e.getAttribute("data-bs-delay-show")), n && (t.delay = n), e.hasAttribute("data-bs-dismiss") && "click" == e.getAttribute("data-bs-dismiss") && (t.dismiss = "click");
            var i = new bootstrap.Tooltip(e, t);
            return t.dismiss && "click" === t.dismiss && e.addEventListener("click", function(e) { i.hide() }), i
        },
        n = function(e, t) {
            var n = {};
            e.hasAttribute("data-bs-delay-hide") && (n.hide = e.getAttribute("data-bs-delay-hide")), e.hasAttribute("data-bs-delay-show") && (n.show = e.getAttribute("data-bs-delay-show")), n && (t.delay = n), "true" == e.getAttribute("data-bs-dismiss") && (t.dismiss = !0), !0 === t.dismiss && (t.template = '<div class="popover" role="tooltip"><div class="popover-arrow"></div><span class="popover-dismiss btn btn-icon"><i class="bi bi-x fs-2"></i></span><h3 class="popover-header"></h3><div class="popover-body"></div></div>');
            var i = new bootstrap.Popover(e, t);
            if (!0 === t.dismiss) {
                var r = function(e) { i.hide() };
                e.addEventListener("shown.bs.popover", function() { document.getElementById(e.getAttribute("aria-describedby")).addEventListener("click", r) }), e.addEventListener("hide.bs.popover", function() { document.getElementById(e.getAttribute("aria-describedby")).removeEventListener("click", r) })
            }
            return i
        },
        i = function() {
            [].slice.call(document.querySelectorAll('[data-kt-countup="true"]:not(.counted)')).map(function(e) {
                if (KTUtil.isInViewport(e) && KTUtil.visible(e)) {
                    var t = {},
                        n = e.getAttribute("data-kt-countup-value");
                    n = parseFloat(n.replace(/,/g, "")), e.hasAttribute("data-kt-countup-start-val") && (t.startVal = parseFloat(e.getAttribute("data-kt-countup-start-val"))), e.hasAttribute("data-kt-countup-duration") && (t.duration = parseInt(e.getAttribute("data-kt-countup-duration"))), e.hasAttribute("data-kt-countup-decimal-places") && (t.decimalPlaces = parseInt(e.getAttribute("data-kt-countup-decimal-places"))), e.hasAttribute("data-kt-countup-prefix") && (t.prefix = e.getAttribute("data-kt-countup-prefix")), e.hasAttribute("data-kt-countup-separator") && (t.separator = e.getAttribute("data-kt-countup-separator")), e.hasAttribute("data-kt-countup-suffix") && (t.suffix = e.getAttribute("data-kt-countup-suffix")), new countUp.CountUp(e, n, t).start(), e.classList.add("counted")
                }
            })
        };
    return {
        init: function() { this.initBootstrapTooltips(), this.initBootstrapPopovers(), this.initBootstrapScrollSpy(), this.initDaterangepicker(), this.initButtons(), this.initCheck(), this.initSelect2(), this.initCountUp(), this.initCountUpTabs(), this.initAutosize(), this.initTinySliders(), this.initSmoothScroll(), this.initBootstrapToast(), this.initBootstrapCollapse() },
        initPageLoader: function() { KTUtil.removeClass(document.body, "page-loading") },
        initDaterangepicker: function() {
            ! function() {
                if ("undefined" != typeof jQuery && void 0 !== $.fn.daterangepicker) {
                    var e = [].slice.call(document.querySelectorAll('[data-kt-daterangepicker="true"]')),
                        t = moment().subtract(29, "days"),
                        n = moment();
                    e.map(function(e) {
                        var i = e.querySelector("div"),
                            r = e.hasAttribute("data-kt-daterangepicker-opens") ? e.getAttribute("data-kt-daterangepicker-opens") : "left",
                            o = function(e, t) { i && (i.innerHTML = e.format("D MMM YYYY") + " - " + t.format("D MMM YYYY")) };
                        $(e).daterangepicker({ startDate: t, endDate: n, opens: r, ranges: { Today: [moment(), moment()], Yesterday: [moment().subtract(1, "days"), moment().subtract(1, "days")], "Last 7 Days": [moment().subtract(6, "days"), moment()], "Last 30 Days": [moment().subtract(29, "days"), moment()], "This Month": [moment().startOf("month"), moment().endOf("month")], "Last Month": [moment().subtract(1, "month").startOf("month"), moment().subtract(1, "month").endOf("month")] } }, o), o(t, n)
                    })
                }
            }()
        },
        initBootstrapTooltip: function(e, n) { return t(e, n) },
        initBootstrapTooltips: function() {
            [].slice.call(document.querySelectorAll('[data-bs-toggle="tooltip"]')).map(function(e) { t(e, {}) })
        },
        initBootstrapModal: function() {-1 !== navigator.userAgent.toLowerCase().indexOf("firefox") && document.querySelectorAll(".modal:not(.initialized)").forEach(e => { e.addEventListener("shown.bs.modal", function() { bootstrap.Modal.getInstance(this).handleUpdate(), this.classList.add("initialized"), alert(2) }) }) },
        initBootstrapPopovers: function() {
            [].slice.call(document.querySelectorAll('[data-bs-toggle="popover"]')).map(function(e) { n(e, {}) })
        },
        initBootstrapPopover: function(e, t) { return n(e, t) },
        initBootstrapScrollSpy: function() {
            [].slice.call(document.querySelectorAll('[data-bs-spy="scroll"]')).map(function(e) {
                e.getAttribute("data-bs-target");
                var t = document.querySelector(e.getAttribute("data-bs-target")),
                    n = bootstrap.ScrollSpy.getInstance(t);
                n && n.refresh()
            })
        },
        initBootstrapToast: function() {
            [].slice.call(document.querySelectorAll(".toast")).map(function(e) { return new bootstrap.Toast(e, {}) })
        },
        initBootstrapCollapse: function() { KTUtil.on(document.body, '.collapsible[data-bs-toggle="collapse"]', "click", function(e) { this.classList.contains("collapsed") ? (this.classList.remove("active"), this.blur()) : this.classList.add("active") }) },
        initButtons: function() {
            [].slice.call(document.querySelectorAll('[data-kt-buttons="true"]')).map(function(e) {
                var t = e.hasAttribute("data-kt-buttons-target") ? e.getAttribute("data-kt-buttons-target") : ".btn";
                KTUtil.on(e, t, "click", function(n) {
                    [].slice.call(e.querySelectorAll(t + ".active")).map(function(e) { e.classList.remove("active") }), this.classList.add("active")
                })
            })
        },
        initCheck: function() {
            KTUtil.on(document.body, '[data-kt-check="true"]', "change", function(e) {
                var t = this,
                    n = document.querySelectorAll(t.getAttribute("data-kt-check-target"));
                KTUtil.each(n, function(e) { "checkbox" == e.type ? e.checked = t.checked : e.classList.toggle("active") })
            })
        },
        initSelect2: function() {
            "undefined" != typeof jQuery && void 0 !== $.fn.select2 && ([].slice.call(document.querySelectorAll('[data-control="select2"], [data-kt-select2="true"]')).map(function(e) { var t = { dir: document.body.getAttribute("direction") }; "true" == e.getAttribute("data-hide-search") && (t.minimumResultsForSearch = 1 / 0), $(e).select2(t) }), !1 === e && (e = !0, $(document).on("select2:open", function(e) {
                var t = document.querySelectorAll(".select2-container--open .select2-search__field");
                t.length > 0 && t[t.length - 1].focus()
            })))
        },
        initCountUp: function() { i() },
        initCountUpTabs: function() { i(), window.addEventListener("scroll", i), [].slice.call(document.querySelectorAll('[data-kt-countup-tabs="true"][data-bs-toggle="tab"]')).map(function(e) { e.addEventListener("shown.bs.tab", i) }) },
        initAutosize: function() {
            [].slice.call(document.querySelectorAll('[data-kt-autosize="true"]')).map(function(e) { autosize(e) })
        },
        initTinySliders: function() {
            ! function() {
                const e = Array.prototype.slice.call(document.querySelectorAll('[data-tns="true"]'), 0);
                (e || 0 !== e.length) && e.forEach(function(e) {
                    ! function(e) {
                        if (!e) return;
                        const t = {};
                        e.getAttributeNames().forEach(function(n) { if (/^data-tns-.*/g.test(n)) { let r = n.replace("data-tns-", "").toLowerCase().replace(/(?:[\s-])\w/g, function(e) { return e.replace("-", "").toUpperCase() }); if ("data-tns-responsive" === n) { const i = e.getAttribute(n).replace(/(\w+:)|(\w+ :)/g, function(e) { return '"' + e.substring(0, e.length - 1) + '":' }); try { t[r] = JSON.parse(i) } catch (e) {} } else t[r] = "true" === (i = e.getAttribute(n)) || "false" !== i && i } var i });
                        const n = Object.assign({}, { container: e, slideBy: "page", autoplay: !0, autoplayButtonOutput: !1 }, t);
                        e.closest(".tns") && KTUtil.addClass(e.closest(".tns"), "tns-initiazlied"), tns(n)
                    }(e)
                })
            }()
        },
        initSmoothScroll: function() { SmoothScroll && new SmoothScroll('a[data-kt-scroll-toggle][href*="#"]', { speed: 900, offset: function(e, t) { return e.hasAttribute("data-kt-scroll-offset") ? KTUtil.getResponsiveValue(e.getAttribute("data-kt-scroll-offset")) : 0 } }) },
        isDarkMode: function() { return document.body.classList.contains("dark-mode") },
        setThemeMode: function(e, t) {
            ! function(e, t) {
                var n = function(e, t) {
                    return new Promise(function(n, i) {
                        var r = document.querySelector("link[href*='" + e + "']"),
                            o = document.createElement("link"),
                            a = r.href.replace(e, t);
                        o.rel = "stylesheet", o.type = "text/css", o.href = a, document.head.insertBefore(o, r), o.onload = function() { n(a), r.remove() }, o.onerror = function() { i(a) }
                    })
                };
                document.body.classList.add("page-loading"), "dark" === e ? Promise.all([n("plugins.bundle.css", "plugins.dark.bundle.css"), n("style.bundle.css", "style.dark.bundle.css")]).then(function() { document.body.classList.add("dark-mode"), document.body.classList.remove("page-loading"), t instanceof Function && t() }).catch(function() {}) : "light" === e && Promise.all([n("plugins.dark.bundle.css", "plugins.bundle.css"), n("style.dark.bundle.css", "style.bundle.css")]).then(function() { document.body.classList.remove("dark-mode"), document.body.classList.remove("page-loading"), t instanceof Function && t() }).catch(function() {})
            }(e, t)
        }
    }
}();
KTUtil.onDOMContentLoaded(function() { KTApp.init() }), window.addEventListener("load", function() { KTApp.initPageLoader() }), "undefined" != typeof module && void 0 !== module.exports && (module.exports = KTApp);
var KTLayoutSearch = function() {
    var e, t, n, i, r, o, a, l, s, u, d, c, m, f = function(e) {
            setTimeout(function() {
                var i = KTUtil.getRandomInt(1, 3);
                t.classList.add("d-none"), 3 === i ? (n.classList.add("d-none"), r.classList.remove("d-none")) : (n.classList.remove("d-none"), r.classList.add("d-none")), e.complete()
            }, 1500)
        },
        p = function(e) { t.classList.remove("d-none"), n.classList.add("d-none"), r.classList.add("d-none") };
    return {
        init: function() {
            (e = document.querySelector("#kt_header_search")) && (i = e.querySelector('[data-kt-search-element="wrapper"]'), e.querySelector('[data-kt-search-element="form"]'), t = e.querySelector('[data-kt-search-element="main"]'), n = e.querySelector('[data-kt-search-element="results"]'), r = e.querySelector('[data-kt-search-element="empty"]'), o = e.querySelector('[data-kt-search-element="preferences"]'), a = e.querySelector('[data-kt-search-element="preferences-show"]'), l = e.querySelector('[data-kt-search-element="preferences-dismiss"]'), s = e.querySelector('[data-kt-search-element="advanced-options-form"]'), u = e.querySelector('[data-kt-search-element="advanced-options-form-show"]'), d = e.querySelector('[data-kt-search-element="advanced-options-form-cancel"]'), c = e.querySelector('[data-kt-search-element="advanced-options-form-search"]'), (m = new KTSearch(e)).on("kt.search.process", f), m.on("kt.search.clear", p), a.addEventListener("click", function() { i.classList.add("d-none"), o.classList.remove("d-none") }), l.addEventListener("click", function() { i.classList.remove("d-none"), o.classList.add("d-none") }), u.addEventListener("click", function() { i.classList.add("d-none"), s.classList.remove("d-none") }), d.addEventListener("click", function() { i.classList.remove("d-none"), s.classList.add("d-none") }), c.addEventListener("click", function() {}))
        }
    }
}();
KTUtil.onDOMContentLoaded(function() { KTLayoutSearch.init() });
var KTLayoutAside = function() { var e, t; return { init: function() { t = document.querySelector("#kt_aside"), e = document.querySelector("#kt_aside_toggle"), t && e && KTToggle.getInstance(e).on("kt.toggle.change", function() { t.classList.add("animating"), setTimeout(function() { t.classList.remove("animating") }, 300) }) } } }();
KTUtil.onDOMContentLoaded(function() { KTLayoutAside.init() });
var KTLayoutToolbar = {
    init: function() {
        document.querySelector("#kt_toolbar") && function() {
            var e = document.querySelector("#kt_toolbar_slider"),
                t = document.querySelector("#kt_toolbar_slider_value");
            if (e) {
                noUiSlider.create(e, { start: [5], connect: [!0, !1], step: 1, format: wNumb({ decimals: 1 }), range: { min: [1], max: [10] } }), e.noUiSlider.on("update", function(e, n) { t.innerHTML = e[n] });
                var n = e.querySelector(".noUi-handle");
                n.setAttribute("tabindex", 0), n.addEventListener("click", function() { this.focus() }), n.addEventListener("keydown", function(t) {
                    var n = Number(e.noUiSlider.get());
                    switch (t.which) {
                        case 37:
                            e.noUiSlider.set(n - 1);
                            break;
                        case 39:
                            e.noUiSlider.set(n + 1)
                    }
                })
            }
        }()
    }
};
KTUtil.onDOMContentLoaded(function() { KTLayoutToolbar.init() });