<?php

namespace App\Admin\Controllers;

use App\Models\Chat;
use App\Models\Product;
use App\Models\User;
use App\Models\Utils;
use Encore\Admin\Auth\Database\Administrator;
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
    protected $title = 'Messages';

    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid()
    {
        return admin_info(
            'Coming soon',
            'Messaing feature is not available on web yet.  
            <a target="_blank" href="https://play.google.com/store/apps/details?id=net.eighttechnologes.ict4farmers">Download ICT4Farmers mobile</a> to fully manage your messages & replies.'
        );

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


        Utils::session_start();

        $sender = 0;
        $product_id = 0;
        $receiver = 0;

        if (
            isset($_GET['sender']) &&
            isset($_GET['product_id']) &&
            isset($_GET['receiver'])
        ) {
            Utils::session_start();
            $_SESSION['chat_create']['sender'] = trim($_GET['sender']);
            $_SESSION['chat_create']['product_id'] = trim($_GET['product_id']);
            $_SESSION['chat_create']['receiver'] = trim($_GET['receiver']);

            $sender = (int)(trim($_GET['sender']));
            $product_id = (int)(trim($_GET['product_id']));
            $receiver = (int)(trim($_GET['receiver']));
        }


        if (isset($_SESSION['chat_create'])) {
            if (
                isset($_SESSION['chat_create']['sender']) &&
                isset($_SESSION['chat_create']['product_id']) &&
                isset($_SESSION['chat_create']['receiver'])
            ) {
                Utils::session_start();
                $sender = (int)($_SESSION['chat_create']['sender']);
                $product_id = (int)($_SESSION['chat_create']['product_id']);
                $receiver = (int)($_SESSION['chat_create']['receiver']);
            }
        }

        if (
            $sender == 0 ||
            $product_id == 0 ||
            $receiver == 0
        ) {
            return redirect(url('admin/products'));
            die("Can't initialize this caht. Please try again");
        }

        $s = Administrator::find($sender);
        $r = Administrator::find($receiver);
        $p = Product::find($product_id);

        if (
            $s == null ||
            $r == null ||
            $p == null
        ) {
            return redirect(url('admin/products'));
            die("Failed to find product information. Please try again");
        }

        $form = new Form(new Chat());


        $form->footer(function ($footer) {
            $footer->disableReset();
            $footer->disableViewCheck();
            $footer->disableEditingCheck();
            $footer->disableCreatingCheck();
        });


        $form->submitted(function () {
            Utils::session_start();
            session_destroy();
            return admin_success(
                'Success',
                'Your message has been successfully sent. 
                <a target="_blank" href="https://play.google.com/store/apps/details?id=net.eighttechnologes.ict4farmers">Download ICT4Farmers mobile</a> to fully manage your messages & replies.'
            );
        });

        $form->display('Sending message to:')->value($r->name);
        $form->display('About product:')->value($p->name);
        $form->display('Product price: '. config('app.currency') . " " )->value($p->price);
        $form->textarea('body', __('Compose message'))
            ->required()
            ->help("TIP: Your messgae should be specific, precise and complete.");
        $form->hidden('sender', __('Sender'))->readonly()->value($s->id);
        $form->hidden('receiver')->readonly()->value($r->id);
        $form->hidden('product_id')->readonly()->value($p->id);
        $form->hidden('thread')->readonly()->value(Chat::get_chat_thread_id(
            $s->id,
            $r->id,
            $p->id
        ));
        $form->hidden('received')->readonly()->value(0);
        $form->hidden('receiver_name')->readonly()->value($r->name);
        $form->hidden('sender_name')->readonly()->value($s->name);
        $form->hidden('product_name')->readonly()->value($p->name);
        $form->hidden('product_pic')->readonly()->value($p->get_thumbnail());
        $form->hidden('seen')->readonly()->value(0);
        $form->hidden('unread_count')->readonly()->value(1);
        $form->hidden('type')->readonly()->value('text');
        $form->hidden('contact')->readonly()->value($p->user->phone_number);

        return $form;
    }
}
