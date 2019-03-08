using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MINHAS_FINANCAS_ADMIN
{
    public partial class CadastraRenda : System.Web.UI.Page
    {


        // indica se esta em modo de edicao
        protected bool ModoEditaRenda = false;
        protected Renda rendas;


        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["usuario"] == null)
                Response.Redirect("Entrar.aspx");


            // sera modo edicao quando um id de contato for passado na querystring
            ModoEditaRenda = !string.IsNullOrWhiteSpace(Request.QueryString["idRenda"]);



            if (ModoEditaRenda)
            {
                var idrenda = int.Parse(Request.QueryString["idRenda"]);
                using (FinancasEntities2 ctx = new FinancasEntities2())
                    rendas = ctx.Renda.FirstOrDefault(g => g.id == idrenda);
            }
            if (!IsPostBack)
            {
                if (ModoEditaRenda)
                {
                    BtnCadastraRenda.Text = "Salvar edicao";
                    TxtDescricaoRenda.Text = rendas.descricao;
                    TxtValorRenda.Text = rendas.valor.ToString();
                    TxtRecebimentoRenda.Text = rendas.dataRecebimento;
                }
            }


        }

        protected void BtnCadastraRenda_Click(object sender, EventArgs e)
        {
            // obtem o usuário da sessão
            var usuario = (Usuario)Session["usuario"];

            if (!ModoEditaRenda)
            {
                // cria um objeto do tipo GastosMensais onde será adicionado o conteudo do formulário
                var c = new Renda
                {
                    descricao = TxtDescricaoRenda.Text,
                    valor = Convert.ToDecimal(TxtValorRenda.Text),
                    dataRecebimento = TxtRecebimentoRenda.Text,
                    id_usuario = usuario.id
                };

                try
                {
                    // cria um novo contexto do entity, adiciona o objeto criado anteriormente e salva no banco
                    using (FinancasEntities2 ctx = new FinancasEntities2())
                    {
                        ctx.Renda.Add(c);
                        ctx.SaveChanges();



                        //LimpaForm();
                        //MensagemSucesso.Visible = true;
                        // redireciona para a lista de gastos cadastrados após 3 segundos
                        //Response.AppendHeader("Refresh", "3;url=ListaGastos.aspx");

                        // apenas redireciona para a pagina de contatos
                        Response.Redirect("PainelResumo.aspx");
                    }
                }
                catch (Exception)
                {
                    //LimpaForm();
                    //MensagemErro.Visible = true;
                    Response.Write("Não foi possivel cadastrar");
                    throw;
                }
            }
            else
            {
                using (FinancasEntities2 ctx = new FinancasEntities2())
                {

                    rendas.descricao = TxtDescricaoRenda.Text;
                    rendas.valor = Convert.ToDecimal(TxtValorRenda.Text);
                    rendas.dataRecebimento = TxtRecebimentoRenda.Text;

                    ctx.Renda.Attach(rendas);
                    ctx.Entry(rendas).State = EntityState.Modified;
                    ctx.SaveChanges();
                    //LimpaForm();
                    //MensagemSucesso.Visible = true;
                    // redireciona para a lista de gastos cadastrados após 1 segundos
                    //Response.AppendHeader("Refresh", "1;url=MinhasRendas.aspx");
                    Response.Redirect("MinhasRendas.aspx");
                }
            }
        }
    }
}