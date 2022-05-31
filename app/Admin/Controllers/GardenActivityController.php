<?php

namespace App\Admin\Controllers;

use App\Models\GardenActivity;
use Encore\Admin\Controllers\AdminController;
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
    protected $title = 'GardenActivity';

    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid()
    {
        $grid = new Grid(new GardenActivity());

        $grid->column('id', __('Id'));
        $grid->column('created_at', __('Created at'));
        $grid->column('updated_at', __('Updated at'));
        $grid->column('name', __('Name'));
        $grid->column('due_date', __('Due date'));
        $grid->column('details', __('Details'));
        $grid->column('administrator_id', __('Administrator id'));
        $grid->column('person_responsible', __('Person responsible'));
        $grid->column('done_by', __('Done by'));
        $grid->column('is_generated', __('Is generated'));
        $grid->column('is_done', __('Is done'));
        $grid->column('done_status', __('Done status'));
        $grid->column('done_details', __('Done details'));
        $grid->column('done_images', __('Done images'));
        $grid->column('position', __('Position'));
        $grid->column('garden_id', __('Garden id'));
        $grid->column('garden_production_record_id', __('Garden production record id'));

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
