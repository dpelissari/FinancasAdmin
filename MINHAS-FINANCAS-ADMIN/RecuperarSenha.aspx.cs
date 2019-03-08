using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net.Mail;
using System.Net;

namespace MINHAS_FINANCAS_ADMIN
{
    public partial class RecuperarSenha : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnRecuperaSenha_Click1(object sender, EventArgs e)
        {
            using (var context = new FinancasEntities())
            {
                //// obtem o usuario
                var usuario = context.Usuario.FirstOrDefault(u => u.email == txtRecuperaSenha.Text);

                try
                {
                    if (usuario != null)
                    {
                        // Remetente e Destinatario
                        string de = "dpelissari1@gmail.com";
                        string para = usuario.email;

                        // Corpo do email
                        string nome = usuario.nome;
                        string email = usuario.email;
                        string senha = usuario.senha;
                        string corpo = System.IO.File.ReadAllText(HttpContext.Current.Server.MapPath("EmailTemplate.html"));
                        corpo = corpo.Replace("#nome#", usuario.nome);
                        corpo = corpo.Replace("#email#", usuario.email);
                        corpo = corpo.Replace("#senha#", usuario.senha);

                        MailMessage mail = new MailMessage();
                        mail.From = new MailAddress(de);
                        mail.To.Add(para); // para
                        mail.Subject = "Recuperação de senha | Minhas Finanças"; // assunto
                        mail.Body = corpo; // mensagem
                        mail.IsBodyHtml = true; // permite corpo em html

                        // envia o email
                        using (var smtp = new SmtpClient("smtp.gmail.com"))
                        {
                            smtp.EnableSsl = true; // GMail requer SSL
                            smtp.Port = 587;       // porta para SSL
                            smtp.DeliveryMethod = SmtpDeliveryMethod.Network; // modo de envio
                            smtp.UseDefaultCredentials = false; // vamos utilizar credencias especificas

                            // seu usuário e senha para autenticação
                            smtp.Credentials = new NetworkCredential("dpelissari1@gmail.com", "daniel2011*");

                            // envia o e-mail
                            smtp.Send(mail);
                            MensagemDeSenhaEnviada.Visible = true;
                        }
                    }
                    else
                    {
                        // Se o usuário não existir
                        MensagemUsuarioNaoEncontrado.Visible = true;
                        return;
                    }
                }
                catch
                {
                    Response.AppendHeader("Refresh", "1;url=Erro.aspx");
                }
            }
        }
    }
}