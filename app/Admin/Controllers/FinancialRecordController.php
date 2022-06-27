<?php

namespace App\Admin\Controllers;

use App\Models\FinancialRecord;
use App\Models\Garden;
use Carbon\Carbon;
use Encore\Admin\Auth\Database\Administrator;
use Encore\Admin\Controllers\AdminController;
use Encore\Admin\Facades\Admin;
use Encore\Admin\Form;
use Encore\Admin\Grid;
use Encore\Admin\Show;
use Illuminate\Support\Facades\Auth;

class FinancialRecordController extends AdminController
{
    /**
     * Title for current resource.
     *
     * @var string
     */
    protected $title = 'My financial records';

    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid()
    {
<<<<<<< HEAD

        /* 
        $amounts = [11000, 69000, 18000, 88000, 1300, 42000, 16000, 90000, 10000, 15000, 10000, 5000, 1500, 15900, 45000, 5000, 60000, 4000, 2000, 25000, 10000];
        $gardens = [10,11];
        for ($i = 0; $i < 650; $i++) {
            $d = new Carbon();
            $d->subDays(rand(1, 120));
            shuffle($amounts);
            shuffle($amounts);
            shuffle($amounts);
            shuffle($amounts);
            shuffle($gardens);
            $f = new FinancialRecord();
            $f->garden_id = $gardens[0];
            $f->created_at = $d->format('Y-m-d H:i:s');
            $f->administrator_id = 44;
            $f->created_by = 44;
            $f->amount =  ($amounts[0]);
            $f->description = 'Paid workers';
            $f->save();
        }
        die("done"); 
        $_descs = [
            'Paid workers',
            'Paid workers',
            'Paid workers',
            'Purchsed seeds',
            'Purchsed pestsides',
            'Paid wages',
            'Paid electricity',
            'Transportation fee',
            'Taxes',
            'Paid loan',
            'Paid salary',
            'Paid services',
        ];
        $descs = [
            'Sold harvests',
            'Sold 100KGs',
            'Sold seed',
            'Cash sales',
        ];

        foreach (FinancialRecord::all() as $key => $v) {
            shuffle($descs);
            shuffle($_descs);
            if($v->amount < 1){
                $v->description = $_descs[1];
            }else{
                $v->description = $descs[1];
            }
            $v->save();

        } 
*/
=======
>>>>>>> ict4farmers-new
        $grid = new Grid(new FinancialRecord());

        if (
            Admin::user()->isRole('administrator') ||
            Admin::user()->isRole('admin')
        ) {
            /*$grid->actions(function ($actions) {
                $actions->disableEdit();
            });*/
        } else {
            $grid->model()->where('administrator_id', Admin::user()->id);
            $grid->disableRowSelector();
        }

        $grid->filter(function ($filter) {
            $u = Auth::user();
            //$filter->equal('administrator_id', "Filter by user")->select(Administrator::all()->pluck('name', 'id'));
            $filter->select('garden_id', __('Select Enterprise'))
                ->options(
                    Garden::where('administrator_id', $u->id)->get()->pluck('name', 'id')
                );
        });

        if (
            Admin::user()->isRole('administrator') ||
            Admin::user()->isRole('admin')
        ) {
            /*$grid->actions(function ($actions) {
                $actions->disableEdit();
            });*/
        } else {
            $grid->model()->where('administrator_id', Admin::user()->id);
            $grid->disableRowSelector();
        }

        $grid->column('id', __('#Id'))->sortable();
        $grid->column('created_at', __('Created'))->sortable();
        $grid->column('garden_id', __('Enterprise'))->display(function () {
            return $this->enterprise->name;
        })->sortable();

        $grid->column('administrator_id', __('Owner'))->display(function () {
            return $this->owner->name;
        })->sortable();


        $grid->column('created_by', __('Created by'))->display(function () {
            return $this->creator->name;
        })->sortable();

        $grid->column('description', __('Description'));
        $grid->column('amount', __('Amount'))->display(function () {
            return $this->amount_text;
        })->sortable();


        return $grid;
    }

    /**
     * Make a show builder.
     *
     * @param mixed $id
     * @return Show
     */
    protected function detail($id)
    {
        $show = new Show(FinancialRecord::findOrFail($id));

        $show->field('id', __('Id'));
        $show->field('created_at', __('Created at'));
        $show->field('updated_at', __('Updated at'));
        $show->field('garden_id', __('Garden id'));
        $show->field('administrator_id', __('Administrator id'));
        $show->field('created_by', __('Created by'));
        $show->field('description', __('Description'));
        $show->field('amount', __('Amount'));

        return $show;
    }

    /**
     * Make a form builder.
     *
     * @return Form
     */
    protected function form()
    {
        //$form->number('administrator_id', __('Administrator id'));

        $form = new Form(new FinancialRecord());
        $u = Auth::user();
        $form->select('garden_id', __('Enterprise'))
            ->options(
                Garden::where('administrator_id', $u->id)->get()->pluck('name', 'id')
            )
            ->rules('required');
        $form->hidden('created_by', __('created_by'))->default($u->id)->value($u->id);

        $form->date('created_date', __('Transaction date'))->rules('required');

        $form->text('description', __('Description'))->rules('required');
        $form->text('amount', __('Amount'))
            ->attribute('type', 'number')
            ->help('Start with a negative (-) for expense transaction.')
            ->rules('required');
        return $form;
    }
}
