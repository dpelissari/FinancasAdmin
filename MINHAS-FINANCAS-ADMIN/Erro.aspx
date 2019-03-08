<%@ Page Title="" Language="C#" MasterPageFile="~/Entrar.Master" AutoEventWireup="true" CodeBehind="Erro.aspx.cs" Inherits="MINHAS_FINANCAS_ADMIN.Erro" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server" />

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-12 col-md-5 col-xl-4 my-5">
                <div class="text-center">
                    <h6 class="text-uppercase text-muted mb-4">Não foi possivel concluír a operação!</h6>
                    <h1 class="display-4 mb-3">Ocorreu um problema ao processar sua operação­</h1>
                    <p class="text-muted mb-4">Por favor tente mais tarde, estamos trabalhando para resolver este problema o mais rápido possivel!</p>
                    <a href="Entrar.aspx" class="btn btn-lg btn-primary">Retornar a plataforma
                </a>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
