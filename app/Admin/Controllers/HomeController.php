<?php

namespace App\Admin\Controllers;

use App\Http\Controllers\Controller;
use App\Models\FinancialRecord;
use Carbon\Carbon;
use Encore\Admin\Controllers\Dashboard;
use Encore\Admin\Layout\Column;
use Encore\Admin\Layout\Content;
use Encore\Admin\Layout\Row;
use Encore\Admin\Widgets\Box;

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
                    $column->append($box);
                });

                $row->column(3, function (Column $column) {
                    $box  = new Box('My customers messages', view('widgets.box-3', [
                        'icon' => '3.png',
                        'count' => '51',
                        'sub_title' => 'Unread messages from your customers.',
                    ]));
                    $column->append($box);
                });

                $row->column(3, function (Column $column) {
                    $box  = new Box('Announcements', view('widgets.box-3', [
                        'icon' => '4.png',
                        'count' => '51',
                        'sub_title' => 'Communications from your farmers association.',
                    ]));
                    $column->append($box);
                });

                $row->column(3, function (Column $column) {
                    $box  = new Box('E-Academy', view('widgets.box-3', [
                        'icon' => '3.png',
                        'count' => '17',
                        'sub_title' => 'Farming digital courses available for FREE.',
                    ]));
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
                                $_income += ((-1) * ($rec->amount));
                            } else {
                                $_expense += $rec->amount;
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
                    $box  = new Box('Scheduled acivities', view('widgets.box-1', ['data' => []]));
                    $box->collapsable();
                    $column->append($box);
                });
                $row->column(3, function (Column $column) {
                    $box  = new Box('Upcoming activities', view('widgets.box-2', ['data' => []]));
                    $box->collapsable();
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
