<?php

namespace App\View\Components;

use Illuminate\View\Component;

class DocumentTable extends Component
{
    public $documents;

    /**
     * Create a new component instance.
     *
     * @return void
     */
    public function __construct($documents)
    {
        return $this->documents = $documents;
        //
    }

    /**
     * Get the view / contents that represent the component.
     *
     * @return \Illuminate\Contracts\View\View|\Closure|string
     */
    public function render()
    {
        return view('components.document-table');
    }
}
