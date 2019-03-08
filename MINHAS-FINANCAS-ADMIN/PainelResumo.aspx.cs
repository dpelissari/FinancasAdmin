using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MINHAS_FINANCAS_ADMIN
{
    public partial class PainelResumo : System.Web.UI.Page
    {
        protected List<GastosMensais> gastoAtual;
        // propieda que é exiba no front
        public decimal gastoTotal;
        protected decimal rendaMensal;
        protected List<Renda> rendas;
        protected decimal rendaDisponivel;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["usuario"] == null)
                Response.Redirect("Entrar.aspx");

            using (FinancasEntities1 ctx = new FinancasEntities1())
            {
                var usuario = (Usuario)Session["usuario"];

                //armazena os dados atuais no banco
                //gastoAtual = ctx.GastosMensais.Where(a => a.id_usuario == usuario.id).ToList();
                gastoAtual = ctx.GastosMensais.Where(a => a.id_usuario == usuario.id).ToList();

                // salva na variavel a soma dos valores das contas cadastradas  
                gastoTotal = Convert.ToDecimal(gastoAtual.Sum(g => g.valor));
            }

            using (FinancasEntities2 ctx = new FinancasEntities2())
            {
                // obtem o usuário da sessão
                var usuario = (Usuario)Session["usuario"];

                // obtem os gastos do usuário logado
                rendas = ctx.Renda.Where(a => a.id_usuario == usuario.id).ToList();
                rendaMensal = Convert.ToDecimal(rendas.Sum(g => g.valor));
            }

            // subtrai os gastos deixando apenas o valor liquido disponivel
            rendaDisponivel = rendaMensal - gastoTotal;
        }



        protected void Page_LoadComplete(object sender, EventArgs e)
        {
            using (FinancasEntities2 ctx = new FinancasEntities2())
            {
                // obtem o usuário da sessão
                var usuario = (Usuario)Session["usuario"];

                // obtem os gastos do usuário logado
                rendas = ctx.Renda.Where(a => a.id_usuario == usuario.id).ToList();
                rendaMensal = Convert.ToDecimal(rendas.Sum(g => g.valor));
            }

            rendaDisponivel = rendaMensal - gastoTotal;
            // alimenta todos os controles
            DataBind();
        }
    }
}