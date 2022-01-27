<?php

namespace App\Admin\Controllers;
  
use Encore\Admin\Controllers\AdminController;
use Encore\Admin\Form;
use Encore\Admin\Form\NestedForm;
use Encore\Admin\Grid;
use Encore\Admin\Show;

class CountryController extends AdminController
{
    /**
     * Title for current resource.
     *
     * @var string
     */
    protected $title = 'City/Division';

    /**
     * Make a grid builder.
     *
     * \Faker\Factory::create();
     * @return Grid
     */
    protected function grid()
    {
        $grid = new Grid(new \App\Models\Country );

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
        $show = new Show(\App\Models\Country::findOrFail($id));

        $show->field('id', __('Id'));
        $show->field('created_at', __('Created at'));
        $show->field('updated_at', __('Updated at'));
        $show->field('name', __('Name'));
        $show->field('longitude', __('Longitude'));
        $show->field('latitude', __('Latitude'));
        $show->field('details', __('Details'));
        $show->field('image', __('Image'));
        $show->field('code', __('Code'));
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
        $form = new Form(new \App\Models\Country());

        $form->text('name', __('Name'))->required();
        $form->hidden('longitude', __('Longitude'))->default("0.0");
        $form->hidden('latitude', __('Latitude'))->default("0.0");
        $form->text('details', __('Details'));
        $form->hidden('image', __('Image'));
        $form->hidden('code', __('Code'))->default("0");
        $form->text('listed', __('Listed')); 

        $form->html('<h3>Click on "New" to an area to this city.</h3>');
        $form->hasMany('cities', null, function (NestedForm $form) {
            $form->text('name', __('Name'))->required();
            $form->hidden('longitude', __('Longitude'))->default("0.0");
            $form->hidden('latitude', __('Latitude'))->default("0.0");
            $form->hidden('details', __('Details'))->default("");
            $form->hidden('image', __('Image'));
            $form->hidden('listed', __('Listed'))->default("1");
        });


        return $form;
    }
}
