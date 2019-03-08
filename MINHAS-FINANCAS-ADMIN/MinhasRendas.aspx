<%@ Page Title="" Language="C#" MasterPageFile="~/Principal.Master" AutoEventWireup="true" CodeBehind="MinhasRendas.aspx.cs" Inherits="MINHAS_FINANCAS_ADMIN.MinhasRendas" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


    <div class="row justify-content-center">
        <div class="col-12 col-lg-10 col-xl-8">
            <div class="header mt-md-5">
                <div class="header-body">
                    <div class="row align-items-center">
                        <div class="col">
                            <h6 class="header-pretitle">FONTE DE RENDA</h6>
                            <h1 class="header-title">Rendas Mensais</h1>
                        </div>
                        <div class="col-auto">
                            <a href="CadastraRenda.aspx" class="btn btn-primary">Nova Renda</a>
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
                        <th>Data Recebimento</th>
                        <th colspan="2">Ação</th>
                    </tr>
                </thead>
                <tbody>
                    <asp:Repeater runat="server" DataSource="<%# rendas  %>">
                        <ItemTemplate>
                            <tr>
                                <td><%# Eval("id") %></td>
                                <td><%# Eval("descricao") %></td>
                                <td><%# Eval("valor") %></td>
                                <td><%# Eval("id_usuario") %></td>
                                <td><%# Eval("dataRecebimento") %></td>

                                <td>
                                    <a href="CadastraRenda.aspx?idRenda=<%# Eval("id") %>" class="btn btn-warning btn-sm">Editar</a>
                                </td>

                                <td>
                                    <asp:Button ID="BtnExcluirRenda" runat="server" Text="Excluir" class="btn btn-danger btn-sm"
                                        CommandArgument='<%# Eval("id") %>' OnClick="BtnExcluirRenda_Click" />
                                </td>
                            </tr>
                        </ItemTemplate>
                    </asp:Repeater>
                </tbody>
            </table>
        </div>
    </div>

</asp:Content>
