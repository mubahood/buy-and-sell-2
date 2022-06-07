<?php

namespace App\Admin\Controllers;

use App\Models\Category;
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
        return Category::tree(function (Tree $tree) {

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
        $form = new Form(new Category());

        






        $form->text('name',"Category name")->rules('required');
        
        $form->hidden('type',"type")->default('product');
        $form->text('unit',"Category measuring unit")->rules('required');
        $form->textarea('description',"Category description")->rules('required');
        $form->image('image',"Category photo");
        //$form->select('parent')->options(Category::get_subcategories() );

 

        // parent	
        // slug	


	


        return $form;
    }
}
