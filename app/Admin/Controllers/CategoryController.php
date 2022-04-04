<?php

namespace App\Admin\Controllers;

use App\Models\Category;
use Encore\Admin\Controllers\AdminController;
use Encore\Admin\Form;
use Encore\Admin\Form\NestedForm;
use Encore\Admin\Grid;
use Encore\Admin\Show;
use Illuminate\Support\Facades\URL;

class CategoryController extends AdminController
{

    function __construct()
    {
        if(isset($_POST['name'])){ 
            die("time to upload shit");
        }
    }

    /**
     * Title for current resource.
     *
     * @var string
     */
    protected $title = 'Categories';

    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid()
    {
        $grid = new Grid(new Category());

        $grid->disableRowSelector();

        $grid->column('id', __('Id'))->sortable();
        //$grid->column('created_at', __('Created at'));
        //$grid->column('updated_at', __('Updated at'));
        $grid->column('name', __('Name'))->display(function ($name) {

            $cat = Category::find($this->parent);
            $cat_name = "";
            if (!$cat) {
                $cat_name = "";
            } else if (isset($cat->name)) {
                $cat_name = $cat->name;
            }

            $src = "";
            if ($this->image != null && strlen($this->image) > 2) {
                $src =  URL::asset('/public/storage/' . $this->image);
            }

            return view('components.symbol-image-text', [
                'title' => $this->name,
                'sub_title' => $cat_name,
                'image' => $src,
            ]);;
        })->sortable();




        //$grid->column('description', __('Description'));
        //$grid->column('slug', __('Slug'));
        //$grid->column('image', __('Image'));

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
        $show = new Show(Category::findOrFail($id));

        $show->field('id', __('Id'));
        $show->field('created_at', __('Created at'));
        $show->field('updated_at', __('Updated at'));
        $show->field('parent', __('Parent'));
        $show->field('name', __('Name'));
        $show->field('description', __('Description'));
        $show->field('slug', __('Slug'));
        $show->field('image', __('Image'));

        return $show;
    }

    /**
     * Make a form builder.
     *
     * @return Form
     */
    protected function form()
    {

        $form = new Form(new Category());

        return view('admin.forms.category');



        // $form->radio('has_parent', __("Has parent category?"))
        //     ->required()
        //     ->options([
        //         "0" => "No",
        //         "1" => "Yes"
        //     ])
        //     ->when("1", function ($form) {

        //     });


        $form->column(4, function ($form) {
            $form->select('parent', 'Parent category')->options(Category::where('parent', '<', 1)->get()->pluck('name', 'id'))->default(0);
        });

        $form->column(4, function ($form) {
            $form->text('name', __('Category Name'))->required();
        });

        $form->column(4, function ($form) {
            $form->text('slug', __('Slug'))->readonly();
        });

        $form->column(12, function ($form) {
            $form->textarea('description', __('Description'))->required()->default('Buy and sell all kinds of ... in Uganda');
        });
 
                
        $form->column(6, function ($form) {
            $form->image('image', __('Image'));
        });
                
/*

        $form->hasMany('attributes', __('Click on "New" to add category attributes'), function (NestedForm $form) {

            $form->text('name', __('Name'))->rules('required');
            $options["text"] = "text";
            $options["textarea"] = "textarea";
            $options["number"] = "number";
            $options["select"] = "select";
            $options["radio"] = "radio";
            $options["checkbox"] = "checkbox";
            $form->select('type')->options($options)->rules('required');

            $form->tags('options', __('Options'));

            $form->text('units', __('Units'));
            $form->radio('is_required', __('Is required'))->options([
                '0' => 'No',
                '1' => 'Yes',
            ])->required();
        }); */


        return $form;
    }
}
