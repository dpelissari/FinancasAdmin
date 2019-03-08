<%@ Page Title="" Language="C#" MasterPageFile="~/Principal.Master" AutoEventWireup="true" CodeBehind="CadastraGasto.aspx.cs" Inherits="MINHAS_FINANCAS_ADMIN.CadastroGasto" %>

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
                                <h6 class="header-pretitle">ADMINISTRAÇÃO </h6>
                                <h1 class="header-title"><%= ModoEdicao ? "Editar gasto menal" : "Cadastrar gasto mensal" %></h1>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="form-group">
                    <label>Descrição</label>
                    <asp:TextBox ID="TxtDescricao" runat="server" class="form-control"></asp:TextBox>
                </div>

                <div class="row">
                    <div class="col-12 col-md-6">
                        <div class="form-group">
                            <label>Valor</label>
                            <asp:TextBox ID="TxtValor" runat="server" class="form-control"></asp:TextBox>
                        </div>

                    </div>
                    <div class="col-12 col-md-6">
                        <div class="form-group">
                            <label>Data de Vencimento</label>
                            <asp:TextBox ID="TxtVencimento" runat="server" placeholder="Data Vencimento" class="form-control" data-toggle="flatpickr"></asp:TextBox>
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="col-12 ">
                        <asp:Button ID="BtnCadastraGasto" runat="server" Text="Cadastrar" class="btn btn-outline-primary" OnClick="BtnCadastraGasto_Click" />
                        <a href="MeusGastos.aspx" class="btn btn-outline-dark">Cancelar</a>
                    </div>
                </div>

            </div>

        </div>
    </div>

</asp:Content>
