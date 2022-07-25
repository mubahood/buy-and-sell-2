<?php

namespace App\Admin\Controllers;

use App\Models\GardenActivity;
use Encore\Admin\Controllers\AdminController;
use Encore\Admin\Facades\Admin;
use Encore\Admin\Form;
use Encore\Admin\Grid;
use Encore\Admin\Show;

class GardenActivityController extends AdminController
{
    /**
     * Title for current resource.
     *
     * @var string
     */
    protected $title = 'Garden activities';

    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid()
    {
        $grid = new Grid(new GardenActivity()); 

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

        //$grid->column('id', __('Id'));
        //$grid->column('details', __('Details'));
        //$grid->column('administrator_id', __('Administrator id'));
        //$grid->column('is_generated', __('Is generated'));
        //$grid->column('done_by', __('Submitted'));
        //$grid->column('is_done', __('Submitted'));
        //$grid->column('done_details', __('Done details'));
        //$grid->column('position', __('Position'));
        //$grid->column('done_images', __('Done images'));
        //$grid->column('garden_id', __('Enterprise'));
        //$grid->column('garden_production_record_id', __('Garden production record id'));
        
        $grid->column('created_at', __('Created'));
        $grid->column('garden_id', __('Enterprise'))->display(function () {
            return $this->enterprise->name; 
        })->sortable();
        $grid->column('name', __('Activity'));
        
        $grid->column('person_responsible', __('Assigned to'))->display(function () {
            return $this->assigned_to->name; 
        })->sortable();

        $grid->column('due_date', __('To be done before')); 
        $grid->column('done_status', __('Is done')); 
        
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
        $show = new Show(GardenActivity::findOrFail($id));

        $show->field('id', __('Id'));
        $show->field('created_at', __('Created at'));
        $show->field('updated_at', __('Updated at'));
        $show->field('name', __('Name'));
        $show->field('due_date', __('Due date'));
        $show->field('details', __('Details'));
        $show->field('administrator_id', __('Administrator id'));
        $show->field('person_responsible', __('Person responsible'));
        $show->field('done_by', __('Done by'));
        $show->field('is_generated', __('Is generated'));
        $show->field('is_done', __('Is done'));
        $show->field('done_status', __('Done status'));
        $show->field('done_details', __('Done details'));
        $show->field('done_images', __('Done images'));
        $show->field('position', __('Position'));
        $show->field('garden_id', __('Garden id'));
        $show->field('garden_production_record_id', __('Garden production record id'));

        return $show;
    }

    /**
     * Make a form builder.
     *
     * @return Form
     */
    protected function form()
    {
        $form = new Form(new GardenActivity());

        $form->textarea('name', __('Name'));
        $form->textarea('due_date', __('Due date'));
        $form->textarea('details', __('Details'));
        $form->number('administrator_id', __('Administrator id'));
        $form->number('person_responsible', __('Person responsible'));
        $form->number('done_by', __('Done by'));
        $form->switch('is_generated', __('Is generated'));
        $form->textarea('is_done', __('Is done'));
        $form->textarea('done_status', __('Done status'));
        $form->textarea('done_details', __('Done details'));
        $form->textarea('done_images', __('Done images'));
        $form->number('position', __('Position'));
        $form->number('garden_id', __('Garden id'))->default(1);
        $form->number('garden_production_record_id', __('Garden production record id'));

        return $form;
    }
}
