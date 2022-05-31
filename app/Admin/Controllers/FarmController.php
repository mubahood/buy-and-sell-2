<?php

namespace App\Admin\Controllers;

use App\Models\Farm;
use Encore\Admin\Controllers\AdminController;
use Encore\Admin\Form;
use Encore\Admin\Grid;
use Encore\Admin\Show;

class FarmController extends AdminController
{
    /**
     * Title for current resource.
     *
     * @var string
     */
    protected $title = 'Farm';

    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid()
    {
        $grid = new Grid(new Farm());

        $grid->column('id', __('Id'));
        $grid->column('created_at', __('Created at'));
        $grid->column('updated_at', __('Updated at'));
        $grid->column('administrator_id', __('Administrator id'));
        $grid->column('location_id', __('Location id'));
        $grid->column('name', __('Name'));
        $grid->column('details', __('Details'));
        $grid->column('latitude', __('Latitude'));
        $grid->column('longitude', __('Longitude'));

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
        $show = new Show(Farm::findOrFail($id));

        $show->field('id', __('Id'));
        $show->field('created_at', __('Created at'));
        $show->field('updated_at', __('Updated at'));
        $show->field('administrator_id', __('Administrator id'));
        $show->field('location_id', __('Location id'));
        $show->field('name', __('Name'));
        $show->field('details', __('Details'));
        $show->field('latitude', __('Latitude'));
        $show->field('longitude', __('Longitude'));

        return $show;
    }

    /**
     * Make a form builder.
     *
     * @return Form
     */
    protected function form()
    {
        $form = new Form(new Farm());

        $form->number('administrator_id', __('Administrator id'));
        $form->number('location_id', __('Location id'));
        $form->textarea('name', __('Name'));
        $form->textarea('details', __('Details'));
        $form->textarea('latitude', __('Latitude'));
        $form->textarea('longitude', __('Longitude'));

        return $form;
    }
}
