@extends('metro.layout.layout-dashboard')

@section('dashboard-content')
    {!! $dataTable->table() !!}
@endsection

@section('footer')
    <script src="{{ url('/') }}/assets/js/custom/widgets.js"></script>
    <script src="{{ url('/') }}/assets/js/buttons.server-side.js"></script>
    {{ $dataTable->scripts() }}
 
@endsection
