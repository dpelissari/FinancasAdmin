using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MINHAS_FINANCAS_ADMIN
{
    public partial class Entrar1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

   

        protected void btnEntrar_Click(object sender, EventArgs e)
        {
            using (var context = new FinancasEntities())
            {
                //// obtem o usuario
                var usuario = context.Usuario.FirstOrDefault(u => u.email == TxtEmail.Text && u.senha == TxtSenha.Text);

                // Se o usuário não existi
                if (usuario == null)
                {
                    TxtSenha.Text = "";
                    LoginErro.Visible = true;
                    return;
                }

                // se o usuário existir
                Session["usuario"] = usuario;
                Response.Redirect("PainelResumo.aspx");
            }
        }
    }
}