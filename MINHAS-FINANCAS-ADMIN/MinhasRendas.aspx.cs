using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MINHAS_FINANCAS_ADMIN
{
    public partial class MinhasRendas : System.Web.UI.Page
    {

        // criacao da lista que receberá todos os registros do banco
        protected List<Renda> rendas;

        protected void Page_Load(object sender, EventArgs e)
        {
            // se a sessção está nulla, manda para login
            if (Session["usuario"] == null)
                Response.Redirect("Entrar.aspx");

            using (FinancasEntities2 ctx = new FinancasEntities2())
            {
                // obtem o usuário da sessão
                var usuario = (Usuario)Session["usuario"];

                // obtem os gastos do usuário logado
                rendas = ctx.Renda.Where(a => a.id_usuario == usuario.id).ToList();
            }
        }

        protected void Page_LoadComplete(object sender, EventArgs e)
        {
            // alimenta todos os controles
            DataBind();
        }

        protected void BtnExcluirRenda_Click(object sender, EventArgs e)
        {
            // obtem o id do contato clicado
            var idRenda = int.Parse(((Button)sender).CommandArgument);


            using (FinancasEntities2 ctx = new FinancasEntities2())
            {
                // encontra o contato com base no id
                var renda = ctx.Renda.FirstOrDefault(c => c.id == idRenda);

                // exclui da base de dados e salva
                ctx.Renda.Remove(renda);
                ctx.SaveChanges();

                // da refresh na pagina
                Response.Redirect(Request.Url.ToString());
            }
        }


    }
}