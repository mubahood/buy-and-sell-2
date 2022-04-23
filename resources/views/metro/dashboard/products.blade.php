<?php
use App\Models\Product;

$users = Product::all();
$head = ['ID', 'Name', 'Price', 'Category', 'Location', 'Nature of offer', 'Owner','Contact','Created'];
$rows = [];
$create_link = url('dashboard/users/create');
$delete_link = url('dashboard/users/delete');
$edit_link = url('dashboard/users/edit');
$view_link = url('dashboard/users');
$has_actions = true;
foreach ($users as $key => $v) {
    $row = [];
    $row[] = $v->id;
    $row[] = $v->id;
    $row[] = '<b class="text-dark">' . $v->name . '</b>';
    $row[] = $v->price;
    $row[] = $v->category_name;
    $row[] = $v->city_name;
    $row[] = $v->nature_of_offer;
    $row[] = $v->seller_name;
    $row[] = $v->seller_phone;
    $row[] = $v->created_at;
    $rows[] = $row;
}

?>
@extends('metro.layout.layout-dashboard')




@section('dashboard-content')
    @include('metro.components.table')
@endsection
