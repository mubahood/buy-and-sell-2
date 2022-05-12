<?php

namespace App\Admin\Controllers;

use App\Models\FarmersGroup;
use Encore\Admin\Auth\Database\Administrator;
use Encore\Admin\Controllers\AdminController;
use Encore\Admin\Form;
use Encore\Admin\Form\NestedForm;
use Encore\Admin\Grid;
use Encore\Admin\Show;

class FarmersGroupController extends AdminController
{
    /**
     * Title for current resource.
     *
     * @var string
     */
    protected $title = 'FarmersGroup';

    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid()
    {
        $grid = new Grid(new FarmersGroup());

        $grid->column('id', __('Id'));
        $grid->column('created_at', __('Created at'));
        $grid->column('updated_at', __('Updated at'));
        $grid->column('name', __('Name'));
        $grid->column('details', __('Details'));

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
        $show = new Show(FarmersGroup::findOrFail($id));

        $show->field('id', __('Id'));
        $show->field('created_at', __('Created at'));
        $show->field('name', __('Name'));
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
        $form = new Form(new FarmersGroup());

        $form->text('name', __('Group Name'))->required();
        $form->textarea('details', __('Details'));

        $form->hasMany('agents', function (NestedForm $form) {

            $items = [];
            foreach (Administrator::all() as $key => $f) {
                $items[$f->id] = $f->name . ", ID #" . $f->id;
            }
            $form->select('administrator_id', __('Select Agent'))
                ->options($items)
                ->required();
                 
        });


        return $form;
    }
}
