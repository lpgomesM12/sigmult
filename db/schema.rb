# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20161231184319) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "caixas", force: :cascade do |t|
    t.datetime "data_abertura"
    t.datetime "data_fechamento"
    t.decimal  "valr_caixa",      precision: 10, scale: 2
    t.integer  "empresa_id"
    t.integer  "user_abertura"
    t.integer  "user_fechamento"
    t.datetime "created_at",                               null: false
    t.datetime "updated_at",                               null: false
    t.index ["empresa_id"], name: "index_caixas_on_empresa_id", using: :btree
    t.index ["user_abertura"], name: "index_caixas_on_user_abertura", using: :btree
    t.index ["user_fechamento"], name: "index_caixas_on_user_fechamento", using: :btree
  end

  create_table "categoriaempresas", force: :cascade do |t|
    t.string   "nome_categoria"
    t.string   "desc_descricao"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "categoriafinaceiros", force: :cascade do |t|
    t.string   "nome_categoria"
    t.integer  "empresa_id"
    t.integer  "father_id"
    t.integer  "integer"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.index ["empresa_id"], name: "index_categoriafinaceiros_on_empresa_id", using: :btree
  end

  create_table "categoriaprodutos", force: :cascade do |t|
    t.string   "nome_categoria"
    t.integer  "father_id"
    t.integer  "integer"
    t.integer  "empresa_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.index ["empresa_id"], name: "index_categoriaprodutos_on_empresa_id", using: :btree
  end

  create_table "cidades", force: :cascade do |t|
    t.string   "nome_cidade"
    t.integer  "estado_id"
    t.boolean  "flag_ativo"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["estado_id"], name: "index_cidades_on_estado_id", using: :btree
  end

  create_table "clientes", force: :cascade do |t|
    t.string   "nome_cliente"
    t.string   "cpf"
    t.integer  "endereco_id"
    t.datetime "data_exclusao"
    t.integer  "user_inclusao"
    t.integer  "user_exclusao"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.integer  "empresa_id"
    t.integer  "numr_codigo"
    t.index ["empresa_id"], name: "index_clientes_on_empresa_id", using: :btree
    t.index ["endereco_id"], name: "index_clientes_on_endereco_id", using: :btree
    t.index ["user_exclusao"], name: "index_clientes_on_user_exclusao", using: :btree
    t.index ["user_inclusao"], name: "index_clientes_on_user_inclusao", using: :btree
  end

  create_table "codclientes", force: :cascade do |t|
    t.integer  "numr_codigo"
    t.integer  "empresa_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["empresa_id"], name: "index_codclientes_on_empresa_id", using: :btree
  end

  create_table "codvendas", force: :cascade do |t|
    t.integer  "numr_contador"
    t.integer  "empresa_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["empresa_id"], name: "index_codvendas_on_empresa_id", using: :btree
  end

  create_table "contabanks", force: :cascade do |t|
    t.string   "nome_banco"
    t.string   "nome_conta"
    t.string   "numr_agencia"
    t.string   "numr_conta"
    t.integer  "empresa_id"
    t.datetime "data_exclusao"
    t.integer  "user_inclusao"
    t.integer  "user_exclusao"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["empresa_id"], name: "index_contabanks_on_empresa_id", using: :btree
    t.index ["user_exclusao"], name: "index_contabanks_on_user_exclusao", using: :btree
    t.index ["user_inclusao"], name: "index_contabanks_on_user_inclusao", using: :btree
  end

  create_table "empresas", force: :cascade do |t|
    t.string   "nome_empresa"
    t.integer  "endereco_id"
    t.integer  "categoriaempresa_id"
    t.string   "cnpj"
    t.string   "nome_responsavel"
    t.string   "telefone1"
    t.string   "telefone2"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.index ["categoriaempresa_id"], name: "index_empresas_on_categoriaempresa_id", using: :btree
    t.index ["endereco_id"], name: "index_empresas_on_endereco_id", using: :btree
  end

  create_table "enderecos", force: :cascade do |t|
    t.string   "endereco"
    t.string   "cep"
    t.string   "complemento"
    t.integer  "cidade_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["cidade_id"], name: "index_enderecos_on_cidade_id", using: :btree
  end

  create_table "estados", force: :cascade do |t|
    t.string   "nome_estado"
    t.string   "sigl_estado"
    t.boolean  "flag_ativo"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "estoques", force: :cascade do |t|
    t.integer  "qtd_produto"
    t.integer  "produto_id"
    t.integer  "empresa_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["empresa_id"], name: "index_estoques_on_empresa_id", using: :btree
    t.index ["produto_id"], name: "index_estoques_on_produto_id", using: :btree
  end

  create_table "formapagamentos", force: :cascade do |t|
    t.string   "nome_formapagamento"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
  end

  create_table "fornecedors", force: :cascade do |t|
    t.string   "nome_fornecedor"
    t.string   "desc_cnpj"
    t.integer  "endereco_id"
    t.integer  "empresa_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.index ["empresa_id"], name: "index_fornecedors_on_empresa_id", using: :btree
    t.index ["endereco_id"], name: "index_fornecedors_on_endereco_id", using: :btree
  end

  create_table "itenvendas", force: :cascade do |t|
    t.decimal  "valor_unitario", precision: 10, scale: 2
    t.integer  "qtd_item"
    t.decimal  "valr_total",     precision: 10, scale: 2
    t.integer  "venda_id"
    t.integer  "produto_id"
    t.datetime "data_exclusao"
    t.integer  "user_inclusao"
    t.integer  "user_exclusao"
    t.datetime "created_at",                              null: false
    t.datetime "updated_at",                              null: false
    t.index ["produto_id"], name: "index_itenvendas_on_produto_id", using: :btree
    t.index ["user_exclusao"], name: "index_itenvendas_on_user_exclusao", using: :btree
    t.index ["user_inclusao"], name: "index_itenvendas_on_user_inclusao", using: :btree
    t.index ["venda_id"], name: "index_itenvendas_on_venda_id", using: :btree
  end

  create_table "movimentacaoprodutos", force: :cascade do |t|
    t.integer  "qtd_produto"
    t.string   "tipo_movimentacao"
    t.decimal  "valor_movimentacao", precision: 10, scale: 2
    t.string   "desc_observacao"
    t.integer  "produto_id"
    t.datetime "data_exclusao"
    t.integer  "user_inclusao"
    t.integer  "user_exclusao"
    t.integer  "empresa_id"
    t.integer  "fornecedor_id"
    t.datetime "created_at",                                  null: false
    t.datetime "updated_at",                                  null: false
    t.index ["empresa_id"], name: "index_movimentacaoprodutos_on_empresa_id", using: :btree
    t.index ["fornecedor_id"], name: "index_movimentacaoprodutos_on_fornecedor_id", using: :btree
    t.index ["produto_id"], name: "index_movimentacaoprodutos_on_produto_id", using: :btree
    t.index ["user_exclusao"], name: "index_movimentacaoprodutos_on_user_exclusao", using: :btree
    t.index ["user_inclusao"], name: "index_movimentacaoprodutos_on_user_inclusao", using: :btree
  end

  create_table "produtos", force: :cascade do |t|
    t.string   "nome_produto"
    t.string   "desc_observacao"
    t.integer  "categoriaproduto_id"
    t.datetime "data_exclusao"
    t.integer  "qtd_estoqueminimo"
    t.integer  "qtd_estoquemaximo"
    t.string   "nome_marca"
    t.string   "cod_barras"
    t.decimal  "valor_custo",         precision: 10, scale: 2
    t.decimal  "valor_venda",         precision: 10, scale: 2
    t.string   "desc_tamanho"
    t.string   "status"
    t.string   "peso_kilograma"
    t.string   "desc_unidademedida"
    t.integer  "user_inclusao"
    t.integer  "integer"
    t.integer  "user_exclusao"
    t.integer  "empresa_id"
    t.datetime "created_at",                                   null: false
    t.datetime "updated_at",                                   null: false
    t.integer  "unidademedida_id"
    t.index ["categoriaproduto_id"], name: "index_produtos_on_categoriaproduto_id", using: :btree
    t.index ["empresa_id"], name: "index_produtos_on_empresa_id", using: :btree
    t.index ["integer"], name: "index_produtos_on_integer", using: :btree
    t.index ["unidademedida_id"], name: "index_produtos_on_unidademedida_id", using: :btree
    t.index ["user_exclusao"], name: "index_produtos_on_user_exclusao", using: :btree
    t.index ["user_inclusao"], name: "index_produtos_on_user_inclusao", using: :btree
  end

  create_table "telefoneclientes", force: :cascade do |t|
    t.string   "desc_telefone"
    t.string   "tipo_telefone"
    t.integer  "cliente_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["cliente_id"], name: "index_telefoneclientes_on_cliente_id", using: :btree
  end

  create_table "telefonefornecedors", force: :cascade do |t|
    t.string   "desc_telefone"
    t.string   "desc_tipo"
    t.integer  "fornecedor_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["fornecedor_id"], name: "index_telefonefornecedors_on_fornecedor_id", using: :btree
  end

  create_table "tipomovifinanceiros", force: :cascade do |t|
    t.string   "nome_movimento"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "unidademedidas", force: :cascade do |t|
    t.string   "nome_unidade"
    t.integer  "empresa_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.index ["empresa_id"], name: "index_unidademedidas_on_empresa_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "nome",                   default: "", null: false
    t.string   "email",                  default: "", null: false
    t.string   "role",                   default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.integer  "empresa_id"
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["empresa_id"], name: "index_users_on_empresa_id", using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  create_table "vendas", force: :cascade do |t|
    t.integer  "cliente_id"
    t.datetime "data_exclusao"
    t.integer  "empresa_id"
    t.decimal  "valr_desconto",     precision: 10, scale: 2
    t.decimal  "valr_venda",        precision: 10, scale: 2
    t.decimal  "valr_total",        precision: 10, scale: 2
    t.string   "situacao"
    t.integer  "formapagamento_id"
    t.integer  "user_inclusao"
    t.integer  "user_exclusao"
    t.datetime "created_at",                                 null: false
    t.datetime "updated_at",                                 null: false
    t.integer  "numr_codigo"
    t.integer  "caixa_id"
    t.index ["caixa_id"], name: "index_vendas_on_caixa_id", using: :btree
    t.index ["cliente_id"], name: "index_vendas_on_cliente_id", using: :btree
    t.index ["empresa_id"], name: "index_vendas_on_empresa_id", using: :btree
    t.index ["formapagamento_id"], name: "index_vendas_on_formapagamento_id", using: :btree
    t.index ["user_exclusao"], name: "index_vendas_on_user_exclusao", using: :btree
    t.index ["user_inclusao"], name: "index_vendas_on_user_inclusao", using: :btree
  end

  add_foreign_key "caixas", "empresas"
  add_foreign_key "categoriafinaceiros", "empresas"
  add_foreign_key "categoriaprodutos", "empresas"
  add_foreign_key "cidades", "estados"
  add_foreign_key "clientes", "empresas"
  add_foreign_key "clientes", "enderecos"
  add_foreign_key "codclientes", "empresas"
  add_foreign_key "codvendas", "empresas"
  add_foreign_key "contabanks", "empresas"
  add_foreign_key "empresas", "categoriaempresas"
  add_foreign_key "empresas", "enderecos"
  add_foreign_key "enderecos", "cidades"
  add_foreign_key "estoques", "empresas"
  add_foreign_key "estoques", "produtos"
  add_foreign_key "fornecedors", "empresas"
  add_foreign_key "fornecedors", "enderecos"
  add_foreign_key "itenvendas", "produtos"
  add_foreign_key "itenvendas", "vendas"
  add_foreign_key "movimentacaoprodutos", "empresas"
  add_foreign_key "movimentacaoprodutos", "fornecedors"
  add_foreign_key "movimentacaoprodutos", "produtos"
  add_foreign_key "produtos", "categoriaprodutos"
  add_foreign_key "produtos", "empresas"
  add_foreign_key "produtos", "unidademedidas"
  add_foreign_key "telefoneclientes", "clientes"
  add_foreign_key "telefonefornecedors", "fornecedors"
  add_foreign_key "unidademedidas", "empresas"
  add_foreign_key "users", "empresas"
  add_foreign_key "vendas", "caixas"
  add_foreign_key "vendas", "clientes"
  add_foreign_key "vendas", "empresas"
  add_foreign_key "vendas", "formapagamentos"
end
