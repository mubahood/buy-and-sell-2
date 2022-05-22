<?php

namespace App\Admin\Controllers;

use App\Models\Garden;
use Encore\Admin\Controllers\AdminController;
use Encore\Admin\Form;
use Encore\Admin\Grid;
use Encore\Admin\Show;
use Illuminate\Support\Facades\Auth;

class GardenController extends AdminController
{
    /**
     * Title for current resource.
     *
     * @var string
     */
    protected $title = 'Garden';

    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid()
    {
        $grid = new Grid(new Garden());

        $grid->column('id', __('Id'));
        $grid->column('created_at', __('Created at'));
        $grid->column('updated_at', __('Updated at'));
        $grid->column('administrator_id', __('Administrator id'));
        $grid->column('crop_category_id', __('Crop category id'));
        $grid->column('location_id', __('Location id'));
        $grid->column('name', __('Name'));
        $grid->column('image', __('Image'));
        $grid->column('plant_date', __('Plant date'));
        $grid->column('harvest_date', __('Harvest date'));
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
        $show = new Show(Garden::findOrFail($id));

        $show->field('id', __('Id'));
        $show->field('created_at', __('Created at'));
        $show->field('updated_at', __('Updated at'));
        $show->field('administrator_id', __('Administrator id')); 
        $show->field('crop_category_id', __('Crop category id'));
        $show->field('location_id', __('Location id'));
        $show->field('name', __('Name'));
        $show->field('image', __('Image'));
        $show->field('plant_date', __('Plant date'));
        $show->field('harvest_date', __('Harvest date'));
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
        $form = new Form(new Garden());

        $u = Auth::user();
        $form->hidden('administrator_id', __('Administrator id'))->default($u->id)->value($u->id);
        $form->number('crop_category_id', __('Crop category id'));
        $form->number('location_id', __('Location id'));
        $form->textarea('name', __('Name'));
        $form->textarea('image', __('Image'));
        $form->textarea('plant_date', __('Plant date'));
        $form->textarea('harvest_date', __('Harvest date'));
        $form->textarea('details', __('Details'));
        $form->textarea('latitude', __('Latitude'));
        $form->textarea('longitude', __('Longitude'));

        return $form;
    }
}
