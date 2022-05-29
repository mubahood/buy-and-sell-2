<?php

namespace Encore\Admin\Grid\Exporters;

use Illuminate\Support\Str;
abstract class ExcelExporter extends AbstractExporter {
  

    /**
     * @var string
     */
    protected $fileName;

    /**
     * @var array
     */
    protected $headings = [];

    /**
     * @var array
     */
    protected $columns = [];

    /**
     * @return array
     */
    public function headings(): array
    {
        if (!empty($this->columns)) {
            return array_values($this->columns);
        }

        return $this->headings;
    }

    /**
     * @return \Illuminate\Database\Eloquent\Builder|\Illuminate\Database\Eloquent\Model
     */
    public function query()
    {
        if (!empty($this->columns)) {
            $columns = array_keys($this->columns);

            $eagerLoads = array_keys($this->getQuery()->getEagerLoads());

            $columns = collect($columns)->reject(function ($column) use ($eagerLoads) {
                return Str::contains($column, '.') || in_array($column, $eagerLoads);
            });

            return $this->getQuery()->select($columns->toArray());
        }

        return $this->getQuery();
    }

    /**
     * {@inheritdoc}
     */
    public function export()
    {
        return "1.xls";

        exit;
    }
}
