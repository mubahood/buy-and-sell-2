<?php

namespace App\Admin\Controllers;

use App\Models\FarmersGroup;
use App\Models\FarmersGroupHasAgent;
use App\Models\Location;
use App\Models\User;
use Encore\Admin\Controllers\AdminController;
use Encore\Admin\Form;
use Encore\Admin\Grid;
use Encore\Admin\Show;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;

class AgentUsersController extends AdminController
{
    /**
     * Title for current resource.
     *
     * @var string
     */
    protected $title = 'Farmers';

    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid()
    {
        $grid = new Grid(new User());

        $u = Auth::user();
        $group_id = 0;
        foreach (FarmersGroupHasAgent::all() as $key => $g) {
            if ($g->administrator_id == $u->id) {
                $group_id = $g->farmers_group_id;
            }
        }

        $grid->model()->where('group_id', $group_id);

        $grid->column('id', __('Id'));
        $grid->column('username', __('Username'));
        $grid->column('password', __('Password'));


        $grid->column('name', __('Name'));
        $grid->column('avatar', __('Avatar'));
        $grid->column('remember_token', __('Remember token'));
        $grid->column('created_at', __('Created at'));
        $grid->column('updated_at', __('Updated at'));
        $grid->column('last_name', __('Last name'));
        $grid->column('company_name', __('Company name'));
        $grid->column('email', __('Email'));
        $grid->column('phone_number', __('Phone number'));
        $grid->column('address', __('Address'));
        $grid->column('about', __('About'));
        $grid->column('services', __('Services'));
        $grid->column('longitude', __('Longitude'));
        $grid->column('latitude', __('Latitude'));
        $grid->column('division', __('Division'));
        $grid->column('opening_hours', __('Opening hours'));
        $grid->column('cover_photo', __('Cover photo'));
        $grid->column('facebook', __('Facebook'));
        $grid->column('twitter', __('Twitter'));
        $grid->column('whatsapp', __('Whatsapp'));
        $grid->column('youtube', __('Youtube'));
        $grid->column('instagram', __('Instagram'));
        $grid->column('last_seen', __('Last seen'));
        $grid->column('status', __('Status'));
        $grid->column('linkedin', __('Linkedin'));
        $grid->column('category_id', __('Category id'));
        $grid->column('status_comment', __('Status comment'));
        $grid->column('country_id', __('Country id'));
        $grid->column('region', __('Region'));
        $grid->column('district', __('District'));
        $grid->column('sub_county', __('Sub county'));
        $grid->column('user_type', __('User type'));
        $grid->column('location_id', __('Location id'));
        $grid->column('owner_id', __('Owner id'));
        $grid->column('date_of_birth', __('Date of birth'));
        $grid->column('marital_status', __('Marital status'));
        $grid->column('gender', __('Gender'));
        $grid->column('group_id', __('Group id'));
        $grid->column('group_text', __('Group text'));
        $grid->column('sector', __('Sector'));
        $grid->column('production_scale', __('Production scale'));
        $grid->column('number_of_dependants', __('Number of dependants'));
        $grid->column('user_role', __('User role'));
        $grid->column('access_to_credit', __('Access to credit'));
        $grid->column('experience', __('Experience'));
        $grid->column('profile_is_complete', __('Profile is complete'));

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
        $show = new Show(User::findOrFail($id));

        $show->field('id', __('Id'));
        $show->field('username', __('Username'));
        $show->field('password', __('Password'));
        $show->field('name', __('Name'));
        $show->field('avatar', __('Avatar'));
        $show->field('remember_token', __('Remember token'));
        $show->field('created_at', __('Created at'));
        $show->field('updated_at', __('Updated at'));
        $show->field('last_name', __('Last name'));
        $show->field('company_name', __('Company name'));
        $show->field('email', __('Email'));
        $show->field('phone_number', __('Phone number'));
        $show->field('address', __('Address'));
        $show->field('about', __('About'));
        $show->field('services', __('Services'));
        $show->field('longitude', __('Longitude'));
        $show->field('latitude', __('Latitude'));
        $show->field('division', __('Division'));
        $show->field('opening_hours', __('Opening hours'));
        $show->field('cover_photo', __('Cover photo'));
        $show->field('facebook', __('Facebook'));
        $show->field('twitter', __('Twitter'));
        $show->field('whatsapp', __('Whatsapp'));
        $show->field('youtube', __('Youtube'));
        $show->field('instagram', __('Instagram'));
        $show->field('last_seen', __('Last seen'));
        $show->field('status', __('Status'));
        $show->field('linkedin', __('Linkedin'));
        $show->field('category_id', __('Category id'));
        $show->field('status_comment', __('Status comment'));
        $show->field('country_id', __('Country id'));
        $show->field('region', __('Region'));
        $show->field('district', __('District'));
        $show->field('sub_county', __('Sub county'));
        $show->field('user_type', __('User type'));
        $show->field('location_id', __('Location id'));
        $show->field('owner_id', __('Owner id'));
        $show->field('date_of_birth', __('Date of birth'));
        $show->field('marital_status', __('Marital status'));
        $show->field('gender', __('Gender'));
        $show->field('group_id', __('Group id'));
        $show->field('group_text', __('Group text'));
        $show->field('sector', __('Sector'));
        $show->field('production_scale', __('Production scale'));
        $show->field('number_of_dependants', __('Number of dependants'));
        $show->field('user_role', __('User role'));
        $show->field('access_to_credit', __('Access to credit'));
        $show->field('experience', __('Experience'));
        $show->field('profile_is_complete', __('Profile is complete'));

        return $show;
    }

    /**
     * Make a form builder.
     *
     * @return Form
     */
    protected function form()
    {
        $u = Auth::user();
        $group_id = 0;
        foreach (FarmersGroupHasAgent::all() as $key => $g) {
            if ($g->administrator_id == $u->id) {
                $group_id = $g->farmers_group_id;
            }
        }

        if ($group_id < 1) {
            return "Your agent's account have not been assigned to any farmer's association yet. 
            Please contact system administrators to do so.";
        }

        $form = new Form(new User());

        if ($form->isCreating()) {
            $form->saving(function (Form $f) {
                $u = new User();
                $u->name = $f->name;
                $u->email = $f->email;
                $u->longitude = '0.00';
                $u->latitude = '0.00';
                $u->address = $f->address;
                $u->username = $f->phone_number;
                $u->category_id = $f->sector;
                $u->sector = $f->sector;
                $u->region = $f->location_id;
                $u->location_id = $f->location_id;
                $u->date_of_birth = $f->date_of_birth;
                $u->user_type = $f->user_type;
                $u->avatar = 'no_image.jpg';
                $u->password = Hash::make(trim($f->password));
                $u->marital_status = $f->marital_status;
                $u->gender = $f->gender;
                $u->group_id = $f->group_id;
                $u->production_scale = $f->production_scale;
                $u->number_of_dependants = $f->number_of_dependants;
                $u->user_role = $f->user_role;
                $u->access_to_credit = $f->access_to_credit;
                $u->experience = $f->experience;
                $u->profile_is_complete = false;

                $u->save();
            });
        }

        if ($form->isEditing()) {
            if (isset($_POST['user_type'])) {
                dd("editng...");
            }
        }

        //http://localhost:8888/buy-and-sell-2/admin/agent-users/44/edit
        //http://localhost:8888/buy-and-sell-2/admin/agent-users/44/edit

        /*  	


        */
        //$form->image('avatar', __('Avatar'));
        //$form->textarea('last_name', __('Last name'));
        //$form->textarea('company_name', __('Company name'));
        //$form->textarea('about', __('About'));
        //$form->textarea('services', __('Services'));
        // $form->textarea('longitude', __('Longitude'));
        // $form->textarea('latitude', __('Latitude'));
        // $form->textarea('division', __('Division'));
        // $form->textarea('status_comment', __('Status comment'));
        // $form->textarea('country_id', __('Country id'));
        // $form->textarea('region', __('Region'));
        // $form->textarea('district', __('District'));
        // $form->textarea('sub_county', __('Sub county'));
        // $form->textarea('opening_hours', __('Opening hours'));
        // $form->textarea('cover_photo', __('Cover photo')); 
        // $form->number('owner_id', __('Owner id'));

        $form->text('user_type', __('User type'))->default('Farmer');



        return $form;
    }
}
