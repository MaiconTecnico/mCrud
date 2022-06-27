unit mCrud.controller.interfaces;

interface

uses
  mCrud.controller.dto.interfaces;

type
  iController = interface
    function Cliente : iClienteDTO;
    function Endereco : iEnderecoDTO;
    function Telefone : iTelefoneDTO;
  end;

implementation

end.
