<?php

namespace App\Admin\Controllers;

use App\Models\Category;
use App\Models\City;
use App\Models\Product;
use App\Models\Utils;
use Encore\Admin\Auth\Database\Administrator;
use Encore\Admin\Controllers\AdminController;
use Encore\Admin\Form;
use Encore\Admin\Grid;
use Encore\Admin\Show;

class ProductController extends AdminController
{
    /**
     * Title for current resource.
     *
     * @var string
     */
    protected $title = 'Product';

    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid()
    {

        /*

        for ($j=0; $j < 1000; $j++) { 
            $cats = [];
            $users = [];
            $cities = [];
            foreach(Category::all() as $c){
                if($c->parent<1){
                    continue;
                }
                $cats[] = $c;
            }
            foreach(Administrator::all() as $c){
                $users[] = $c->id;
            }
            foreach(City::all() as $c){
                $cities[] = $c->id;
            }
    
            $p = new Product();
            $f = \Faker\Factory::create();
            $p->name = $f->sentence(10);
            shuffle($cats); 
            shuffle($users); 
            $cat = $cats[0]; 
            $p->category_id = $cat->id;
            $p->user_id = $users[0];
            $p->country_id = $cities[0];
            $p->city_id = $cities[0];
            $p->price = ((int)(rand(100,1000)."000"));
            $p->quantity = ((int)(rand(10,100)));
            $p->description = $f->sentence(100);
            $images = [];
    
            for ($i=0; $i < 10; $i++) { 
                $img = json_decode("{}");
                $img->src = 'temp/full/'.rand(1,15).".jpeg";
                $img->user_id =  1;
                $img->thumbnail = 'thumbnail/full/'.rand(1,200).".webp";
                $images [] = $img;
            }
            $p->images = json_encode($images);
            $p->thumbnail = json_encode($images[0]);
    
            $atts = [];
            foreach ($cat->attributes as $key => $att) {
                $att->value = $f->sentence(2);
                $atts[] = $att;
            }
            $p->attributes = json_encode($atts);
            $p->sub_category_id = json_encode($cat->id);
            $p->fixed_price = true;
            $p->save();
        }*/

        $grid = new Grid(new Product());
        $grid->column('id', __('Id'));
        $grid->column('created_at', __('Created at')); 
        $grid->column('name', __('Name')); 
        $grid->column('user_id', __('User id'));
        $grid->column('price', __('Price')); 
        $grid->column('status', __('Status'));    
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
        $show = new Show(Product::findOrFail($id));

        $show->field('id', __('Id'));
        $show->field('created_at', __('Created at'));
        $show->field('updated_at', __('Updated at'));
        $show->field('name', __('Name'));
        $show->field('category_id', __('Category id'));
        $show->field('user_id', __('User id'));
        $show->field('price', __('Price'));
        $show->field('slug', __('Slug'));
        $show->field('status', __('Status'));
        $show->field('description', __('Description'));
        $show->field('quantity', __('Quantity'));
        $show->field('images', __('Images'));
        $show->field('attributes', __('Attributes'));

        return $show;
    }

    /**
     * Make a form builder.
     *
     * @return Form
     */
    protected function form()
    {
        $form = new Form(new Product());

        $form->text('name', __('Name'));
        $form->number('category_id', __('Category id'));
        $form->number('user_id', __('User id'));
        $form->text('price', __('Price'));
        $form->text('slug', __('Slug'));
        $form->text('status', __('Status'));
        $form->text('description', __('Description'));
        $form->text('quantity', __('Quantity'));
        $form->text('images', __('Images'));
        $form->text('attributes', __('Attributes'));

        return $form;
    }
}
