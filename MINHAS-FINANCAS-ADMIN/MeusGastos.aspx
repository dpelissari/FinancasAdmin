<%@ Page Title="" Language="C#" MasterPageFile="~/Principal.Master" AutoEventWireup="true" CodeBehind="MeusGastos.aspx.cs" Inherits="MINHAS_FINANCAS_ADMIN.Gasto" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server" />
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="row justify-content-center">
        <div class="col-12 col-lg-10 col-xl-8">
            <div class="header mt-md-5">
                <div class="header-body">
                    <div class="row align-items-center">
                        <div class="col">
                            <h6 class="header-pretitle">CONTROLE</h6>
                            <h1 class="header-title">Gastos mensais </h1>
                        </div>
                        <div class="col-auto">
                            <a href="CadastraGasto.aspx" class="btn btn-primary">Novo gasto</a>
                        </div>
                    </div>
                </div>
            </div>
            <table class="table table-striped">
                <thead>
                    <tr>
                        <th>Código</th>
                        <th>Descrição</th>
                        <th>Valor</th>
                        <th>Cód. Usuário</th>
                        <th>Data Vencimento</th>
                        <th colspan="2">Ação</th>
                    </tr>
                </thead>
                <tbody>
                    <asp:Repeater runat="server" DataSource="<%# gastos  %>">
                        <ItemTemplate>
                            <tr>
                                <td><%# Eval("id") %></td>
                                <td><%# Eval("descricao") %></td>
                                <td><%# Eval("valor") %></td>
                                <td><%# Eval("id_usuario") %></td>
                                <td><%# Eval("dataVencimento") %></td>

                                <td><a href="CadastraGasto.aspx?idGasto=<%# Eval("id") %>" class="btn btn-warning btn-sm">Editar</a></td>
                                <td><asp:Button ID="BtnExcluir" runat="server" Text="Excluir" class="btn btn-danger btn-sm" CommandArgument='<%# Eval("id") %>' OnClick="BtnExcluir_Click" /></td>
                            </tr>
                        </ItemTemplate>
                    </asp:Repeater>
                </tbody>
            </table>
        </div>
    </div>

</asp:Content>
