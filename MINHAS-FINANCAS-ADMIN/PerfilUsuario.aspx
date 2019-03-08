<%@ Page Title="" Language="C#" MasterPageFile="~/Principal.Master" AutoEventWireup="true" CodeBehind="PerfilUsuario.aspx.cs" Inherits="MINHAS_FINANCAS_ADMIN.PerfilUsuario" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container-fluid">

        <div class="col-12 col-lg-10 col-xl-8">
            <div class="header mt-md-5">
                <div class="header-body">
                    <div class="row align-items-center">
                        <div class="col">
                            <h6 class="header-pretitle">MINHA CONTA</h6>
                            <h1 class="header-title">Editar perfil</h1>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="col-md-12 col-lg-12 col-xl-6">
            <div class="text-center">
                <img src="data:image/svg+xml;charset=UTF-8,%3Csvg%20width%3D%22200%22%20height%3D%22200%22%20xmlns%3D%22http%3A%2F%2Fwww.w3.org%2F2000%2Fsvg%22%20viewBox%3D%220%200%20200%20200%22%20preserveAspectRatio%3D%22none%22%3E%3Cdefs%3E%3Cstyle%20type%3D%22text%2Fcss%22%3E%23holder_167c25c3fa2%20text%20%7B%20fill%3Argba(255%2C255%2C255%2C.75)%3Bfont-weight%3Anormal%3Bfont-family%3AHelvetica%2C%20monospace%3Bfont-size%3A10pt%20%7D%20%3C%2Fstyle%3E%3C%2Fdefs%3E%3Cg%20id%3D%22holder_167c25c3fa2%22%3E%3Crect%20width%3D%22200%22%20height%3D%22200%22%20fill%3D%22%23777%22%3E%3C%2Frect%3E%3Cg%3E%3Ctext%20x%3D%2274.4296875%22%20y%3D%22104.5%22%3E200x200%3C%2Ftext%3E%3C%2Fg%3E%3C%2Fg%3E%3C%2Fsvg%3E" class="foto-usuario" alt="...">
            </div>

            <div class="custom-file text-center mt-4">
                <asp:FileUpload ID="FileUpload1" runat="server" />
            </div>

            <div class="form-group">
                <label>Nome</label>
                <asp:TextBox ID="txtNomeUsuario" runat="server" type="text" class="form-control" placeholder="Ex: João da Silva Medeiros"></asp:TextBox>
            </div>
            <div class="form-group">
                <label>Endereço de e-mail</label>
                <asp:TextBox ID="TxtEmailUsuario" runat="server" type="email" class="form-control" placeholder="Ex: joao@email.com"></asp:TextBox>
            </div>


            <div class="row">
                <div class="col-md-6 col-lg-6 col-xl-6">

                    <div class="input-group input-group-merge">
                        <asp:TextBox ID="TxtSenha" runat="server" type="password" class="form-control form-control-appended" placeholder="Senha"></asp:TextBox>

                        <div class="input-group-append">
                            <span class="input-group-text" id="BtnVerSenha">
                                <i class="fe fe-eye"></i>
                            </span>
                        </div>

                    </div>
                </div>
                <div class="col-md-6 col-lg-6 col-xl-6">

                    <div class="input-group input-group-merge">
                        <asp:TextBox ID="TxtConfSenha" runat="server" type="password" class="form-control form-control-appended" placeholder="Confirmar senha"></asp:TextBox>

                        <div class="input-group-append">
                            <span class="input-group-text" id="BtnVerConfSenha">
                                <i class="fe fe-eye"></i>
                            </span>
                        </div>

                    </div>
                </div>



            </div>

            <asp:Button ID="BtnSalvaPerfil" runat="server" Text="Salvar Edição" class="btn btn-outline-primary btn-block mt-4" OnClick="BtnSalvaPerfil_Click" />
        </div>


    </div>

    <script type="text/javascript">
        $("#BtnVerSenha").click(function () {
            var campoSenha = $("#ContentPlaceHolder1_TxtSenha").attr('type');
            if (campoSenha == "text") $("#ContentPlaceHolder1_TxtSenha").attr('type', 'password');
            if (campoSenha == "password") $("#ContentPlaceHolder1_TxtSenha").attr('type', 'text');
        })

        $("#BtnVerConfSenha").click(function () {
            var campoSenha = $("#ContentPlaceHolder1_TxtConfSenha").attr('type');
            if (campoSenha == "text") $("#ContentPlaceHolder1_TxtConfSenha").attr('type', 'password');
            if (campoSenha == "password") $("#ContentPlaceHolder1_TxtConfSenha").attr('type', 'text');
        })
    </script>

</asp:Content>
