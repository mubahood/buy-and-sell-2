<div class="grid-dropdown-actions dropdown">


    <div class="me-0">
        <button class="btn btn-sm btn-icon btn-bg-light btn-active-color-primary" data-kt-menu-trigger="click"
            data-kt-menu-placement="bottom-end">
            <i class="bi bi-three-dots fs-3"></i>
        </button>
        <!--begin::Menu 3-->
        <div class="menu menu-sub menu-sub-dropdown menu-column menu-rounded menu-gray-800 menu-state-bg-light-primary fw-bold w-200px py-3"
            data-kt-menu="true">


            @foreach ($default as $action)
                <div class="my-menu-item">
                    {!! $action->render() !!}
                </div>
            @endforeach
            @if (!empty($custom))

            @if (!empty($default))
                <li class="divider"></li>
            @endif

            @foreach ($custom as $action)
                    <div class="my-menu-item">
                        {!! $action->render() !!}
                    </div>
            @endforeach
        @endif

        </div>
        <!--end::Menu 3-->
    </div>


    <style>
   
        .my-menu-item a {
            display: block;
            cursor: pointer;
            display: flex;
            align-items: center;
            padding: 0;
            flex: 0 0 100%;
            padding: .65rem 1rem;
            transition: none;
            outline: 0 !important
        }

        .my-menu-item a:hover{
            background-color: rgb(230, 230, 230);
        }

    </style>

 
    <ul class="dropdown-menu"
        style="min-width: 70px !important;box-shadow: 0 2px 3px 0 rgba(0,0,0,.2);border-radius:0;left: -65px;top: 5px;">

        @foreach ($default as $action)
            <li>{!! $action->render() !!}</li>
        @endforeach

        
    </ul>
</div>

 

@yield('child')
