<%@ Page Title="" Language="C#" MasterPageFile="~/Principal.Master" AutoEventWireup="true" CodeBehind="CadastraRenda.aspx.cs" Inherits="MINHAS_FINANCAS_ADMIN.CadastraRenda" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="container-fluid">
        <div class="row justify-content-center">
            <div class="col-12 col-lg-10 col-xl-8">

                <div class="header mt-md-5">
                    <div class="header-body">
                        <div class="row align-items-center">
                            <div class="col">
                                <h6 class="header-pretitle">FONTE DE RENDA </h6>
                                <h1 class="header-title"><%= ModoEditaRenda ? "Editar renda mensal" : "Cadastrar renda mensal" %></h1>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="form-group">
                    <label>Descrição</label>
                    <asp:TextBox ID="TxtDescricaoRenda" runat="server" class="form-control"></asp:TextBox>
                </div>

                <div class="row">
                    <div class="col-12 col-md-6">
                        <div class="form-group">
                            <label>Valor</label>
                            <asp:TextBox ID="TxtValorRenda" runat="server" class="form-control"></asp:TextBox>
                        </div>

                    </div>
                    <div class="col-12 col-md-6">
                        <div class="form-group">
                            <label>Data de recebimento</label>
                            <asp:TextBox ID="TxtRecebimentoRenda" runat="server" placeholder="Data Vencimento" class="form-control" data-toggle="flatpickr"></asp:TextBox>
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="col-12 ">
                        <asp:Button ID="BtnCadastraRenda" runat="server" Text="Cadastrar" class="btn btn-outline-primary" OnClick="BtnCadastraRenda_Click" />
                        <a href="MinhasRendas.aspx" class="btn btn-outline-dark">Cancelar</a>
                    </div>
                </div>

            </div>

        </div>
    </div>
</asp:Content>
