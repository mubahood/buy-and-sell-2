<?php

use App\Models\Banner;

$users = Banner::all();
/*

id	
name	
category_id
image	
clicks	
 
*/
$head = ['ID', 'Photo', 'Name', 'Category', 'Clicks'];
$rows = [];
//$create_link = url('dashboard/banners/create');
//$delete_link = url('dashboard/banners');
$edit_link = url('dashboard/users/edit');
//$view_link = url('dashboard/users');


$has_actions = true;
foreach ($users as $key => $v) {
    $row = [];
    $row[] = $v->id;
    $row[] = $v->id; 

    $row[] = '<span href="{{ $_link }}" class="symbol symbol-50px">
                <span class="symbol-label" style="background-image:url('.url( ''.$v->image).');"></span>
             </span>';
    $row[] = '<b class="text-dark">' . $v->name . '</b>';
    $row[] = $v->category_id;
    $row[] = $v->clicks;
    $row['edit_link'] = url('dashboard/banners/'.$v->id.'/edit');
    $rows[] = $row;
}

?>
@section('toolbar-title','Banners')
@extends('metro.layout.layout-dashboard')



@section('dashboard-content')
    @include('metro.components.table')
@endsection


