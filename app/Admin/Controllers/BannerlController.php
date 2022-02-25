<?php

namespace App\Admin\Controllers;

use App\Models\Banner;
use App\Models\Category;
use App\Models\Product;
use Encore\Admin\Controllers\AdminController;
use Encore\Admin\Form;
use Encore\Admin\Grid;
use Encore\Admin\Show;

class BannerlController extends AdminController
{
    /**
     * Title for current resource.
     *
     * @var string
     */
    protected $title = 'Banner';

    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid()
    {
        $grid = new Grid(new Banner());

        $grid->column('id', __('Id'));
        $grid->column('section', __('Section'));
        $grid->column('position', __('Position'));
        $grid->column('name', __('Title'))->editable();
        $grid->column('sub_title', __('Sub title'))->editable();
        $grid->column('type', __('Type'));
        $grid->column('category_id', __('Category id'));
        $grid->column('product_id', __('Product id'));
        $grid->column('image', __('Image'));
        $grid->column('clicks', __('Clicks'));

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
        $show = new Show(Banner::findOrFail($id));

        $show->field('id', __('Id'));
        $show->field('section', __('Section'));
        $show->field('position', __('Position'));
        $show->field('name', __('Name'));
        $show->field('sub_title', __('Sub title'));
        $show->field('type', __('Type'));
        $show->field('category_id', __('Category id'));
        $show->field('product_id', __('Product id'));
        $show->field('image', __('Image'));
        $show->field('clicks', __('Clicks'));

        return $show;
    }

    /**
     * Make a form builder.
     *
     * @return Form
     */
    protected function form()
    {
        $form = new Form(new Banner());

        $form->select('section', __('Section'))->options([
            'Section #1' => 'Section #1',
            'Section #2' => 'Section #2',
            'Section #3' => 'Section #3',
            'Section #4' => 'Section #4',
        ])->required();
        $form->text('position', __('Position'))->required();
        $form->text('name', __('title'))->required();
        $form->text('sub_title', __('Sub title'))->required();

        $form->radio('type', __('Banner Type'))->options([
            'Category' => 'Category',
            'Product' => 'Product',
        ])
            ->when("Category", function ($form) {
                $form->select('category_id', 'Select category')->options(Category::all()->pluck('name', 'id'))->default(0);
            })
            ->required()
            ->when("Product", function ($form) {
                $form->select('product_id', 'Select product')->options(Product::all()->pluck('name', 'id'))->default(0);
            })
            ->required();
        $form->image('image', __('Image'))->required();

        return $form;
    }
}
