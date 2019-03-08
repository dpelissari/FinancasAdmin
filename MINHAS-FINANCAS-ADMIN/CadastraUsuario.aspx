<%@ Page Title="" Language="C#" MasterPageFile="~/Entrar.Master" AutoEventWireup="true" CodeBehind="CadastraUsuario.aspx.cs" Inherits="MINHAS_FINANCAS_ADMIN.CadastraUsuario" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="container-fluid">
        <div class="row align-items-center justify-content-center">
            <div class="col-12 col-md-5 col-lg-6 col-xl-4 px-lg-6 my-5">

                <h1 class="display-4 text-center mb-3">Novo usuário</h1>
                <p class="text-muted text-center mb-5">Crie uma conta gratuíta e comece agora mesmo a controlar melhor suas finanças.</p>


                <form runat="server">

                    <div class="form-group">
                        <label>Nome</label>
                        <asp:TextBox ID="txtNomeUsuario" runat="server" type="text" class="form-control" placeholder="Ex: João da Silva Medeiros"></asp:TextBox>
                    </div>


                    <div class="form-group">
                        <label>E-mail</label>
                        <asp:TextBox ID="txtEmailUsuario" runat="server" type="text" class="form-control" placeholder="Ex: nome@email.com"></asp:TextBox>
                    </div>

                    <div class="form-group">
                        <label>Senha</label>
                        <div class="input-group input-group-merge">
                            <asp:TextBox type="password" class="form-control form-control-appended" placeholder="Senha de acesso" ID="txtSenhaUsuario" runat="server"></asp:TextBox>

                            <div class="input-group-append">
                                <span class="input-group-text">
                                    <i class="fe fe-eye"></i>
                                </span>
                            </div>

                        </div>
                    </div>

                    <div class="form-group">
                        <label>Confirmar senha</label>
                        <div class="input-group input-group-merge">
                            <asp:TextBox type="password" class="form-control form-control-appended" placeholder="Senha de acesso" ID="txtConfSenhaUsuario" runat="server"></asp:TextBox>

                            <div class="input-group-append">
                                <span class="input-group-text">
                                    <i class="fe fe-eye"></i>
                                </span>
                            </div>

                        </div>
                    </div>

                    <asp:Button class="btn btn-lg btn-block btn-primary mb-3" ID="BtnCadastraUsuario" runat="server" Text="Cadastrar" OnClick="BtnCadastraUsuario_Click" />

                    <div class="text-center">
                        <small class="text-muted text-center">Já tem uma conta? <a href="Entrar.aspx">Entrar</a>.
              </small>
                    </div>

                </form>

            </div>
            <div class="col-12 col-md-7 col-lg-6 col-xl-8 d-none d-lg-block">
                <div class="bg-cover vh-100 mt--1 mr--3" style="background-image: url(assets/img/covers/auth-side-cover2.jpg);"></div>
            </div>
        </div>
    </div>

</asp:Content>
