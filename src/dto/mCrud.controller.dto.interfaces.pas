unit mCrud.controller.dto.interfaces;

interface

uses
  mCrud.services.generic,
  mCrud.model.entity.cliente,
  mCrud.model.entity.telefone,
  mCrud.model.entity.endereco;

type
  iClienteDTO = interface
    function Id(Value : Integer)  : iClienteDTO; overload;
    function Id : Integer; overload;
    function Nome(Value : String) : iClienteDTO; overload;
    function Nome : String; overload;
    function SQLConsulta(Value : String) : iClienteDTO; overload;
    function SQLConsulta : String; overload;
    function Build : iService<TCliente>;
  end;

  iEnderecoDTO = interface
    function IdCliente(Value : Integer) : iEnderecoDTO; overload;
    function IdCliente : Integer; overload;
    function Logradouro(Value : String) : iEnderecoDTO; overload;
    function Logradouro : String; overload;
    function Cep(Value : String) : iEnderecoDTO; overload;
    function Cep : String; overload;
    function Bairro(Value : String) : iEnderecoDTO; overload;
    function Bairro : String; overload;
    function Cidade(Value : String) : iEnderecoDTO; overload;
    function Cidade : String; overload;
    function Estado(Value : String) : iEnderecoDTO; overload;
    function Estado : String; overload;
    function IndPrincipal(Value : String) : iEnderecoDTO; overload;
    function IndPrincipal : String; overload;
    function Build : iService<TEndereco>;
  end;

  iTelefoneDTO = interface
    function IdCliente(Value : Integer) : iTelefoneDTO; overload;
    function IdCliente : Integer; overload;
    function Telefone(Value : String) : iTelefoneDTO; overload;
    function Telefone : String; overload;
    function Tipo(Value : String) : iTelefoneDTO; overload;
    function Tipo : String; overload;
    function Contato(Value : String) : iTelefoneDTO; overload;
    function Contato : String; overload;
    function IndPrincipal(Value : String) : iTelefoneDTO; overload;
    function IndPrincipal : String; overload;
    function Build : iService<TTelefone>;
  end;

implementation

end.
