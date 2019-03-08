<%@ Page Title="" Language="C#" MasterPageFile="~/Principal.Master" AutoEventWireup="true" CodeBehind="PainelResumo.aspx.cs" Inherits="MINHAS_FINANCAS_ADMIN.PainelResumo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row justify-content-center">
        <div class="col-12 col-lg-10 col-xl-8">

            <div class="header mt-md-5">
                <div class="header-body">
                    <div class="row align-items-center">
                        <div class="col">
                            <h6 class="header-pretitle">PAINEL</h6>
                            <h1 class="header-title">Resumo Mensal</h1>
                        </div>
                    </div>
                </div>
            </div>

            <div class="row">
                <div class="col-12 col-lg-6 col-xl">

                    <div class="card">
                        <div class="card-body">
                            <div class="row align-items-center">
                                <div class="col">
                                    <h6 class="card-title text-uppercase text-muted mb-2">Minha Renda</h6>
                                    <span class="h2 mb-0">R$<%= rendaMensal %></span>
                                </div>

                                <div class="col-auto">
                                    <span class="h2 fe fe-briefcase text-muted mb-0"></span>
                                </div>
                            </div>
                        </div>
                    </div>

                </div>

                <div class="col-12 col-lg-6 col-xl">
                    <div class="card">
                        <div class="card-body">
                            <div class="row align-items-center">
                                <div class="col">
                                    <h6 class="card-title text-uppercase text-muted mb-2">Gastos Cadastrados</h6>
                                    <span class="h2 mb-0">R$<%= gastoTotal %></span>


                                </div>

                                <div class="col-auto">
                                    <span class="h2 fe fe-briefcase text-muted mb-0"></span>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="col-12 col-lg-6 col-xl">
                    <div class="card">
                        <div class="card-body">
                            <div class="row align-items-center">
                                <div class="col">
                                    <h6 class="card-title text-uppercase text-muted mb-2">Valor Dísponivel</h6>
                                    <span class="h2 mb-0">R$<%= rendaDisponivel %></span>
                                </div>
                                <div class="col-auto">
                                    <span class="h2 fe fe-clock text-muted mb-0"></span>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <%-- Salva os valores para exibição no grafico --%>
            <script>
                var gastoTotalMensal = <%= gastoTotal %>;
                var rendaTotal = <%=rendaMensal %>;
                var rendaDisponivel =  <%= rendaDisponivel %>;
            </script>

            <div class="card">
                <div class="card-header">
                    <div class="row align-items-center">
                        <div class="col">
                            <h4 class="card-header-title">Estimativa de gastos
                            </h4>
                        </div>
                        <div class="col-auto">
                            <ul class="nav nav-tabs nav-tabs-sm card-header-tabs">
                                <li class="nav-item" data-toggle="chart" data-target="#devicesChart" data-update='{"data":{"datasets":[{"data":[10, 15, 20]}]}}'>
                                    <a href="#" class="nav-link active" data-toggle="tab">Visão Geral
                                    </a>
                                </li>
                            </ul>
                        </div>
                    </div>

                </div>
                <div class="card-body">
                    <div class="chart chart-appended">
                        <canvas id="devicesChart" class="chart-canvas" data-target="#devicesChartLegend"></canvas>
                    </div>
                    <div id="devicesChartLegend" class="chart-legend"></div>
                </div>
               
            </div>

        </div>
    </div>

</asp:Content>
