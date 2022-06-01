<?php

namespace App\Admin\Controllers;

use App\Models\Farm;
use App\Models\Location;
use Encore\Admin\Controllers\AdminController;
use Encore\Admin\Facades\Admin;
use Encore\Admin\Form;
use Encore\Admin\Grid;
use Encore\Admin\Show;
use Illuminate\Support\Facades\Auth;

class FarmController extends AdminController
{
    /**
     * Title for current resource.
     *
     * @var string
     */
    protected $title = 'Farm';

    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid()
    {
        $grid = new Grid(new Farm());

        if (
            Admin::user()->isRole('administrator') ||
            Admin::user()->isRole('admin') 
            ) {          
            /*$grid->actions(function ($actions) {
                $actions->disableEdit();
            });*/
        } else {
            $grid->model()->where('administrator_id', Admin::user()->id);
        }
        
        $grid->disableRowSelector();

        //$grid->column('id', __('Id'));
        //$grid->column('updated_at', __('Updated at'));
        $grid->column('created_at', __('Created'))->sortable();
        $grid->column('name', __('Farm Name'))->sortable();
        $grid->column('administrator_id', __('Owner'))->display(function(){
            return $this->owner->name; 
        })->sortable();
        $grid->column('location_id', __('Subcounty'))->display(function(){
            return $this->location->get_name(); 
        })->sortable();
        $grid->column('latitude', __('GPS'))->display(function(){
            return $this->latitude.", ".$this->longitude; 
        }); 
        //$grid->column('details', __('Details'));

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
        $show = new Show(Farm::findOrFail($id));

        $show->field('created_at', __('Created'));
        $show->field('administrator_id', __('Administrator id'));
        $show->field('location_id', __('Location id'));
        $show->field('name', __('Name'));
        $show->field('details', __('Details'));
        $show->field('latitude', __('Latitude'));
        $show->field('longitude', __('Longitude'));

        return $show;
    }

    /**
     * Make a form builder.
     *
     * @return Form
     */
    protected function form()
    {
        $form = new Form(new Farm());
 
        $user = Auth::user();
        if ($form->isCreating()) {
            $form->hidden('administrator_id', __('Administrator id'))->value($user->id);
        } else {
            $form->hidden('administrator_id', __('Administrator id'));
        }

        $form->select('location_id', __('Sub-county'))
        ->options(Location::get_subcounties())
        ->rules('required'); 
 
        $form->text('name', __('Name'));
        $form->text('latitude', __('Latitude'))->rules('required');
        $form->text('longitude', __('Longitude'))->rules('required');
        $form->textarea('details', __('Details'));

        return $form;
    }
}
