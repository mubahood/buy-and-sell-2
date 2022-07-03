<?php

namespace App\Admin\Controllers;

use App\Http\Controllers\Controller;
use App\Models\FinancialRecord;
use App\Models\GardenActivity;
use App\Models\GardenProductionRecord;
use App\Models\Location;
use App\Models\Product;
use Carbon\Carbon;
use Encore\Admin\Auth\Database\Administrator;
use Encore\Admin\Controllers\Dashboard;
use Encore\Admin\Facades\Admin;
use Encore\Admin\Layout\Column;
use Encore\Admin\Layout\Content;
use Encore\Admin\Layout\Row;
use Encore\Admin\Widgets\Box;
use Illuminate\Support\Str;
use Excel;

class HomeController extends Controller
{
    public function index(Content $content)
    {
        /* 
        ini_set('memory_limit', '-1'); // enabled the full memory available.        
        ini_set('max_execution_time', '-1');

        $file_path = "farmers.xlsx";
        if (!file_exists($file_path)) {
            die("File DNE");
        }

        $array = Excel::toArray([], $file_path);
        $i = 0;
        $j = 0;
        $x = 0;
        foreach ($array[0] as $key => $v) {
            $j++;
            $i++;
            if (
                $i <= 1 ||
                (count($v) < 6)
            ) {
                continue;
            }


            $u = new Administrator();
            $u->username = trim($v[0]);

            $u->name = $v[1];
            $u->last_name = $v[2];
            $u->gender = $v[3];
            $u->phone_number = $v[4];
            $u->phone_number_2 = $v[5];
            $u->region = $v[6];
            $u->district_text = trim($v[7]);
            $u->district = trim($v[7]);
            $u->county_text = $v[8];
            $u->sub_county_text = $v[9];
            $u->address = $v[10];

            $dis = Location::where([
                'name' => $u->district_text
            ])->first();

            if ($dis == null) {
                $dis = Location::find(1);
            }
            if ($dis == null) {
                die("District not found");
            }
            $sub_county = Location::where([
                'name' => $u->sub_county_text
            ])->first();

            if ($sub_county == null) {
                $sub_county = Location::find(1);
            }
            if ($sub_county == null) {
                die("District not found");
            }

            $u->district = $dis->id;
            $u->sub_county = $sub_county->id;

            $u->education = $v[11];
            $u->marital_status = $v[12];
            $u->number_of_dependants = ((int)($v[13]));
            $u->access_to_credit = $v[15];
            $u->experience = ((int)($v[16]));
            $u->sector = $v[17];
            $u->production_scale = $v[18];
            $u->group_text = 1;
            $u->group_id = 1;
            $u->profile_is_complete = 0;
            $u->company_name = $u->name;
            $u->email = trim($u->phone_number);
            if (strlen($u->email) < 2) {
                $u->email = $u->name;
            }
            $u->username = $u->email;
            $u->avatar = 'no_image.jpg';
            $u->user_role = 'farmer';
            $u->date_of_birth = rand(25, 60);
            $u->password = password_hash('4321', PASSWORD_DEFAULT);


            $old_user = Administrator::where([
                'username' => $u->username
            ])->first();

            if ($old_user != null) {
                continue;
            }

            $u->save();
            echo $j . ". <b>USERNMAE:</b> $u->name - $u->email <hr>   ";
            $x++; 
           
            continue;
            echo $j . ". 
            <b>USERNMAE:</b> $u->username <br>            
            <b>NAME:</b> $u->name <br>            
            <b>LAST NAME:</b> $u->last_name <br>            
            <b>SEX:</b> $u->gender <br>
            <b>Phone number:</b> $u->phone_number <br>
            <b>Phone number  2:</b> $u->phone_number_2 <br>
            <b>Region:</b> $u->region <br>
            <b>District</b> $u->district_text <br>
            <b>County</b> $u->county_text <br>
            <b>Sub County</b> $sub_county->name <br>
            <b>Home address</b> $u->address <br>
            <b>Level of education</b> $u->education <br>
            <b>Marital status</b> $u->marital_status <br>
            <b>Number of dependents</b> $u->number_of_dependants <br>
            <b>access_to_credit</b> $u->access_to_credit <br>
            <b>Farming Experience in years</b> $u->experience <br>
            <b>sector</b> $u->sector <br>
            <b>Production scale</b> $u->production_scale <br>
            <b>Farmers organization</b> $u->group_text <br>

            <hr>";
        }


 */


        //die("romina");


        return $content
            ->title('Dashboard')
            ->description('Description...')
            ->row(function (Row $row) {


                $row->column(3, function (Column $column) {
                    $box  = new Box('My products views', view('widgets.box-3', [
                        'icon' => '1.png',
                        'count' => '24',
                        'sub_title' => 'All people who viewed your farm products.',
                    ]));
                    $box->style('success');
                    $column->append($box);
                });

                $row->column(3, function (Column $column) {
                    $box  = new Box('My customers messages', view('widgets.box-3', [
                        'icon' => '3.png',
                        'count' => '51',
                        'sub_title' => 'Unread messages from your customers.',
                    ]));
                    $box->style('success');
                    $column->append($box);
                });

                $row->column(3, function (Column $column) {
                    $box  = new Box('Announcements', view('widgets.box-3', [
                        'icon' => '4.png',
                        'count' => '51',
                        'sub_title' => 'Communications from your farmers association.',
                    ]));
                    $box->style('success');
                    $column->append($box);
                });

                $row->column(3, function (Column $column) {
                    $box  = new Box('E-Academy', view('widgets.box-3', [
                        'icon' => '2.png',
                        'count' => '17',
                        'sub_title' => 'Farming digital courses available for FREE.',
                    ]));
                    $box->style('success');
                    $column->append($box);
                });
            })
            ->row(function (Row $row) {
                $row->column(6, function (Column $column) {
                    $data = [];
                    $lables = [];
                    $income = [];
                    $expense = [];
                    $days_ago = 30;
                    for ($i = 0; $i < $days_ago; $i++) {

                        $min_day = new Carbon();
                        $max_day = new Carbon();

                        $min_day->subDays($days_ago);
                        $max_day->subDays(($days_ago - 1));

                        $min_day->addDays($i);
                        $max_day->addDays($i);
                        $min = $min_day->format('Y-m-d H:i:s');
                        $max = $max_day->format('Y-m-d H:i:s');
                        $lables[] = $max_day->format('d M-Y');
                        $_income = 0;
                        $_expense = 0;
                        $recs = FinancialRecord::whereBetween('created_at', [$min, $max])->get();
                        foreach ($recs as $rec) {
                            if ($rec->amount < 0) {
                                $_income += ((-1) * ((int)($rec->amount)));
                            } else {
                                $_expense += ((int)($rec->amount));
                            }
                        }
                        $expense[] = $_expense;
                        $income[] = $_income;
                    }


                    $data['lables'] = $lables;
                    $data['income'] = $income;
                    $data['expense'] = $expense;

                    $box_financial  = new Box('Financial report - (Last 30 days)', view('admin.charts.bar', ['data' => $data]));
                    $box_financial->collapsable();
                    $column->append($box_financial);
                });

                $row->column(3, function (Column $column) {

                    $data = [];
                    $data[] = FinancialRecord::where('administrator_id', Admin::user()->id)
                        ->where('amount', '>', 0)
                        ->sum('amount');

                    $data[] = (-1 * FinancialRecord::where('administrator_id', Admin::user()->id)
                        ->where('amount', '<', 0)
                        ->sum('amount'));

                    $bal = $data[0] - $data[1];
                    if ($bal < 0) {
                        $title = "Loss: UGX" . number_format($bal);
                    } else {
                        $title = "Profits: UGX" . number_format($bal);
                    }

                    $box  = new Box('Profit or Loss', view('widgets.box-1', [
                        'title' => $title,
                        'data' => $data,
                        'colors' => ['green', 'red'],
                        'labels' => [
                            'Total Income - UGX ' . number_format($data[0]),
                            'Total Expense - UGX ' . number_format($data[1]),
                        ],
                    ]));
                    $box
                        ->style('success')
                        ->collapsable();
                    $column->append($box);
                });
                $row->column(3, function (Column $column) {

                    $recs = FinancialRecord::where('administrator_id', Admin::user()->id)
                        ->orderBy('id', 'Desc')
                        ->limit(8)
                        ->get();
                    $data = [];
                    foreach ($recs as $va) {
                        $_data['title'] = $va->description;
                        $_data['sub_title'] = $va->amount_text;
                        $data[] = $_data;
                    }
                    $box  = new Box('Recent transactions', view('widgets.box-4', ['data' => $data]));
                    $box
                        ->style('success')
                        ->collapsable();
                    $column->append($box);
                });
            })
            ->row(function (Row $row) {
                $row->column(3, function (Column $column) {
                    $data = [];
                    $data[] = GardenActivity::where([
                        'administrator_id' => Admin::user()->id,
                        'is_done' => true,
                    ])->count();

                    $data[] = GardenActivity::where([
                        'administrator_id' => Admin::user()->id,
                        'is_done' => false,
                    ])->count();

                    $tot = $data[0] + $data[1];
                    $percentage_done = 100;
                    if ($tot > 0) {
                        $percentage_done = ((int) ((($tot - $data[1]) / $tot) * 100));
                    }

                    $title = "$percentage_done% Activities completed";

                    $box  = new Box('Production activities', view('widgets.box-1', [
                        'title' => $title,
                        'data' => $data,
                        'colors' => ['green', 'red'],
                        'labels' => [
                            'Completed ' . number_format($data[0]),
                            'Nont Completed ' . number_format($data[1]),
                        ],
                    ]));
                    $box
                        ->style('success')
                        ->collapsable();
                    $column->append($box);
                });
                $row->column(3, function (Column $column) {
                    $recs = GardenActivity::where('administrator_id', Admin::user()->id)
                        ->orderBy('id', 'Desc')
                        ->limit(8)
                        ->get();
                    $data = [];
                    foreach ($recs as $va) {
                        $_data['title'] = Str::limit($va->name, 20);
                        $_data['sub_title'] = $va->is_done ? "Done" : "Not done";
                        $data[] = $_data;
                    }
                    $box  = new Box(' Recent scheduled acticivies', view('widgets.box-4', ['data' => $data]));
                    $box
                        ->style('success')
                        ->collapsable();
                    $column->append($box);
                });
                $row->column(3, function (Column $column) {
                    $recs = GardenProductionRecord::where('administrator_id', Admin::user()->id)
                        ->orderBy('id', 'Desc')
                        ->limit(8)
                        ->get();
                    $data = [];
                    foreach ($recs as $va) {
                        $_data['title'] = Str::limit($va->description, 16);
                        $_data['sub_title'] = Str::limit("By " . $va->owner->name, 10);
                        $data[] = $_data;
                    }
                    $box  = new Box('Recent production records', view('widgets.box-4', ['data' => $data]));
                    $box
                        ->style('success')
                        ->collapsable();
                    $column->append($box);
                });
                $row->column(3, function (Column $column) {
                    $box  = new Box('Latest E-Academy courses', view('widgets.box-1', ['data' => [
                        ''
                    ]]));
                    $box
                        ->style('success')
                        ->collapsable();
                    $column->append($box);
                });
            });

        /*         return $content
            ->title('Dashboard')
            ->description('Description...')
            ->row(Dashboard::title())
            ->row(function (Row $row) {
                $row->column(6, function (Column $column) {
                    $column->append(Dashboard::environment());
                });

                $row->column(3, function (Column $column) {
                    $column->append(Dashboard::extensions());
                });

                $row->column(3, function (Column $column) {
                    $column->append(Dashboard::dependencies());
                });
            }); */
    }
}
