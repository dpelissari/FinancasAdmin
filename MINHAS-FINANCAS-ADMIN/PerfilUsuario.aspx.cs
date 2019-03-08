using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MINHAS_FINANCAS_ADMIN
{
    public partial class PerfilUsuario : System.Web.UI.Page
    {
        protected Usuario usuarios;
      

        

        protected void Page_Load(object sender, EventArgs e)
        {

            //// se a sessão está nulla, manda para login
            //if (Session["usuario"] == null)
            //{
            //    Response.Redirect("Entrar.aspx");
            //}
            //else
            //{
            //    var usuario = (Usuario)Session["usuario"];
            //    NomeUsuario = usuario.nome;
            //    CodigoUsuario = usuario.id;

            //}
            
        }

        protected void BtnSalvaPerfil_Click(object sender, EventArgs e)
        {
            using (FinancasEntities ctx = new FinancasEntities())
            {
                usuarios.nome = txtNomeUsuario.Text;
                usuarios.email = TxtEmailUsuario.Text;
                usuarios.senha = TxtSenha.Text;
                usuarios.confirmacaoSenha = TxtConfSenha.Text;

                ctx.Usuario.Attach(usuarios);
                ctx.Entry(usuarios).State = EntityState.Modified;
                ctx.SaveChanges();

                // redireciona para a lista de gastos cadastrados após 3 segundos
                Response.AppendHeader("Refresh", "3;url=Usuario.aspx");
            }

        }
    }
}