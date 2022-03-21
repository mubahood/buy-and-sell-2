<?php

namespace App\Admin\Controllers;

use App\Models\PostCategory;
use Encore\Admin\Controllers\AdminController;
use Encore\Admin\Form;
use Encore\Admin\Grid;
use Encore\Admin\Show;

class PostCategoryController extends AdminController
{
    /**
     * Title for current resource.
     *
     * @var string
     */
    protected $title = 'PostCategory';

    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid()
    {
        $grid = new Grid(new PostCategory());

        $grid->column('id', __('Id'));
        $grid->column('created_at', __('Created at'));
        $grid->column('updated_at', __('Updated at'));
        $grid->column('name', __('Name'));
        $grid->column('details', __('Details'));
        $grid->column('thumnnail', __('Thumnnail'));
        $grid->column('posts', __('Posts'));

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
        $show = new Show(PostCategory::findOrFail($id));

        $show->field('id', __('Id'));
        $show->field('created_at', __('Created at'));
        $show->field('updated_at', __('Updated at'));
        $show->field('name', __('Name'));
        $show->field('details', __('Details'));
        $show->field('thumnnail', __('Thumnnail'));
        $show->field('posts', __('Posts'));

        return $show;
    }

    /**
     * Make a form builder.
     *
     * @return Form
     */
    protected function form()
    {
        $form = new Form(new PostCategory());

        $form->text('name', __('Name'));
        $form->text('details', __('Details'));
        $form->image('thumnnail', __('Thumnnail'));
        $form->number('posts', __('Posts'));

        return $form;
    }
}
