<?php
$expanded = '';
$segments = request()->segments();
$seg = end($segments);
$seg = strtolower($seg);
//"active show"
?>
@if (Admin::user()->visible(\Illuminate\Support\Arr::get($item, 'roles', [])) && Admin::user()->can(\Illuminate\Support\Arr::get($item, 'permission')))
    @if (!isset($item['children']))
        @php
            $active_item = '';
            if (strtolower($item['uri']) == $seg) {
                $active_item = '  show active ';
            }
        @endphp

        <div class="menu-item   {{ $active_item }}">
            @if (url()->isValidUrl($item['uri']))
                <a class="menu-link" href="{{ $item['uri'] }}" target="_blank">
                @else
                    <a class="menu-link" href="{{ admin_url($item['uri']) }}">
            @endif
            <span class="menu-icon">
                <i class="fa {{ $item['icon'] }}"></i>
            </span>
            </span>
            <span class="menu-title">
                @if (Lang::has($titleTranslation = 'admin.menu_titles.' . trim(str_replace(' ', '_', strtolower($item['title'])))))
                    <span>{{ __($titleTranslation) }}</span>
                @else
                    <span>{{ admin_trans($item['title']) }}</span>
                @endif
            </span>
            </a>
        </div>
    @else
        <div data-kt-menu-trigger="click" class="menu-item menu-accordion">


            <span class="menu-link">
                <span class="menu-icon">
                    <span class="svg-icon svg-icon-2">
                        <i class="fa {{ $item['icon'] }}"></i>
                    </span>
                </span>
                <span class="menu-title">
                    @if (Lang::has($titleTranslation = 'admin.menu_titles.' . trim(str_replace(' ', '_', strtolower($item['title'])))))
                        <span>{{ __($titleTranslation) }}</span>
                    @else
                        <span>{{ admin_trans($item['title']) }}</span>
                    @endif
                </span>
                <span class="menu-arrow"></span>
            </span>



            @php
                $expanded = '';
                foreach ($item['children'] as $value) {
                    if (strtolower($value['uri']) == $seg) {
                        $expanded = ' here active show ';
                    }
                }
            @endphp
            <div class="menu-sub menu-sub-accordion menu-active-bg  {{ $expanded }}">
                @foreach ($item['children'] as $item)
                    @php
                        $active_item = '';
                        if (strtolower($item['uri']) == $seg) {
                            $active_item = '  show active ';
                        }
                    @endphp

                    <div class="menu-item  {{ $active_item }}">
                        @if (url()->isValidUrl($item['uri']))
                            <a class="menu-link" href="{{ $item['uri'] }}" target="_blank">
                            @else
                                <a class="menu-link" href="{{ admin_url($item['uri']) }}">
                        @endif
                        <span class="menu-bullet">
                            <span class="bullet bullet-dot"></span>
                        </span>
                        <span class="menu-title">
                            @if (Lang::has($titleTranslation = 'admin.menu_titles.' . trim(str_replace(' ', '_', strtolower($item['title'])))))
                                <span>{{ __($titleTranslation) }}</span>
                            @else
                                <span>{{ admin_trans($item['title']) }}</span>
                            @endif
                        </span>
                        </a>
                    </div>
                @endforeach
            </div>


        </div>
    @endif
@endif
