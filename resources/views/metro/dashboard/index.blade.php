<?php
use App\Models\Category;
use App\Models\User;
$top_cats = Category::get_top_categories();
$users = User::where([])
    ->orderBy('id', 'Desc')
    ->limit(5)
    ->get();
$all_users = User::count('id');

?>@extends('metro.layout.layout-dashboard')
@section('dashboard-content')
    <div class="row g-5 g-xl-10 mb-xl-10">
        
        

    </div>
@endsection

@section('footer')
    {{-- <script src="{{ url('/') }}/assets/js/widgets.bundle.js"></script> --}}
    <script>
        $(document).ready(function() {

            var e = document.getElementById("kt_card_widget_4_chart");
            if (e) {
                var t = {
                        size: e.getAttribute("data-kt-size") ? parseInt(e.getAttribute("data-kt-size")) : 70,
                        lineWidth: e.getAttribute("data-kt-line") ? parseInt(e.getAttribute("data-kt-line")) : 11,
                        rotate: e.getAttribute("data-kt-rotate") ? parseInt(e.getAttribute("data-kt-rotate")) : 145
                    },
                    a = document.createElement("canvas"),
                    r = document.createElement("span");
                "undefined" != typeof G_vmlCanvasManager && G_vmlCanvasManager.initElement(a);
                var i = a.getContext("2d");
                a.width = a.height = t.size, e.appendChild(r), e.appendChild(a), i.translate(t.size / 2, t.size /
                    2), i.rotate((t.rotate / 180 - .5) * Math.PI);
                var o = (t.size - t.lineWidth) / 2,
                    s = function(e, t, a) {
                        a = Math.min(Math.max(0, a || 1), 1), i.beginPath(), i.arc(0, 0, o, 0, 2 * Math.PI * a, !1),
                            i.strokeStyle = e, i.lineCap = "round", i.lineWidth = t, i.stroke()
                    };
                s("#E4E6EF", t.lineWidth, 1), s(KTUtil.getCssVariableValue("--bs-danger"), t.lineWidth, 100 / 150),
                    s(KTUtil.getCssVariableValue("--bs-primary"), t.lineWidth, .4)
            }

        });
    </script>
@endsection
