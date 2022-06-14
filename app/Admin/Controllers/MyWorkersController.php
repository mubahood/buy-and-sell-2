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

use function Ramsey\Uuid\v1;

class MyWorkersController extends AdminController
{
    /**
     * Title for current resource.
     *
     * @var string
     */
    protected $title = 'My Workers';

    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid()
    {
        $grid = new Grid(new User());

        $u = Auth::user();

        $grid->model()->where([
            'owner_id' => $u->id,
            'user_type' => 'worker'
        ]);

        $grid->column('id', __('Worker #ID'))->sortable();
        $grid->column('created_at', __('Created'))->hide();
        $grid->column('name', __('Name'));
        $grid->column('username', __('Username'));
        $grid->column('company_name', __('Company name'));
        $grid->column('phone_number', __('Phone number'));
        $grid->column('gender', __('Gender'));

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
        $form = new Form(new User());

        $form->saving(function (Form $f) {

            if (!$f->isEditing()) {
                $u = Auth::user();
                $f->username = $f->phone_number;
                $f->address = $u->address;
                $f->location_id = $u->location_id;
                $f->sector = $u->sector;
                $f->group_id = $u->group_id;
                $f->region = $u->location_id;
                $f->access_to_credit = $u->access_to_credit;
                $f->experience = $u->experience;
                $f->avatar = 'no_image.jpg';
                $f->password = Hash::make(trim($f->password));
            } else {

                die($f->id);
                die("is editng...");
            }
        });




        /* 
  SQLSTATE[HY000]: General error: 1364 Field 'username' doesn't have a default value (SQL: insert into `users` (`owner_id`, `user_type`, `user_role`, `phone_number`, `password`, `name`, `date_of_birth`, `gender`, `marital_status`, `updated_at`, `created_at`) values (44, worker, worker, +256706638494, admin, Muhindo Mubaraka, 12, Female, Single, 2022-06-14 08:03:17, 2022-06-14 08:03:17))
*/

        $form->hidden('owner_id')->value($u->id);
        $form->hidden('username');
        $form->hidden('address');
        $form->hidden('location_id');
        $form->hidden('sector');
        $form->hidden('region');
        $form->hidden('group_id');
        $form->hidden('experience');
        $form->hidden('access_to_credit');
        $form->hidden('avatar');


        $form->hidden('user_type', __('User type'))->default('worker')->value('worker');
        $form->hidden('user_role', __('User type'))->default('worker')->value('worker');

        $form->text('id', __('id'));


        $form->text('phone_number', 'Phone number')
            ->creationRules(['required', "unique:users"])
            ->updateRules(['required', "unique:users,phone_number,{{id}}"]);



        $form->password('password', trans('admin.password'))->rules('required|confirmed');
        $form->password('password_confirmation', trans('admin.password_confirmation'))->rules('required')
            ->default(function ($form) {
                return $form->model()->password;
            });

        $form->ignore(['password_confirmation']);
        $form->saving(function (Form $form) {
            if ($form->password && $form->model()->password != $form->password) {
                $form->password = Hash::make($form->password);
            }
        });



        $form->divider();

        $form->text('name', __('Full Name'))
            ->required();

        $form->text('date_of_birth', __('Age'))
            ->attribute('type', 'number')
            ->required();

        $form->select('gender', __('Gender'))
            ->options([
                'Male' => 'Male',
                'Female' => 'Female',
            ])
            ->required();


        $form->select('marital_status', __('Marital status'))
            ->options([
                'Single' => 'Single',
                'Married' => 'Married',
            ])
            ->required();


        return $form;
    }
}
