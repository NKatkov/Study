﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Areas/aspx/Views/Shared/DataViz.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<asp:Content ContentPlaceHolderID="HeadContent" runat="server">
<style>       
    .k-chart {
        height: 280px;
        padding: 37px;
        margin: 0 0 50px 0;
        width: 390px;
    }
</style>
</asp:Content>

<asp:Content ContentPlaceHolderID="MainContent" runat="server">
<div class="configuration k-widget k-header" style="width: 80px">
    <span class="configHead">Gap and spacing</span>
    <ul class="options">
        <li>
            <button id="getGap" class="k-button">Set gap</button>
            <input id="gap" type="number" value="1.5" step="0.1" style="width: 60px;" />
        </li>
        <li>
            <button id="getSpacing" class="k-button">Set spacing</button>
            <input id="spacing" type="number" value="0.4" step="0.1" style="width: 60px;" />
        </li>
    </ul>
</div>
<%= Html.Kendo().Chart()
        .Name("chart")
        .Title("Internet Users")
        .Legend(legend => legend.Position(ChartLegendPosition.Bottom))
        .Series(series => {
            series.Column(new double[] { 67.96, 61.93, 75, 71, 78 }).Name("United States");
            series.Column(new double[] { 15.7, 11, 20, 25, 36.6 }).Name("World");
        })
        .CategoryAxis(axis => axis
            .Categories("2005", "2006", "2007", "2008", "2009")
        )
        .ValueAxis(axis => axis
            .Numeric().Labels(labels => labels.Format("{0}%"))
        )
        .Tooltip(tooltip => tooltip
            .Visible(true)
            .Format("{0}%")
        )
%>
<script>
    $(document).ready(function() {
        var chart = $("#chart").data("kendoChart"),
            firstSeries = chart.options.series;

        $("#getGap").click(function () {
            firstSeries[0].gap = parseFloat($("#gap").val(), 10);
            chart.redraw();
        });

        $("#getSpacing").click(function () {
            firstSeries[0].spacing = parseFloat($("#spacing").val(), 10);
            chart.redraw();
        });

        if (kendo.ui.NumericTextBox) {
            $("#gap").kendoNumericTextBox();
            $("#spacing").kendoNumericTextBox();
        }
    });
</script>
</asp:Content>
