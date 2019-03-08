<%@ Page Title="" Language="C#" MasterPageFile="~/Entrar.Master" AutoEventWireup="true" CodeBehind="Entrar.aspx.cs" Inherits="MINHAS_FINANCAS_ADMIN.Entrar1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server" />

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container-fluid">
        <div class="row align-items-center justify-content-center">
            <div class="col-12 col-md-5 col-lg-6 col-xl-4 px-lg-6 my-5">
                <h1 class="display-4 text-center mb-3">Minhas Finanças</h1>
                <p class="text-muted text-center mb-5">Acese a plataforma usando suas credenciais </p>
                <form runat="server">
                    <div class="form-group">
                        <label>Endereço e-mail</label>
                        <asp:TextBox ID="TxtEmail" runat="server" type="email" class="form-control" placeholder="name@email.com"></asp:TextBox>
                    </div>


                    <div class="form-group">
                        <div class="row">
                            <div class="col">
                                <label>Senha</label>
                            </div>

                            <div class="col-auto">
                                <a href="RecuperarSenha.aspx" class="form-text small text-muted">Esqueceu sua senha?</a>
                            </div>
                        </div>

                        <%-- Senha --%>
                        <div class="input-group input-group-merge">
                            <asp:TextBox ID="TxtSenha" runat="server" type="password" class="form-control form-control-appended" placeholder="Enter your password"></asp:TextBox>

                            <%-- botão mostrar senha --%>
                            <div class="input-group-append">
                                <span class="input-group-text">
                                    <i class="fe fe-eye" id="BtnVerSenha"></i>
                                </span>
                            </div>

                            <script type="text/javascript">
                                $("#BtnVerSenha").click(function () {
                                    var campoSenha = $("#ContentPlaceHolder1_TxtSenha").attr('type');
                                    if (campoSenha == "text") $("#ContentPlaceHolder1_TxtSenha").attr('type', 'password');
                                    if (campoSenha == "password") $("#ContentPlaceHolder1_TxtSenha").attr('type', 'text');
                                })
                            </script>

                        </div>
                    </div>

                    <asp:Button ID="btnEntrar" runat="server" Text="Entrar" class="btn btn-lg btn-block btn-primary mb-3" OnClick="btnEntrar_Click" />

                    <%-- Criar conta --%>
                    <p class="text-center">
                        <small class="text-muted text-center">Não possui conta? <a href="CadastraUsuario.aspx">Criar agora</a>.
                        </small>
                    </p>


                    <asp:PlaceHolder runat="server" Visible="false" ID="LoginErro">
                        <p class="text-center">
                            <small class="text-muted text-center">Não foi possivel efetuar login, verifique suas credenciais
                            </small>
                        </p>
                    </asp:PlaceHolder>

                </form>

            </div>

            <%-- Imagem --%>
            <div class="col-12 col-md-7 col-lg-6 col-xl-8 d-none d-lg-block">
                <div class="bg-cover vh-100 mt--1 mr--3" style="background-image: url(assets/img/covers/auth-side-cover.jpg);"></div>
            </div>
        </div>
    </div>

</asp:Content>
