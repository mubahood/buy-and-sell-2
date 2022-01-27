<?php

namespace App\Admin\Controllers;
 
use Encore\Admin\Controllers\AdminController;
use Encore\Admin\Form;
use Encore\Admin\Grid;
use Encore\Admin\Show;

class CityController extends AdminController
{
    /**
     * Title for current resource.
     *
     * @var string
     */
    protected $title = 'Areas';

    /**
     * Make a grid builder. 
     *
     * @return Grid
     */
    protected function grid()
    {
        $grid = new Grid(new \App\Models\City());

        $grid->column('id', __('Id'));
        $grid->column('name', __('Name'));

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
        $show = new Show(\App\Models\City::findOrFail($id));

        $show->field('id', __('Id'));
        $show->field('created_at', __('Created at'));
        $show->field('updated_at', __('Updated at'));
        $show->field('country_id', __('Country id'));
        $show->field('name', __('Name'));
        $show->field('longitude', __('Longitude'));
        $show->field('latitude', __('Latitude'));
        $show->field('details', __('Details'));
        $show->field('image', __('Image'));
        $show->field('listed', __('Listed'));

        return $show;
    }

    /**
     * Make a form builder.
     *
     * @return Form
     */
    protected function form()
    {
        $form = new Form(new \App\Models\City());

        $form->number('country_id', __('Country id'));
        $form->text('name', __('Name'));
        $form->text('longitude', __('Longitude'));
        $form->text('latitude', __('Latitude'));
        $form->text('details', __('Details'));
        $form->image('image', __('Image'));
        $form->text('listed', __('Listed'));

        return $form;
    }
}
