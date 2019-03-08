using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MINHAS_FINANCAS_ADMIN
{
    public partial class CadastroGasto : System.Web.UI.Page
    {

        // indica se esta em modo de edicao
        protected bool ModoEdicao = false;
        protected GastosMensais gastos;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["usuario"] == null)
                Response.Redirect("Entrar.aspx");


            // sera modo edicao quando um id de contato for passado na querystring
            ModoEdicao = !string.IsNullOrWhiteSpace(Request.QueryString["idGasto"]);



            if (ModoEdicao)
            {
                var idgasto = int.Parse(Request.QueryString["idGasto"]);
                using (FinancasEntities1 ctx = new FinancasEntities1())
                    gastos = ctx.GastosMensais.FirstOrDefault(g => g.id == idgasto);
            }
            if (!IsPostBack)
            {
                if (ModoEdicao)
                {
                    BtnCadastraGasto.Text = "Salvar edicao";
                    TxtDescricao.Text = gastos.descricao;
                    TxtValor.Text = gastos.valor.ToString();
                    TxtVencimento.Text = gastos.dataVencimento;
                }
            }


        }

        protected void BtnCadastraGasto_Click(object sender, EventArgs e)
        {
            // obtem o usuário da sessão
            var usuario = (Usuario)Session["usuario"];

            if (!ModoEdicao)
            {
                // cria um objeto do tipo GastosMensais onde será adicionado o conteudo do formulário
                var c = new GastosMensais
                {
                    descricao = TxtDescricao.Text,
                    valor = Convert.ToDecimal(TxtValor.Text),
                    dataVencimento = TxtVencimento.Text,
                    id_usuario = usuario.id
                };

                try
                {
                    // cria um novo contexto do entity, adiciona o objeto criado anteriormente e salva no banco
                    using (FinancasEntities1 ctx = new FinancasEntities1())
                    {
                        ctx.GastosMensais.Add(c);
                        ctx.SaveChanges();

                        

                        //LimpaForm();
                        //MensagemSucesso.Visible = true;
                        // redireciona para a lista de gastos cadastrados após 3 segundos
                        //Response.AppendHeader("Refresh", "3;url=ListaGastos.aspx");

                        // apenas redireciona para a pagina de contatos
                        Response.Redirect("MeusGastos.aspx");
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
                using (FinancasEntities1 ctx = new FinancasEntities1())
                {

                    gastos.descricao = TxtDescricao.Text;
                    gastos.valor = Convert.ToDecimal(TxtValor.Text);
                    gastos.dataVencimento = TxtVencimento.Text;

                    ctx.GastosMensais.Attach(gastos);
                    ctx.Entry(gastos).State = EntityState.Modified;
                    ctx.SaveChanges();
                    //LimpaForm();
                    //MensagemSucesso.Visible = true;
                    // redireciona para a lista de gastos cadastrados após 1 segundos
                    //Response.AppendHeader("Refresh", "1;url=MeusGastos.aspx");
                    Response.Redirect("MeusGastos.aspx");
                }
            }
        }
    }
}