<?php

namespace App\Admin\Controllers;

use App\Models\FinancialRecord;
use Encore\Admin\Controllers\AdminController;
use Encore\Admin\Facades\Admin;
use Encore\Admin\Form;
use Encore\Admin\Grid;
use Encore\Admin\Show;

class FinancialRecordController extends AdminController
{
    /**
     * Title for current resource.
     *
     * @var string
     */
    protected $title = 'Financial records';

    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid()
    {
        $grid = new Grid(new FinancialRecord());

        if (
            Admin::user()->isRole('administrator') ||
            Admin::user()->isRole('admin')
        ) {
            /*$grid->actions(function ($actions) {
                $actions->disableEdit();
            });*/
        } else {
            //$grid->model()->where('administrator_id', Admin::user()->id);
            $grid->disableRowSelector();
        }

 
        $grid->column('id', __('#Id'))->sortable(); 
        $grid->column('created_at', __('Created'))->sortable(); 
        $grid->column('garden_id', __('Enterprise'))->display(function () {
            return $this->enterprise->name;
        })->sortable(); 
        
        $grid->column('administrator_id', __('Owner'))->display(function(){
            return $this->owner->name; 
        })->sortable();
        
        
        $grid->column('created_by', __('Created by'))->display(function(){
            return $this->creator->name; 
        })->sortable();
         
        $grid->column('description', __('Description'));
        $grid->column('amount', __('Amount'));
        
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
        $form = new Form(new FinancialRecord());

        $form->number('garden_id', __('Garden id'));
        $form->number('administrator_id', __('Administrator id'));
        $form->number('created_by', __('Created by'));
        $form->textarea('description', __('Description'));
        $form->number('amount', __('Amount'));

        return $form;
    }
}
