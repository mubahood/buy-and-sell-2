<?php

namespace App\Admin\Controllers;

use App\Models\Banner; 
use Encore\Admin\Controllers\AdminController;
use Encore\Admin\Form;
use Encore\Admin\Layout\Content;
use Encore\Admin\Tree;

class ProductsCategoryController extends AdminController
{
    protected $title = 'All categories';

    /**
     * Index interface.
     *
     * @return Content
     */
    public function index(Content $content)
    {
        return $content
            ->title($this->title)
            ->body($this->tree());
    }

    /**
     * Make a grid builder.
     *
     * @return Tree
     */
    protected function tree()
    {
        return Banner::tree(function (Tree $tree) {

            $tree->branch(function ($branch) {
                return $branch['name'];
            });
        });
    }

    /**
     * Make a form builder.
     *
     * @return Form
     */
    protected function form()
    {
        $form = new Form(new Banner());

        $form->display('id', 'ID');

        $form->select('parent_id')->options(Banner::selectOptions());

        $form->text('title')->rules('required');
        $form->textarea('desc')->rules('required');
        $form->image('logo');

        $form->display('created_at', 'Created At');
        $form->display('updated_at', 'Updated At');

        return $form;
    }
}
