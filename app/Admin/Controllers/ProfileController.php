<?php

namespace App\Admin\Controllers;

use App\Models\Profile;
use App\Models\Utils;
use Carbon\Carbon;
use Encore\Admin\Controllers\AdminController;
use Encore\Admin\Form;
use Encore\Admin\Grid;
use Encore\Admin\Show;
use Illuminate\Support\Facades\URL;

class ProfileController extends AdminController
{
    /**
     * Title for current resource.
     *
     * @var string
     */
    protected $title = 'Profiles';

    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid()
    {
        $grid = new Grid(new Profile());
        $grid->disableCreateButton();
        
        $grid->column('id', __('Id'))->sortable() ;
        $grid->column('created_at', __('Created'))->display(function ($item) {
            return Carbon::parse($item)->diffForHumans();
        })->sortable();
        $grid->column('first_name', __('Name'))->display(function ($first_name) {
            return $this->first_name . " " . $this->last_name;
        })->sortable();
        $grid->column('company_name', __('Company'))->sortable();
        $grid->column('status', __('Status'))->display(function ($status) {
            return  Utils::tell_status($status);
        })->sortable();

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
        $show = new Show(Profile::findOrFail($id));

        $show->field('id', __('Id'));
        $show->field('created_at', __('Created at'));
        $show->field('updated_at', __('Updated at'));
        $show->field('user_id', __('User id'));
        $show->field('first_name', __('First name'));
        $show->field('last_name', __('Last name'));
        $show->field('company_name', __('Company name'));
        $show->field('email', __('Email'));
        $show->field('phone_number', __('Phone number'));
        $show->field('location', __('Location'));
        $show->field('about', __('About'));
        $show->field('services', __('Services'));
        $show->field('longitude', __('Longitude'));
        $show->field('latitude', __('Latitude'));
        $show->field('division', __('Division'));
        $show->field('opening_hours', __('Opening hours'));


        $show->profile_photo()->unescape()->as(function ($profile_photo) {
            $pic = json_decode($profile_photo);

            return '<img width="200" src=' . URL::asset('storage/' . str_replace("public/", "", $pic->thumbnail)) . ' />';
        });
        $show->cover_photo()->unescape()->as(function ($cover_photo) {
            $pic = json_decode($cover_photo);

            return '<img width="200" src=' . URL::asset('storage/' . str_replace("public/", "", $pic->thumbnail)) . ' />';
        });


        $show->field('facebook', __('Facebook'));
        $show->field('twitter', __('Twitter'));
        $show->field('whatsapp', __('Whatsapp'));
        $show->field('youtube', __('Youtube'));
        $show->field('instagram', __('Instagram'));
        $show->field('last_seen', __('Last seen'));
        $show->field('status', __('Status'));



        return $show;
    }

    /**
     * Make a form builder.
     *
     * @return Form
     */
    protected function form()
    {
        $form = new Form(new Profile());

        $form->display('user_id', __('User id'));
        $form->display('first_name', __('First name'));
        $form->display('last_name', __('Last name'));
        $form->display('company_name', __('Company name'));
        $form->display('email', __('Email'));
        $form->display('phone_number', __('Phone number'));
        $form->display('location', __('Location'));

        $form->radio('status', __('Status'))
            ->options([
                '1' => 'Accepted',
                '2' => 'Halted',
                '3' => 'Rejected',
            ])
            ->required()
            ->when('in', [2, 3], function (Form $form) {
                $form->textarea('status_comment', 'Enter status comment (Remarks)')
                    ->help("Please specify with a comment");
            });
        $form->disableCreatingCheck();
        $form->tools(function (Form\Tools $tools) {
            $tools->disableDelete();
            $tools->disableView();
        });
        $form->disableCreatingCheck();
        $form->disableEditingCheck();
        $form->disableViewCheck();
        $form->tools(function (Form\Tools $tools) {
            $tools->disableDelete();
            $tools->disableView();
        });
        return $form;
    }
}
