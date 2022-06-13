<?php

namespace App\Admin\Controllers;

use App\Http\Controllers\Controller;
use App\Models\FinancialRecord;
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

                $from = date('2022-06-01');
                $to = date('2022-06-02');
                $recs = FinancialRecord::whereBetween('created_at', [$from, $to])->get();
                foreach ($recs as $key => $v) {
                    echo($v->created_at."<br>");
                }
                die("done");
                dd($recs);

                $row->column(6, function (Column $column) {
                    $box_financial  = new Box('Financial report', view('admin.charts.bar'));
                    $box_financial->collapsable();
                    $column->append($box_financial);
                });

                $row->column(3, function (Column $column) {
                    $column->append('Romina 2');
                });

                $row->column(3, function (Column $column) {
                    $column->append('Romina 3');
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
