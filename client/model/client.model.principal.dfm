object dmPrincipal: TdmPrincipal
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 498
  Width = 719
  object RestClientPessoa: TRESTClient
    Accept = 'application/json, text/plain; q=0.9, text/html;q=0.8,'
    AcceptCharset = 'utf-8, *;q=0.8'
    BaseURL = 'http://localhost:3000'
    Params = <>
    ConnectTimeout = 0
    ReadTimeout = 0
    Left = 48
    Top = 16
  end
  object RestRequestPessoa: TRESTRequest
    AssignedValues = [rvConnectTimeout, rvReadTimeout]
    Client = RestClientPessoa
    Params = <>
    Resource = 'pessoas'
    Response = RestResponsePessoa
    ConnectTimeout = 0
    ReadTimeout = 0
    Left = 48
    Top = 136
  end
  object RestResponsePessoa: TRESTResponse
    ContentType = 'application/json'
    Left = 48
    Top = 72
  end
  object RESTResponseDataSetAdapter: TRESTResponseDataSetAdapter
    Active = True
    AutoUpdate = False
    Dataset = FDMemTablePessoa
    FieldDefs = <>
    ResponseJSON = RestResponsePessoa
    NestedElements = True
    Left = 48
    Top = 200
  end
  object FDMemTablePessoa: TFDMemTable
    Active = True
    FieldDefs = <
      item
        Name = 'id'
        DataType = ftWideString
        Size = 255
      end
      item
        Name = 'natureza'
        DataType = ftWideString
        Size = 255
      end
      item
        Name = 'dataregistro'
        DataType = ftWideString
        Size = 255
      end
      item
        Name = 'documento'
        DataType = ftWideString
        Size = 255
      end
      item
        Name = 'primeironome'
        DataType = ftWideString
        Size = 255
      end
      item
        Name = 'segundonome'
        DataType = ftWideString
        Size = 255
      end
      item
        Name = 'endereco'
        DataType = ftWideString
        Size = 255
      end
      item
        Name = 'endereco.idendereco'
        DataType = ftWideString
        Size = 255
      end
      item
        Name = 'endereco.idpessoa'
        DataType = ftWideString
        Size = 255
      end
      item
        Name = 'endereco.cep'
        DataType = ftWideString
        Size = 255
      end
      item
        Name = 'enderecointegracao'
        DataType = ftWideString
        Size = 255
      end
      item
        Name = 'enderecointegracao.idendereco'
        DataType = ftWideString
        Size = 255
      end
      item
        Name = 'enderecointegracao.uf'
        DataType = ftWideString
        Size = 255
      end
      item
        Name = 'enderecointegracao.cidade'
        DataType = ftWideString
        Size = 255
      end
      item
        Name = 'enderecointegracao.bairro'
        DataType = ftWideString
        Size = 255
      end
      item
        Name = 'enderecointegracao.logradouro'
        DataType = ftWideString
        Size = 255
      end
      item
        Name = 'enderecointegracao.complemento'
        DataType = ftWideString
        Size = 255
      end>
    IndexDefs = <>
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvUpdateChngFields, uvUpdateMode, uvLockMode, uvLockPoint, uvLockWait, uvRefreshMode, uvFetchGeneratorsPoint, uvCheckRequired, uvCheckReadOnly, uvCheckUpdatable, uvAutoCommitUpdates]
    UpdateOptions.LockWait = True
    UpdateOptions.FetchGeneratorsPoint = gpNone
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    StoreDefs = True
    Left = 40
    Top = 256
    object FDMemTablePessoaid: TWideStringField
      DisplayLabel = 'ID'
      FieldName = 'id'
      Size = 255
    end
    object FDMemTablePessoanatureza: TWideStringField
      DisplayLabel = 'Natureza'
      FieldName = 'natureza'
      Size = 255
    end
    object FDMemTablePessoadataregistro: TWideStringField
      DisplayLabel = 'Data Registro'
      FieldName = 'dataregistro'
      Size = 255
    end
    object FDMemTablePessoadocumento: TWideStringField
      DisplayLabel = 'Documento'
      FieldName = 'documento'
      Size = 255
    end
    object FDMemTablePessoaprimeironome: TWideStringField
      DisplayLabel = 'Primeiro Nome'
      FieldName = 'primeironome'
      Size = 255
    end
    object FDMemTablePessoasegundonome: TWideStringField
      DisplayLabel = 'Segundo Nome'
      FieldName = 'segundonome'
      Size = 255
    end
    object FDMemTablePessoaendereco: TWideStringField
      FieldName = 'endereco'
      Size = 255
    end
    object FDMemTablePessoaenderecoidendereco: TWideStringField
      FieldName = 'endereco.idendereco'
      Size = 255
    end
    object FDMemTablePessoaenderecoidpessoa: TWideStringField
      FieldName = 'endereco.idpessoa'
      Size = 255
    end
    object FDMemTablePessoaenderecocep: TWideStringField
      DisplayLabel = 'CEP'
      FieldName = 'endereco.cep'
      Size = 255
    end
    object FDMemTablePessoaenderecointegracao: TWideStringField
      FieldName = 'enderecointegracao'
      Size = 255
    end
    object FDMemTablePessoaenderecointegracaoidendereco: TWideStringField
      FieldName = 'enderecointegracao.idendereco'
      Size = 255
    end
    object FDMemTablePessoaenderecointegracaouf: TWideStringField
      DisplayLabel = 'UF'
      FieldName = 'enderecointegracao.uf'
      Size = 255
    end
    object FDMemTablePessoaenderecointegracaocidade: TWideStringField
      DisplayLabel = 'Cidade'
      FieldName = 'enderecointegracao.cidade'
      Size = 255
    end
    object FDMemTablePessoaenderecointegracaobairro: TWideStringField
      DisplayLabel = 'Bairro'
      FieldName = 'enderecointegracao.bairro'
      Size = 255
    end
    object FDMemTablePessoaenderecointegracaologradouro: TWideStringField
      DisplayLabel = 'Logradouro'
      FieldName = 'enderecointegracao.logradouro'
      Size = 255
    end
    object FDMemTablePessoaenderecointegracaocomplemento: TWideStringField
      DisplayLabel = 'Complemento'
      FieldName = 'enderecointegracao.complemento'
      Size = 255
    end
  end
end
