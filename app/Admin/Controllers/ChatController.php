<?php

namespace App\Admin\Controllers;

use App\Models\Chat;
use App\Models\Utils;
use Encore\Admin\Controllers\AdminController;
use Encore\Admin\Form;
use Encore\Admin\Grid;
use Encore\Admin\Show;

class ChatController extends AdminController
{
    /**
     * Title for current resource.
     *
     * @var string
     */
    protected $title = 'Chat';

    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid()
    {
        $grid = new Grid(new Chat());

        $grid->column('id', __('Id'));
        $grid->column('created_at', __('Created at'));
        $grid->column('updated_at', __('Updated at'));
        $grid->column('body', __('Body'));
        $grid->column('sender', __('Sender'));
        $grid->column('receiver', __('Receiver'));
        $grid->column('product_id', __('Product id'));
        $grid->column('thread', __('Thread'));
        $grid->column('received', __('Received'));
        $grid->column('seen', __('Seen'));
        $grid->column('type', __('Type'));
        $grid->column('receiver_pic', __('Receiver pic'));
        $grid->column('sender_pic', __('Sender pic'));
        $grid->column('contact', __('Contact'));
        $grid->column('gps', __('Gps'));
        $grid->column('file', __('File'));
        $grid->column('image', __('Image'));
        $grid->column('audio', __('Audio'));
        $grid->column('receiver_name', __('Receiver name'));
        $grid->column('sender_name', __('Sender name'));
        $grid->column('product_name', __('Product name'));
        $grid->column('product_pic', __('Product pic'));
        $grid->column('unread_count', __('Unread count'));

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
        $show = new Show(Chat::findOrFail($id));

        $show->field('id', __('Id'));
        $show->field('created_at', __('Created at'));
        $show->field('updated_at', __('Updated at'));
        $show->field('body', __('Body'));
        $show->field('sender', __('Sender'));
        $show->field('receiver', __('Receiver'));
        $show->field('product_id', __('Product id'));
        $show->field('thread', __('Thread'));
        $show->field('received', __('Received'));
        $show->field('seen', __('Seen'));
        $show->field('type', __('Type'));
        $show->field('receiver_pic', __('Receiver pic'));
        $show->field('sender_pic', __('Sender pic'));
        $show->field('contact', __('Contact'));
        $show->field('gps', __('Gps'));
        $show->field('file', __('File'));
        $show->field('image', __('Image'));
        $show->field('audio', __('Audio'));
        $show->field('receiver_name', __('Receiver name'));
        $show->field('sender_name', __('Sender name'));
        $show->field('product_name', __('Product name'));
        $show->field('product_pic', __('Product pic'));
        $show->field('unread_count', __('Unread count'));

        return $show;
    }

    /**
     * Make a form builder.
     *
     * @return Form
     */
    protected function form()
    {
        $form = new Form(new Chat());

        Utils::session_start();

        $form->textarea('body', __('Body'));
        $form->number('sender', __('Sender'));
        $form->number('receiver', __('Receiver'));
        $form->number('product_id', __('Product id'));
        $form->textarea('thread', __('Thread'));
        $form->switch('received', __('Received'));
        $form->switch('seen', __('Seen'));
        $form->textarea('type', __('Type'));
        $form->textarea('receiver_pic', __('Receiver pic'));
        $form->textarea('sender_pic', __('Sender pic'));
        $form->textarea('contact', __('Contact'));
        $form->textarea('gps', __('Gps'));
        $form->textarea('file', __('File'));
        $form->textarea('image', __('Image'));
        $form->textarea('audio', __('Audio'));
        $form->textarea('receiver_name', __('Receiver name'));
        $form->textarea('sender_name', __('Sender name'));
        $form->textarea('product_name', __('Product name'));
        $form->textarea('product_pic', __('Product pic'));
        $form->number('unread_count', __('Unread count'));

        return $form;
    }
}
