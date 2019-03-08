<%@ Page Title="" Language="C#" MasterPageFile="~/Entrar.Master" AutoEventWireup="true" CodeBehind="RecuperarSenha.aspx.cs" Inherits="MINHAS_FINANCAS_ADMIN.RecuperarSenha" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server" >

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="container-fluid">
      <div class="row align-items-center justify-content-center">
        <div class="col-12 col-md-5 col-lg-6 col-xl-4 px-lg-6 my-5">

          <h1 class="display-4 text-center mb-3">Recuperar senha</h1>
          
          <p class="text-muted text-center mb-5">
            Informe o e-mail cadastrado e verifique sua caixa de entrada.
          </p>
          
          <form runat="server">

            <div class="form-group">
              <label>Endereço de e-mail</label>
              <asp:TextBox class="form-control" placeholder="name@address.com" ID="txtRecuperaSenha" runat="server"></asp:TextBox>
            </div>

            <asp:Button class="btn btn-lg btn-block btn-primary mb-3" ID="btnRecuperaSenha" runat="server" Text="Recuperar senha" OnClick="btnRecuperaSenha_Click1" />

            <div class="text-center">
              <small class="text-muted text-center">Lembrou sua senha? <a href="Entrar.aspx"">Efetuar login</a>.</small>
            </div>

            <div id="resultadoEnvio"></div>
          </form>

            <asp:PlaceHolder runat="server" Visible="false" ID="MensagemUsuarioNaoEncontrado">
                <div class="form-group mt-4">
                    <div class="alert alert-warning alert-dismissible fade show" role="alert">
                        <strong>Usuário não encontrado!</strong> Informe o endereço de e-mail usado para acessar sua conta.
                        <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                        <span aria-hidden="true">×</span>
                        </button>
                    </div>
                </div>
            </asp:PlaceHolder>

            <asp:PlaceHolder runat="server" Visible="false" ID="MensagemDeSenhaEnviada">
                <div class="form-group mt-4">
                    <div class="alert alert-success" role="alert">
                        <strong>Sua senha foi enviada para o endereço de e-mail usado para acessar sua conta.</strong> 
                        <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                        <span aria-hidden="true">×</span>
                        </button>
                    </div>
                </div>
            </asp:PlaceHolder>
           

        </div>
        <div class="col-12 col-md-7 col-lg-6 col-xl-8 d-none d-lg-block">
          <div class="bg-cover vh-100 mt--1 mr--3" style="background-image: url(assets/img/covers/auth-side-cover3.jpg)"></div>
        </div>

      </div>
    </div>

</asp:Content>
