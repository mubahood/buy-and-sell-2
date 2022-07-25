<?php

namespace App\Admin\Controllers;

use App\Models\CropCategory;
use App\Models\Farm;
use App\Models\Garden;
use App\Models\Location;
use Encore\Admin\Controllers\AdminController;
use Encore\Admin\Facades\Admin;
use Encore\Admin\Form;
use Encore\Admin\Grid;
use Encore\Admin\Show;
use Illuminate\Support\Facades\Auth;

class GardenController extends AdminController
{
    /**
     * Title for current resource.
     *
     * @var string
     */
    protected $title = 'Enterprise';

    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid()
    {
        $grid = new Grid(new Garden());
        if (
            Admin::user()->isRole('administrator') ||
            Admin::user()->isRole('admin')
        ) {
            /*$grid->actions(function ($actions) {
                $actions->disableEdit();
            });*/
        } else {
            $grid->model()->where('administrator_id', Admin::user()->id);
            $grid->disableRowSelector();
        }

        $grid->column('created_at', __('Created'))->sortable();
        
        $grid->column('name', __('Enterpeise Name'));

        $grid->column('administrator_id', __('Owner'))->sortable();
        $grid->column('crop_category_id', __('Sector'))->display(function(){
            return $this->sector->get_name(); 
        })->sortable();
         
        $grid->column('plant_date', __('Started'));

        $grid->column('location_id', __('Subcounty'))->display(function () {
            return $this->location->get_name();
        })->sortable();

        $grid->column('longitude', __('Longitude'));
        $grid->column('latitude', __('Latitude'));

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
        $show = new Show(Garden::findOrFail($id));

        $show->field('id', __('Id'));
        $show->field('created_at', __('Created at'));
        $show->field('updated_at', __('Updated at'));
        $show->field('administrator_id', __('Administrator id'));
        $show->field('crop_category_id', __('Crop category id'));
        $show->field('location_id', __('Location id'));
        $show->field('name', __('Name'));
        $show->field('image', __('Image'));
        $show->field('plant_date', __('Plant date'));
        $show->field('harvest_date', __('Harvest date'));
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
        $form = new Form(new Garden());

        $u = Auth::user();
        $form->hidden('administrator_id', __('Administrator id'))->default($u->id)->value($u->id);


        $form->select('farm_id', __('Farm'))
            ->help('Select a farm where this enterprise is')
            ->options(
                Farm::where('administrator_id',$u->id)->get()->pluck('name','id')
            )
            ->rules('required');

        $form->select('crop_category_id', __('Enterprise Sector'))
            ->options(CropCategory::get_subcategories())
            ->rules('required');

        $form->select('location_id', __('Sub-county'))
            ->options(Location::get_subcounties())
            ->rules('required');

        $form->text('name', __('Enterprise Name'))->rules('required');
        $form->image('image', __('Image'));

        $form->date('plant_date', __('Start date'))
            ->help("Select the date when this enterprise started.")->required();
        $form->text('latitude', __('GPS Latitude'))->default("0.00");
        $form->text('longitude', __('GPS Longitude'))->default("0.00");

        $form->textarea('details', __('Details'));

        return $form;
    }
}
