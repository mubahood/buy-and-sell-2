<?php

namespace App\Admin\Controllers;

use App\Models\PestCase;
use Encore\Admin\Controllers\AdminController;
use Encore\Admin\Form;
use Encore\Admin\Grid;
use Encore\Admin\Show;
//test

class PestCaseController extends AdminController
{
    /**
     * Title for current resource.
     *
     * @var string
     */
    protected $title = 'PestCase';

    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid()
    {
        $grid = new Grid(new PestCase());

        $grid->column('id', __('Id'));
        $grid->column('created_at', __('Created at'));
        $grid->column('updated_at', __('Updated at'));
        $grid->column('garden_id', __('Garden id'));
        $grid->column('pest_id', __('Pest id'));
        $grid->column('administrator_id', __('Administrator id'));
        $grid->column('location_id', __('Location id'));
        $grid->column('description', __('Description'));
        $grid->column('images', __('Images'));

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
        $show = new Show(PestCase::findOrFail($id));

        $show->field('id', __('Id'));
        $show->field('created_at', __('Created at'));
        $show->field('updated_at', __('Updated at'));
        $show->field('garden_id', __('Garden id'));
        $show->field('pest_id', __('Pest id'));
        $show->field('administrator_id', __('Administrator id'));
        $show->field('location_id', __('Location id'));
        $show->field('description', __('Description'));
        $show->field('images', __('Images'));

        return $show;
    }

    /**
     * Make a form builder.
     *
     * @return Form
     */
    protected function form()
    {
        $form = new Form(new PestCase());

        $form->number('garden_id', __('Garden id'));
        $form->number('pest_id', __('Pest id'));
        $form->number('administrator_id', __('Administrator id'));
        $form->number('location_id', __('Location id'));
        $form->textarea('description', __('Description'));
        $form->textarea('images', __('Images'));

        return $form;
    }
}
