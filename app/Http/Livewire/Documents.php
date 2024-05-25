<?php

namespace App\Http\Livewire;

use App\Models\Document;
use Illuminate\Support\Facades\Gate;
use Livewire\Component;
use Livewire\WithPagination;

class Documents extends Component
{
    use WithPagination;

    public $term;
    public $idToDelete;
    
    // protected $queryString = ['term'];

    public function render()
    {
        if($this->term){
            $documents = Document::search($this->term)->paginate(5);
        }else{
            $documents = Document::with('user')
                    ->orderBy('created_at','DESC')
                    ->paginate(5);
        }

        return view('livewire.documents', compact('documents'));
    }

    public function confirmDelete(int $id){
        $this->idToDelete = $id;
        $this->dispatchBrowserEvent('show-delete-modal');
    }

    public function destroy()
    {
        // só pode deletar seus proprios deletar
        if(Gate::denies('delete-document', Document::findOrFail($this->idToDelete))){
            abort(403);
        }

        Document::destroy($this->idToDelete);
        $this->dispatchBrowserEvent('hide-delete-modal');
        $this->render();
    }
}
