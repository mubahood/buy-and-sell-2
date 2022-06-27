<?php

namespace App\Admin\Controllers;

use App\Models\CropCategory;
use Encore\Admin\Controllers\AdminController;
use Encore\Admin\Form;
use Encore\Admin\Form\NestedForm;
use Encore\Admin\Grid;
use Encore\Admin\Show;

class CropCategoryController extends AdminController
{
    /**
     * Title for current resource.
     *
     * @var string
     */
    protected $title = 'Enterprise Categories';
  

    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid()
    {
        $grid = new Grid(new CropCategory());

        $grid->column('id', __('Id'));
        $grid->column('name', __('Name'));
        $grid->column('image', __('Image'));
        
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
        $show = new Show(CropCategory::findOrFail($id));

        $show->field('id', __('Id'));
        $show->field('created_at', __('Created at'));
        $show->field('updated_at', __('Updated at'));
        $show->field('name', __('Name'));
        $show->field('image', __('Image'));
        $show->field('details', __('Details'));

        return $show;
    }


    /**
     * Make a form builder.
     *
     * @return Form
     */
    protected function form()
    {
        $form = new Form(new CropCategory());

        $form->text('name', __('Name'))->required();
        $parents = [];
        foreach (CropCategory::all() as $key => $v) {
            $id = (int)($v->parent);
            if($v->parent<1){
                $parents[$v->id] = $v->name;
            }
        }
        
        $form->select('parent', __('Parent category'))
        ->options($parents);
        $form->image('image', __('Image'));
        $form->textarea('details', __('Details')); 

        
        $form->hasMany('activities', function (NestedForm $form) {
            $form->text('name', __('Name'))->required();
            $form->text('days_after_planting', __('Days after planting'))
            ->attribute(['type' => 'number'])
            ->required();
            $form->textarea('details', __('details'));
        });


        return $form;
    }
}
