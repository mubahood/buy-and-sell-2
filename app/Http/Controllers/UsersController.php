<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\DataTables\UsersDataTable;

class UsersController extends Controller
{
    public function index()
    {
        return  view('metro.dashboard.users');
    }

    public function edit()
    {
        return  view('metro.dashboard.users-create');
    }
}
