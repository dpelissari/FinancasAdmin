using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MINHAS_FINANCAS_ADMIN
{
    public partial class CadastraUsuario : System.Web.UI.Page
    {
        // indica se esta em modo de edicao
        protected bool ModoEditaUsuario = false;
        protected Usuario usuarios;


        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void BtnCadastraUsuario_Click(object sender, EventArgs e)
        {
            if (!ModoEditaUsuario)
            {
                // cria um objeto do tipo GastosMensais onde será adicionado o conteudo do formulário
                var c = new Usuario
                {
                    nome = txtNomeUsuario.Text,
                    email = txtEmailUsuario.Text,
                    senha = txtSenhaUsuario.Text,
                    confirmacaoSenha = txtConfSenhaUsuario.Text
                };

                try
                {
                    // cria um novo contexto do entity, adiciona o objeto criado anteriormente e salva no banco
                    using (FinancasEntities ctx = new FinancasEntities())
                    {
                        ctx.Usuario.Add(c);
                        ctx.SaveChanges();

                        // apenas redireciona para a pagina de login
                        Response.Redirect("Entrar.aspx");
                    }
                }
                catch (Exception)
                {
                    Response.Write("Não foi possivel cadastrar");
                    throw;
                }
            }
            else
            {
                using (FinancasEntities ctx = new FinancasEntities())
                {
                    usuarios.nome = txtNomeUsuario.Text;
                    usuarios.email = txtEmailUsuario.Text;
                    usuarios.senha = txtSenhaUsuario.Text;
                    usuarios.confirmacaoSenha = txtConfSenhaUsuario.Text;

                    ctx.Usuario.Attach(usuarios);
                    ctx.Entry(usuarios).State = EntityState.Modified;
                    ctx.SaveChanges();

                    // redireciona para a lista de gastos cadastrados após 3 segundos
                    Response.AppendHeader("Refresh", "3;url=Usuario.aspx");
                }
            }
        }
    }
}