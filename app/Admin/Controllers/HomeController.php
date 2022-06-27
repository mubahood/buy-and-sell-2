<?php

namespace App\Admin\Controllers;

use App\Http\Controllers\Controller;
use App\Models\FinancialRecord;
use App\Models\GardenActivity;
use App\Models\GardenProductionRecord;
use App\Models\Product;
use Carbon\Carbon;
use Encore\Admin\Controllers\Dashboard;
use Encore\Admin\Facades\Admin;
use Encore\Admin\Layout\Column;
use Encore\Admin\Layout\Content;
use Encore\Admin\Layout\Row;
use Encore\Admin\Widgets\Box;
use Illuminate\Support\Str;


class HomeController extends Controller
{
    public function index(Content $content)
    {
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
<<<<<<< HEAD
                                $_income += ((-1) * ($rec->amount));
                            } else {
                                $_expense += $rec->amount;
=======
                                $_income += ((-1) * ((int)($rec->amount)));
                            } else {
                                $_expense += ((int)($rec->amount));
>>>>>>> ict4farmers-new
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
<<<<<<< HEAD
                        $_data['sub_title'] = Str::limit("By ".$va->owner->name, 10);
=======
                        $_data['sub_title'] = Str::limit("By " . $va->owner->name, 10);
>>>>>>> ict4farmers-new
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
