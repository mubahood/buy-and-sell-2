<?php
use App\Models\MenuItem;
use App\Models\Chat;
use App\Models\Product;
use App\Models\User;

$users = User::all();
$head = ['ID', 'Name', 'Email', 'Phone', 'Address', 'Location', 'Role', 'Joined'];
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
    $row[] = '<b class="text-dark">'.$v->name.'</b>';
    $row[] = $v->email;
    $row[] = $v->phone_number;
    $row[] = $v->address;
    $row[] = $v->location_id;
    $row[] = $v->user_type;
    $row[] = $v->created_at;
    $rows[] = $row;
}

?>
@extends('metro.layout.layout-dashboard')



@section('dashboard-content')
    @include('metro.components.table')
@endsection
 