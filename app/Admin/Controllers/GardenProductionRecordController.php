<?php

namespace App\Admin\Controllers;

use App\Models\GardenProductionRecord;
use Encore\Admin\Controllers\AdminController;
use Encore\Admin\Form;
use Encore\Admin\Grid;
use Encore\Admin\Show;

class GardenProductionRecordController extends AdminController
{
    /**
     * Title for current resource.
     *
     * @var string
     */
    protected $title = 'GardenProductionRecord';

    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid()
    {
        $grid = new Grid(new GardenProductionRecord());

        $grid->column('id', __('Id'));
        $grid->column('created_at', __('Created at'));
        $grid->column('updated_at', __('Updated at'));
        $grid->column('garden_id', __('Garden id'));
        $grid->column('administrator_id', __('Administrator id'));
        $grid->column('description', __('Description'));
        $grid->column('images', __('Images'));
        $grid->column('created_by_id', __('Created by id'));

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
        $show = new Show(GardenProductionRecord::findOrFail($id));

        $show->field('id', __('Id'));
        $show->field('created_at', __('Created at'));
        $show->field('updated_at', __('Updated at'));
        $show->field('garden_id', __('Garden id'));
        $show->field('administrator_id', __('Administrator id'));
        $show->field('description', __('Description'));
        $show->field('images', __('Images'));
        $show->field('created_by_id', __('Created by id'));

        return $show;
    }

    /**
     * Make a form builder.
     *
     * @return Form
     */
    protected function form()
    {
        $form = new Form(new GardenProductionRecord());

        $form->number('garden_id', __('Garden id'));
        $form->number('administrator_id', __('Administrator id'));
        $form->textarea('description', __('Description'));
        $form->textarea('images', __('Images'));
        $form->number('created_by_id', __('Created by id'));

        return $form;
    }
}
