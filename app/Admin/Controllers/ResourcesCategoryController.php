<?php

namespace App\Admin\Controllers;

use App\Models\Category;
use App\Models\Utils;
use Encore\Admin\Controllers\AdminController;
use Encore\Admin\Form;
use Encore\Admin\Layout\Content;
use Encore\Admin\Tree;

class ResourcesCategoryController extends AdminController
{
    protected $title = 'Resources categories';

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
        return Category::tree(function (Tree $tree) {
            $tree->branch(function ($branch) {
                return $branch['name'];
            })->query(function ($model) {
                return $model->where('type', 'resource');
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
        $form = new Form(new Category());



        $form->saving(function (Form $form) {
            $form->slug = Utils::make_slug($form->name);
            return $form;
        });


        $form->text('name', "Category name")->rules('required');
        $form->hidden('slug', "slug");
        $form->hidden('type', "type")->default('resource');
        $form->text('unit', "Category measuring unit")->default('KGs')->rules('required');
        $form->textarea('description', "Category description");
        $form->image('image', "Category photo");
        //$form->select('parent')->options(Category::get_subcategories() );



        // parent	
        // slug	





        return $form;
    }
}
