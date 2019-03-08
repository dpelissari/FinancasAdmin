using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Web;

namespace PROJETO_ISUL_2019
{
    public class EmailNews
    {

        public List<string> Erros { get; private set; }

        public EmailNews(string enderecoEmail)
        {
            // inicializa erros
            Erros = new List<string>();

            if (string.IsNullOrEmpty(enderecoEmail))
                Erros.Add("E-mail deve ser preenchido");

            if (string.IsNullOrEmpty(enderecoEmail)) // TODO - Validar e-mail
                Erros.Add("E-mail deve ser válido");

          
            if (!Erros.Any())
            {
              
                EnderecoEmail = enderecoEmail;
             
            }
        }
       
        public string EnderecoEmail { get; private set; }

        public bool Enviar()
        {
            var Para = new List<MailAddress>
            {
                new MailAddress("daniel.pelissari@agripoint.com.br", "Daniel"),
            };

            try
            {
                // Corpo do email
                var corpo = string.Empty;
                var mail = new MailMessage
                {
                    From = new MailAddress("contato@agripoint.com.br", "Contato AgriPoint"),
                    Subject = "Newsletter | Interleite Sul 2019",
                    Body =
                    "<h4>Contato de interesse | Novidades ISUL 2019</h4>"
                    
                    + "<p>O seguinte endereço de e-mail se escreveu para receber as novidades do ISUL 2019.  <br/> <strong>E-mail:  </strong>" + EnderecoEmail + "</p>",
                    IsBodyHtml = true
                };

                // adiciona os destinatarios
                Para.ForEach(p => mail.To.Add(p));

                // envia o email
                using (var smtp = new SmtpClient("smtp.gmail.com"))
                {
                    smtp.EnableSsl = true;                              // gmail requer SSL
                    smtp.Port = 587;                                    // porta para SSL
                    smtp.DeliveryMethod = SmtpDeliveryMethod.Network;   // modo de envio
                    smtp.UseDefaultCredentials = false;                  // vamos utilizar credencias especificas
                    smtp.Credentials = new NetworkCredential("contato@agripoint.com.br", "contato123*");

                    // envia o e-mail
                    smtp.Send(mail);
                }

                // email enviado com sucesso
                return true;
            }
            catch (Exception ex)
            {

                Console.WriteLine(ex.Message);
                // não foi possível enviar o e-mail
                return false;
            }
        }

    }
}