using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MINHAS_FINANCAS_ADMIN
{
    public partial class Gasto : System.Web.UI.Page
    {

        // criacao da lista que receberá todos os registros do banco
        protected List<GastosMensais> gastos;


        protected void Page_Load(object sender, EventArgs e)
        {
            // se a sessção está nulla, manda para login
            if (Session["usuario"] == null)
                Response.Redirect("Entrar.aspx");

            using (FinancasEntities1 ctx = new FinancasEntities1())
            {
                // obtem o usuário da sessão
                var usuario = (Usuario)Session["usuario"];

                // obtem os gastos do usuário logado
                gastos = ctx.GastosMensais.Where(a => a.id_usuario == usuario.id).ToList();
            }
        }

        protected void Page_LoadComplete(object sender, EventArgs e)
        {
            // alimenta todos os controles
            DataBind();
        }
        protected void BtnExcluir_Click(object sender, EventArgs e)
        {
            // obtem o id do contato clicado
            var idGasto = int.Parse(((Button)sender).CommandArgument);


            using (FinancasEntities1 ctx = new FinancasEntities1())
            {
                // encontra o contato com base no id
                var gasto = ctx.GastosMensais.FirstOrDefault(c => c.id == idGasto);

                // exclui da base de dados e salva
                ctx.GastosMensais.Remove(gasto);
                ctx.SaveChanges();

                // da refresh na pagina
                Response.Redirect(Request.Url.ToString());
            }
        }
    }
}