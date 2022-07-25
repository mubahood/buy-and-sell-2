<?php

namespace App\Admin\Controllers;

use App\Models\Question;
use Encore\Admin\Controllers\AdminController;
use Encore\Admin\Form;
use Encore\Admin\Grid;
use Encore\Admin\Show;

class QuestionController extends AdminController
{
    /**
     * Title for current resource.
     *
     * @var string
     */
    protected $title = 'Question';

    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid()
    {
        $grid = new Grid(new Question());

        $grid->column('id', __('Id'));
        $grid->column('created_at', __('Created at'));
        $grid->column('updated_at', __('Updated at'));
        $grid->column('administrator_id', __('Administrator id'));
        $grid->column('answered_by', __('Answered by'));
        $grid->column('is_answered', __('Is answered'));
        $grid->column('question', __('Question'));
        $grid->column('answer', __('Answer'));
        $grid->column('question_images', __('Question images'));
        $grid->column('answer_images', __('Answer images'));
        $grid->column('category_id', __('Category id'));

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
        $show = new Show(Question::findOrFail($id));

        $show->field('id', __('Id'));
        $show->field('created_at', __('Created at'));
        $show->field('updated_at', __('Updated at'));
        $show->field('administrator_id', __('Administrator id'));
        $show->field('answered_by', __('Answered by'));
        $show->field('is_answered', __('Is answered'));
        $show->field('question', __('Question'));
        $show->field('answer', __('Answer'));
        $show->field('question_images', __('Question images'));
        $show->field('answer_images', __('Answer images'));
        $show->field('category_id', __('Category id'));

        return $show;
    }

    /**
     * Make a form builder.
     *
     * @return Form
     */
    protected function form()
    {
        $form = new Form(new Question());

        $form->number('administrator_id', __('Administrator id'));
        $form->number('answered_by', __('Answered by'));
        $form->switch('is_answered', __('Is answered'));
        $form->textarea('question', __('Question'));
        $form->textarea('answer', __('Answer'));
        $form->textarea('question_images', __('Question images'));
        $form->textarea('answer_images', __('Answer images'));
        $form->number('category_id', __('Category id'));

        return $form;
    }
}
